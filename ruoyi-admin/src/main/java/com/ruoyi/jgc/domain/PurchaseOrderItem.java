package com.ruoyi.jgc.domain;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.system.domain.UploadFile;

/**
 * 进货单明细对象 purchase_order_item
 * 
 * @author ruoyi
 * @date 2025-02-28
 */
public class PurchaseOrderItem extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String id;

    /** 进货单表id */
    @Excel(name = "进货单表id")
    private String purchaseOrderId;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 家具类型 */
    @Excel(name = "家具类型")
    private String type;

    /** 单价 */
    @Excel(name = "单价")
    private Long unitPrice;

    /** 数量 */
    @Excel(name = "数量")
    private Long quantity;

    private List<UploadFile> uploadFiles;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setPurchaseOrderId(String purchaseOrderId) 
    {
        this.purchaseOrderId = purchaseOrderId;
    }

    public String getPurchaseOrderId() 
    {
        return purchaseOrderId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setUnitPrice(Long unitPrice) 
    {
        this.unitPrice = unitPrice;
    }

    public Long getUnitPrice() 
    {
        return unitPrice;
    }
    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
    }

    public List<UploadFile> getUploadFiles() {
        return uploadFiles;
    }

    public void setUploadFiles(List<UploadFile> uploadFiles) {
        this.uploadFiles = uploadFiles;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("purchaseOrderId", getPurchaseOrderId())
            .append("name", getName())
            .append("type", getType())
            .append("unitPrice", getUnitPrice())
            .append("quantity", getQuantity())
            .toString();
    }
}
