package com.ruoyi.jgc.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.CollectionUtils;
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
import com.ruoyi.jgc.domain.FurnitureOrder;
import com.ruoyi.jgc.service.IFurnitureOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 家具订单Controller
 * 
 * @author jgc
 * @date 2024-09-10
 */
@RestController
@RequestMapping("/order/furnitureOrder")
public class FurnitureOrderController extends BaseController
{
    @Autowired
    private IFurnitureOrderService furnitureOrderService;

    /**
     * 查询家具订单列表
     */
    @PreAuthorize("@ss.hasPermi('order:furnitureOrder:list')")
    @GetMapping("/list")
    public TableDataInfo list(FurnitureOrder furnitureOrder)
    {
        startPage();
        List<FurnitureOrder> list = furnitureOrderService.selectFurnitureOrderList(furnitureOrder);
        return getDataTable(list);
    }

    /**
     * 导出家具订单列表
     */
    @PreAuthorize("@ss.hasPermi('order:furnitureOrder:export')")
    @Log(title = "家具订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FurnitureOrder furnitureOrder)
    {
        List<FurnitureOrder> list = furnitureOrderService.selectFurnitureOrderList(furnitureOrder);
        ExcelUtil<FurnitureOrder> util = new ExcelUtil<FurnitureOrder>(FurnitureOrder.class);
        util.exportExcel(response, list, "家具订单数据");
    }

    /**
     * 获取家具订单详细信息
     */
    @PreAuthorize("@ss.hasPermi('order:furnitureOrder:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(furnitureOrderService.selectFurnitureOrderById(id));
    }

    /**
     * 新增家具订单
     */
    @PreAuthorize("@ss.hasPermi('order:furnitureOrder:add')")
    @Log(title = "家具订单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FurnitureOrder furnitureOrder)
    {
        furnitureOrder.setCreateUser(getUsername());
        return toAjax(furnitureOrderService.insertFurnitureOrder(furnitureOrder));
    }

    /**
     * 修改家具订单
     */
    @PreAuthorize("@ss.hasPermi('order:furnitureOrder:edit')")
    @Log(title = "家具订单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FurnitureOrder furnitureOrder)
    {
        furnitureOrder.setUpdateBy(getUsername());
        furnitureOrder.setUpdateTime(new Date());
        if ("5".equals(furnitureOrder.getOrderStatus())) {
            //如果订单状态修改为“5”（已完成），则修改支付状态为“支付完成”，修改配送状态为“配送完成”
            furnitureOrder.setPaymentStatus("2");
            furnitureOrder.setDeliveryStatus("3");
        }
        return toAjax(furnitureOrderService.updateFurnitureOrder(furnitureOrder));
    }

    /**
     * 修改家具订单相关状态（订单状态，支付状态，配送状态）
     */
    @PreAuthorize("@ss.hasPermi('order:furnitureOrder:edit')")
    @Log(title = "家具订单", businessType = BusinessType.UPDATE)
    @PutMapping("/editStatus")
    public AjaxResult editStatus(@RequestBody FurnitureOrder furnitureOrder)
    {
        FurnitureOrder updaFurnitureOrder = new FurnitureOrder();
        updaFurnitureOrder.setId(furnitureOrder.getId());
        updaFurnitureOrder.setUpdateBy(getUsername());
        updaFurnitureOrder.setUpdateTime(new Date());
        updaFurnitureOrder.setPaymentStatus(furnitureOrder.getPaymentStatus());
        updaFurnitureOrder.setDeliveryStatus(furnitureOrder.getDeliveryStatus());
        updaFurnitureOrder.setOrderStatus(furnitureOrder.getOrderStatus());
        if ("5".equals(updaFurnitureOrder.getOrderStatus())) {
            //如果订单状态修改为“5”（已完成），则修改支付状态为“支付完成”，修改配送状态为“配送完成”
            updaFurnitureOrder.setPaymentStatus("2");
            updaFurnitureOrder.setDeliveryStatus("3");
        }
        return toAjax(furnitureOrderService.updateFurnitureOrder(furnitureOrder));
    }


    /**
     * 删除家具订单
     */
    @PreAuthorize("@ss.hasPermi('order:furnitureOrder:remove')")
    @Log(title = "家具订单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(furnitureOrderService.deleteFurnitureOrderByIds(ids));
    }
}
