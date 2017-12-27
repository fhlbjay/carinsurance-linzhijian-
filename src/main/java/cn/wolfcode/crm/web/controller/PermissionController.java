package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Permission;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IPermissionService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("permission")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("list")
    @ResponseBody
    public List<Permission> list() throws Exception {
        return permissionService.selectAll();
    }

    @RequestMapping("view")
    @RequiresPermissions("permission:view")
    @PermissionName("权限查询")
    public String view() throws Exception {
        return "permission/permission";
    }

    @RequestMapping("listByRoleId")
    @ResponseBody
    public List<Permission> listByRoleId(Long id) throws Exception {
        if (id != null)
            return permissionService.listByRoleId(id);
        return null;
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("permission:query")
    @PermissionName("权限列表")
    public PageResult query(QueryObject queryObject) throws Exception {
        return permissionService.query(queryObject);
    }

    @RequestMapping("reload")
    @ResponseBody
    @RequiresPermissions("permission:reload")
    @PermissionName("权限加载")
    public JsonResult reload() throws Exception {
        try {
            permissionService.reload();
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "加载失败");
        }
    }

    @RequestMapping("selectPermissionView")
    @ResponseBody
    public List<Permission> selectPermissionView() throws Exception {
        return permissionService.selectPermissionView();
    }
}
