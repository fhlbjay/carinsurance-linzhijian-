package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface PermissionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Permission record);

    Permission selectByPrimaryKey(Long id);

    List<Permission> selectAll();

    int updateByPrimaryKey(Permission record);

    List<Permission> listByRoleId(Long id);

    int queryCount(QueryObject queryObject);

    List<Permission> queryList(QueryObject queryObject);

    List<String> selectAllResources();

    List<String> getPermissionResourcesByEmployeeId(Long employeeId);

    List<Permission> selectPermissionView();
}