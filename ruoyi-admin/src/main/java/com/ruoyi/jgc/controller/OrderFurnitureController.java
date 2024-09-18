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
import com.ruoyi.jgc.domain.OrderFurniture;
import com.ruoyi.jgc.service.IOrderFurnitureService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单中家具Controller
 * 
 * @author ruoyi
 * @date 2024-09-18
 */
@RestController
@RequestMapping("/order/orderFurniture")
public class OrderFurnitureController extends BaseController
{
    @Autowired
    private IOrderFurnitureService orderFurnitureService;

    /**
     * 查询订单中家具列表
     */
    @PreAuthorize("@ss.hasPermi('order:orderFurniture:list')")
    @GetMapping("/list")
    public TableDataInfo list(OrderFurniture orderFurniture)
    {
        startPage();
        List<OrderFurniture> list = orderFurnitureService.selectOrderFurnitureList(orderFurniture);
        return getDataTable(list);
    }

    /**
     * 导出订单中家具列表
     */
    @PreAuthorize("@ss.hasPermi('order:orderFurniture:export')")
    @Log(title = "订单中家具", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, OrderFurniture orderFurniture)
    {
        List<OrderFurniture> list = orderFurnitureService.selectOrderFurnitureList(orderFurniture);
        ExcelUtil<OrderFurniture> util = new ExcelUtil<OrderFurniture>(OrderFurniture.class);
        util.exportExcel(response, list, "订单中家具数据");
    }

    /**
     * 获取订单中家具详细信息
     */
    @PreAuthorize("@ss.hasPermi('order:orderFurniture:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(orderFurnitureService.selectOrderFurnitureById(id));
    }

    /**
     * 新增订单中家具
     */
    @PreAuthorize("@ss.hasPermi('order:orderFurniture:add')")
    @Log(title = "订单中家具", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody OrderFurniture orderFurniture)
    {
        return toAjax(orderFurnitureService.insertOrderFurniture(orderFurniture));
    }

    /**
     * 修改订单中家具
     */
    @PreAuthorize("@ss.hasPermi('order:orderFurniture:edit')")
    @Log(title = "订单中家具", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody OrderFurniture orderFurniture)
    {
        return toAjax(orderFurnitureService.updateOrderFurniture(orderFurniture));
    }

    /**
     * 删除订单中家具
     */
    @PreAuthorize("@ss.hasPermi('order:orderFurniture:remove')")
    @Log(title = "订单中家具", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(orderFurnitureService.deleteOrderFurnitureByIds(ids));
    }
}
