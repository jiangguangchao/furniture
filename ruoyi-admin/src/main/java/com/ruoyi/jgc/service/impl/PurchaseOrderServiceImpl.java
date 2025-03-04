package com.ruoyi.jgc.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.PurchaseOrderMapper;
import com.ruoyi.jgc.domain.PurchaseOrder;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.jgc.domain.AssociationType;
import com.ruoyi.jgc.domain.FurnitureOrder;
import com.ruoyi.jgc.domain.PaymentRecord;
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
    public PurchaseOrder selectPurchaseOrderById(String id)
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

        //查询附属图片
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
        purchaseOrder.setId(DateUtils.dateTimeNow(DateUtils.YYYYMMDDHHMMSS));
        int result = purchaseOrderMapper.insertPurchaseOrder(purchaseOrder);
        //更新上传文件记录
        // List<UploadFile> uploadFiles = purchaseOrder.getUploadFiles();
        // if (CollectionUtils.isNotEmpty(uploadFiles)) {
        //     log.info("新增进货单 本次新增图片{}张", uploadFiles.size());
        //     uploadFiles.forEach(uploadFile -> {
        //         uploadFile.setAssociationId(purchaseOrder.getId() + "");
        //         uploadFile.setAssociationType(AssociationType.PURCHASE_ORDER.getCode());
        //         uploadFileService.updateUploadFile(uploadFile);
        //     });
        // }
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
        // List<UploadFile> uploadFiles = purchaseOrder.getUploadFiles();
        // if (CollectionUtils.isNotEmpty(uploadFiles)) {
        //     log.info("修改进货单 本次新增图片{}张", uploadFiles.size());
        //     uploadFiles.forEach(uploadFile -> {
        //         uploadFile.setAssociationId(purchaseOrder.getId() + "");
        //         uploadFile.setAssociationType(AssociationType.PURCHASE_ORDER.getCode());
        //         uploadFileService.updateUploadFile(uploadFile);
        //     });
        // }

        return result;
    }

    /**
     * 批量删除进货单
     * 
     * @param ids 需要删除的进货单主键
     * @return 结果
     */
    @Override
    public int deletePurchaseOrderByIds(String[] ids)
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
    public int deletePurchaseOrderById(String id)
    {
        return purchaseOrderMapper.deletePurchaseOrderById(id);
    }

    @Override
    public int updateOrderPayment(String orderId, List<PaymentRecord> paymentRecords) {
        PurchaseOrder order = new PurchaseOrder();
        order.setId(orderId);
        order.setPaymentStatus("0");//未支付

        BigDecimal payAmout = new BigDecimal(0);
        if (CollectionUtils.isNotEmpty(paymentRecords)) {
            for (PaymentRecord paymentRecord : paymentRecords) {
                if (!AssociationType.PURCHASE_ORDER.getCode().equals(paymentRecord.getAssociationType())) {
                    continue;
                }
                payAmout = payAmout.add(paymentRecord.getPaymentAmount());
            }

            //已支付金额和订单金额对比
            PurchaseOrder orderInDB = selectPurchaseOrderById(orderId);
            if (payAmout.equals(orderInDB.getTotalAmount())) {
                order.setPaymentStatus("2");//支付完成
            } else {
                order.setPaymentStatus("1");//部分支付
            }
        }
        order.setPaidMoney(payAmout);
        return updatePurchaseOrder(order);
    }

    @Override
    public int updateFrunitureCategory(String id, String frunitureCtgy, String addOrRemove) {
        PurchaseOrder purchaseOrder = selectPurchaseOrderById(id);
        String frunitureCategory = purchaseOrder.getFrunitureCategory();
        if ("1".equals(addOrRemove)) {
            frunitureCategory = StringUtils.isEmpty(frunitureCategory) ? frunitureCtgy : frunitureCategory + "," + frunitureCtgy;
        } else {
            if (StringUtils.isNotEmpty(frunitureCategory)) {
                String[] frunitureCtgys = frunitureCategory.split(",");
                List<String> frunitureCtgysList = new ArrayList<>(Arrays.asList(frunitureCtgys));
                frunitureCtgysList.remove(frunitureCtgy);
                frunitureCategory = StringUtils.join(frunitureCtgysList, ",");
            }
        }

        PurchaseOrder updatPurchaseOrder = new PurchaseOrder();
        updatPurchaseOrder.setId(id);
        updatPurchaseOrder.setFrunitureCategory(frunitureCategory);
        return updatePurchaseOrder(updatPurchaseOrder);
    }

}
