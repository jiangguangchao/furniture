package com.ruoyi.jgc.service;

import java.util.List;
import com.ruoyi.jgc.domain.Districts;

/**
 * 行政区划Service接口
 * 
 * @author ruoyi
 * @date 2024-09-12
 */
public interface IDistrictsService 
{
    /**
     * 查询行政区划
     * 
     * @param code 行政区划主键
     * @return 行政区划
     */
    public Districts selectDistrictsByCode(String code);

    /**
     * 查询行政区划列表
     * 
     * @param districts 行政区划
     * @return 行政区划集合
     */
    public List<Districts> selectDistrictsList(Districts districts);

    /**
     * 新增行政区划
     * 
     * @param districts 行政区划
     * @return 结果
     */
    public int insertDistricts(Districts districts);

    /**
     * 修改行政区划
     * 
     * @param districts 行政区划
     * @return 结果
     */
    public int updateDistricts(Districts districts);

    /**
     * 批量删除行政区划
     * 
     * @param codes 需要删除的行政区划主键集合
     * @return 结果
     */
    public int deleteDistrictsByCodes(String[] codes);

    /**
     * 删除行政区划信息
     * 
     * @param code 行政区划主键
     * @return 结果
     */
    public int deleteDistrictsByCode(String code);
}
