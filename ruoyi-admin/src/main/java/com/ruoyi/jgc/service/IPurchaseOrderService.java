package com.ruoyi.jgc.service;

import java.util.List;
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
    public PurchaseOrder selectPurchaseOrderById(Long id);

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
     * 批量删除进货单
     * 
     * @param ids 需要删除的进货单主键集合
     * @return 结果
     */
    public int deletePurchaseOrderByIds(Long[] ids);

    /**
     * 删除进货单信息
     * 
     * @param id 进货单主键
     * @return 结果
     */
    public int deletePurchaseOrderById(Long id);
}
