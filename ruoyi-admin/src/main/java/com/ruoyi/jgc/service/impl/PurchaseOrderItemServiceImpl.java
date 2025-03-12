package com.ruoyi.jgc.service.impl;

import java.util.List;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.PurchaseOrderItemMapper;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.jgc.domain.AssociationType;
import com.ruoyi.jgc.domain.PicAssociationType;
import com.ruoyi.jgc.domain.PurchaseOrderItem;
import com.ruoyi.jgc.service.IPurchaseOrderItemService;
import com.ruoyi.system.domain.UploadFile;
import com.ruoyi.system.service.IUploadFileService;

/**
 * 进货单明细Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-28
 */
@Service
public class PurchaseOrderItemServiceImpl implements IPurchaseOrderItemService 
{
    @Autowired
    private PurchaseOrderItemMapper purchaseOrderItemMapper;
    @Autowired
    private IUploadFileService  uploadFileService;

    /**
     * 查询进货单明细
     * 
     * @param id 进货单明细主键
     * @return 进货单明细
     */
    @Override
    public PurchaseOrderItem selectPurchaseOrderItemById(String id)
    {
        return purchaseOrderItemMapper.selectPurchaseOrderItemById(id);
    }

    /**
     * 查询进货单明细列表
     * 
     * @param purchaseOrderItem 进货单明细
     * @return 进货单明细
     */
    @Override
    public List<PurchaseOrderItem> selectPurchaseOrderItemList(PurchaseOrderItem purchaseOrderItem)
    {
        List<PurchaseOrderItem> purchaseOrderItems = purchaseOrderItemMapper.selectPurchaseOrderItemList(purchaseOrderItem);

        //查询附属图片
        if (CollectionUtils.isNotEmpty(purchaseOrderItems)) {
            UploadFile query = new UploadFile();
            query.setAssociationType(PicAssociationType.PURCHASE_ORDER_ITME.getCode());
            purchaseOrderItems.forEach(p -> {
                query.setAssociationId(p.getId() + "");
                List<UploadFile> uploadFiles = uploadFileService.selectUploadFileList(query);
                p.setUploadFiles(uploadFiles);
            });
        }
        return purchaseOrderItems;
    }

    /**
     * 新增进货单明细
     * 
     * @param purchaseOrderItem 进货单明细
     * @return 结果
     */
    @Override
    public int insertPurchaseOrderItem(PurchaseOrderItem purchaseOrderItem)
    {
        purchaseOrderItem.setId(DateUtils.dateTimeNow(DateUtils.YYYYMMDDHHMMSS));
        return purchaseOrderItemMapper.insertPurchaseOrderItem(purchaseOrderItem);
    }

    /**
     * 修改进货单明细
     * 
     * @param purchaseOrderItem 进货单明细
     * @return 结果
     */
    @Override
    public int updatePurchaseOrderItem(PurchaseOrderItem purchaseOrderItem)
    {
        return purchaseOrderItemMapper.updatePurchaseOrderItem(purchaseOrderItem);
    }

    /**
     * 批量删除进货单明细
     * 
     * @param ids 需要删除的进货单明细主键
     * @return 结果
     */
    @Override
    public int deletePurchaseOrderItemByIds(String[] ids)
    {
        return purchaseOrderItemMapper.deletePurchaseOrderItemByIds(ids);
    }

    /**
     * 删除进货单明细信息
     * 
     * @param id 进货单明细主键
     * @return 结果
     */
    @Override
    public int deletePurchaseOrderItemById(String id)
    {
        return purchaseOrderItemMapper.deletePurchaseOrderItemById(id);
    }
}
