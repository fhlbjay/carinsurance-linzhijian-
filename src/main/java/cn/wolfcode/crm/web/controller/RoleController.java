package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.domain.Role;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IRoleService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @RequestMapping("view")
    @RequiresPermissions("role:view")
    @PermissionName("角色查询")
    public String view() throws Exception {
        return "role/role";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("role:query")
    @PermissionName("角色列表")
    public PageResult query(QueryObject queryObject) throws Exception {
        return roleService.query(queryObject);
    }

    @RequestMapping("list")
    @ResponseBody
    public List<Role> list() throws Exception {
        return roleService.selectAll();
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("role:saveOrUpdate")
    @PermissionName("角色新增/修改")
    public JsonResult saveOrUpdate(Role role) throws Exception {
        try {
            if (role.getId() == null) {
                roleService.insert(role);
            } else {
                roleService.updateByPrimaryKey(role);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");

        }
    }

    @RequestMapping("getRoleIdsByEmployeeId")
    @ResponseBody
    public List<Long> getRoleIdsByEmployeeId(Long id) throws Exception {
        return roleService.getRoleIdsByEmployeeId(id);
    }
}
