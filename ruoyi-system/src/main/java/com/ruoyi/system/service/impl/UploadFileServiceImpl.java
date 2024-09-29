package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.UploadFileMapper;
import com.ruoyi.system.domain.UploadFile;
import com.ruoyi.system.service.IUploadFileService;

/**
 * 上传文件Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-29
 */
@Service
public class UploadFileServiceImpl implements IUploadFileService 
{
    @Autowired
    private UploadFileMapper uploadFileMapper;

    /**
     * 查询上传文件
     * 
     * @param id 上传文件主键
     * @return 上传文件
     */
    @Override
    public UploadFile selectUploadFileById(Long id)
    {
        return uploadFileMapper.selectUploadFileById(id);
    }

    /**
     * 查询上传文件列表
     * 
     * @param uploadFile 上传文件
     * @return 上传文件
     */
    @Override
    public List<UploadFile> selectUploadFileList(UploadFile uploadFile)
    {
        return uploadFileMapper.selectUploadFileList(uploadFile);
    }

    /**
     * 新增上传文件
     * 
     * @param uploadFile 上传文件
     * @return 结果
     */
    @Override
    public int insertUploadFile(UploadFile uploadFile)
    {
        uploadFile.setCreateTime(DateUtils.getNowDate());
        return uploadFileMapper.insertUploadFile(uploadFile);
    }

    /**
     * 修改上传文件
     * 
     * @param uploadFile 上传文件
     * @return 结果
     */
    @Override
    public int updateUploadFile(UploadFile uploadFile)
    {
        return uploadFileMapper.updateUploadFile(uploadFile);
    }

    /**
     * 批量删除上传文件
     * 
     * @param ids 需要删除的上传文件主键
     * @return 结果
     */
    @Override
    public int deleteUploadFileByIds(Long[] ids)
    {
        return uploadFileMapper.deleteUploadFileByIds(ids);
    }

    /**
     * 删除上传文件信息
     * 
     * @param id 上传文件主键
     * @return 结果
     */
    @Override
    public int deleteUploadFileById(Long id)
    {
        return uploadFileMapper.deleteUploadFileById(id);
    }
}
