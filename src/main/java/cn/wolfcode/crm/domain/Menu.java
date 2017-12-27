package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

//菜单
@Getter
@Setter
public class Menu extends BaseDomain {

    private static final long serialVersionUID = 8407815207859236525L;

    private String text;

    private String url;

    private Menu parentMenu;

    private List<Menu> children = new ArrayList<>();

    private Permission permission;
}