package com.ruoyi.jgc.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单中家具对象 order_furniture
 * 
 * @author ruoyi
 * @date 2024-09-18
 */
public class OrderFurniture extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 订单号 */
    @Excel(name = "订单号")
    private String orderId;

    /** 家具类别 */
    @Excel(name = "家具类别")
    private String category;

    /** 款式 */
    @Excel(name = "款式")
    private String style;

    /** 材质 */
    @Excel(name = "材质")
    private String material;

    /** 尺寸 */
    @Excel(name = "尺寸")
    private BigDecimal size;

    /** 床宽 */
    @Excel(name = "床宽")
    private String bedWidth;

    /** 金额 */
    @Excel(name = "金额")
    private BigDecimal money;

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
    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getCategory() 
    {
        return category;
    }
    public void setStyle(String style) 
    {
        this.style = style;
    }

    public String getStyle() 
    {
        return style;
    }
    public void setMaterial(String material) 
    {
        this.material = material;
    }

    public String getMaterial() 
    {
        return material;
    }
    public void setSize(BigDecimal size) 
    {
        this.size = size;
    }

    public BigDecimal getSize() 
    {
        return size;
    }
    public void setBedWidth(String bedWidth) 
    {
        this.bedWidth = bedWidth;
    }

    public String getBedWidth() 
    {
        return bedWidth;
    }
    public void setMoney(BigDecimal money) 
    {
        this.money = money;
    }

    public BigDecimal getMoney() 
    {
        return money;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("category", getCategory())
            .append("style", getStyle())
            .append("material", getMaterial())
            .append("size", getSize())
            .append("bedWidth", getBedWidth())
            .append("money", getMoney())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
