package com.ruoyi.jgc.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 家具订单对象 furniture_order
 * 
 * @author jgc
 * @date 2024-09-10
 */
public class FurnitureOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private String id;

    /** 总金额 */
    @Excel(name = "总金额")
    private BigDecimal totalMoney;

    /** 已支付金额 */
    @Excel(name = "已支付金额")
    private BigDecimal paidMoney;

    /** 对应字典：order_status 1-进行中 5-已完成 9-已取消 */
    @Excel(name = "订单状态")
    private String orderStatus;

    /** 下单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "下单时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date orderTime;

    /** 下单人 */
    @Excel(name = "下单人")
    private String orderUser;

    /** 下单人联系电话 */
    @Excel(name = "下单人联系电话")
    private String phoneNumber;

    /** 区县 */
    private String district;

    /** 乡镇 */
    private String town;

    /** 村委 */
    private String village;

    /** 几队 */
    private Long dui;

    /** 村庄 */
    private String subVillage;

    /** 创建人 */
    @Excel(name = "创建人")
    private String createUser;

    private String paymentStatus;

    private String deliveryStatus;

    private String includeCustom;

    /** 区域类型 是县城还是乡镇*/
    private String areaType;

    /**县城地址 */
    private String urbanAddress;

    /** 利润 */
    private int profit;

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(String deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setTotalMoney(BigDecimal totalMoney) 
    {
        this.totalMoney = totalMoney;
    }

    public BigDecimal getTotalMoney() 
    {
        return totalMoney;
    }
    public void setPaidMoney(BigDecimal paidMoney) 
    {
        this.paidMoney = paidMoney;
    }

    public BigDecimal getPaidMoney() 
    {
        return paidMoney;
    }
    public void setOrderStatus(String orderStatus) 
    {
        this.orderStatus = orderStatus;
    }

    public String getOrderStatus() 
    {
        return orderStatus;
    }
    public void setOrderTime(Date orderTime) 
    {
        this.orderTime = orderTime;
    }

    public Date getOrderTime() 
    {
        return orderTime;
    }
    public void setOrderUser(String orderUser) 
    {
        this.orderUser = orderUser;
    }

    public String getOrderUser() 
    {
        return orderUser;
    }
    public void setPhoneNumber(String phoneNumber) 
    {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() 
    {
        return phoneNumber;
    }
    public void setDistrict(String district) 
    {
        this.district = district;
    }

    public String getDistrict() 
    {
        return district;
    }
    public void setTown(String town) 
    {
        this.town = town;
    }

    public String getTown() 
    {
        return town;
    }
    public void setVillage(String village) 
    {
        this.village = village;
    }

    public String getVillage() 
    {
        return village;
    }
    public void setDui(Long dui) 
    {
        this.dui = dui;
    }

    public Long getDui() 
    {
        return dui;
    }
    public void setSubVillage(String subVillage) 
    {
        this.subVillage = subVillage;
    }

    public String getSubVillage() 
    {
        return subVillage;
    }
    public void setCreateUser(String createUser) 
    {
        this.createUser = createUser;
    }

    public String getCreateUser() 
    {
        return createUser;
    }

    public String getIncludeCustom() {
        return includeCustom;
    }

    public void setIncludeCustom(String includeCustom) {
        this.includeCustom = includeCustom;
    }

    public String getAreaType() {
        return areaType;
    }

    public void setAreaType(String areaType) {
        this.areaType = areaType;
    }

    public String getUrbanAddress() {
        return urbanAddress;
    }

    public void setUrbanAddress(String urbanAddress) {
        this.urbanAddress = urbanAddress;
    }

    
    public int getProfit() {
        return profit;
    }

    public void setProfit(int profit) {
        this.profit = profit;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("totalMoney", getTotalMoney())
            .append("paidMoney", getPaidMoney())
            .append("orderStatus", getOrderStatus())
            .append("orderTime", getOrderTime())
            .append("orderUser", getOrderUser())
            .append("phoneNumber", getPhoneNumber())
            .append("district", getDistrict())
            .append("town", getTown())
            .append("village", getVillage())
            .append("dui", getDui())
            .append("subVillage", getSubVillage())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("remark", getRemark())
            .toString();
    }
}
