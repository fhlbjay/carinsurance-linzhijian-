package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Checkingin;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.ICheckinginService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("checkingin")
public class CheckinginController {

    @Autowired
    ICheckinginService checkinginService;

    @RequestMapping("view")
    @RequiresPermissions("checkingin:view")
    @PermissionName("考勤页面")
    public String view() throws Exception {
        return "checkingin/checkingin";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("checkingin:query")
    @PermissionName("考勤列表")
    public PageResult query(QueryObject queryObject) throws Exception {
        return checkinginService.query(queryObject);
    }

    @RequestMapping("sign")
    @ResponseBody
    public JsonResult saveOrUpdate() throws Exception {
        try {
            checkinginService.insert();
            return new JsonResult();
        }catch (Exception e){
            e.printStackTrace();
            return new JsonResult(false,"签到失败");
        }
    }

    @RequestMapping("back")
    @ResponseBody
    public JsonResult back(Checkingin checkingin) throws Exception {
        checkinginService.back(checkingin);
        return new JsonResult();
    }


    @RequestMapping("updata")
    @ResponseBody
    public JsonResult updata(Checkingin checkingin) throws Exception {
        checkinginService.updata(checkingin);
        return new JsonResult();
    }


}
