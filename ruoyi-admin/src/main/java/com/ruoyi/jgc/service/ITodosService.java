package com.ruoyi.jgc.service;

import java.util.List;
import com.ruoyi.jgc.domain.Todos;

/**
 * 待办事项Service接口
 * 
 * @author jgc
 * @date 2024-09-29
 */
public interface ITodosService 
{
    /**
     * 查询待办事项
     * 
     * @param id 待办事项主键
     * @return 待办事项
     */
    public Todos selectTodosById(Long id);

    /**
     * 查询待办事项列表
     * 
     * @param todos 待办事项
     * @return 待办事项集合
     */
    public List<Todos> selectTodosList(Todos todos);

    /**
     * 新增待办事项
     * 
     * @param todos 待办事项
     * @return 结果
     */
    public int insertTodos(Todos todos);

    /**
     * 修改待办事项
     * 
     * @param todos 待办事项
     * @return 结果
     */
    public int updateTodos(Todos todos);

    /**
     * 批量删除待办事项
     * 
     * @param ids 需要删除的待办事项主键集合
     * @return 结果
     */
    public int deleteTodosByIds(Long[] ids);

    /**
     * 删除待办事项信息
     * 
     * @param id 待办事项主键
     * @return 结果
     */
    public int deleteTodosById(Long id);
}
