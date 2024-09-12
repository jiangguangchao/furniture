package com.ruoyi.jgc.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.FurnitureOrderMapper;
import com.ruoyi.jgc.domain.FurnitureOrder;
import com.ruoyi.jgc.service.IFurnitureOrderService;

/**
 * 家具订单Service业务层处理
 * 
 * @author jgc
 * @date 2024-09-10
 */
@Service
public class FurnitureOrderServiceImpl implements IFurnitureOrderService 
{
    @Autowired
    private FurnitureOrderMapper furnitureOrderMapper;

    /**
     * 查询家具订单
     * 
     * @param id 家具订单主键
     * @return 家具订单
     */
    @Override
    public FurnitureOrder selectFurnitureOrderById(String id)
    {
        return furnitureOrderMapper.selectFurnitureOrderById(id);
    }

    /**
     * 查询家具订单列表
     * 
     * @param furnitureOrder 家具订单
     * @return 家具订单
     */
    @Override
    public List<FurnitureOrder> selectFurnitureOrderList(FurnitureOrder furnitureOrder)
    {
        return furnitureOrderMapper.selectFurnitureOrderList(furnitureOrder);
    }

    /**
     * 新增家具订单
     * 
     * @param furnitureOrder 家具订单
     * @return 结果
     */
    @Override
    public int insertFurnitureOrder(FurnitureOrder furnitureOrder)
    {
        furnitureOrder.setCreateTime(DateUtils.getNowDate());
        furnitureOrder.setId(DateUtils.dateTimeNow(DateUtils.YYYYMMDDHHMMSS));
        return furnitureOrderMapper.insertFurnitureOrder(furnitureOrder);
    }

    /**
     * 修改家具订单
     * 
     * @param furnitureOrder 家具订单
     * @return 结果
     */
    @Override
    public int updateFurnitureOrder(FurnitureOrder furnitureOrder)
    {
        return furnitureOrderMapper.updateFurnitureOrder(furnitureOrder);
    }

    /**
     * 批量删除家具订单
     * 
     * @param ids 需要删除的家具订单主键
     * @return 结果
     */
    @Override
    public int deleteFurnitureOrderByIds(String[] ids)
    {
        return furnitureOrderMapper.deleteFurnitureOrderByIds(ids);
    }

    /**
     * 删除家具订单信息
     * 
     * @param id 家具订单主键
     * @return 结果
     */
    @Override
    public int deleteFurnitureOrderById(String id)
    {
        return furnitureOrderMapper.deleteFurnitureOrderById(id);
    }
}
