package com.ruoyi.jgc.service;

import java.util.List;

import com.ruoyi.jgc.domain.PaymentRecord;
import com.ruoyi.jgc.domain.PurchaseOrder;

/**
 * 进货单Service接口
 * 
 * @author jgc
 * @date 2024-09-29
 */
public interface IPurchaseOrderService 
{
    /**
     * 查询进货单
     * 
     * @param id 进货单主键
     * @return 进货单
     */
    public PurchaseOrder selectPurchaseOrderById(String id);

    /**
     * 查询进货单列表
     * 
     * @param purchaseOrder 进货单
     * @return 进货单集合
     */
    public List<PurchaseOrder> selectPurchaseOrderList(PurchaseOrder purchaseOrder);

    /**
     * 新增进货单
     * 
     * @param purchaseOrder 进货单
     * @return 结果
     */
    public int insertPurchaseOrder(PurchaseOrder purchaseOrder);

    /**
     * 修改进货单
     * 
     * @param purchaseOrder 进货单
     * @return 结果
     */
    public int updatePurchaseOrder(PurchaseOrder purchaseOrder);

        /**
     * 根据支付记录修改订单中的已支付金额和支付状态
     * @param 
     * @return
     */
    public int updateOrderPayment(String orderId, List<PaymentRecord> paymentRecords);

    /**
     * 批量删除进货单
     * 
     * @param ids 需要删除的进货单主键集合
     * @return 结果
     */
    public int deletePurchaseOrderByIds(String[] ids);

    /**
     * 删除进货单信息
     * 
     * @param id 进货单主键
     * @return 结果
     */
    public int deletePurchaseOrderById(String id);
}
