package com.ruoyi.jgc.domain;

public enum AssociationType {
    PURCHASE_ORDER("PO", "进货单"),
    FURNITURE_ORDER("FO", "家具订单"),
    PAYMENT_RECORD("PR", "付款记录");

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