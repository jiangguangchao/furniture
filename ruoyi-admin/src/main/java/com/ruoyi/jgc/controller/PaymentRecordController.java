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
import com.ruoyi.jgc.domain.PaymentRecord;
import com.ruoyi.jgc.service.IPaymentRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 支付记录Controller
 * 
 * @author ruoyi
 * @date 2024-09-14
 */
@RestController
@RequestMapping("/order/paymentRecord")
public class PaymentRecordController extends BaseController
{
    @Autowired
    private IPaymentRecordService paymentRecordService;

    /**
     * 查询支付记录列表
     */
    @PreAuthorize("@ss.hasPermi('order:paymentRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(PaymentRecord paymentRecord)
    {
        startPage();
        List<PaymentRecord> list = paymentRecordService.selectPaymentRecordList(paymentRecord);
        return getDataTable(list);
    }

    /**
     * 导出支付记录列表
     */
    @PreAuthorize("@ss.hasPermi('order:paymentRecord:export')")
    @Log(title = "支付记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PaymentRecord paymentRecord)
    {
        List<PaymentRecord> list = paymentRecordService.selectPaymentRecordList(paymentRecord);
        ExcelUtil<PaymentRecord> util = new ExcelUtil<PaymentRecord>(PaymentRecord.class);
        util.exportExcel(response, list, "支付记录数据");
    }

    /**
     * 获取支付记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('order:paymentRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(paymentRecordService.selectPaymentRecordById(id));
    }

    /**
     * 新增支付记录
     */
    @PreAuthorize("@ss.hasPermi('order:paymentRecord:add')")
    @Log(title = "支付记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PaymentRecord paymentRecord)
    {
        paymentRecord.setCreateBy(getUsername());
        return toAjax(paymentRecordService.insertPaymentRecord(paymentRecord));
    }

    /**
     * 修改支付记录
     */
    @PreAuthorize("@ss.hasPermi('order:paymentRecord:edit')")
    @Log(title = "支付记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PaymentRecord paymentRecord)
    {
        paymentRecord.setUpdateBy(getUsername());
        paymentRecord.setUpdateTime(new Date());
        return toAjax(paymentRecordService.updatePaymentRecord(paymentRecord));
    }

    /**
     * 删除支付记录
     */
    @PreAuthorize("@ss.hasPermi('order:paymentRecord:remove')")
    @Log(title = "支付记录", businessType = BusinessType.DELETE)
	@PostMapping("/delete")
    public AjaxResult remove(@RequestBody PaymentRecord paymentRecord)
    {
        return toAjax(paymentRecordService.deletePaymentRecordById(paymentRecord));
    }
}
