package com.ruoyi.jgc.mapper;

import java.util.List;
import com.ruoyi.jgc.domain.FurnitureOrder;

/**
 * 家具订单Mapper接口
 * 
 * @author jgc
 * @date 2024-09-10
 */
public interface FurnitureOrderMapper 
{
    /**
     * 查询家具订单
     * 
     * @param id 家具订单主键
     * @return 家具订单
     */
    public FurnitureOrder selectFurnitureOrderById(String id);

    /**
     * 查询家具订单列表
     * 
     * @param furnitureOrder 家具订单
     * @return 家具订单集合
     */
    public List<FurnitureOrder> selectFurnitureOrderList(FurnitureOrder furnitureOrder);

    /**
     * 新增家具订单
     * 
     * @param furnitureOrder 家具订单
     * @return 结果
     */
    public int insertFurnitureOrder(FurnitureOrder furnitureOrder);

    /**
     * 修改家具订单
     * 
     * @param furnitureOrder 家具订单
     * @return 结果
     */
    public int updateFurnitureOrder(FurnitureOrder furnitureOrder);

    /**
     * 删除家具订单
     * 
     * @param id 家具订单主键
     * @return 结果
     */
    public int deleteFurnitureOrderById(String id);

    /**
     * 批量删除家具订单
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFurnitureOrderByIds(String[] ids);
}
