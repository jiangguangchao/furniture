package com.ruoyi.jgc.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.system.domain.UploadFile;

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
    private String id;

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

    private String status;

    private String paymentStatus;

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

    private BigDecimal paidMoney;

    /** 备注 */
    @Excel(name = "备注")
    private String remarks;

    private List<UploadFile> uploadFiles;

    private String logistics;

    private Integer logisticsMoney;

    /** 家具类别 */
    private String frunitureCategory;

    

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
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

    public List<UploadFile> getUploadFiles() {
        return uploadFiles;
    }

    public void setUploadFiles(List<UploadFile> uploadFiles) {
        this.uploadFiles = uploadFiles;
    }

    public BigDecimal getPaidMoney() {
        return paidMoney;
    }

    public void setPaidMoney(BigDecimal paidMoney) {
        this.paidMoney = paidMoney;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getLogistics() {
        return logistics;
    }

    public void setLogistics(String logistics) {
        this.logistics = logistics;
    }

    public Integer getLogisticsMoney() {
        return logisticsMoney;
    }

    public void setLogisticsMoney(Integer logisticsMoney) {
        this.logisticsMoney = logisticsMoney;
    }

    public String getFrunitureCategory() {
        return frunitureCategory;
    }

    public void setFrunitureCategory(String frunitureCategory) {
        this.frunitureCategory = frunitureCategory;
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
