package com.ruoyi.jgc.domain;

import com.ruoyi.common.annotation.Excel;

public class OrderStatisticsDto {

    /** 统计日期 */
    private String statcDate;

    /** 日期类型 */
    private String dateType;

    /** 是否是强制统计，如果是强制统计，会覆盖统计表中相同日期的数据 */
    private boolean force;

    public String getStatcDate() {
        return statcDate;
    }

    public void setStatcDate(String statcDate) {
        this.statcDate = statcDate;
    }

    public String getDateType() {
        return dateType;
    }

    public void setDateType(String dateType) {
        this.dateType = dateType;
    }

    public boolean isForce() {
        return force;
    }

    public void setForce(boolean force) {
        this.force = force;
    }
}
