package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class Role extends BaseDomain {

    private static final long serialVersionUID = 4608551593128875913L;

    private String sn;

    private String name;

    private List<Permission> permissions = new ArrayList<>();
}