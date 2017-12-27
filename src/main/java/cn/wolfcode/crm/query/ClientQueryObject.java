package cn.wolfcode.crm.query;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ClientQueryObject extends QueryObject{
    //状态
    private Byte status;
    private String keywords;
}
