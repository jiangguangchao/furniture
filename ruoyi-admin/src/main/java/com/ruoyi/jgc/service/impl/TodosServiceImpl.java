package com.ruoyi.jgc.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.TodosMapper;
import com.ruoyi.jgc.domain.Todos;
import com.ruoyi.jgc.service.ITodosService;

/**
 * 待办事项Service业务层处理
 * 
 * @author jgc
 * @date 2024-09-29
 */
@Service
public class TodosServiceImpl implements ITodosService 
{
    @Autowired
    private TodosMapper todosMapper;

    /**
     * 查询待办事项
     * 
     * @param id 待办事项主键
     * @return 待办事项
     */
    @Override
    public Todos selectTodosById(Long id)
    {
        return todosMapper.selectTodosById(id);
    }

    /**
     * 查询待办事项列表
     * 
     * @param todos 待办事项
     * @return 待办事项
     */
    @Override
    public List<Todos> selectTodosList(Todos todos)
    {
        return todosMapper.selectTodosList(todos);
    }

    /**
     * 新增待办事项
     * 
     * @param todos 待办事项
     * @return 结果
     */
    @Override
    public int insertTodos(Todos todos)
    {
        todos.setCreateTime(DateUtils.getNowDate());
        return todosMapper.insertTodos(todos);
    }

    /**
     * 修改待办事项
     * 
     * @param todos 待办事项
     * @return 结果
     */
    @Override
    public int updateTodos(Todos todos)
    {
        todos.setUpdateTime(DateUtils.getNowDate());
        return todosMapper.updateTodos(todos);
    }

    /**
     * 批量删除待办事项
     * 
     * @param ids 需要删除的待办事项主键
     * @return 结果
     */
    @Override
    public int deleteTodosByIds(Long[] ids)
    {
        return todosMapper.deleteTodosByIds(ids);
    }

    /**
     * 删除待办事项信息
     * 
     * @param id 待办事项主键
     * @return 结果
     */
    @Override
    public int deleteTodosById(Long id)
    {
        return todosMapper.deleteTodosById(id);
    }
}
