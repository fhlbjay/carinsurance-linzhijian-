package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

//车损险
@Getter
@Setter
public class CarLossIns extends BaseDomain {

    private static final long serialVersionUID = -8833273515108947442L;

    //保费
    private BigDecimal ins;

    private Bill bill;

    //车辆大小
    private Byte carSize;

    //估价
    private BigDecimal valuation;
}