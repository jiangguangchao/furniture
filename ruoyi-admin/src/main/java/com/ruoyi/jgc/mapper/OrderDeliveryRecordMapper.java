package com.ruoyi.jgc.mapper;

import java.util.List;
import com.ruoyi.jgc.domain.OrderDeliveryRecord;

/**
 * 配送记录Mapper接口
 * 
 * @author ruoyi
 * @date 2024-09-19
 */
public interface OrderDeliveryRecordMapper 
{
    /**
     * 查询配送记录
     * 
     * @param id 配送记录主键
     * @return 配送记录
     */
    public OrderDeliveryRecord selectOrderDeliveryRecordById(Long id);

    /**
     * 查询配送记录列表
     * 
     * @param orderDeliveryRecord 配送记录
     * @return 配送记录集合
     */
    public List<OrderDeliveryRecord> selectOrderDeliveryRecordList(OrderDeliveryRecord orderDeliveryRecord);

    /**
     * 新增配送记录
     * 
     * @param orderDeliveryRecord 配送记录
     * @return 结果
     */
    public int insertOrderDeliveryRecord(OrderDeliveryRecord orderDeliveryRecord);

    /**
     * 修改配送记录
     * 
     * @param orderDeliveryRecord 配送记录
     * @return 结果
     */
    public int updateOrderDeliveryRecord(OrderDeliveryRecord orderDeliveryRecord);

    /**
     * 删除配送记录
     * 
     * @param id 配送记录主键
     * @return 结果
     */
    public int deleteOrderDeliveryRecordById(Long id);

    /**
     * 批量删除配送记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrderDeliveryRecordByIds(Long[] ids);
}
