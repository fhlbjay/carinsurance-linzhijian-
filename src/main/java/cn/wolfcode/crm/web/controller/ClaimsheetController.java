package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Claimsheet;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ClaimsheetQueryObject;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IClaimsheetService;
import cn.wolfcode.crm.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("claimsheet")
public class ClaimsheetController {

    @Autowired
    IClaimsheetService claimsheetService;

    @RequestMapping("list")
    @ResponseBody
    public List<Claimsheet> list() throws Exception {
        return claimsheetService.selectAll();
    }
    @RequestMapping("complete")
    public String complete() throws Exception {
        return "claimsheet/complete";
    }
    @RequestMapping("examine")
    public String examine() throws Exception {
        return "claimsheet/examine";
    }

    @RequestMapping("exclusions")
    public String exclusions() throws Exception {
        return "claimsheet/exclusions";
    }
    @RequestMapping("view")
    public String view() throws Exception {
        return "claimsheet/claimsheet";
    }
    @RequestMapping("query")
    @ResponseBody
    public PageResult query(ClaimsheetQueryObject queryObject) throws Exception {
        return claimsheetService.query(queryObject);
    }
    @RequestMapping("delete")
    @ResponseBody
    public void delete(Long  id) throws Exception {

        claimsheetService.deleteByPrimaryKey(id);
    }

    @RequestMapping("selectAll")
    @ResponseBody
    public List<Claimsheet> selectAll(QueryObject queryObject) throws Exception {
        return claimsheetService.selectAll();
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Claimsheet claimsheet) throws Exception {
        try {
            if (claimsheet.getId() == null) {
                claimsheetService.insert(claimsheet);
            } else {
                claimsheetService.updateByPrimaryKey(claimsheet);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }
    @RequestMapping("changeStatus")
    @ResponseBody
    public void changeStatus(Long id) throws Exception {
        claimsheetService.changeStatus(id);
    }

    @RequestMapping("changeStatus1")
    @ResponseBody
    public void changeStatus1(Long id) throws Exception {
        claimsheetService.changeStatus1(id);
    }
    @RequestMapping("changeStatus2")
    @ResponseBody
    public void changeStatus2(Long id) throws Exception {
        claimsheetService.changeStatus2(id);
    }



}
