package com.ruoyi.jgc.schedule;

import org.apache.commons.collections4.MapUtils;
import org.apache.poi.hpsf.Date;
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

import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;
import com.mysql.cj.x.protobuf.MysqlxCrud.Order;
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
    
    @Scheduled(fixedDelay = 5000l)
    public void test() {
        System.out.println("test..............");

        //统计今日订单
        doStatisticsAndSave("D", DateUtils.getStartTime(), DateUtils.getStartTime("D", 1), "今日");
        
        //统计昨日订单
        doStatisticsAndSave("D", DateUtils.getStartTime("D", -1), DateUtils.getStartTime(), "昨日");

        //统计本月订单
        doStatisticsAndSave("M", DateUtils.getStartTime("M", 0), DateUtils.getStartTime("M", 1), "本月");

        //统计上月订单
        doStatisticsAndSave("M", DateUtils.getStartTime("M", -1), DateUtils.getStartTime("M", 0), "上月");

        //统计今年订单
        doStatisticsAndSave("Y", DateUtils.getStartTime("Y", 0), DateUtils.getStartTime("Y", 1), "今年");

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

        OrderStatistics queryStatc = new OrderStatistics();
        queryStatc.setStatcDate(statcDate);
        List<OrderStatistics> orderStatisticsList = orderStatisticsService.selectOrderStatisticsList(queryStatc);
        if (CollectionUtils.isEmpty(orderStatisticsList)) {
            
        }


        //1.查询统计时间段内所有订单
        List<FurnitureOrder> furnitureOrderList = getFurnitureOrderByTime(orderStartTime, orderEndTime);
        if (CollectionUtils.isEmpty(furnitureOrderList)) {
            logger.info("没有查询到{}订单，跳过统计", desc);
            return;
        }
        furnitureOrderList.removeIf(o -> o.getOrderStatus().equals("9"));//移除状态是“已取消”的订单，已取消订单不需要统计在内
        if (CollectionUtils.isEmpty(furnitureOrderList)) {
            logger.info("{}订单全部为“已取消”订单，跳过统计", desc);
            return;
        }

        
        OrderStatistics orderStatistics = new OrderStatistics();
        orderStatistics.setCreateBy("system");
        orderStatistics.setStatcDate(statcDate);
        
        //订单总数
        orderStatistics.setStatcValue(Long.valueOf(furnitureOrderList.size()));
        orderStatistics.setDataType("0");
        orderStatisticsService.insertOrderStatistics(orderStatistics);

        //订单总金额
        orderStatistics.setDataType("1");
        //家具订单金额不会存在小数，都是整元。所以这里合计的时候直接用long类型相加即可
        orderStatistics.setStatcValue(furnitureOrderList.stream().mapToLong(o->o.getTotalMoney().longValue()).sum());
        orderStatistics.setId(null);//上一步insert操作时，主键会自动回填，这里需要设置为null
        orderStatisticsService.insertOrderStatistics(orderStatistics);

        //订单支付总金额
        orderStatistics.setDataType("2");
        orderStatistics.setStatcValue(furnitureOrderList.stream().mapToLong(o->o.getPaidMoney().longValue()).sum());
        orderStatistics.setId(null);//上一步insert操作时，主键会自动回填，这里需要设置为null
        orderStatisticsService.insertOrderStatistics(orderStatistics);

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