package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Bill;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.BillQueryObject;

import java.util.List;

public interface IBillSerivce {
    void deleteByPrimaryKey(Long id);

    void insert(Bill record);

    Bill selectByPrimaryKey(Long id);

    List<Bill> selectAll();

    void updateByPrimaryKey(Bill record);

    PageResult query(BillQueryObject queryObject);

    void audit(Bill bill);

    //通过审核
    void pass(Bill bill);

    //退回
    void back(Bill bill);

    void refuse(Bill bill);

}
