package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Department extends BaseDomain {

    private static final long serialVersionUID = 4981286762352741989L;

    private String sn;

    private String name;

    private boolean state = true;
}