package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.*;
import cn.wolfcode.crm.mapper.*;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.BillQueryObject;
import cn.wolfcode.crm.service.IBillSerivce;
import cn.wolfcode.crm.util.RandomUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class BillSerivceImpl implements IBillSerivce {

    @Autowired
    private CarMapper carMapper;
    @Autowired
    private BasicBillMapper basicBillMapper;
    @Autowired
    private TaxAndInsMapper taxAndInsMapper;
    @Autowired
    private ApprovalMapper approvalMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private BillMapper billMapper;

    @Autowired
    private AuditMapper auditMapper;

    private static Long BILL_ID = 0L;

    @Override
    public void deleteByPrimaryKey(Long id) {
        //删除主保单
        billMapper.deleteByPrimaryKey(id);
        //删除汽车信息
        carMapper.deleteByBillId(id);
        //删除基本信息
        basicBillMapper.deleteByBillId(id);
        //删除保险信息
        taxAndInsMapper.deleteByBillId(id);

    }

    @Override
    public void insert(Bill record) {
        if (record.getTaxAndIns() == null) {
            //1:先保存主保单
            billMapper.insert(record);
            //2:获取该保单中的车辆信息
            Car car = record.getCar();
            //3:设置改car所属的保单编号
            car.setBill(record);
            //4:存储该car的信息
            carMapper.insert(car);
            //5:获取基本信息
            BasicBill basicBill = record.getBasicBill();
            //6:设置改基本信息所属的保单
            basicBill.setBill(record);
            //设置保单编号
            basicBill.setOdd(RandomUtil.getRandomFileName());
            //7:保存该基本信息
            basicBillMapper.insert(basicBill);
            //8:将car和basicBill的id传入主保单中
            record.setCar(car);
            //9:将basicBill的id传入主保单中
            record.setBasicBill(basicBill);
            //设置该产品的年费
            productMapper.updateYearsAmount(record);
            //10:重新更新该保单的信息
            billMapper.updateByPrimaryKey(record);
            //设置一个常量存放该bill的id
            BILL_ID = record.getId();
        } else {
            //获取明细
            TaxAndIns taxAndIns = record.getTaxAndIns();
            //设置该明细所属的保单
            taxAndIns.setBill(billMapper.selectByPrimaryKey(BILL_ID));
            //存储保险明细表
            taxAndInsMapper.insert(taxAndIns);
            //关联保险明细和保单
            billMapper.tax(taxAndIns);
        }
    }

    @Override
    public Bill selectByPrimaryKey(Long id) {
        return billMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Bill> selectAll() {
        return billMapper.selectAll();
    }

    @Override
    public void updateByPrimaryKey(Bill record) {
        billMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(BillQueryObject queryObject) {
        int count = billMapper.queryCount(queryObject);
        if (count > 0) {
            PageResult result = new PageResult(count, billMapper.queryList(queryObject));
            return result;
        }
        return new PageResult(count, Collections.emptyList());
    }

    //提交审核保单
    @Override
    public void audit(Bill bill) {
        //将该保单的信息设置为待审核
        bill.setStatus(Bill.STATUS_AUDIT);
        billMapper.audit(bill);
//        //存储保单批文上的信息
        Approval approval = bill.getApproval();
        //设置批单号
        approval.setChecknum(RandomUtil.getRandomFileName2());
        approvalMapper.insert(approval);
//        //补全该保单中的信息
        billMapper.app(approval);
        //
    }

    @Override
    public void pass(Bill bill) {
        //将状态设置为未交费
        bill.setPay((byte)1);
        //将该保单的信息设置为已过审核
        bill.setStatus(Bill.STATUS_ORDER);
        //将审核信息添加到审核表中
        Audit audit = bill.getAudit();
        //设置大保单id
        audit.setBill(bill);
        //保存该审核信息
        auditMapper.insert(audit);
        //设置bill中与审核信息的关联
        bill.setAudit(audit);
        billMapper.audit(bill);
    }

    @Override
    public void back(Bill bill) {
        //将状态设置为暂存
        bill.setStatus(Bill.STATUS_SAVE);
        //退回
        billMapper.back(bill);
    }

    @Override
    public void refuse(Bill bill) {
        //将状态设置为拒绝
        bill.setStatus(Bill.STATUS_BACK);
        //将审核信息添加到审核表中
        Audit audit = bill.getAudit();
        //设置保单id
        audit.setBill(bill);
        //保存该审核信息
        auditMapper.insert(audit);
        //设置bill中与审核信息的关联
        bill.setAudit(audit);
        billMapper.audit(bill);
    }
}
