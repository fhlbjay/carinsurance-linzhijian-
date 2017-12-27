package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.ChangeRecord;
import cn.wolfcode.crm.domain.Client;
import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ChangeRecordQueryObject;
import cn.wolfcode.crm.service.IChangeRecordService;
import cn.wolfcode.crm.service.IClientSerivce;
import cn.wolfcode.crm.service.IEmployeeService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("changeRecord")
public class ChangeRecordController {

    @Autowired
    IChangeRecordService changeRecordService;
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IClientSerivce clientSerivce;

    @RequestMapping("list")
    @ResponseBody
    public List<ChangeRecord> list() throws Exception {
        return changeRecordService.selectAll();
    }

    @RequestMapping("insert")
    @ResponseBody
    @RequiresPermissions("changeRecord:insert")
    @PermissionName("客户移交记录新增")
    public JsonResult insert(ChangeRecord record) throws Exception {
        try {
            //移交时间
            record.setChangeDate(new Date());
            //操作人
            Employee principal = (Employee) SecurityUtils.getSubject().getPrincipal();
            record.setHandler(principal);
            //设置原负责人
            Employee oldMan = employeeService.selectByPrimaryKey(record.getOldMan().getId());
            record.setOldMan(oldMan);
            //设置新负责人
            Employee newMan = employeeService.selectByPrimaryKey(record.getNewMan().getId());
            record.setNewMan(newMan);
            //设置当前操作的用户
            Client client = clientSerivce.selectByPrimaryKey(record.getId());
            //重新设置改用负责人
            client.setInChargeUser(newMan);
            //更新该用户信息
            clientSerivce.updateByPrimaryKey(client);
            record.setClient(client);
            //将该用户转换为正式用户
            clientSerivce.official(record.getId());
            changeRecordService.insert(record);
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }

    @RequestMapping("view")
    @RequiresPermissions("changeRecord:view")
    @PermissionName("客户移交记录查询")
    public String view() throws Exception {
        return "changeRecord/changeRecord";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("changeRecord:query")
    @PermissionName("客户移交记录列表")
    public PageResult query(ChangeRecordQueryObject queryObject) throws Exception {
        return changeRecordService.query(queryObject);
    }


}
