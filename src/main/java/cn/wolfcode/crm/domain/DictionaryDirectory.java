package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

//字典目录
@Getter
@Setter
public class DictionaryDirectory extends BaseDomain {

    private static final long serialVersionUID = 3195679800372979006L;

    private String sn;

    private String name;

    private String intro;
}