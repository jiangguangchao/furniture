package com.ruoyi.jgc.service.impl;

import java.util.List;
import java.math.BigDecimal;
import com.ruoyi.common.utils.DateUtils;

import org.apache.commons.collections4.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.FurnitureOrderMapper;
import com.ruoyi.jgc.domain.FurnitureOrder;
import com.ruoyi.jgc.domain.PaymentRecord;
import com.ruoyi.jgc.service.IFurnitureOrderService;

/**
 * 家具订单Service业务层处理
 * 
 * @author jgc
 * @date 2024-09-10
 */
@Service
public class FurnitureOrderServiceImpl implements IFurnitureOrderService 
{

    private static final Logger log = LoggerFactory.getLogger(FurnitureOrderServiceImpl.class);


    @Autowired
    private FurnitureOrderMapper furnitureOrderMapper;

    /**
     * 查询家具订单
     * 
     * @param id 家具订单主键
     * @return 家具订单
     */
    @Override
    public FurnitureOrder selectFurnitureOrderById(String id)
    {
        return furnitureOrderMapper.selectFurnitureOrderById(id);
    }

    /**
     * 查询家具订单列表
     * 
     * @param furnitureOrder 家具订单
     * @return 家具订单
     */
    @Override
    public List<FurnitureOrder> selectFurnitureOrderList(FurnitureOrder furnitureOrder)
    {
        return furnitureOrderMapper.selectFurnitureOrderList(furnitureOrder);
    }

    /**
     * 新增家具订单
     * 
     * @param furnitureOrder 家具订单
     * @return 结果
     */
    @Override
    public int insertFurnitureOrder(FurnitureOrder furnitureOrder)
    {
        furnitureOrder.setPaymentStatus("0");//新增订单支付状态为未支付
        furnitureOrder.setDeliveryStatus("0");//未配送
        furnitureOrder.setCreateTime(DateUtils.getNowDate());
        furnitureOrder.setId(DateUtils.dateTimeNow(DateUtils.YYYYMMDDHHMMSS));
        return furnitureOrderMapper.insertFurnitureOrder(furnitureOrder);
    }

    /**
     * 修改家具订单
     * 
     * @param furnitureOrder 家具订单
     * @return 结果
     */
    @Override
    public int updateFurnitureOrder(FurnitureOrder furnitureOrder)
    {
        return furnitureOrderMapper.updateFurnitureOrder(furnitureOrder);
    }

    /**
     * 批量删除家具订单
     * 
     * @param ids 需要删除的家具订单主键
     * @return 结果
     */
    @Override
    public int deleteFurnitureOrderByIds(String[] ids)
    {
        return furnitureOrderMapper.deleteFurnitureOrderByIds(ids);
    }

    /**
     * 删除家具订单信息
     * 
     * @param id 家具订单主键
     * @return 结果
     */
    @Override
    public int deleteFurnitureOrderById(String id)
    {
        return furnitureOrderMapper.deleteFurnitureOrderById(id);
    }

    /**
     * 根据支付记录修改订单中的已支付金额和支付状态
     * @param orderId
     * @param paymentRecords
     * @return
     */
    @Override
    public int updateOrderPayment(String orderId, List<PaymentRecord> paymentRecords) {
        FurnitureOrder order = new FurnitureOrder();
        order.setId(orderId);
        order.setPaymentStatus("0");//未支付

        BigDecimal payAmout = new BigDecimal(0);
        if (CollectionUtils.isNotEmpty(paymentRecords)) {
            for (PaymentRecord paymentRecord : paymentRecords) {
                if (!"FO".equals(paymentRecord.getAssociationType())) {
                    continue;
                }
                payAmout = payAmout.add(paymentRecord.getPaymentAmount());
            }
            log.info("根据[{}]支付记录,更新家具订单中的支付金额为[{}]", paymentRecords.size(), payAmout);

            //已支付金额和订单金额对比
            FurnitureOrder orderInDB = selectFurnitureOrderById(orderId);
            if (payAmout.equals(orderInDB.getTotalMoney())) {
                order.setPaymentStatus("2");//支付完成
            } else {
                order.setPaymentStatus("1");//部分支付
            }
        }
        order.setPaidMoney(payAmout);
        return updateFurnitureOrder(order);
    }
}
