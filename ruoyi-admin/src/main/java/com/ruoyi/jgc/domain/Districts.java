package com.ruoyi.jgc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 行政区划对象 districts
 * 
 * @author ruoyi
 * @date 2024-09-12
 */
public class Districts extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 行政区划代码 */
    @Excel(name = "行政区划代码")
    private String code;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 父级行政区划代码 */
    @Excel(name = "父级行政区划代码")
    private String pCode;

    public void setCode(String code) 
    {
        this.code = code;
    }

    public String getCode() 
    {
        return code;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setpCode(String pCode) 
    {
        this.pCode = pCode;
    }

    public String getpCode() 
    {
        return pCode;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("code", getCode())
            .append("name", getName())
            .append("pCode", getpCode())
            .toString();
    }
}
