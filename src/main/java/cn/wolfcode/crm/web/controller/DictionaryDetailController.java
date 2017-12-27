package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.DictionaryDetail;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.DictionaryQueryObject;
import cn.wolfcode.crm.service.IDictionaryDetailService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("dictionaryDetail")
public class DictionaryDetailController {

    @Autowired
    IDictionaryDetailService dictionaryDetailService;

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("dictionaryDetail:query")
    @PermissionName("数据字典明细列表")
    public PageResult query(DictionaryQueryObject queryObject) throws Exception {
        if (queryObject.getParentId() == null) {
            return null;
        }
        return dictionaryDetailService.query(queryObject);
    }

    @RequestMapping("selectByParentSn")
    @ResponseBody
    @RequiresPermissions("dictionaryDetail:selectByParentSn")
    @PermissionName("数据字典明细查询(目录编码)")
    public List<DictionaryDetail> selectByParentSn(String sn) throws Exception {
        return dictionaryDetailService.selectByParentSn(sn);
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("dictionaryDetail:saveOrUpdate")
    @PermissionName("数据字典明细编辑")
    public JsonResult saveOrUpdate(DictionaryDetail dictionaryDetail) throws Exception {
        try {
            if (dictionaryDetail.getId() == null) {
                dictionaryDetailService.insert(dictionaryDetail);
            } else {
                dictionaryDetailService.updateByPrimaryKey(dictionaryDetail);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }

    @RequestMapping("changeState")
    @ResponseBody
    @RequiresPermissions("dictionaryDetail:changeState")
    @PermissionName("数据字典明细禁/启用")
    public void changeState(Long id) throws Exception {
        dictionaryDetailService.changeState(id);
    }

    @RequestMapping("selectById")
    @ResponseBody
    @RequiresPermissions("dictionaryDetail:selectById")
    @PermissionName("数据字典明细查询(ID)")
    public DictionaryDetail selectById(Long id) throws Exception {
        return dictionaryDetailService.selectByPrimaryKey(id);
    }
}
