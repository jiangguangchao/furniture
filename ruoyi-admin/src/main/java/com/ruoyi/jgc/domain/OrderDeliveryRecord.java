package com.ruoyi.jgc.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 配送记录对象 order_delivery_record
 * 
 * @author ruoyi
 * @date 2024-09-19
 */
public class OrderDeliveryRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 配送编号 */
    private Long id;

    /** 订单号 */
    @Excel(name = "订单号")
    private String orderId;

    /** 配送时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "配送时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deliveryTime;

    /** 配送状态 */
    @Excel(name = "配送状态")
    private String deliveryStatus;

    private Long workerId;

    public void setWorkerId(Long workerId) {
        this.workerId = workerId;
    }

    public Long getWorkerId() {
        return workerId;
    }
    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOrderId(String orderId) 
    {
        this.orderId = orderId;
    }

    public String getOrderId() 
    {
        return orderId;
    }
    public void setDeliveryTime(Date deliveryTime) 
    {
        this.deliveryTime = deliveryTime;
    }

    public Date getDeliveryTime() 
    {
        return deliveryTime;
    }
    public void setDeliveryStatus(String deliveryStatus) 
    {
        this.deliveryStatus = deliveryStatus;
    }

    public String getDeliveryStatus() 
    {
        return deliveryStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("deliveryTime", getDeliveryTime())
            .append("deliveryStatus", getDeliveryStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
