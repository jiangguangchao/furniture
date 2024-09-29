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
import com.ruoyi.jgc.domain.PurchaseOrder;
import com.ruoyi.jgc.service.IPurchaseOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 进货单Controller
 * 
 * @author jgc
 * @date 2024-09-29
 */
@RestController
@RequestMapping("/purchase/purchaseOrder")
public class PurchaseOrderController extends BaseController
{
    @Autowired
    private IPurchaseOrderService purchaseOrderService;

    /**
     * 查询进货单列表
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:list')")
    @GetMapping("/list")
    public TableDataInfo list(PurchaseOrder purchaseOrder)
    {
        startPage();
        List<PurchaseOrder> list = purchaseOrderService.selectPurchaseOrderList(purchaseOrder);
        return getDataTable(list);
    }

    /**
     * 导出进货单列表
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:export')")
    @Log(title = "进货单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PurchaseOrder purchaseOrder)
    {
        List<PurchaseOrder> list = purchaseOrderService.selectPurchaseOrderList(purchaseOrder);
        ExcelUtil<PurchaseOrder> util = new ExcelUtil<PurchaseOrder>(PurchaseOrder.class);
        util.exportExcel(response, list, "进货单数据");
    }

    /**
     * 获取进货单详细信息
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(purchaseOrderService.selectPurchaseOrderById(id));
    }

    /**
     * 新增进货单
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:add')")
    @Log(title = "进货单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PurchaseOrder purchaseOrder)
    {
        return toAjax(purchaseOrderService.insertPurchaseOrder(purchaseOrder));
    }

    /**
     * 修改进货单
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:edit')")
    @Log(title = "进货单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PurchaseOrder purchaseOrder)
    {
        return toAjax(purchaseOrderService.updatePurchaseOrder(purchaseOrder));
    }

    /**
     * 删除进货单
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:remove')")
    @Log(title = "进货单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(purchaseOrderService.deletePurchaseOrderByIds(ids));
    }
}
