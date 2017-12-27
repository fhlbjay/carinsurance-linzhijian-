package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Company;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.ICompanyService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("company")
public class CompanyController {

    @Autowired
    ICompanyService companyService;

    @RequestMapping("list")
    @ResponseBody
    public List<Company> list() throws Exception {
        return companyService.selectAll();
    }

    @RequestMapping("view")
    @RequiresPermissions("company:view")
    @PermissionName("公司查询")
    public String view() throws Exception {
        return "company/company";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("company:query")
    @PermissionName("公司列表")
    public PageResult query(QueryObject queryObject) throws Exception {
        return companyService.query(queryObject);
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("company:saveOrUpdate")
    @PermissionName("公司新增/修改")
    public JsonResult saveOrUpdate(Company company) throws Exception {
        try {
            if (company.getId() == null) {
                companyService.insert(company);
            } else {
                companyService.updateByPrimaryKey(company);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }

    @RequestMapping("changeState")
    @ResponseBody
    @RequiresPermissions("company:changeState")
    @PermissionName("公司改变状态")
    public void changeState(Long id) throws Exception {
        companyService.changeState(id);
    }
}
