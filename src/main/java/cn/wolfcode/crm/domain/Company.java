package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Company extends BaseDomain {
    /**
     * 不合作
     */
    public static final boolean STATUS_NONCOOPERATION = false;
    /**
     * 合作
     */
    public static final boolean STATUS_COOPERATION = true;

    private static final long serialVersionUID = -3112295626063811918L;

    private String sn;

    private String name;

    private boolean status;

}