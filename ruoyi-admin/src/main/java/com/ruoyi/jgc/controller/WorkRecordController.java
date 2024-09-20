package com.ruoyi.jgc.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.jgc.domain.WorkRecord;
import com.ruoyi.jgc.service.IWorkRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 工作记录Controller
 * 
 * @author jgc
 * @date 2024-09-20
 */
@RestController
@RequestMapping("/work/workRecord")
public class WorkRecordController extends BaseController
{
    @Autowired
    private IWorkRecordService workRecordService;

    /**
     * 查询工作记录列表
     */
    @PreAuthorize("@ss.hasPermi('work:workRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(WorkRecord workRecord)
    {
        startPage();
        List<WorkRecord> list = workRecordService.selectWorkRecordList(workRecord);
        return getDataTable(list);
    }

    /**
     * 导出工作记录列表
     */
    @PreAuthorize("@ss.hasPermi('work:workRecord:export')")
    @Log(title = "工作记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WorkRecord workRecord)
    {
        List<WorkRecord> list = workRecordService.selectWorkRecordList(workRecord);
        ExcelUtil<WorkRecord> util = new ExcelUtil<WorkRecord>(WorkRecord.class);
        util.exportExcel(response, list, "工作记录数据");
    }

    /**
     * 获取工作记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('work:workRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(workRecordService.selectWorkRecordById(id));
    }

    /**
     * 新增工作记录
     */
    @PreAuthorize("@ss.hasPermi('work:workRecord:add')")
    @Log(title = "工作记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WorkRecord workRecord)
    {
        return toAjax(workRecordService.insertWorkRecord(workRecord));
    }

    /**
     * 修改工作记录
     */
    @PreAuthorize("@ss.hasPermi('work:workRecord:edit')")
    @Log(title = "工作记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WorkRecord workRecord)
    {
        return toAjax(workRecordService.updateWorkRecord(workRecord));
    }

    /**
     * 删除工作记录
     */
    @PreAuthorize("@ss.hasPermi('work:workRecord:remove')")
    @Log(title = "工作记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(workRecordService.deleteWorkRecordByIds(ids));
    }
}
