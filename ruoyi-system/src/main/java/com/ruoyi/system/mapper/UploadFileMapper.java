package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.UploadFile;

/**
 * 上传文件Mapper接口
 * 
 * @author ruoyi
 * @date 2024-09-29
 */
public interface UploadFileMapper 
{
    /**
     * 查询上传文件
     * 
     * @param id 上传文件主键
     * @return 上传文件
     */
    public UploadFile selectUploadFileById(String id);

    /**
     * 查询上传文件列表
     * 
     * @param uploadFile 上传文件
     * @return 上传文件集合
     */
    public List<UploadFile> selectUploadFileList(UploadFile uploadFile);

    /**
     * 新增上传文件
     * 
     * @param uploadFile 上传文件
     * @return 结果
     */
    public int insertUploadFile(UploadFile uploadFile);

    /**
     * 修改上传文件
     * 
     * @param uploadFile 上传文件
     * @return 结果
     */
    public int updateUploadFile(UploadFile uploadFile);

    /**
     * 删除上传文件
     * 
     * @param id 上传文件主键
     * @return 结果
     */
    public int deleteUploadFileById(String id);

    /**
     * 批量删除上传文件
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUploadFileByIds(String[] ids);
}
