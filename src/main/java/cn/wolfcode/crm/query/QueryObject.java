package cn.wolfcode.crm.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QueryObject {
    private int page = 1;
    private int rows = 10;

    public int getBegin() {
        return (page - 1) * rows;
    }
}
