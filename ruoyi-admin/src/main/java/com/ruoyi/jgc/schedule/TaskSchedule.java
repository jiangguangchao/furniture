package com.ruoyi.jgc.schedule;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.jgc.domain.FurnitureOrder;
import com.ruoyi.jgc.domain.OrderStatistics;
import com.ruoyi.jgc.service.IFurnitureOrderService;
import com.ruoyi.jgc.service.IOrderStatisticsService;

@Component
@EnableScheduling
public class TaskSchedule {

    @Autowired
    private IFurnitureOrderService furnitureOrderService;
    @Autowired
    private IOrderStatisticsService orderStatisticsService;

    Logger logger = LoggerFactory.getLogger(TaskSchedule.class);
    

    //从早7点开始每半个小时执行一次今日订单统计
    @Scheduled(cron = "0 0/30 7-21 * * ?")
    public void doTodayStatistics() {
        //统计今日订单
        doStatisticsAndSave("D", DateUtils.getStartTime(), DateUtils.getStartTime("D", 1), "今日");
    }

    //每天早上10点统计昨天订单和本月订单
    @Scheduled(cron = "0 0 10 * * ?")
    public void doYesterdayStatistics() {
        //统计昨日订单
        doStatisticsAndSave("D", DateUtils.getStartTime("D", -1), DateUtils.getStartTime(), "昨日");
        //统计本月订单
        doStatisticsAndSave("M", DateUtils.getStartTime("M", 0), DateUtils.getStartTime("M", 1), "本月");
    }

    //每月的1号统计上月订单和今年订单
    @Scheduled(cron = "0 0 1 1 * ?")
    public void doLastMonthStatistics() {
        //统计上月订单
        doStatisticsAndSave("M", DateUtils.getStartTime("M", -1), DateUtils.getStartTime("M", 0), "上月");
        //统计今年订单
        doStatisticsAndSave("Y", DateUtils.getStartTime("Y", 0), DateUtils.getStartTime("Y", 1), "今年");
    }

    //每年的1到5号统计去年订单
    @Scheduled(cron = "0 0 1 1-5 * ?")
    public void doLastYearStatistics() {
        //统计去年订单
        doStatisticsAndSave("Y", DateUtils.getStartTime("Y", -1), DateUtils.getStartTime("Y", 0), "去年");
    }


    /**
     * 统计订单
     * @param dateType 统计日期类型 D:日统计 M:月统计 Y:年统计
     * @param startTime
     * @param endTime
     * @param desc 统计日期类型说明
     */
    private void doStatisticsAndSave(String dateType, String orderStartTime, String orderEndTime, String desc) {
        doStatisticsAndSave(dateType, orderStartTime, orderEndTime, desc, false);  
    }

    /**
     * 统计订单
     * @param dateType 统计日期类型 D:日统计 M:月统计 Y:年统计
     * @param startTime
     * @param endTime
     * @param desc 统计日期类型说明
     * @param forceStatc 是否强制统计 true:是 false:否。强制统计时,会覆盖旧的统计数据，不论统计数据新旧是否一致。
     *         如果是不强制统计，只要存在对应日期的统计数据，就不在统计
     */
    private void doStatisticsAndSave(String dateType, String orderStartTime, String orderEndTime, String desc, boolean forceStatc) {
        logger.info("开始{}统计{}订单, 统计时间范围[{} -- {}]", forceStatc ? "[强制]" : "[非强制]", desc, orderStartTime, orderEndTime);

        String statcDate = DateUtils.getStartTime().substring(0, 10).replace("-", "");
        if ("M".equals(dateType)) {
            statcDate = statcDate.substring(0, 6);
        } else if ("Y".equals(dateType)) {
            statcDate = statcDate.substring(0, 4);
        }

        boolean needStatc_type0 = true;
        boolean needStatc_type1 = true;
        boolean needStatc_type2 = true;
        OrderStatistics os0 = null;
        OrderStatistics os1 = null;
        OrderStatistics os2 = null;
        
        OrderStatistics queryStatc = new OrderStatistics();
        queryStatc.setStatcDate(statcDate);
        List<OrderStatistics> orderStatisticsListInDB = orderStatisticsService.selectOrderStatisticsList(queryStatc);
        if (!CollectionUtils.isEmpty(orderStatisticsListInDB)) {
            for (OrderStatistics os : orderStatisticsListInDB) {
                if ("0".equals(os.getDataType()) && !forceStatc) {
                    os0 = os;
                    needStatc_type0 = false;
                } else if ("1".equals(os.getDataType()) && !forceStatc) {
                    needStatc_type1 = false;
                    os1 = os;
                } else if ("2".equals(os.getDataType()) && !forceStatc) {
                    os2 = os;
                    needStatc_type2 = false;
                }
            }
        }

        if (!needStatc_type0 && !needStatc_type1 && !needStatc_type2) {
            logger.info("{}统计数据已存在，且当前是非强制统计，跳过本次统计", desc);
            return;
        }


        //1.查询统计时间段内所有订单
        List<FurnitureOrder> furnitureOrderList = getFurnitureOrderByTime(orderStartTime, orderEndTime);
        if (CollectionUtils.isEmpty(furnitureOrderList)) {
            logger.info("没有查询到{}订单，跳过本次统计", desc);
            return;
        }
        furnitureOrderList.removeIf(o -> o.getOrderStatus().equals("9"));//移除状态是“已取消”的订单，已取消订单不需要统计在内
        if (CollectionUtils.isEmpty(furnitureOrderList)) {
            logger.info("{}订单全部为“已取消”订单，跳过本次统计", desc);
            return;
        }

        
        OrderStatistics orderStatistics = new OrderStatistics();
        orderStatistics.setCreateBy("system");
        orderStatistics.setStatcDate(statcDate);
        
        //订单总数统计
        doStatisticsAndSaveByType(needStatc_type0, statcDate, "0", "总数", Long.valueOf(furnitureOrderList.size()), desc, forceStatc, os0);
        //订单总金额统计
        doStatisticsAndSaveByType(needStatc_type1, statcDate, "1", "总金额", furnitureOrderList.stream().mapToLong(o->o.getTotalMoney().longValue()).sum(), desc, forceStatc, os1);
        //已付款金额统计
        doStatisticsAndSaveByType(needStatc_type2, statcDate, "2", "已付款金额", furnitureOrderList.stream().mapToLong(o->o.getPaidMoney().longValue()).sum(), desc, forceStatc, os2);

    }

    private void doStatisticsAndSaveByType(boolean needStatc_type, String statcDate, String dataType, String dataTypeDesc, Long ststcValue, String desc,  boolean forceStatc,  OrderStatistics os) {

        OrderStatistics orderStatistics = new OrderStatistics();
        orderStatistics.setCreateBy("system");
        orderStatistics.setStatcDate(statcDate);

        if (needStatc_type) {
            if (os != null) {
                logger.info("{}订单[{}]统计，统计已存在，当前是{}统计，执行修改操作", desc, dataTypeDesc, forceStatc ? "[强制]" : "[非强制]");
                os.setStatcValue(ststcValue);
                orderStatisticsService.updateOrderStatistics(os);
            } else {
                logger.info("{}订单[{}]统计，统计不存在，当前是{}统计，执行新增操作", desc, dataTypeDesc, forceStatc ? "[强制]" : "[非强制]");
                orderStatistics.setStatcValue(ststcValue);
                orderStatistics.setDataType(dataType);
                orderStatisticsService.insertOrderStatistics(orderStatistics);
            }
            
        }

    }

    private List<FurnitureOrder> getFurnitureOrderByTime(String orderStartTime, String orderEndTime) {
        FurnitureOrder query = new FurnitureOrder();
        Map<String, Object> params = new HashMap();
        params.put("orderStartTime", orderStartTime);
        params.put("orderEndTime", orderEndTime);
        query.setParams(params);
        return furnitureOrderService.selectFurnitureOrderList(query);
    }
}