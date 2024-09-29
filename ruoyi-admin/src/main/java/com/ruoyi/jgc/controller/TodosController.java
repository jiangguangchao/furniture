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
import com.ruoyi.jgc.domain.Todos;
import com.ruoyi.jgc.service.ITodosService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 待办事项Controller
 * 
 * @author jgc
 * @date 2024-09-29
 */
@RestController
@RequestMapping("/order/todos")
public class TodosController extends BaseController
{
    @Autowired
    private ITodosService todosService;

    /**
     * 查询待办事项列表
     */
    @PreAuthorize("@ss.hasPermi('order:todos:list')")
    @GetMapping("/list")
    public TableDataInfo list(Todos todos)
    {
        startPage();
        List<Todos> list = todosService.selectTodosList(todos);
        return getDataTable(list);
    }

    /**
     * 导出待办事项列表
     */
    @PreAuthorize("@ss.hasPermi('order:todos:export')")
    @Log(title = "待办事项", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Todos todos)
    {
        List<Todos> list = todosService.selectTodosList(todos);
        ExcelUtil<Todos> util = new ExcelUtil<Todos>(Todos.class);
        util.exportExcel(response, list, "待办事项数据");
    }

    /**
     * 获取待办事项详细信息
     */
    @PreAuthorize("@ss.hasPermi('order:todos:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(todosService.selectTodosById(id));
    }

    /**
     * 新增待办事项
     */
    @PreAuthorize("@ss.hasPermi('order:todos:add')")
    @Log(title = "待办事项", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Todos todos)
    {
        return toAjax(todosService.insertTodos(todos));
    }

    /**
     * 修改待办事项
     */
    @PreAuthorize("@ss.hasPermi('order:todos:edit')")
    @Log(title = "待办事项", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Todos todos)
    {
        return toAjax(todosService.updateTodos(todos));
    }

    /**
     * 删除待办事项
     */
    @PreAuthorize("@ss.hasPermi('order:todos:remove')")
    @Log(title = "待办事项", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(todosService.deleteTodosByIds(ids));
    }
}
