package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

//字典明细
@Getter
@Setter
public class DictionaryDetail extends BaseDomain {

    private static final long serialVersionUID = -9129767957091069711L;

    private DictionaryDirectory parent;

    private String name;

    private String intro;

    //false为禁用
    private boolean state = true;
}