package com.ruoyi.jgc.mapper;

import java.util.List;
import com.ruoyi.jgc.domain.WorkRecord;

/**
 * 工作记录Mapper接口
 * 
 * @author jgc
 * @date 2024-09-20
 */
public interface WorkRecordMapper 
{
    /**
     * 查询工作记录
     * 
     * @param id 工作记录主键
     * @return 工作记录
     */
    public WorkRecord selectWorkRecordById(Long id);

    /**
     * 查询工作记录列表
     * 
     * @param workRecord 工作记录
     * @return 工作记录集合
     */
    public List<WorkRecord> selectWorkRecordList(WorkRecord workRecord);

    /**
     * 新增工作记录
     * 
     * @param workRecord 工作记录
     * @return 结果
     */
    public int insertWorkRecord(WorkRecord workRecord);

    /**
     * 修改工作记录
     * 
     * @param workRecord 工作记录
     * @return 结果
     */
    public int updateWorkRecord(WorkRecord workRecord);

    /**
     * 删除工作记录
     * 
     * @param id 工作记录主键
     * @return 结果
     */
    public int deleteWorkRecordById(Long id);

    /**
     * 批量删除工作记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWorkRecordByIds(Long[] ids);
}
