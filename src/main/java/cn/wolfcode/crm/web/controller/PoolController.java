package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ClientQueryObject;
import cn.wolfcode.crm.service.IClientSerivce;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("pool")
public class PoolController {

    @Autowired
    IClientSerivce clientSerivce;

    @RequestMapping("view")
    @RequiresPermissions("pool:view")
    @PermissionName("资源池查询")
    public String view() throws Exception {
        return "client/ResourcePool";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("pool:query")
    @PermissionName("资源池客户列表")
    public PageResult query(ClientQueryObject qo) throws Exception {
        qo.setStatus((byte)2);
        return clientSerivce.query(qo);
    }
}
