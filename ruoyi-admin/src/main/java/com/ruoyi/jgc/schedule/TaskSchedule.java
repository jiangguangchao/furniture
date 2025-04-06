package com.ruoyi.jgc.schedule;

import org.apache.commons.collections4.MapUtils;
import org.apache.commons.math3.geometry.partitioning.BSPTreeVisitor.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.jgc.domain.FurnitureOrder;
import com.ruoyi.jgc.domain.OrderStatistics;
import com.ruoyi.jgc.service.IFurnitureOrderService;
import com.ruoyi.jgc.service.IOrderStatisticsService;

/**
 * 家具订单统计定时任务。
 * 统计时会按照日（D），月（M），年（Y）进行统计，
 * 数据类型分 0：订单总数 1：订单总金额 2：已支付总金额
 * 也就是说会统计每日的订单总数，订单总金额，已支付总金额。每月的...，每年的...
 */
@Component
@EnableScheduling
public class TaskSchedule {

    @Autowired
    private IFurnitureOrderService furnitureOrderService;
    @Autowired
    private IOrderStatisticsService orderStatisticsService;

    Logger logger = LoggerFactory.getLogger(TaskSchedule.class);

    private static final Map<String, String> statc_type_map = new HashMap<>();

    static {
        statc_type_map.put("0", "总笔数");
        statc_type_map.put("1", "总金额");
        statc_type_map.put("2", "已支付金额");
        statc_type_map.put("3", "利润");
    }

    // 从早7点开始每半个小时执行一次今日订单统计
    @Scheduled(cron = "0 0/30 7-21 * * ?")
    // @Scheduled(fixedDelay = 1000 * 60 * 3)
    public void doTodayStatistics() {
        // 统计今日订单
        doStatisticsAndSave("D", DateUtils.getStartTime(), DateUtils.getStartTime("D", 1));
    }

    // 每天早上10点统计昨天订单和本月订单
    @Scheduled(cron = "0 0 10 * * ?")
    public void doYesterdayStatistics() {
        // 统计昨日订单
        doStatisticsAndSave("D", DateUtils.getStartTime("D", -1), DateUtils.getStartTime());
        // 统计本月订单
        doStatisticsAndSave("M", DateUtils.getStartTime("M", 0), DateUtils.getStartTime("M", 1));
    }

    // 每月的1号统计上月订单和今年订单
    @Scheduled(cron = "0 0 1 1 * ?")
    public void doLastMonthStatistics() {
        // 统计上月订单
        doStatisticsAndSave("M", DateUtils.getStartTime("M", -1), DateUtils.getStartTime("M", 0));
        // 统计今年订单
        doStatisticsAndSave("Y", DateUtils.getStartTime("Y", 0), DateUtils.getStartTime("Y", 1));
    }

    // 每年的1到5号统计去年订单
    @Scheduled(cron = "0 0 1 1-5 * ?")
    public void doLastYearStatistics() {
        // 统计去年订单
        doStatisticsAndSave("Y", DateUtils.getStartTime("Y", -1), DateUtils.getStartTime("Y", 0));
    }

    public void doStatisticsAndSave(String dateType, List<String> dateList, boolean forceStatc) {
        if (dateList == null || dateList.size() == 0) {
            return;
        }

        /**
         * 逻辑说明：
         * dateList里面是日期集合。比如是这样的集合 2025-01-01,2025-01-02,2025-01-03,2025-01-04,
         * 2025-01-05,2025-01-06,2025-01-07,2025-01-08,2025-01-09,2025-01-10,2025-01-11。
         * 根据dateType，循环获取日期的开始时间。
         * 
         * 如果dateType是D，也就是按天统计。那么获取的开始时间，就是
         * 上面日期每天的开始时间。也就是时间都不同。这样都可以放到set集合中。
         * 
         * 如果dateType是M，也就是按月统计。那么获取的开始时间，全部都是就是2025-01-01 00:00:00。
         * 这样集合中就只有一个时间了。这样就只会统计这个月一次，而不会造成重复统计2025年1月份的。
         * 
         * 如果dateType是Y，也就是按年统计。和月统计类似。
         */
        Set<String> dateSet = new LinkedHashSet<>();
        dateList.forEach(d -> {
            String date = DateUtils.getStartTime(DateUtils.parseDate(d), dateType, 0, DateUtils.YYYY_MM_DD_HH_MM_SS);
            dateSet.add(date);
        });
        if (dateSet.size() > 0) {
            dateSet.forEach(d -> {
                doStatisticsAndSave(dateType, d, forceStatc);
            });
        }

    }

    /**
     * 统计订单
     * 
     * @param dateType  统计日期类型 D:日统计 M:月统计 Y:年统计
     * @param startTime
     * @param endTime
     * @param desc      统计日期类型说明
     */
    public void doStatisticsAndSave(String dateType, String date) {
        doStatisticsAndSave(dateType, date, false);
    }

    /**
     * 统计订单
     * 
     * @param dateType 统计日期类型 D:日统计 M:月统计 Y:年统计
     * @param date     统计的日期，这个会根据dateType进行计算，
     *                 如果dateType是D，那么就根据date计算这一天的开始时间和结束时间，如果dateType是M，那么就会根据date计算这个月的开始时间和结束时间，
     *                 如果dateType是Y，那么date就是统计的年份
     * @param desc     统计日期类型说明
     */
    public void doStatisticsAndSave(String dateType, String date, boolean forceStatc) {
        String startTime = DateUtils.getStartTime(DateUtils.parseDate(date), dateType, 0,
                DateUtils.YYYY_MM_DD_HH_MM_SS);
        String endTime = DateUtils.getStartTime(DateUtils.parseDate(date), dateType, 1, DateUtils.YYYY_MM_DD_HH_MM_SS);
        doStatisticsAndSave(dateType, startTime, endTime, forceStatc);
    }

    /**
     * 统计订单
     * 
     * @param dateType  统计日期类型 D:日统计 M:月统计 Y:年统计
     * @param startTime
     * @param endTime
     * @param desc      统计日期类型说明
     */
    public void doStatisticsAndSave(String dateType, String orderStartTime, String orderEndTime) {
        doStatisticsAndSave(dateType, orderStartTime, orderEndTime, false);
    }

    /**
     * 统计订单
     * 
     * @param dateType   统计日期类型 D:日统计 M:月统计 Y:年统计
     * @param startTime
     * @param endTime
     * @param desc       统计日期类型说明
     * @param forceStatc 是否强制统计 true:是 false:否。强制统计时,会覆盖旧的统计数据，不论统计数据新旧是否一致。
     *                   如果是不强制统计，只要存在对应日期的统计数据，就不在统计
     */
    public void doStatisticsAndSave(String dateType, String orderStartTime, String orderEndTime, boolean forceStatc) {
        String dateDesc = "统计时间范围[" + orderStartTime + " -- " + orderEndTime + "], 日期类型[" + dateType + "]";

        logger.info("开始{}统计订单, {}", forceStatc ? "[强制]" : "[非强制]", dateDesc);

        String statcDate = DateUtils.getStartTime(DateUtils.parseDate(orderStartTime),
                "D", 0, DateUtils.YYYY_MM_DD).substring(0, 10).replace("-", "");
        if ("M".equals(dateType)) {
            statcDate = statcDate.substring(0, 6);
        } else if ("Y".equals(dateType)) {
            statcDate = statcDate.substring(0, 4);
        }


        // 查询数据库，判断哪些统计项已经存在，从set中移除。set中剩余的就是需要再次统计的
        OrderStatistics queryStatc = new OrderStatistics();
        Map<String, Object> param = new HashMap<>();
        param.put("startDate", statcDate);
        param.put("endDate", statcDate);
        queryStatc.setParams(param);
        // 查询数据库中已存在的指定日期的统计记录
        List<OrderStatistics> orderStatisticsListInDB = orderStatisticsService.selectOrderStatisticsList(queryStatc);
        Map<String, List<OrderStatistics>> dataTypeMapInDB = orderStatisticsListInDB.stream()
                .collect(Collectors.groupingBy(OrderStatistics::getDataType));

        Set<String> need_statc_set = new HashSet<>();
        need_statc_set.addAll(statc_type_map.keySet());
        if (!forceStatc) {
            need_statc_set.removeAll(dataTypeMapInDB.keySet());
        }

        if (need_statc_set.size() == 0) {
            logger.info("所有统计项数据都已存在，且当前是非强制统计，跳过本次统计。 {} ", dateDesc);
            return;
        }

        // 1.查询统计时间段内所有订单
        List<FurnitureOrder> furnitureOrderList = getFurnitureOrderByTime(orderStartTime, orderEndTime);
        if (CollectionUtils.isEmpty(furnitureOrderList)) {
            logger.info("没有查询到订单，跳过本次统计。 {}", dateDesc);
            return;
        }
        furnitureOrderList.removeIf(o -> o.getOrderStatus().equals("9"));// 移除状态是“已取消”的订单，已取消订单不需要统计在内
        if (CollectionUtils.isEmpty(furnitureOrderList)) {
            logger.info("{}订单全部为“已取消”订单，跳过本次统计。 {}", dateDesc);
            return;
        }

        for (String dataType : need_statc_set) {

            OrderStatistics orderStatisticsInDB = null;
            if (!CollectionUtils.isEmpty(dataTypeMapInDB.get(dataType))) {
                orderStatisticsInDB = dataTypeMapInDB.get(dataType).get(0);
            }

            doStatisticsAndSaveByType(statcDate, dataType, statc_type_map.get(dataType), 
                getStatcValue(dataType, furnitureOrderList), dateDesc, forceStatc, orderStatisticsInDB);
        }

    }

    private void doStatisticsAndSaveByType(String statcDate, String dataType, String dataTypeDesc, Long ststcValue,
            String desc, boolean forceStatc, OrderStatistics os) {

        OrderStatistics orderStatistics = new OrderStatistics();
        orderStatistics.setCreateBy("system");
        orderStatistics.setStatcDate(statcDate);

        if (os != null) {
            // 程序能走到这一步，一定是强制统计。也就是说这里的forceStatc实际上是true。不可能是false。
            logger.info("订单[{}]统计，统计已存在，当前是{}统计，执行修改操作。 {}", dataTypeDesc, forceStatc ? "[强制]" : "[非强制]", desc);
            os.setStatcValue(ststcValue);
            orderStatisticsService.updateOrderStatistics(os);
        } else {
            logger.info("订单[{}]统计，统计不存在，当前是{}统计，执行新增操作。 {}", dataTypeDesc, forceStatc ? "[强制]" : "[非强制]", desc);
            orderStatistics.setStatcValue(ststcValue);
            orderStatistics.setDataType(dataType);
            orderStatisticsService.insertOrderStatistics(orderStatistics);
        }

    }

    private Long getStatcValue(String dataType, List<FurnitureOrder> furnitureOrderList) {
        Long result = 0l;
        switch (dataType) {
            case "0":
                result = Long.valueOf(furnitureOrderList.size());
                break;
            case "1":
                result = furnitureOrderList.stream().mapToLong(o -> o.getTotalMoney().longValue()).sum();
                break;
            case "2":
                result = furnitureOrderList.stream().mapToLong(o -> o.getPaidMoney().longValue()).sum();
                break;
            case "3":
                result = furnitureOrderList.stream().mapToLong(o -> o.getProfit()).sum();
                break;

            default:
                break;
        }

        return result;
    }

    private List<FurnitureOrder> getFurnitureOrderByTime(String orderStartTime, String orderEndTime) {
        FurnitureOrder query = new FurnitureOrder();
        Map<String, Object> params = new HashMap();
        params.put("beginOrderTime", orderStartTime);
        params.put("endOrderTime", orderEndTime);
        query.setParams(params);
        return furnitureOrderService.selectFurnitureOrderList(query);
    }
}