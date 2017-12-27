package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Role;
import cn.wolfcode.crm.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    Role selectByPrimaryKey(Long id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);

    int queryCount(QueryObject queryObject);

    List<Role> queryList(QueryObject queryObject);

    void insertRelation(@Param("roleId") Long roleId, @Param("permissionId") Long permissionId);

    void deleteRelationByRoleId(Long roleId);

    List<Long> getRoleIdsByEmployeeId(Long employeeId);

    List<String> getRoleNamesByEmployeeId(Long employeeId);
}