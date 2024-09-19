package com.ruoyi.jgc.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.OrderDeliveryRecordMapper;
import com.ruoyi.jgc.domain.OrderDeliveryRecord;
import com.ruoyi.jgc.service.IOrderDeliveryRecordService;

/**
 * 配送记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-19
 */
@Service
public class OrderDeliveryRecordServiceImpl implements IOrderDeliveryRecordService 
{
    @Autowired
    private OrderDeliveryRecordMapper orderDeliveryRecordMapper;

    /**
     * 查询配送记录
     * 
     * @param id 配送记录主键
     * @return 配送记录
     */
    @Override
    public OrderDeliveryRecord selectOrderDeliveryRecordById(Long id)
    {
        return orderDeliveryRecordMapper.selectOrderDeliveryRecordById(id);
    }

    /**
     * 查询配送记录列表
     * 
     * @param orderDeliveryRecord 配送记录
     * @return 配送记录
     */
    @Override
    public List<OrderDeliveryRecord> selectOrderDeliveryRecordList(OrderDeliveryRecord orderDeliveryRecord)
    {
        return orderDeliveryRecordMapper.selectOrderDeliveryRecordList(orderDeliveryRecord);
    }

    /**
     * 新增配送记录
     * 
     * @param orderDeliveryRecord 配送记录
     * @return 结果
     */
    @Override
    public int insertOrderDeliveryRecord(OrderDeliveryRecord orderDeliveryRecord)
    {
        orderDeliveryRecord.setCreateTime(DateUtils.getNowDate());
        return orderDeliveryRecordMapper.insertOrderDeliveryRecord(orderDeliveryRecord);
    }

    /**
     * 修改配送记录
     * 
     * @param orderDeliveryRecord 配送记录
     * @return 结果
     */
    @Override
    public int updateOrderDeliveryRecord(OrderDeliveryRecord orderDeliveryRecord)
    {
        orderDeliveryRecord.setUpdateTime(DateUtils.getNowDate());
        return orderDeliveryRecordMapper.updateOrderDeliveryRecord(orderDeliveryRecord);
    }

    /**
     * 批量删除配送记录
     * 
     * @param ids 需要删除的配送记录主键
     * @return 结果
     */
    @Override
    public int deleteOrderDeliveryRecordByIds(Long[] ids)
    {
        return orderDeliveryRecordMapper.deleteOrderDeliveryRecordByIds(ids);
    }

    /**
     * 删除配送记录信息
     * 
     * @param id 配送记录主键
     * @return 结果
     */
    @Override
    public int deleteOrderDeliveryRecordById(Long id)
    {
        return orderDeliveryRecordMapper.deleteOrderDeliveryRecordById(id);
    }
}
