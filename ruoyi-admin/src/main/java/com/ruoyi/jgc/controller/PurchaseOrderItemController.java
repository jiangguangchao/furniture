package com.ruoyi.jgc.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
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
import com.ruoyi.jgc.domain.PurchaseOrderItem;
import com.ruoyi.jgc.service.IPurchaseOrderItemService;
import com.ruoyi.jgc.service.IPurchaseOrderService;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 进货单明细Controller
 * 
 * @author ruoyi
 * @date 2025-02-28
 */
@RestController
@RequestMapping("/purchase/purchaseOrderItem")
public class PurchaseOrderItemController extends BaseController
{
    @Autowired
    private IPurchaseOrderItemService purchaseOrderItemService;
    @Autowired
    private IPurchaseOrderService purchaseOrderService;

    /**
     * 查询进货单明细列表
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:list')")
    @GetMapping("/list")
    public TableDataInfo list(PurchaseOrderItem purchaseOrderItem)
    {
        startPage();
        List<PurchaseOrderItem> list = purchaseOrderItemService.selectPurchaseOrderItemList(purchaseOrderItem);
        return getDataTable(list);
    }

    /**
     * 导出进货单明细列表
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:export')")
    @Log(title = "进货单明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PurchaseOrderItem purchaseOrderItem)
    {
        List<PurchaseOrderItem> list = purchaseOrderItemService.selectPurchaseOrderItemList(purchaseOrderItem);
        ExcelUtil<PurchaseOrderItem> util = new ExcelUtil<PurchaseOrderItem>(PurchaseOrderItem.class);
        util.exportExcel(response, list, "进货单明细数据");
    }

    /**
     * 获取进货单明细详细信息
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(purchaseOrderItemService.selectPurchaseOrderItemById(id));
    }

    /**
     * 新增进货单明细
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:add')")
    @Log(title = "进货单明细", businessType = BusinessType.INSERT)
    @PostMapping
    @Transactional
    public AjaxResult add(@RequestBody PurchaseOrderItem purchaseOrderItem)
    {
        int insertResult = purchaseOrderItemService.insertPurchaseOrderItem(purchaseOrderItem);
        if (insertResult == 0) {
            logger.error("进货单明细新增失败");
            return toAjax(insertResult);
        }

        //查询出对应进货单，然后更新进货单中的家具类型（家具进货单中的家具类型字段是为了根据家具类型查询进货单）
        purchaseOrderService.updateFrunitureCategory(purchaseOrderItem.getPurchaseOrderId(), purchaseOrderItem.getType(), "1");
        return toAjax(insertResult);
    }

    /**
     * 修改进货单明细
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:edit')")
    @Log(title = "进货单明细", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PurchaseOrderItem purchaseOrderItem)
    {
        return toAjax(purchaseOrderItemService.updatePurchaseOrderItem(purchaseOrderItem));
    }

    /**
     * 删除进货单明细
     */
    @PreAuthorize("@ss.hasPermi('purchase:purchaseOrder:remove')")
    @Log(title = "进货单明细", businessType = BusinessType.DELETE)
	@DeleteMapping
    @Transactional
    public AjaxResult remove(@RequestBody PurchaseOrderItem purchaseOrderItem)
    {
        purchaseOrderItemService.deletePurchaseOrderItemById(purchaseOrderItem.getId());
        purchaseOrderService.updateFrunitureCategory(purchaseOrderItem.getPurchaseOrderId(), purchaseOrderItem.getType(), "0");
        return toAjax(1);
    }
}
