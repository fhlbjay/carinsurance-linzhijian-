package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Permission extends BaseDomain {

    private static final long serialVersionUID = 7645138625996559838L;

    private String name;

    private String resource;
}