package com.ruoyi.jgc.mapper;

import java.util.List;
import com.ruoyi.jgc.domain.PurchaseOrderItem;

/**
 * 进货单明细Mapper接口
 * 
 * @author ruoyi
 * @date 2025-02-28
 */
public interface PurchaseOrderItemMapper 
{
    /**
     * 查询进货单明细
     * 
     * @param id 进货单明细主键
     * @return 进货单明细
     */
    public PurchaseOrderItem selectPurchaseOrderItemById(Long id);

    /**
     * 查询进货单明细列表
     * 
     * @param purchaseOrderItem 进货单明细
     * @return 进货单明细集合
     */
    public List<PurchaseOrderItem> selectPurchaseOrderItemList(PurchaseOrderItem purchaseOrderItem);

    /**
     * 新增进货单明细
     * 
     * @param purchaseOrderItem 进货单明细
     * @return 结果
     */
    public int insertPurchaseOrderItem(PurchaseOrderItem purchaseOrderItem);

    /**
     * 修改进货单明细
     * 
     * @param purchaseOrderItem 进货单明细
     * @return 结果
     */
    public int updatePurchaseOrderItem(PurchaseOrderItem purchaseOrderItem);

    /**
     * 删除进货单明细
     * 
     * @param id 进货单明细主键
     * @return 结果
     */
    public int deletePurchaseOrderItemById(Long id);

    /**
     * 批量删除进货单明细
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePurchaseOrderItemByIds(Long[] ids);
}
