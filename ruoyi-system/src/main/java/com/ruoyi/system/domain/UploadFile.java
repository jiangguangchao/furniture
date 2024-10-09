package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 上传文件对象 upload_file
 * 
 * @author ruoyi
 * @date 2024-09-29
 */
public class UploadFile extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String id;

    /** 关联id */
    @Excel(name = "关联id")
    private String associationId;

    /** 关联类型 */
    @Excel(name = "关联类型")
    private String associationType;

    /** 文件类型 */
    @Excel(name = "文件类型")
    private String fileType;

    /** 文件名 */
    @Excel(name = "文件名")
    private String fileName;

    /** 文件路径 */
    @Excel(name = "文件路径")
    private String filePath;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setAssociationId(String associationId) 
    {
        this.associationId = associationId;
    }

    public String getAssociationId() 
    {
        return associationId;
    }
    public void setAssociationType(String associationType) 
    {
        this.associationType = associationType;
    }

    public String getAssociationType() 
    {
        return associationType;
    }
    public void setFileType(String fileType) 
    {
        this.fileType = fileType;
    }

    public String getFileType() 
    {
        return fileType;
    }
    public void setFileName(String fileName) 
    {
        this.fileName = fileName;
    }

    public String getFileName() 
    {
        return fileName;
    }
    public void setFilePath(String filePath) 
    {
        this.filePath = filePath;
    }

    public String getFilePath() 
    {
        return filePath;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("associationId", getAssociationId())
            .append("associationType", getAssociationType())
            .append("fileType", getFileType())
            .append("fileName", getFileName())
            .append("filePath", getFilePath())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .toString();
    }
}
