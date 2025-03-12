package com.ruoyi.jgc.domain;


/**
 * 图片关联类型
 */
public enum PicAssociationType {

    //进货单
    PURCHASE_ORDER("PO", "进货单"),

    //进货单条目，也就是进货单中的每一种家具关联的图片
    PURCHASE_ORDER_ITME("POI", "进货单中家具条目"),

    //家具订单,目前家具订单本身没有关联的图片，订单中的家具条目和支付记录有关联图片。这里是先占个位置
    FURNITURE_ORDER("FO", "家具订单"),

    //订单中的家具条目关联图片，一笔订单会记录买了什么家具。这些家具会有关联图片
    ORDER_FURNITURE_ITEM("OFI", "订单中家具条目"),

    //支付记录图片
    PAYMENT_RECORD("PR", "付款记录");


    private final String code;
    private final String desc;

    PicAssociationType(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public String getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

    public static PicAssociationType fromCode(String code) {
        for (PicAssociationType associationType : PicAssociationType.values()) {
            if (associationType.getCode().equals(code)) {
                return associationType;
            }
        }
        return null;
    }
}
