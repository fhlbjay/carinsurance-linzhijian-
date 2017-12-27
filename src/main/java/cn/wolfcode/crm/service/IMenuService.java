package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Menu;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IMenuService {
    int deleteByPrimaryKey(Long id);

    void insert(Menu record);

    Menu selectByPrimaryKey(Long id);

    List<Menu> selectAll();

    void updateByPrimaryKey(Menu record);

    PageResult query(QueryObject queryObject);

    List<Menu> listNoParent();

    List<Menu> selectByParentIdAndEmployeeId(Long employeeId, Long parentId);
}
