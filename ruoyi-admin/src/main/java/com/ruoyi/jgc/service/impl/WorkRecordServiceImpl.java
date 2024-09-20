package com.ruoyi.jgc.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.WorkRecordMapper;
import com.ruoyi.jgc.domain.WorkRecord;
import com.ruoyi.jgc.service.IWorkRecordService;

/**
 * 工作记录Service业务层处理
 * 
 * @author jgc
 * @date 2024-09-20
 */
@Service
public class WorkRecordServiceImpl implements IWorkRecordService 
{
    @Autowired
    private WorkRecordMapper workRecordMapper;

    /**
     * 查询工作记录
     * 
     * @param id 工作记录主键
     * @return 工作记录
     */
    @Override
    public WorkRecord selectWorkRecordById(Long id)
    {
        return workRecordMapper.selectWorkRecordById(id);
    }

    /**
     * 查询工作记录列表
     * 
     * @param workRecord 工作记录
     * @return 工作记录
     */
    @Override
    public List<WorkRecord> selectWorkRecordList(WorkRecord workRecord)
    {
        return workRecordMapper.selectWorkRecordList(workRecord);
    }

    /**
     * 新增工作记录
     * 
     * @param workRecord 工作记录
     * @return 结果
     */
    @Override
    public int insertWorkRecord(WorkRecord workRecord)
    {
        workRecord.setCreateTime(DateUtils.getNowDate());
        return workRecordMapper.insertWorkRecord(workRecord);
    }

    /**
     * 修改工作记录
     * 
     * @param workRecord 工作记录
     * @return 结果
     */
    @Override
    public int updateWorkRecord(WorkRecord workRecord)
    {
        workRecord.setUpdateTime(DateUtils.getNowDate());
        return workRecordMapper.updateWorkRecord(workRecord);
    }

    /**
     * 批量删除工作记录
     * 
     * @param ids 需要删除的工作记录主键
     * @return 结果
     */
    @Override
    public int deleteWorkRecordByIds(Long[] ids)
    {
        return workRecordMapper.deleteWorkRecordByIds(ids);
    }

    /**
     * 删除工作记录信息
     * 
     * @param id 工作记录主键
     * @return 结果
     */
    @Override
    public int deleteWorkRecordById(Long id)
    {
        return workRecordMapper.deleteWorkRecordById(id);
    }
}
