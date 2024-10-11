package com.ruoyi.jgc.service;

import java.util.List;
import com.ruoyi.jgc.domain.FurnitureOrder;
import com.ruoyi.jgc.domain.PaymentRecord;

/**
 * 家具订单Service接口
 * 
 * @author jgc
 * @date 2024-09-10
 */
public interface IFurnitureOrderService 
{
    /**
     * 查询家具订单
     * 
     * @param id 家具订单主键
     * @return 家具订单
     */
    public FurnitureOrder selectFurnitureOrderById(String id);

    /**
     * 查询家具订单列表
     * 
     * @param furnitureOrder 家具订单
     * @return 家具订单集合
     */
    public List<FurnitureOrder> selectFurnitureOrderList(FurnitureOrder furnitureOrder);

    /**
     * 新增家具订单
     * 
     * @param furnitureOrder 家具订单
     * @return 结果
     */
    public int insertFurnitureOrder(FurnitureOrder furnitureOrder);

    /**
     * 修改家具订单
     * 
     * @param furnitureOrder 家具订单
     * @return 结果
     */
    public int updateFurnitureOrder(FurnitureOrder furnitureOrder);

    /**
     * 根据支付记录修改订单中的已支付金额和支付状态
     * @param 
     * @return
     */
    public int updateOrderPayment(String orderId, List<PaymentRecord> paymentRecords);

    /**
     * 批量删除家具订单
     * 
     * @param ids 需要删除的家具订单主键集合
     * @return 结果
     */
    public int deleteFurnitureOrderByIds(String[] ids);

    /**
     * 删除家具订单信息
     * 
     * @param id 家具订单主键
     * @return 结果
     */
    public int deleteFurnitureOrderById(String id);
}
