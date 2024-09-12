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
import com.ruoyi.jgc.domain.Districts;
import com.ruoyi.jgc.service.IDistrictsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 行政区划Controller
 * 
 * @author ruoyi
 * @date 2024-09-12
 */
@RestController
@RequestMapping("/baseinfo/districts")
public class DistrictsController extends BaseController
{
    @Autowired
    private IDistrictsService districtsService;

    /**
     * 查询行政区划列表
     */
    @PreAuthorize("@ss.hasPermi('baseinfo:districts:list')")
    @GetMapping("/list")
    public TableDataInfo list(Districts districts)
    {
        logger.info("查询行政区划-----");
        startPage();
        List<Districts> list = districtsService.selectDistrictsList(districts);
        return getDataTable(list);
    }

    /**
     * 导出行政区划列表
     */
    @PreAuthorize("@ss.hasPermi('baseinfo:districts:export')")
    @Log(title = "行政区划", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Districts districts)
    {
        List<Districts> list = districtsService.selectDistrictsList(districts);
        ExcelUtil<Districts> util = new ExcelUtil<Districts>(Districts.class);
        util.exportExcel(response, list, "行政区划数据");
    }

    /**
     * 获取行政区划详细信息
     */
    @PreAuthorize("@ss.hasPermi('baseinfo:districts:query')")
    @GetMapping(value = "/{code}")
    public AjaxResult getInfo(@PathVariable("code") String code)
    {
        return success(districtsService.selectDistrictsByCode(code));
    }

    /**
     * 新增行政区划
     */
    @PreAuthorize("@ss.hasPermi('baseinfo:districts:add')")
    @Log(title = "行政区划", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Districts districts)
    {
        return toAjax(districtsService.insertDistricts(districts));
    }

    /**
     * 修改行政区划
     */
    @PreAuthorize("@ss.hasPermi('baseinfo:districts:edit')")
    @Log(title = "行政区划", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Districts districts)
    {
        return toAjax(districtsService.updateDistricts(districts));
    }

    /**
     * 删除行政区划
     */
    @PreAuthorize("@ss.hasPermi('baseinfo:districts:remove')")
    @Log(title = "行政区划", businessType = BusinessType.DELETE)
	@DeleteMapping("/{codes}")
    public AjaxResult remove(@PathVariable String[] codes)
    {
        return toAjax(districtsService.deleteDistrictsByCodes(codes));
    }
}
