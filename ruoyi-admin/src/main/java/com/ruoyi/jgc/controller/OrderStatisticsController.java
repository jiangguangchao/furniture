package com.ruoyi.jgc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.ruoyi.jgc.domain.OrderStatistics;
import com.ruoyi.jgc.domain.OrderStatisticsDto;
import com.ruoyi.jgc.schedule.TaskSchedule;
import com.ruoyi.jgc.service.IOrderStatisticsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单统计Controller
 * 
 * @author jgc
 * @date 2024-09-29
 */
@RestController
@RequestMapping("/statistics/orderStatistics")
public class OrderStatisticsController extends BaseController
{
    @Autowired
    private IOrderStatisticsService orderStatisticsService;


    //订单统计的定时任务，这里这么引入有点奇怪，但是taskSchedule中提供了
    //订单统计的方法，可以传入需要统计的日期直接进行统计，非常方便。为了省事，就这样做了。
    //实际上，统计的方法应该写到一个service中。
    @Autowired
    private TaskSchedule taskSchedule;

    /**
     * 查询订单统计列表
     */
    @PreAuthorize("@ss.hasPermi('statistics:orderStatistics:list')")
    @GetMapping("/list")
    public TableDataInfo list(OrderStatistics orderStatistics)
    {
        startPage();
        List<OrderStatistics> list = orderStatisticsService.selectOrderStatisticsList(orderStatistics);
        return getDataTable(list);
    }

    /**
     * 导出订单统计列表
     */
    // @PreAuthorize("@ss.hasPermi('statistics:orderStatistics:export')")
    // @Log(title = "订单统计", businessType = BusinessType.EXPORT)
    // @PostMapping("/export")
    // public void export(HttpServletResponse response, OrderStatistics orderStatistics)
    // {
    //     List<OrderStatistics> list = orderStatisticsService.selectOrderStatisticsList(orderStatistics);
    //     ExcelUtil<OrderStatistics> util = new ExcelUtil<OrderStatistics>(OrderStatistics.class);
    //     util.exportExcel(response, list, "订单统计数据");
    // }

    /**
     * 获取订单统计详细信息
     */
    @PreAuthorize("@ss.hasPermi('statistics:orderStatistics:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(orderStatisticsService.selectOrderStatisticsById(id));
    }

    /**
     * 根据指定日期统计
     */
    @PreAuthorize("@ss.hasPermi('statistics:orderStatistics:add')")
    @Log(title = "订单统计", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult statcByDate(@RequestBody OrderStatisticsDto orderStatistics)
    {
        String startDate = orderStatistics.getStartDate();
        String endDate = orderStatistics.getEndDate();
        // 计算两个日期之间的dateList
        List<String> dateList = getDateListBetween(startDate, endDate);
        for (String dateType : orderStatistics.getDateTypeList()) {
            for (String date : dateList) {
                taskSchedule.doStatisticsAndSave(dateType, date, true);
            }
        }
        return toAjax(1);
    }

    /**
     * 修改订单统计
     */
    // @PreAuthorize("@ss.hasPermi('statistics:orderStatistics:edit')")
    // @Log(title = "订单统计", businessType = BusinessType.UPDATE)
    // @PutMapping
    // public AjaxResult edit(@RequestBody OrderStatistics orderStatistics)
    // {
    //     return toAjax(orderStatisticsService.updateOrderStatistics(orderStatistics));
    // }

    /**
     * 删除订单统计
     */
    // @PreAuthorize("@ss.hasPermi('statistics:orderStatistics:remove')")
    // @Log(title = "订单统计", businessType = BusinessType.DELETE)
	// @DeleteMapping("/{ids}")
    // public AjaxResult remove(@PathVariable Long[] ids)
    // {
    //     return toAjax(orderStatisticsService.deleteOrderStatisticsByIds(ids));
    // }

    // 添加方法：获取两个日期之间的所有日期列表
    private List<String> getDateListBetween(String startDate, String endDate) {
        List<String> dateList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date start = sdf.parse(startDate);
            Date end = sdf.parse(endDate);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(start);
            while (calendar.getTime().before(end) || calendar.getTime().equals(end)) {
                dateList.add(sdf.format(calendar.getTime()));
                calendar.add(Calendar.DATE, 1);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return dateList;
    }
}
