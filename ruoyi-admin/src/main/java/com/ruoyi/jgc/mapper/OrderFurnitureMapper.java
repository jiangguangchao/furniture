package com.ruoyi.jgc.mapper;

import java.util.List;
import com.ruoyi.jgc.domain.OrderFurniture;

/**
 * 订单中家具Mapper接口
 * 
 * @author ruoyi
 * @date 2024-09-18
 */
public interface OrderFurnitureMapper 
{
    /**
     * 查询订单中家具
     * 
     * @param id 订单中家具主键
     * @return 订单中家具
     */
    public OrderFurniture selectOrderFurnitureById(String id);

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
     * 删除订单中家具
     * 
     * @param id 订单中家具主键
     * @return 结果
     */
    public int deleteOrderFurnitureById(String id);

    /**
     * 批量删除订单中家具
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrderFurnitureByIds(String[] ids);
}
