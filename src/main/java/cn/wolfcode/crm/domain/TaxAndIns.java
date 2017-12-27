package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

//交强险车船税
@Getter
@Setter
public class TaxAndIns extends BaseDomain {

    private static final long serialVersionUID = 2527636204865528255L;

    //上一年交通事故次数
    private int trafficNumber;

    //上一年酒驾事故次数
    private int drunkNumber;

    //交强险系数
    private BigDecimal insModulus;

    //交强险
    private BigDecimal ins;

    //车船税
    private BigDecimal tax;

    //未出事故年数
    private int safeYears;

    private Bill bill;

    private Byte carSize;
}