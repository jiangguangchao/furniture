package com.ruoyi.jgc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.OrderStatisticsMapper;
import com.ruoyi.jgc.domain.OrderStatistics;
import com.ruoyi.jgc.service.IOrderStatisticsService;

/**
 * 订单统计Service业务层处理
 * 
 * @author jgc
 * @date 2024-09-29
 */
@Service
public class OrderStatisticsServiceImpl implements IOrderStatisticsService 
{
    @Autowired
    private OrderStatisticsMapper orderStatisticsMapper;

    /**
     * 查询订单统计
     * 
     * @param id 订单统计主键
     * @return 订单统计
     */
    @Override
    public OrderStatistics selectOrderStatisticsById(Long id)
    {
        return orderStatisticsMapper.selectOrderStatisticsById(id);
    }

    /**
     * 查询订单统计列表
     * 
     * @param orderStatistics 订单统计
     * @return 订单统计
     */
    @Override
    public List<OrderStatistics> selectOrderStatisticsList(OrderStatistics orderStatistics)
    {
        return orderStatisticsMapper.selectOrderStatisticsList(orderStatistics);
    }

    /**
     * 新增订单统计
     * 
     * @param orderStatistics 订单统计
     * @return 结果
     */
    @Override
    public int insertOrderStatistics(OrderStatistics orderStatistics)
    {
        return orderStatisticsMapper.insertOrderStatistics(orderStatistics);
    }

    /**
     * 修改订单统计
     * 
     * @param orderStatistics 订单统计
     * @return 结果
     */
    @Override
    public int updateOrderStatistics(OrderStatistics orderStatistics)
    {
        return orderStatisticsMapper.updateOrderStatistics(orderStatistics);
    }

    /**
     * 批量删除订单统计
     * 
     * @param ids 需要删除的订单统计主键
     * @return 结果
     */
    @Override
    public int deleteOrderStatisticsByIds(Long[] ids)
    {
        return orderStatisticsMapper.deleteOrderStatisticsByIds(ids);
    }

    /**
     * 删除订单统计信息
     * 
     * @param id 订单统计主键
     * @return 结果
     */
    @Override
    public int deleteOrderStatisticsById(Long id)
    {
        return orderStatisticsMapper.deleteOrderStatisticsById(id);
    }
}
