package com.ruoyi.jgc.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.OrderDeliveryRecordMapper;
import com.ruoyi.jgc.domain.FurnitureOrder;
import com.ruoyi.jgc.domain.OrderDeliveryRecord;
import com.ruoyi.jgc.domain.WorkRecord;
import com.ruoyi.jgc.service.IFurnitureOrderService;
import com.ruoyi.jgc.service.IOrderDeliveryRecordService;
import com.ruoyi.jgc.service.IWorkRecordService;
import com.ruoyi.system.service.ISysUserService;

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
    @Autowired
    private IFurnitureOrderService orderService;
    @Autowired
    private IWorkRecordService workRecordService;
    @Autowired
    private ISysUserService userService;

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
        int result = orderDeliveryRecordMapper.insertOrderDeliveryRecord(orderDeliveryRecord);
        updateOrderDeliveryStatus(orderDeliveryRecord.getOrderId());
        return result;
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

        OrderDeliveryRecord oldRecord = orderDeliveryRecordMapper.selectOrderDeliveryRecordById(orderDeliveryRecord.getId());

        orderDeliveryRecord.setUpdateTime(DateUtils.getNowDate());
        String orderId = orderDeliveryRecord.getOrderId();
        //不需要修改订单编号。如果订单编号错误可以直接删除配送记录。新增正确的记录
        orderDeliveryRecord.setOrderId(null);
        int result = orderDeliveryRecordMapper.updateOrderDeliveryRecord(orderDeliveryRecord);

        //更新订单中的配送状态
        updateOrderDeliveryStatus(orderId);

        //如果配送记录的配送状态改为了“配送完成”，则生成对应的工作记录到工作记录表
        if ("3".equals(orderDeliveryRecord.getDeliveryStatus()) && !"3".equals(oldRecord.getDeliveryStatus())) {
            //生成工作记录
            WorkRecord workRecord = new WorkRecord();
            workRecord.setOrderId(orderId);
            workRecord.setWorkerId(orderDeliveryRecord.getWorkerId());
            workRecord.setDeliveryId(orderDeliveryRecord.getId());

            BigDecimal salary = userService.selectUserById(orderDeliveryRecord.getWorkerId()).getSalary();
            workRecord.setSalary(salary);//从员工信息中获取工资

            Date deliveryTime = orderDeliveryRecord.getDeliveryTime();
            if (deliveryTime == null) {
                deliveryTime = oldRecord.getDeliveryTime();
            }
            if (deliveryTime == null) {
                deliveryTime = new Date();
            }
            workRecord.setWorkDate(deliveryTime);
            workRecord.setDeliveryTime(deliveryTime);
            workRecord.setCreateBy("system");//表示是系统自动创建的记录
            workRecordService.insertWorkRecord(workRecord);
        }

        return result;
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
    public int deleteOrderDeliveryRecordById(Long id, String orderId)
    {
        int result = orderDeliveryRecordMapper.deleteOrderDeliveryRecordById(id);
        updateOrderDeliveryStatus(orderId);
        return result;
    }

    @Override
    public int updateOrderDeliveryStatus(String orderId) {
        if (StringUtils.isEmpty(orderId)) {
            return 0;
        }

        OrderDeliveryRecord queryRecord = new OrderDeliveryRecord();
        queryRecord.setOrderId(orderId);
        List<OrderDeliveryRecord> orderDeliveryRecords = orderDeliveryRecordMapper.selectOrderDeliveryRecordList(queryRecord);

        FurnitureOrder updateOrder = new FurnitureOrder();
        updateOrder.setId(orderId);
        updateOrder.setDeliveryStatus("0");

        if (CollectionUtils.isNotEmpty(orderDeliveryRecords)) {
            for (OrderDeliveryRecord record : orderDeliveryRecords) {

                //如果配送记录中的pei送状态只要有一个不为“0”（未配送），就说明订单处于配送中
                if (!"0".equals(record.getDeliveryStatus())) {
                    updateOrder.setDeliveryStatus("1");//配送中
                    break;
                }
            }
        }

        return orderService.updateFurnitureOrder(updateOrder);
    }
}
