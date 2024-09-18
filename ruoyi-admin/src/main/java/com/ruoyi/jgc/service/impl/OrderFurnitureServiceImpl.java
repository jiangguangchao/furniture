package com.ruoyi.jgc.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.OrderFurnitureMapper;
import com.ruoyi.jgc.domain.OrderFurniture;
import com.ruoyi.jgc.service.IOrderFurnitureService;

/**
 * 订单中家具Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-18
 */
@Service
public class OrderFurnitureServiceImpl implements IOrderFurnitureService 
{
    @Autowired
    private OrderFurnitureMapper orderFurnitureMapper;

    /**
     * 查询订单中家具
     * 
     * @param id 订单中家具主键
     * @return 订单中家具
     */
    @Override
    public OrderFurniture selectOrderFurnitureById(Long id)
    {
        return orderFurnitureMapper.selectOrderFurnitureById(id);
    }

    /**
     * 查询订单中家具列表
     * 
     * @param orderFurniture 订单中家具
     * @return 订单中家具
     */
    @Override
    public List<OrderFurniture> selectOrderFurnitureList(OrderFurniture orderFurniture)
    {
        return orderFurnitureMapper.selectOrderFurnitureList(orderFurniture);
    }

    /**
     * 新增订单中家具
     * 
     * @param orderFurniture 订单中家具
     * @return 结果
     */
    @Override
    public int insertOrderFurniture(OrderFurniture orderFurniture)
    {
        orderFurniture.setCreateTime(DateUtils.getNowDate());
        return orderFurnitureMapper.insertOrderFurniture(orderFurniture);
    }

    /**
     * 修改订单中家具
     * 
     * @param orderFurniture 订单中家具
     * @return 结果
     */
    @Override
    public int updateOrderFurniture(OrderFurniture orderFurniture)
    {
        orderFurniture.setUpdateTime(DateUtils.getNowDate());
        return orderFurnitureMapper.updateOrderFurniture(orderFurniture);
    }

    /**
     * 批量删除订单中家具
     * 
     * @param ids 需要删除的订单中家具主键
     * @return 结果
     */
    @Override
    public int deleteOrderFurnitureByIds(Long[] ids)
    {
        return orderFurnitureMapper.deleteOrderFurnitureByIds(ids);
    }

    /**
     * 删除订单中家具信息
     * 
     * @param id 订单中家具主键
     * @return 结果
     */
    @Override
    public int deleteOrderFurnitureById(Long id)
    {
        return orderFurnitureMapper.deleteOrderFurnitureById(id);
    }
}
