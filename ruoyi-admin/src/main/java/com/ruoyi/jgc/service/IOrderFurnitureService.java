package com.ruoyi.jgc.service;

import java.util.List;
import com.ruoyi.jgc.domain.OrderFurniture;

/**
 * 订单中家具Service接口
 * 
 * @author ruoyi
 * @date 2024-09-18
 */
public interface IOrderFurnitureService 
{
    /**
     * 查询订单中家具
     * 
     * @param id 订单中家具主键
     * @return 订单中家具
     */
    public OrderFurniture selectOrderFurnitureById(Long id);

    /**
     * 查询订单中家具列表
     * 
     * @param orderFurniture 订单中家具
     * @return 订单中家具集合
     */
    public List<OrderFurniture> selectOrderFurnitureList(OrderFurniture orderFurniture);

    /**
     * 新增订单中家具
     * 
     * @param orderFurniture 订单中家具
     * @return 结果
     */
    public int insertOrderFurniture(OrderFurniture orderFurniture);

    /**
     * 修改订单中家具
     * 
     * @param orderFurniture 订单中家具
     * @return 结果
     */
    public int updateOrderFurniture(OrderFurniture orderFurniture);

    /**
     * 批量删除订单中家具
     * 
     * @param ids 需要删除的订单中家具主键集合
     * @return 结果
     */
    public int deleteOrderFurnitureByIds(Long[] ids);

    /**
     * 删除订单中家具信息
     * 
     * @param id 订单中家具主键
     * @return 结果
     */
    public int deleteOrderFurnitureById(Long id, String orderId);

    /**
     * 更新订单中的总金额
     * @param orderId
     * @return
     */
    public int updateOrderTotalAmount(String orderId);
}
