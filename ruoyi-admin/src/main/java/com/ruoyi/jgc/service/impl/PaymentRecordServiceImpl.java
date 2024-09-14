package com.ruoyi.jgc.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.PaymentRecordMapper;
import com.ruoyi.jgc.domain.PaymentRecord;
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
        paymentRecord.setCreateTime(DateUtils.getNowDate());
        return paymentRecordMapper.insertPaymentRecord(paymentRecord);
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
        paymentRecord.setUpdateTime(DateUtils.getNowDate());
        return paymentRecordMapper.updatePaymentRecord(paymentRecord);
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
    public int deletePaymentRecordById(Long id)
    {
        return paymentRecordMapper.deletePaymentRecordById(id);
    }
}
