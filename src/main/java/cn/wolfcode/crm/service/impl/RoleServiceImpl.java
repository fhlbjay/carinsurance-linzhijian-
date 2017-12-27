package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.domain.Role;
import cn.wolfcode.crm.mapper.RoleMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    RoleMapper roleMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Role record) {
        roleMapper.insert(record);
        for (Permission permission : record.getPermissions()) {
            roleMapper.insertRelation(record.getId(), permission.getId());
        }
    }

    @Override
    public Role selectByPrimaryKey(Long id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Role> selectAll() {
        return roleMapper.selectAll();
    }

    @Override
    public void updateByPrimaryKey(Role record) {
        roleMapper.deleteRelationByRoleId(record.getId());
        roleMapper.updateByPrimaryKey(record);
        for (Permission permission : record.getPermissions()) {
            roleMapper.insertRelation(record.getId(), permission.getId());
        }
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = roleMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, roleMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

    @Override
    public List<Long> getRoleIdsByEmployeeId(Long id) {
        return roleMapper.getRoleIdsByEmployeeId(id);
    }

    @Override
    public List<String> getRoleNamesByEmployeeId(Long employeeId) {
        return roleMapper.getRoleNamesByEmployeeId(employeeId);
    }
}
