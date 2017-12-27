package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class Car extends BaseDomain {

    //载人
    public static final Byte TYPE_MAN = 0;
    //普通载货
    public static final Byte TYPE_NORMAL = 1;
    //危险品
    public static final Byte TYPE_DANGEROUS = 2;
    //特殊车
    public static final Byte TYPE_SPECIAL = 3;

    //小型车
    public static final Byte SIZE_SMALL = 0;
    //中
    public static final Byte SIZE_MIDDLE = 1;
    //大
    public static final Byte SIZE_LARGE = 2;
    //特大
    public static final Byte SIZE_HUGE = 3;

    private static final long serialVersionUID = 9013480841257231399L;

    private Bill bill;

    private DictionaryDetail carBrand;

    private String carNumber;

    //估价
    private BigDecimal valuation;

    private Byte type;

    private Byte size;

}