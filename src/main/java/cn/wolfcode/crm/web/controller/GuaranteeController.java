package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Guarantee;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.GuaranteeQueryObject;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IGuaranteeService;
import cn.wolfcode.crm.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("guarantee")
public class GuaranteeController {

    @Autowired
    IGuaranteeService guaranteeService;

    @RequestMapping("list")
    @ResponseBody
    public List<Guarantee> list() throws Exception {
        return guaranteeService.selectAll();
    }

    @RequestMapping("view")
    public String view() throws Exception {
        return "guarantee/guarantee";
    }
    @RequestMapping("query")
    @ResponseBody
    public PageResult query(GuaranteeQueryObject queryObject) throws Exception {
        return guaranteeService.query(queryObject);
    }
    @RequestMapping("delete")
    @ResponseBody
    public void delete(Long  id) throws Exception {

        guaranteeService.deleteByPrimaryKey(id);
    }

    @RequestMapping("selectAll")
    @ResponseBody
    public List<Guarantee> selectAll(QueryObject queryObject) throws Exception {
        return guaranteeService.selectAll();
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Guarantee guarantee) throws Exception {
        try {
            if (guarantee.getId() == null) {
                guaranteeService.insert(guarantee);
            } else {
                guaranteeService.updateByPrimaryKey(guarantee);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }
    @RequestMapping("changeStatus")
    @ResponseBody
    public void changeStatus(Long id) throws Exception {
        guaranteeService.changeStatus(id);
    }

}
