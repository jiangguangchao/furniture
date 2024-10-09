package com.ruoyi.system.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.UploadFile;
import com.ruoyi.system.service.IUploadFileService;

import io.jsonwebtoken.lang.Collections;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.uuid.UUID;
import com.ruoyi.common.core.page.TableDataInfo;

import java.io.File;

/**
 * 上传文件Controller
 * 
 * @author ruoyi
 * @date 2024-09-29
 */
@RestController
@RequestMapping("/system/file")
public class UploadFileController extends BaseController {
    @Autowired
    private IUploadFileService uploadFileService;
    @Autowired
    private RuoYiConfig appConfig;

    /**
     * 查询上传文件列表
     */
    @PreAuthorize("@ss.hasPermi('system:file:list')")
    @GetMapping("/list")
    public TableDataInfo list(UploadFile uploadFile) {
        startPage();
        List<UploadFile> list = uploadFileService.selectUploadFileList(uploadFile);
        return getDataTable(list);
    }

    /**
     * 导出上传文件列表
     */
    @PreAuthorize("@ss.hasPermi('system:file:export')")
    @Log(title = "上传文件", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UploadFile uploadFile) {
        List<UploadFile> list = uploadFileService.selectUploadFileList(uploadFile);
        ExcelUtil<UploadFile> util = new ExcelUtil<UploadFile>(UploadFile.class);
        util.exportExcel(response, list, "上传文件数据");
    }

    /**
     * 获取上传文件详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:file:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id) {
        return success(uploadFileService.selectUploadFileById(id));
    }

    /**
     * 新增上传文件
     */
    @PreAuthorize("@ss.hasPermi('system:file:add')")
    @Log(title = "上传文件", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UploadFile uploadFile) {
        return toAjax(uploadFileService.insertUploadFile(uploadFile));
    }

    /**
     * 修改上传文件
     */
    @PreAuthorize("@ss.hasPermi('system:file:edit')")
    @Log(title = "上传文件", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UploadFile uploadFile) {
        return toAjax(uploadFileService.updateUploadFile(uploadFile));
    }

    /**
     * 删除上传文件
     */
    @PreAuthorize("@ss.hasPermi('system:file:remove')")
    @Log(title = "上传文件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids) {
        return toAjax(uploadFileService.deleteUploadFileByIds(ids));
    }

}
