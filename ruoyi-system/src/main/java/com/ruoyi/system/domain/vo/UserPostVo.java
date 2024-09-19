package com.ruoyi.system.domain.vo;

import java.math.BigDecimal;

import com.ruoyi.system.domain.SysUserPost;

public class UserPostVo extends SysUserPost{

    private String userName;

    /** 帐号状态（0正常 1停用） */
    private String status;

    
    private BigDecimal salary;

    public BigDecimal getSalary() {
        return salary;
    }

    public void setSalary(BigDecimal salary) {
        this.salary = salary;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }


}
