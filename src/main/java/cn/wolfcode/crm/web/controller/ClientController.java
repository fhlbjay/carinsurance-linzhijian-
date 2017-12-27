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

import java.util.List;

@Controller
@RequestMapping("client")
public class ClientController {

    @Autowired
    IClientSerivce clientSerivce;

    @RequestMapping("view")
    @RequiresPermissions("client:view")
    @PermissionName("客户查询")
    public String view() throws Exception {
        return "client/client";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("client:query")
    @PermissionName("潜在客户列表")
    public PageResult query(ClientQueryObject qo) throws Exception {
        return clientSerivce.query(qo);
    }
    @RequestMapping("list")
    @ResponseBody
    @RequiresPermissions("client:list")
    @PermissionName("所有客户")
    public List<Client> list() throws Exception {
        return clientSerivce.selectAll();
    }


    @RequestMapping("defeat")
    @ResponseBody
    @RequiresPermissions("client:defeat")
    @PermissionName("开发客户失败")
    public JsonResult defeat(Long id) throws Exception {
        clientSerivce.defeat(clientSerivce.selectByPrimaryKey(id));
        return new JsonResult();
    }
    @RequestMapping("off")
    @ResponseBody
    @RequiresPermissions("client:defeat")
    @PermissionName("客户流失")
    public JsonResult off(Long id) throws Exception {
        clientSerivce.off(id);
        return new JsonResult();
    }

    @RequestMapping("move")
    @ResponseBody
    @RequiresPermissions("client:query")
    @PermissionName("将客户移入资源池")
    public JsonResult move(Long id) throws Exception {
        //获取当前员工
        Employee employee = (Employee) SecurityUtils.getSubject().getPrincipal();
        //获取当前客户的信息
        Client client = clientSerivce.selectByPrimaryKey(id);
        client.setInputUser(employee);
        try {
            clientSerivce.move(client.getId());
            return new JsonResult();
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(false, "移动无效");
        }
    }

    @RequestMapping("absorb")
    @ResponseBody
    @RequiresPermissions("client:absorb")
    @PermissionName("吸纳该用户")
    public JsonResult absorb(Long id) throws Exception {
        //获取当前客户的信息
        Client client = clientSerivce.selectByPrimaryKey(id);
        //将状态改为潜在客户
        byte b = 0;
        client.setStatus(b);
        try {
            clientSerivce.absorb(client);
            return new JsonResult();
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(false, "吸纳失败");
        }
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Client client) throws Exception {
        System.out.println(client);
        byte b = 0;
        client.setStatus(b);
        //获取到当前登录的对象
        Employee employee = (Employee) SecurityUtils.getSubject().getPrincipal();
        //创建人
        client.setInputUser(employee);
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
