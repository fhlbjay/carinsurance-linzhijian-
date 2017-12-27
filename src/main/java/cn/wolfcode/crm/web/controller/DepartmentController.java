package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Department;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IDepartmentService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("department")
public class DepartmentController {

    @Autowired
    IDepartmentService departmentService;

    @RequestMapping("list")
    @ResponseBody
    public List<Department> list() throws Exception {
        return departmentService.selectAll();
    }

    @RequestMapping("view")
    @RequiresPermissions("department:view")
    @PermissionName("部门查询")
    public String view() throws Exception {
        return "department/department";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("department:query")
    @PermissionName("部门列表")
    public PageResult query(QueryObject queryObject) throws Exception {
        return departmentService.query(queryObject);
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("department:saveOrUpdate")
    @PermissionName("部门新增/修改")
    public JsonResult saveOrUpdate(Department department) throws Exception {
        try {
            if (department.getId() == null) {
                departmentService.insert(department);
            } else {
                departmentService.updateByPrimaryKey(department);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }

    @RequestMapping("changeState")
    @ResponseBody
    @RequiresPermissions("department:changeState")
    @PermissionName("部门生/失效")
    public void changeState(Long id) throws Exception {
        departmentService.changeState(id);
    }
}
