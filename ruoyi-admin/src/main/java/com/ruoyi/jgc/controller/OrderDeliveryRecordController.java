package com.ruoyi.jgc.controller;

import java.util.Date;
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
import com.ruoyi.jgc.domain.OrderDeliveryRecord;
import com.ruoyi.jgc.service.IOrderDeliveryRecordService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 配送记录Controller
 * 
 * @author ruoyi
 * @date 2024-09-19
 */
@RestController
@RequestMapping("/order/deliveryRecord")
public class OrderDeliveryRecordController extends BaseController
{
    @Autowired
    private IOrderDeliveryRecordService orderDeliveryRecordService;

    /**
     * 查询配送记录列表
     */
    @PreAuthorize("@ss.hasPermi('order:deliveryRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(OrderDeliveryRecord orderDeliveryRecord)
    {
        startPage();
        List<OrderDeliveryRecord> list = orderDeliveryRecordService.selectOrderDeliveryRecordList(orderDeliveryRecord);
        return getDataTable(list);
    }

    /**
     * 导出配送记录列表
     */
    @PreAuthorize("@ss.hasPermi('order:deliveryRecord:export')")
    @Log(title = "配送记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, OrderDeliveryRecord orderDeliveryRecord)
    {
        List<OrderDeliveryRecord> list = orderDeliveryRecordService.selectOrderDeliveryRecordList(orderDeliveryRecord);
        ExcelUtil<OrderDeliveryRecord> util = new ExcelUtil<OrderDeliveryRecord>(OrderDeliveryRecord.class);
        util.exportExcel(response, list, "配送记录数据");
    }

    /**
     * 获取配送记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('order:deliveryRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(orderDeliveryRecordService.selectOrderDeliveryRecordById(id));
    }

    /**
     * 新增配送记录
     */
    @PreAuthorize("@ss.hasPermi('order:deliveryRecord:add')")
    @Log(title = "配送记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody OrderDeliveryRecord orderDeliveryRecord)
    {
        orderDeliveryRecord.setCreateBy(getUsername());
        return toAjax(orderDeliveryRecordService.insertOrderDeliveryRecord(orderDeliveryRecord));
    }

    /**
     * 修改配送记录
     */
    @PreAuthorize("@ss.hasPermi('order:deliveryRecord:edit')")
    @Log(title = "配送记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody OrderDeliveryRecord orderDeliveryRecord)
    {
        orderDeliveryRecord.setUpdateBy(getUsername());
        orderDeliveryRecord.setUpdateTime(new Date());
        return toAjax(orderDeliveryRecordService.updateOrderDeliveryRecord(orderDeliveryRecord));
    }

    /**
     * 删除配送记录
     */
    @PreAuthorize("@ss.hasPermi('order:deliveryRecord:remove')")
    @Log(title = "配送记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(orderDeliveryRecordService.deleteOrderDeliveryRecordByIds(ids));
    }
}
