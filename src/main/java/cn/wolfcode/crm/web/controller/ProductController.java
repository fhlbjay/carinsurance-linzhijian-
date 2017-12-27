package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Product;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ProductQueryObject;
import cn.wolfcode.crm.service.IProductService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("product")
public class ProductController {

    @Autowired
    IProductService productService;

    @RequestMapping("list")
    @ResponseBody
    public List<Product> list() throws Exception {
        return productService.selectAll();
    }

    @RequestMapping("view")
    @RequiresPermissions("product:view")
    @PermissionName("商品查询")
    public String view() throws Exception {
        return "product/product";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("product:query")
    @PermissionName("商品列表")
    public PageResult query(ProductQueryObject queryObject) throws Exception {
        return productService.query(queryObject);
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("product:saveOrUpdate")
    @PermissionName("商品新增/修改")
    public JsonResult saveOrUpdate(Product product) throws Exception {
        try {
            if (product.getId() == null) {
                productService.insert(product);
            } else {
                productService.updateByPrimaryKey(product);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }

    @RequestMapping("changeState")
    @ResponseBody
    @RequiresPermissions("product:changeState")
    @PermissionName("产品改变状态")
    public void changeState(Long id) throws Exception {
        productService.changeState(id);
    }

}
