package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Client;
import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ClientQueryObject;
import cn.wolfcode.crm.service.IClientSerivce;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("officialClient")
public class OfficialClientController {

    @Autowired
    IClientSerivce clientSerivce;

    @RequestMapping("view")
    @RequiresPermissions("officialclient:view")
    @PermissionName("正式客户查询")
    public String view() throws Exception {
        return "client/officialclient";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("officialclient:query")
    @PermissionName("正式客户列表")
    public PageResult query(ClientQueryObject qo) throws Exception {
        return clientSerivce.query(qo);
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Client client) throws Exception {
        System.out.println(client);
        byte b = 1;
        client.setStatus(b);
        //获取到当前登录的对象
        Employee employee = (Employee) SecurityUtils.getSubject().getPrincipal();
        client.setInputUser(employee);
        client.setInChargeUser(employee);
        try {
            if (client.getId() == null) {
                clientSerivce.insert(client);
            } else {
                clientSerivce.updateByPrimaryKey(client);
            }
            return new JsonResult();
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(false, "保存失败");
        }
    }
}
