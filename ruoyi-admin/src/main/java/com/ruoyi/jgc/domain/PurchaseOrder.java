package com.ruoyi.jgc.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 进货单对象 purchase_order
 * 
 * @author jgc
 * @date 2024-09-29
 */
public class PurchaseOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 供货方 */
    @Excel(name = "供货方")
    private String supplier;

    /** 日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date purchaseDate;

    /** 到货状态 */
    @Excel(name = "到货状态")
    private String arrivalStatus;

    /** 手机 */
    @Excel(name = "手机")
    private String phone;

    /** 微信 */
    @Excel(name = "微信")
    private String weichat;

    /** 货单 */
    @Excel(name = "货单")
    private String goodsList;

    /** 总金额 */
    @Excel(name = "总金额")
    private BigDecimal totalAmount;

    /** 备注 */
    @Excel(name = "备注")
    private String remarks;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSupplier(String supplier) 
    {
        this.supplier = supplier;
    }

    public String getSupplier() 
    {
        return supplier;
    }
    public void setPurchaseDate(Date purchaseDate) 
    {
        this.purchaseDate = purchaseDate;
    }

    public Date getPurchaseDate() 
    {
        return purchaseDate;
    }
    public void setArrivalStatus(String arrivalStatus) 
    {
        this.arrivalStatus = arrivalStatus;
    }

    public String getArrivalStatus() 
    {
        return arrivalStatus;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setWeichat(String weichat) 
    {
        this.weichat = weichat;
    }

    public String getWeichat() 
    {
        return weichat;
    }
    public void setGoodsList(String orderList) 
    {
        this.goodsList = orderList;
    }

    public String getGoodsList() 
    {
        return goodsList;
    }
    public void setTotalAmount(BigDecimal totalAmount) 
    {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getTotalAmount() 
    {
        return totalAmount;
    }
    public void setRemarks(String remarks) 
    {
        this.remarks = remarks;
    }

    public String getRemarks() 
    {
        return remarks;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("supplier", getSupplier())
            .append("purchaseDate", getPurchaseDate())
            .append("arrivalStatus", getArrivalStatus())
            .append("phone", getPhone())
            .append("weichat", getWeichat())
            .append("goodsList", getGoodsList())
            .append("totalAmount", getTotalAmount())
            .append("remarks", getRemarks())
            .toString();
    }
}
