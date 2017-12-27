package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.domain.Orderofcontract;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.OrderQueryObject;
import cn.wolfcode.crm.service.IOrderofcontractService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("orderofcontract")
public class OrderofcontractController {

    @Autowired
    IOrderofcontractService orderofcontractService;

    @RequestMapping("list")
    @ResponseBody
    public List<Orderofcontract> list() throws Exception {
        return orderofcontractService.selectAll();
    }

    @RequestMapping("view")
    @RequiresPermissions("orderofcontract:view")
    @PermissionName("订单合同页面")
    public String view() throws Exception {
        return "order/order";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("orderofcontract:query")
    @PermissionName("订单合同列表")
    public PageResult query(OrderQueryObject queryObject) throws Exception {
        return orderofcontractService.query(queryObject);
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Orderofcontract orderofcontract) throws Exception {
    	try {
    		Subject currentUser = SecurityUtils.getSubject();
    		Employee principal = (Employee) currentUser.getPrincipal();
    		orderofcontract.setEmployeeSeller(principal);
            if (orderofcontract.getId() == null) {
             	orderofcontractService.insert(orderofcontract);
            } else {
             	orderofcontractService.updateByPrimaryKey(orderofcontract);
            }
            return new JsonResult();
        } catch (Exception e) {
        	e.printStackTrace();
            return new JsonResult(false, "保存失败");
        }
    }
    
    //按钮状态改变
    @RequestMapping("changeState")
    @ResponseBody
    public void changeState(Long id,Byte status) throws Exception {
    	orderofcontractService.changeState(id,status);
    }
}
