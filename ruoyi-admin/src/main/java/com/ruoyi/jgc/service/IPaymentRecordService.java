package com.ruoyi.jgc.service;

import java.util.List;
import com.ruoyi.jgc.domain.PaymentRecord;

/**
 * 支付记录Service接口
 * 
 * @author ruoyi
 * @date 2024-09-14
 */
public interface IPaymentRecordService 
{
    /**
     * 查询支付记录
     * 
     * @param id 支付记录主键
     * @return 支付记录
     */
    public PaymentRecord selectPaymentRecordById(Long id);

    /**
     * 查询支付记录列表
     * 
     * @param paymentRecord 支付记录
     * @return 支付记录集合
     */
    public List<PaymentRecord> selectPaymentRecordList(PaymentRecord paymentRecord);

    /**
     * 新增支付记录
     * 
     * @param paymentRecord 支付记录
     * @return 结果
     */
    public int insertPaymentRecord(PaymentRecord paymentRecord);

    /**
     * 修改支付记录
     * 
     * @param paymentRecord 支付记录
     * @return 结果
     */
    public int updatePaymentRecord(PaymentRecord paymentRecord);

    /**
     * 批量删除支付记录
     * 
     * @param ids 需要删除的支付记录主键集合
     * @return 结果
     */
    public int deletePaymentRecordByIds(Long[] ids);

    /**
     * 删除支付记录信息
     * 
     * @param id 支付记录主键
     * @return 结果
     */
    public int deletePaymentRecordById(Long id);
}
