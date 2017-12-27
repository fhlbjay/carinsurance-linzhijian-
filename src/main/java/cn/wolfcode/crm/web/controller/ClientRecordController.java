package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.ClientRecord;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ClientRecordQueryObject;
import cn.wolfcode.crm.service.IClientRecordService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("clientRecord")
public class ClientRecordController {

    @Autowired
    IClientRecordService clientRecordService;

    @RequestMapping("list")
    @ResponseBody
    public List<ClientRecord> list() throws Exception {
        return clientRecordService.selectAll();
    }

    @RequestMapping("view")
    @RequiresPermissions("clientRecord:view")
    @PermissionName("客户跟进记录查询")
    public String view() throws Exception {
        return "clientRecord/clientRecord";
    }

    @RequestMapping("delete")
    @ResponseBody
    @RequiresPermissions("clientRecord:delete")
    @PermissionName("客户跟进/开发记录删除")
    public JsonResult delete(Long id) throws Exception {
        try {
            clientRecordService.deleteByPrimaryKey(id);
            return new JsonResult();
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(false, "删除失败");
        }
    }
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("clientRecord:saveOrUpdate")
    @PermissionName("客户跟进/开发记录更新/保存")
    public JsonResult saveOrUpdate(ClientRecord clientRecord) throws Exception {
        try {
            if (clientRecord.getId() == null) {
                clientRecordService.insert(clientRecord);
            } else {
                clientRecordService.updateByPrimaryKey(clientRecord);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }


    @RequestMapping("viewOff")
    @RequiresPermissions("clientRecord:view")
    @PermissionName("客户开发记录查询")
    public String viewOff() throws Exception {
        return "clientRecord/clientRecord2";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("clientRecord:query")
    @PermissionName("客户开发/跟进记录列表")
    public PageResult query(ClientRecordQueryObject queryObject) throws Exception {
        return clientRecordService.query(queryObject);
    }

}
