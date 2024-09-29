package com.ruoyi.jgc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.PurchaseOrderMapper;
import com.ruoyi.jgc.domain.PurchaseOrder;
import com.ruoyi.jgc.service.IPurchaseOrderService;

/**
 * 进货单Service业务层处理
 * 
 * @author jgc
 * @date 2024-09-29
 */
@Service
public class PurchaseOrderServiceImpl implements IPurchaseOrderService 
{
    @Autowired
    private PurchaseOrderMapper purchaseOrderMapper;

    /**
     * 查询进货单
     * 
     * @param id 进货单主键
     * @return 进货单
     */
    @Override
    public PurchaseOrder selectPurchaseOrderById(Long id)
    {
        return purchaseOrderMapper.selectPurchaseOrderById(id);
    }

    /**
     * 查询进货单列表
     * 
     * @param purchaseOrder 进货单
     * @return 进货单
     */
    @Override
    public List<PurchaseOrder> selectPurchaseOrderList(PurchaseOrder purchaseOrder)
    {
        return purchaseOrderMapper.selectPurchaseOrderList(purchaseOrder);
    }

    /**
     * 新增进货单
     * 
     * @param purchaseOrder 进货单
     * @return 结果
     */
    @Override
    public int insertPurchaseOrder(PurchaseOrder purchaseOrder)
    {
        return purchaseOrderMapper.insertPurchaseOrder(purchaseOrder);
    }

    /**
     * 修改进货单
     * 
     * @param purchaseOrder 进货单
     * @return 结果
     */
    @Override
    public int updatePurchaseOrder(PurchaseOrder purchaseOrder)
    {
        return purchaseOrderMapper.updatePurchaseOrder(purchaseOrder);
    }

    /**
     * 批量删除进货单
     * 
     * @param ids 需要删除的进货单主键
     * @return 结果
     */
    @Override
    public int deletePurchaseOrderByIds(Long[] ids)
    {
        return purchaseOrderMapper.deletePurchaseOrderByIds(ids);
    }

    /**
     * 删除进货单信息
     * 
     * @param id 进货单主键
     * @return 结果
     */
    @Override
    public int deletePurchaseOrderById(Long id)
    {
        return purchaseOrderMapper.deletePurchaseOrderById(id);
    }
}
