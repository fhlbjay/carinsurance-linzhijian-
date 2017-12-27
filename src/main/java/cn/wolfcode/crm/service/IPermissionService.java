package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IPermissionService {
    int deleteByPrimaryKey(Long id);

    int insert(Permission record);

    Permission selectByPrimaryKey(Long id);

    List<Permission> selectAll();

    int updateByPrimaryKey(Permission record);

    List<Permission> listByRoleId(Long id);

    PageResult query(QueryObject queryObject);

    void reload();

    List<String> getPermissionResourcesByEmployeeId(Long employeeId);

    List<Permission> selectPermissionView();
}
