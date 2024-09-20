package com.ruoyi.jgc.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.OrderFurnitureMapper;
import com.ruoyi.jgc.domain.FurnitureOrder;
import com.ruoyi.jgc.domain.OrderFurniture;
import com.ruoyi.jgc.service.IFurnitureOrderService;
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
    @Autowired
    private IFurnitureOrderService orderService;

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
        int result = orderFurnitureMapper.insertOrderFurniture(orderFurniture);
        updateOrderTotalAmount(orderFurniture.getOrderId());
        return result;
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
        String orderId = orderFurniture.getOrderId();
        //不需要修改订单编号。如果订单编号错误可以直接删除配送记录。新增正确的记录
        orderFurniture.setOrderId(null);
        int result = orderFurnitureMapper.updateOrderFurniture(orderFurniture);
        updateOrderTotalAmount(orderId);
        return result;
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
    public int deleteOrderFurnitureById(Long id, String orderId)
    {
        int result = orderFurnitureMapper.deleteOrderFurnitureById(id);
        updateOrderTotalAmount(orderFurnitureMapper.selectOrderFurnitureById(id).getOrderId());
        return result;
    }

    @Override
    public int updateOrderTotalAmount(String orderId) {
        if(StringUtils.isEmpty(orderId)) {
            return 0;
        }

        OrderFurniture queryFurniture = new OrderFurniture();
        queryFurniture.setOrderId(orderId);
        List<OrderFurniture> orderFurnitures = orderFurnitureMapper.selectOrderFurnitureList(queryFurniture);
        BigDecimal totalMoney = BigDecimal.ZERO;
        if (CollectionUtils.isNotEmpty(orderFurnitures)) {
            for (OrderFurniture orderFurniture : orderFurnitures) {
                totalMoney = totalMoney.add(orderFurniture.getMoney());
            }
        }
        FurnitureOrder updateOrder = new FurnitureOrder();
        updateOrder.setId(orderId);
        updateOrder.setTotalMoney(totalMoney);
        return orderService.updateFurnitureOrder(updateOrder);

    }
}
