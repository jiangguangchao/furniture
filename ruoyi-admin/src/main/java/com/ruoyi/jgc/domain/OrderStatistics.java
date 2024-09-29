package com.ruoyi.jgc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单统计对象 order_statistics
 * 
 * @author jgc
 * @date 2024-09-29
 */
public class OrderStatistics extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 统计日期 */
    @Excel(name = "统计日期")
    private String statcDate;

    /** 日期类型 */
    @Excel(name = "日期类型")
    private String dateType;

    /** 数据类型 */
    @Excel(name = "数据类型")
    private String dataType;

    /** 统计值 */
    @Excel(name = "统计值")
    private Long statcValue;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setStatcDate(String statcDate) 
    {
        this.statcDate = statcDate;
    }

    public String getStatcDate() 
    {
        return statcDate;
    }
    public void setDateType(String dateType) 
    {
        this.dateType = dateType;
    }

    public String getDateType() 
    {
        return dateType;
    }
    public void setDataType(String dataType) 
    {
        this.dataType = dataType;
    }

    public String getDataType() 
    {
        return dataType;
    }
    public void setStatcValue(Long statcValue) 
    {
        this.statcValue = statcValue;
    }

    public Long getStatcValue() 
    {
        return statcValue;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("statcDate", getStatcDate())
            .append("dateType", getDateType())
            .append("dataType", getDataType())
            .append("statcValue", getStatcValue())
            .toString();
    }
}
