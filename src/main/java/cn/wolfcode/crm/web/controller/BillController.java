package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Bill;
import cn.wolfcode.crm.domain.TaxAndIns;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.BillQueryObject;
import cn.wolfcode.crm.service.IBillSerivce;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.ModulusUtils;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("bill")
public class BillController {

    @Autowired
    private IBillSerivce billSerivce;

    @RequestMapping("list")
    @ResponseBody
    public List<Bill> list() throws Exception {
        return billSerivce.selectAll();
    }

    @RequestMapping("view")
    @RequiresPermissions("bill:view")
    @PermissionName("所有保单查询")
    public String view() throws Exception {
        return "bill/bill";
    }

    @RequestMapping("orderView")
    @RequiresPermissions("bill:orderView")
    @PermissionName("已过保单查询")
    public String orderView() throws Exception {
        return "bill/orderbill";
    }

    @RequestMapping("add")
    @RequiresPermissions("bill:add")
    @PermissionName("新增投保")
    public String add() throws Exception {
        return "bill/add";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("bill:query")
    @PermissionName("被拒")
    public PageResult query(BillQueryObject queryObject) throws Exception {
        queryObject.setStatus(Bill.STATUS_BACK);
        return billSerivce.query(queryObject);
    }

    @RequestMapping("moment")
    @ResponseBody
    @RequiresPermissions("bill:moment")
    @PermissionName("暂存保单列表")
    public PageResult moment(BillQueryObject queryObject) throws Exception {
        //设置状态为暂存
        queryObject.setStatus(Bill.STATUS_SAVE);
        return billSerivce.query(queryObject);
    }

    @RequestMapping("order")
    @ResponseBody
    @RequiresPermissions("bill:moment")
    @PermissionName("已通过审列表")
    public PageResult order(BillQueryObject queryObject) throws Exception {
        //设置状态为已经过保
        queryObject.setStatus(Bill.STATUS_ORDER);
        return billSerivce.query(queryObject);
    }

    @RequestMapping("audit")
    @ResponseBody
    @RequiresPermissions("bill:audit")
    @PermissionName("待审核保单列表")
    public PageResult audit(BillQueryObject queryObject) throws Exception {
        //设置状态为待审核
        queryObject.setStatus(Bill.STATUS_AUDIT);
        return billSerivce.query(queryObject);
    }

    @RequestMapping("check")
    @ResponseBody
    @RequiresPermissions("bill:check")
    @PermissionName("待批改保单列表")
    public PageResult check(BillQueryObject queryObject) throws Exception {
        //设置状态为待批改
        queryObject.setStatus(Bill.STATUS_CHECK);
        PageResult result = billSerivce.query(queryObject);
        return result;
    }

    @RequestMapping("momentView")
    @RequiresPermissions("bill:momentView")
    @PermissionName("暂存保单列表")
    public String momentView() throws Exception {
        return "bill/momentbill";
    }

    @RequestMapping("auditView")
    @RequiresPermissions("bill:auditView")
    @PermissionName("待审核保单列表")
    public String auditView() throws Exception {
        return "bill/auditbill";
    }

    @RequestMapping("checkView")
    @RequiresPermissions("bill:checkView")
    @PermissionName("待批改保单列表")
    public String checkView() throws Exception {
        return "bill/checkbill";
    }


    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("bill:saveOrUpdate")
    @PermissionName("暂存保单")
    public JsonResult saveOrUpdate(Bill bill) throws Exception {
        //设置保单状态(暂存)
        bill.setStatus(Bill.STATUS_SAVE);
        //暂存保单
        billSerivce.insert(bill);
        return new JsonResult();
    }

    @RequestMapping("checkBill")
    @ResponseBody
    @RequiresPermissions("bill:checkBill")
    @PermissionName("提交批改")
    public JsonResult checkBill(Bill bill) throws Exception {
        //设置保单状态(待批改)
        bill.setStatus(Bill.STATUS_CHECK);
        if (bill.getId() == null) {
            billSerivce.insert(bill);
        } else {
            //提交批改
            billSerivce.updateByPrimaryKey(bill);
        }
        return new JsonResult();
    }


    @RequestMapping("auditBill")
    @ResponseBody
    @RequiresPermissions("bill:auditBill")
    @PermissionName("提交审核")
    public JsonResult audit(Bill bill) throws Exception {
        //将缴费状态设置为0
        bill.setPay((byte) 0);
        billSerivce.audit(bill);
        return new JsonResult();
    }

    @RequestMapping("passBill")
    @ResponseBody
    @RequiresPermissions("bill:auditBill")
    @PermissionName("通过审核")
    public JsonResult pass(Bill bill) throws Exception {
        billSerivce.pass(bill);
        return new JsonResult();
    }

    //返回交强险的三个数据
    @RequestMapping("taxAndIns")
    @ResponseBody
    @RequiresPermissions("bill:taxAndIns")
    public TaxAndIns taxAndIns(Bill bill) throws Exception {
        return ModulusUtils.checkTaxAndIns(bill.getTaxAndIns());
    }

    //删除暂存单
    @RequestMapping("delete")
    @ResponseBody
    @RequiresPermissions("bill:delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            billSerivce.deleteByPrimaryKey(id);
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "删除失败");
        }
    }
    //退回暂存单
    @RequestMapping("back")
    @ResponseBody
    @RequiresPermissions("bill:delete")
    public JsonResult back(Bill bill) throws Exception {
        try {
            billSerivce.back(bill);
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "退回失败");
        }
    }
    //拒绝该保单
    @RequestMapping("refuse")
    @ResponseBody
    @RequiresPermissions("bill:delete")
    public JsonResult refuse(Bill bill) throws Exception {
        try {
            billSerivce.refuse(bill);
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "退回失败");
        }
    }


}
