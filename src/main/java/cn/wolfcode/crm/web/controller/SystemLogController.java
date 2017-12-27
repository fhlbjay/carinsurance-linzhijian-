package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.ISystemLogService;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("systemLog")
public class SystemLogController {

    @Autowired
    ISystemLogService systemLogService;

    @RequestMapping("view")
    @RequiresPermissions("systemLog:view")
    @PermissionName("系统日志查询")
    public String view() throws Exception {
        return "systemLog/systemLog";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("systemLog:query")
    @PermissionName("系统日志列表")
    public PageResult query(QueryObject queryObject) throws Exception {
        return systemLogService.query(queryObject);
    }

}
