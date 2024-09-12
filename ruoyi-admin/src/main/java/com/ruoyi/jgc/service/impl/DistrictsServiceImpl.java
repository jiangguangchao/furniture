package com.ruoyi.jgc.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.jgc.mapper.DistrictsMapper;
import com.ruoyi.jgc.domain.Districts;
import com.ruoyi.jgc.service.IDistrictsService;

/**
 * 行政区划Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-09-12
 */
@Service
public class DistrictsServiceImpl implements IDistrictsService 
{
    @Autowired
    private DistrictsMapper districtsMapper;

    /**
     * 查询行政区划
     * 
     * @param code 行政区划主键
     * @return 行政区划
     */
    @Override
    public Districts selectDistrictsByCode(String code)
    {
        return districtsMapper.selectDistrictsByCode(code);
    }

    /**
     * 查询行政区划列表
     * 
     * @param districts 行政区划
     * @return 行政区划
     */
    @Override
    public List<Districts> selectDistrictsList(Districts districts)
    {
        return districtsMapper.selectDistrictsList(districts);
    }

    /**
     * 新增行政区划
     * 
     * @param districts 行政区划
     * @return 结果
     */
    @Override
    public int insertDistricts(Districts districts)
    {
        return districtsMapper.insertDistricts(districts);
    }

    /**
     * 修改行政区划
     * 
     * @param districts 行政区划
     * @return 结果
     */
    @Override
    public int updateDistricts(Districts districts)
    {
        return districtsMapper.updateDistricts(districts);
    }

    /**
     * 批量删除行政区划
     * 
     * @param codes 需要删除的行政区划主键
     * @return 结果
     */
    @Override
    public int deleteDistrictsByCodes(String[] codes)
    {
        return districtsMapper.deleteDistrictsByCodes(codes);
    }

    /**
     * 删除行政区划信息
     * 
     * @param code 行政区划主键
     * @return 结果
     */
    @Override
    public int deleteDistrictsByCode(String code)
    {
        return districtsMapper.deleteDistrictsByCode(code);
    }
}
