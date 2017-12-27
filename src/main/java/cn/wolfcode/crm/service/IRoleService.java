package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Role;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IRoleService {
    int deleteByPrimaryKey(Long id);

    void insert(Role record);

    Role selectByPrimaryKey(Long id);

    List<Role> selectAll();

    void updateByPrimaryKey(Role record);

    PageResult query(QueryObject queryObject);

    List<Long> getRoleIdsByEmployeeId(Long id);

    List<String> getRoleNamesByEmployeeId(Long employeeId);
}
