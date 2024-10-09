package com.ruoyi.jgc.domain;

public enum UploadAssociationType {
    PURCHASE_ORDER("PO", "进货单"),
    FURNITURE_ORDER("FO", "家具订单");

    private final String code;
    private final String desc;

    // 构造函数
    UploadAssociationType(String code, String desc) {
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
    public static UploadAssociationType fromCode(String code) {
        for (UploadAssociationType type : UploadAssociationType.values()) {
            if (type.getCode().equals(code)) {
                return type;
            }
        }
        throw new IllegalArgumentException("Invalid code: " + code);
    }
}