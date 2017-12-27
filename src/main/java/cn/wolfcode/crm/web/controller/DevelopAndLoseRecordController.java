package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Client;
import cn.wolfcode.crm.domain.DevelopAndLoseRecord;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ClientQueryObject;
import cn.wolfcode.crm.service.IClientSerivce;
import cn.wolfcode.crm.service.IDevelopAndLoseRecordService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("developAndLoseRecord")
public class DevelopAndLoseRecordController {

    @Autowired
    IDevelopAndLoseRecordService developAndLoseRecordService;
    @Autowired
    IClientSerivce clientSerivce;

    @RequestMapping("view")
    @RequiresPermissions("developAndLoseRecord:view")
    @PermissionName("客户开发记录查询")
    public String view() throws Exception {
        return "developAndLoseRecord/developAndLoseRecord";
    }
    @RequestMapping("viewOff")
    @RequiresPermissions("developAndLoseRecord:viewOff")
    @PermissionName("客户流失记录查询")
    public String viewOff() throws Exception {
        return "developAndOffRecord/developAndOffRecord";
    }

    //查询开发失败
    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("developAndLoseRecord:query")
    @PermissionName("客户开发/流失记录列表")
    public PageResult query(ClientQueryObject qo) throws Exception {
        qo.setStatus((byte)-1);
        return developAndLoseRecordService.query(qo);
    }

    //查询流失
    @RequestMapping("queryOff")
    @ResponseBody
    @RequiresPermissions("developAndLoseRecord:queryOff")
    @PermissionName("客户开发/流失记录列表")
    public PageResult queryOff(ClientQueryObject qo) throws Exception {
        qo.setStatus((byte)-2);
        return developAndLoseRecordService.queryOff(qo);
    }

    @RequestMapping("defeat")
    @ResponseBody
    @RequiresPermissions("developAndLoseRecord:defeat")
    @PermissionName("客户开发失败保存")
    public JsonResult defeat(DevelopAndLoseRecord record, Long id) throws Exception {
        //获取该id客户
        Client client = clientSerivce.selectByPrimaryKey(id);
        byte b = -1;
        client.setStatus(b);
        record.setClient(client);
//        //获取当前员工
//        Employee employee = (Employee) SecurityUtils.getSubject().getPrincipal();
//        record.setInChargeUser(employee);
        try {
            developAndLoseRecordService.insert(record);
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "操作失败");

        }

    }
    @RequestMapping("off")
    @ResponseBody
    @RequiresPermissions("developAndLoseRecord:off")
    @PermissionName("客户流失保存")
    public JsonResult off(DevelopAndLoseRecord record, Long id) throws Exception {
        //获取该id客户
        Client client = clientSerivce.selectByPrimaryKey(id);
        byte b = -2;
        client.setStatus(b);
        record.setClient(client);
//        //获取当前员工
//        Employee employee = (Employee) SecurityUtils.getSubject().getPrincipal();
//        record.setInChargeUser(employee);
        try {
            developAndLoseRecordService.insert(record);
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "操作失败");

        }

    }

}
