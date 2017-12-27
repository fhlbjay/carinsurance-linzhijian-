package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Menu;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IMenuService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("menu")
public class MenuController {

    @Autowired
    IMenuService menuService;

    @RequestMapping("list")
    @ResponseBody
    public List<Menu> list() throws Exception {
        return menuService.selectAll();
    }

    @RequestMapping("selectByParentIdAndEmployeeId")
    @ResponseBody
    public List<Menu> selectByParentIdAndEmployeeId(Long employeeId, Long parentId) throws Exception {
        return menuService.selectByParentIdAndEmployeeId(employeeId, parentId);
    }

    @RequestMapping("listNoParent")
    @ResponseBody
    public List<Menu> listNoParent() throws Exception {
        return menuService.listNoParent();
    }

    @RequestMapping("view")
    @RequiresPermissions("menu:view")
    @PermissionName("菜单查询")
    public String view() throws Exception {
        return "menu/menu";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("menu:query")
    @PermissionName("菜单列表")
    public PageResult query(QueryObject queryObject) throws Exception {
        return menuService.query(queryObject);
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("menu:saveOrUpdate")
    @PermissionName("菜单编辑")
    public JsonResult saveOrUpdate(Menu menu) throws Exception {
        try {
            if (menu.getId() == null) {
                menuService.insert(menu);
            } else {
                menuService.updateByPrimaryKey(menu);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }

}
