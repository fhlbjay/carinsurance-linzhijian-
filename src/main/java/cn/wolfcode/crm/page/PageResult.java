package cn.wolfcode.crm.page;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
public class PageResult {
    //currentPage
    private int total;
    //pageSize
    private List<?> rows;
}
