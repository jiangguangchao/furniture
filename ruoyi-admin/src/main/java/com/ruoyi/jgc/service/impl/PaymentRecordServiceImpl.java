package com.ruoyi.jgc.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.ruoyi.common.utils.StringUtils;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.PaymentRecordMapper;
import com.ruoyi.jgc.domain.FurnitureOrder;
import com.ruoyi.jgc.domain.PaymentRecord;
import com.ruoyi.jgc.service.IFurnitureOrderService;
import com.ruoyi.jgc.service.IPaymentRecordService;

/**
 * 支付记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-14
 */
@Service
public class PaymentRecordServiceImpl implements IPaymentRecordService 
{
    @Autowired
    private PaymentRecordMapper paymentRecordMapper;

    @Autowired
    private IFurnitureOrderService orderService;

    /**
     * 查询支付记录
     * 
     * @param id 支付记录主键
     * @return 支付记录
     */
    @Override
    public PaymentRecord selectPaymentRecordById(Long id)
    {
        return paymentRecordMapper.selectPaymentRecordById(id);
    }

    /**
     * 查询支付记录列表
     * 
     * @param paymentRecord 支付记录
     * @return 支付记录
     */
    @Override
    public List<PaymentRecord> selectPaymentRecordList(PaymentRecord paymentRecord)
    {
        return paymentRecordMapper.selectPaymentRecordList(paymentRecord);
    }

    /**
     * 新增支付记录
     * 
     * @param paymentRecord 支付记录
     * @return 结果
     */
    @Override
    public int insertPaymentRecord(PaymentRecord paymentRecord)
    {
        int result = paymentRecordMapper.insertPaymentRecord(paymentRecord);
        updateOrderPayment(paymentRecord.getOrderId());
        return result;
    }

    /**
     * 修改支付记录
     * 
     * @param paymentRecord 支付记录
     * @return 结果
     */
    @Override
    public int updatePaymentRecord(PaymentRecord paymentRecord)
    {

        String orderId = paymentRecord.getOrderId();
        //不需要修改订单编号。如果订单编号错误可以直接删除配送记录。新增正确的记录
        paymentRecord.setOrderId(null);
        int result = paymentRecordMapper.updatePaymentRecord(paymentRecord);
        updateOrderPayment(orderId);
        return result;
    }

    /**
     * 批量删除支付记录
     * 
     * @param ids 需要删除的支付记录主键
     * @return 结果
     */
    @Override
    public int deletePaymentRecordByIds(Long[] ids)
    {
        return paymentRecordMapper.deletePaymentRecordByIds(ids);
    }

    /**
     * 删除支付记录信息
     * 
     * @param id 支付记录主键
     * @return 结果
     */
    @Override
    public int deletePaymentRecordById(Long id, String orderId)
    {
        int result = paymentRecordMapper.deletePaymentRecordById(id);
        updateOrderPayment(orderId);
        return result;

    }

    /**
     * 更新订单中的支付信息（支付金额和支付状态）
     * 支付状态说明：0 未支付，1 部分支付，2 支付完成
     * 
     * 逻辑说明：订单中存在订单金额，支付金额和支付状态。同一笔订单存在分次支付的情况。
     * 所以订单下有支付记录表。记录订单的多次支付信息。根据支付信息修改订单中的支付金额和
     * 支付状态。如果订单下没有支付记录，则修改订单支付状态为未支付 和支付金额为0。
     * 如果有支付记录，也要修改支付金额和支付状态。
     * 
     */
    @Override
    public int updateOrderPayment(String orderId) {
        if (StringUtils.isEmpty(orderId)) {
            return 0;
        }

        FurnitureOrder order = new FurnitureOrder();
        order.setId(orderId);
        order.setPaymentStatus("0");//未支付

        BigDecimal payAmout = new BigDecimal(0);
        PaymentRecord quRecord = new PaymentRecord();
        quRecord.setOrderId(orderId);
        List<PaymentRecord> paymentRecords = paymentRecordMapper.selectPaymentRecordList(quRecord);
        if (CollectionUtils.isNotEmpty(paymentRecords)) {
            for (PaymentRecord paymentRecord : paymentRecords) {
                payAmout = payAmout.add(paymentRecord.getPaymentAmount());
            }

            //已支付金额和订单金额对比
            FurnitureOrder orderInDB = orderService.selectFurnitureOrderById(orderId);
            if (payAmout.equals(orderInDB.getTotalMoney())) {
                order.setPaymentStatus("2");//支付完成
            } else {
                order.setPaymentStatus("1");//部分支付
            }
        }
        order.setPaidMoney(payAmout);
        return orderService.updateFurnitureOrder(order);
    }
}
