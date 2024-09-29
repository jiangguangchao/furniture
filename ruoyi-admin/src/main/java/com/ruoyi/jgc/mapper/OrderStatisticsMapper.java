package com.ruoyi.jgc.mapper;

import java.util.List;
import com.ruoyi.jgc.domain.OrderStatistics;

/**
 * 订单统计Mapper接口
 * 
 * @author jgc
 * @date 2024-09-29
 */
public interface OrderStatisticsMapper 
{
    /**
     * 查询订单统计
     * 
     * @param id 订单统计主键
     * @return 订单统计
     */
    public OrderStatistics selectOrderStatisticsById(Long id);

    /**
     * 查询订单统计列表
     * 
     * @param orderStatistics 订单统计
     * @return 订单统计集合
     */
    public List<OrderStatistics> selectOrderStatisticsList(OrderStatistics orderStatistics);

    /**
     * 新增订单统计
     * 
     * @param orderStatistics 订单统计
     * @return 结果
     */
    public int insertOrderStatistics(OrderStatistics orderStatistics);

    /**
     * 修改订单统计
     * 
     * @param orderStatistics 订单统计
     * @return 结果
     */
    public int updateOrderStatistics(OrderStatistics orderStatistics);

    /**
     * 删除订单统计
     * 
     * @param id 订单统计主键
     * @return 结果
     */
    public int deleteOrderStatisticsById(Long id);

    /**
     * 批量删除订单统计
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrderStatisticsByIds(Long[] ids);
}
