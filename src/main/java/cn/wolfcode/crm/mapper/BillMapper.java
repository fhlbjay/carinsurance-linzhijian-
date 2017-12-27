package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Approval;
import cn.wolfcode.crm.domain.Bill;
import cn.wolfcode.crm.domain.TaxAndIns;
import cn.wolfcode.crm.query.BillQueryObject;

import java.util.List;

public interface BillMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Bill record);

    Bill selectByPrimaryKey(Long id);

    List<Bill> selectAll();

    int updateByPrimaryKey(Bill record);

    int queryCount(BillQueryObject queryObject);

    List<Bill> queryList(BillQueryObject queryObject);

    void tax(TaxAndIns taxAndIns);

    void app(Approval approval);
    //批改通过
    void audit(Bill bill);

    //退回
    void back(Bill bill);

}