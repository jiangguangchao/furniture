package com.ruoyi.jgc.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 工作记录对象 work_record
 * 
 * @author jgc
 * @date 2024-09-20
 */
public class WorkRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记录编号 */
    private Long id;

    /** 员工编号 */
    @Excel(name = "员工编号")
    private Long workerId;

    /** 工作日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "工作日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date workDate;

    /** 工作时间段 */
    @Excel(name = "工作时间段")
    private String workPeriod;

    /** 配送时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "配送时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deliveryTime;

    /** 订单编号 */
    @Excel(name = "订单编号")
    private String orderId;

    /** 报酬 */
    @Excel(name = "报酬")
    private BigDecimal salary;

    /** 加班费 */
    @Excel(name = "加班费")
    private BigDecimal overtimePay;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setWorkerId(Long workerId) 
    {
        this.workerId = workerId;
    }

    public Long getWorkerId() 
    {
        return workerId;
    }
    public void setWorkDate(Date workDate) 
    {
        this.workDate = workDate;
    }

    public Date getWorkDate() 
    {
        return workDate;
    }
    public void setWorkPeriod(String workPeriod) 
    {
        this.workPeriod = workPeriod;
    }

    public String getWorkPeriod() 
    {
        return workPeriod;
    }
    public void setDeliveryTime(Date deliveryTime) 
    {
        this.deliveryTime = deliveryTime;
    }

    public Date getDeliveryTime() 
    {
        return deliveryTime;
    }
    public void setOrderId(String orderId) 
    {
        this.orderId = orderId;
    }

    public String getOrderId() 
    {
        return orderId;
    }
    public void setSalary(BigDecimal salary) 
    {
        this.salary = salary;
    }

    public BigDecimal getSalary() 
    {
        return salary;
    }
    public void setOvertimePay(BigDecimal overtimePay) 
    {
        this.overtimePay = overtimePay;
    }

    public BigDecimal getOvertimePay() 
    {
        return overtimePay;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("workerId", getWorkerId())
            .append("workDate", getWorkDate())
            .append("workPeriod", getWorkPeriod())
            .append("deliveryTime", getDeliveryTime())
            .append("orderId", getOrderId())
            .append("salary", getSalary())
            .append("overtimePay", getOvertimePay())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
