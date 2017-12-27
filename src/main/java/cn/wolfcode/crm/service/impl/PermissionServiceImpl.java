package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.mapper.PermissionMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IPermissionService;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Service
public class PermissionServiceImpl implements IPermissionService {

    @Autowired
    PermissionMapper permissionMapper;
    @Autowired
    ApplicationContext context;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return permissionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Permission record) {
        return permissionMapper.insert(record);
    }

    @Override
    public Permission selectByPrimaryKey(Long id) {
        return permissionMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Permission> selectAll() {
        return permissionMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Permission record) {
        return permissionMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Permission> listByRoleId(Long id) {
        return permissionMapper.listByRoleId(id);
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = permissionMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, permissionMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

    @Override
    public void reload() {
        List<String> resources = permissionMapper.selectAllResources();
        Map<String, Object> beans = context.getBeansWithAnnotation(Controller.class);
        for (Object o : beans.values()) {
            for (Method method : o.getClass().getSuperclass().getMethods()) {
                RequiresPermissions requiresPermissions = method.getDeclaredAnnotation(RequiresPermissions.class);
                if (requiresPermissions != null) {
                    String[] values = requiresPermissions.value();
                    if (!resources.contains(values[0])) {
                        Permission permission = new Permission();
                        permission.setResource(values[0]);
                        permission.setName(method.getDeclaredAnnotation(PermissionName.class).value());
                        permissionMapper.insert(permission);
                    }
                }
            }
        }

    }

    @Override
    public List<String> getPermissionResourcesByEmployeeId(Long employeeId) {
        return permissionMapper.getPermissionResourcesByEmployeeId(employeeId);
    }

    @Override
    public List<Permission> selectPermissionView() {
        return permissionMapper.selectPermissionView();
    }
}
