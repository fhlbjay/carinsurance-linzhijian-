package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.EmployeeQueryObject;
import cn.wolfcode.crm.service.IEmployeeService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("employee")
public class EmployeeController {

    @Autowired
    IEmployeeService employeeService;

    @RequestMapping("view")
    @RequiresPermissions("employee:view")
    @PermissionName("员工查询")
    public String view() throws Exception {
        return "employee/employee";
    }
    @RequestMapping("list")
    @ResponseBody
    public List<Employee> list() throws Exception {
        return employeeService.selectAll();
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("employee:query")
    @PermissionName("员工列表")
    public PageResult query(EmployeeQueryObject queryObject) throws Exception {
        return employeeService.query(queryObject);
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("employee:saveOrUpdate")
    @PermissionName("员工新增/修改")
    public JsonResult saveOrUpdate(Employee employee) throws Exception {
        try {
            if (employee.getId() == null) {
                employeeService.insert(employee);
            } else {
                employeeService.updateByPrimaryKey(employee);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }

    @RequestMapping("changeState")
    @ResponseBody
    @RequiresPermissions("employee:changeState")
    @PermissionName("员工复/离职")
    public void changeState(Long id) throws Exception {
        employeeService.changeState(id);
    }
}
