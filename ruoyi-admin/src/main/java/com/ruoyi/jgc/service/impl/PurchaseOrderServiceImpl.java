package com.ruoyi.jgc.service.impl;

import java.util.List;

import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.PurchaseOrderMapper;
import com.ruoyi.jgc.domain.PurchaseOrder;
import com.ruoyi.jgc.domain.AssociationType;
import com.ruoyi.jgc.service.IPurchaseOrderService;
import com.ruoyi.system.domain.UploadFile;
import com.ruoyi.system.service.IUploadFileService;

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
    @Autowired
    private IUploadFileService  uploadFileService;

    Logger log = org.slf4j.LoggerFactory.getLogger(PurchaseOrderServiceImpl.class);

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
        List<PurchaseOrder> purchaseOrders = purchaseOrderMapper.selectPurchaseOrderList(purchaseOrder);
        if (CollectionUtils.isNotEmpty(purchaseOrders)) {
            UploadFile query = new UploadFile();
            query.setAssociationType(AssociationType.PURCHASE_ORDER.getCode());
            purchaseOrders.forEach(p -> {
                query.setAssociationId(p.getId() + "");
                List<UploadFile> uploadFiles = uploadFileService.selectUploadFileList(query);
                p.setUploadFiles(uploadFiles);
            });
        }
        return purchaseOrders;
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
        int result = purchaseOrderMapper.insertPurchaseOrder(purchaseOrder);
        //更新上传文件记录
        List<UploadFile> uploadFiles = purchaseOrder.getUploadFiles();
        if (CollectionUtils.isNotEmpty(uploadFiles)) {
            log.info("新增进货单 本次新增图片{}张", uploadFiles.size());
            uploadFiles.forEach(uploadFile -> {
                uploadFile.setAssociationId(purchaseOrder.getId() + "");
                uploadFile.setAssociationType(AssociationType.PURCHASE_ORDER.getCode());
                uploadFileService.updateUploadFile(uploadFile);
            });
        }
        return result;
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
        int result = purchaseOrderMapper.updatePurchaseOrder(purchaseOrder);
        //更新上传文件记录
        List<UploadFile> uploadFiles = purchaseOrder.getUploadFiles();
        if (CollectionUtils.isNotEmpty(uploadFiles)) {
            log.info("修改进货单 本次新增图片{}张", uploadFiles.size());
            uploadFiles.forEach(uploadFile -> {
                uploadFile.setAssociationId(purchaseOrder.getId() + "");
                uploadFile.setAssociationType(AssociationType.PURCHASE_ORDER.getCode());
                uploadFileService.updateUploadFile(uploadFile);
            });
        }

        return result;
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
