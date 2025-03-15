package com.ruoyi.jgc.domain;

import java.util.List;

import com.ruoyi.common.annotation.Excel;

public class OrderStatisticsDto {

    /** 统计日期 */
    private String startDate;

    private String endDate;

    /** 日期类型 */
    private List<String> dateTypeList;

    /** 是否是强制统计，如果是强制统计，会覆盖统计表中相同日期的数据 */
    private boolean force;

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public List<String> getDateTypeList() {
        return dateTypeList;
    }

    public void setDateTypeList(List<String> dateTypeList) {
        this.dateTypeList = dateTypeList;
    }

    public boolean isForce() {
        return force;
    }

    public void setForce(boolean force) {
        this.force = force;
    }
}
