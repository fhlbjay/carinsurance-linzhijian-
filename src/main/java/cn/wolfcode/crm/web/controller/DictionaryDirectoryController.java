package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.DictionaryDirectory;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IDictionaryDirectoryService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("dictionaryDirectory")
public class DictionaryDirectoryController {

    @Autowired
    IDictionaryDirectoryService dictionaryDirectoryService;

    @RequestMapping("view")
    @RequiresPermissions("dictionaryDirectory:view")
    @PermissionName("数据字典目录查询")
    public String view() throws Exception {
        return "dictionary/dictionary";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("dictionaryDirectory:query")
    @PermissionName("数据字典目录列表")
    public PageResult query(QueryObject queryObject) throws Exception {
        return dictionaryDirectoryService.query(queryObject);
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("dictionaryDirectory:saveOrUpdate")
    @PermissionName("数据字典目录编辑")
    public JsonResult saveOrUpdate(DictionaryDirectory dictionaryDirectory) throws Exception {
        try {
            if (dictionaryDirectory.getId() == null) {
                dictionaryDirectoryService.insert(dictionaryDirectory);
            } else {
                dictionaryDirectoryService.updateByPrimaryKey(dictionaryDirectory);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }

}
