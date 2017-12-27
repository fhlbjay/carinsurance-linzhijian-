package cn.wolfcode.crm.domain;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
public class Product extends BaseDomain {

    /**
     * 不可用状态
     */
    public static final boolean STATUS_USABLE = false;

    /**
     * 可用状态
     */
    public static final boolean STATUS_UNUSABLE = true;

    private static final long serialVersionUID = 5160814960904311114L;

    private String name;

    private Company company;

    private Integer years;

    private BigDecimal amount;

    private BigDecimal yearsAmount;

    private boolean status;

}