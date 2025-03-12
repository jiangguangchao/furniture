package com.ruoyi.jgc.domain;

/**
 * 付款记录关联类型，目前付款记录只关联两种类型，进货单和家具订单。
 */
public enum AssociationType {
    PURCHASE_ORDER("PO", "进货单"),
    FURNITURE_ORDER("FO", "家具订单");

    private final String code;
    private final String desc;

    // 构造函数
    AssociationType(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    // 获取code的方法
    public String getCode() {
        return code;
    }

    // 获取desc的方法
    public String getDesc() {
        return desc;
    }

    // 根据code获取对应的枚举对象
    public static AssociationType fromCode(String code) {
        for (AssociationType type : AssociationType.values()) {
            if (type.getCode().equals(code)) {
                return type;
            }
        }
        throw new IllegalArgumentException("Invalid code: " + code);
    }
}