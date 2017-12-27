package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Claimsheet;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IClaimsheetService {
    int deleteByPrimaryKey(Long id);

    int insert(Claimsheet record);

    Claimsheet selectByPrimaryKey(Long id);

    List<Claimsheet> selectAll();

    int updateByPrimaryKey(Claimsheet record);
    PageResult query(QueryObject queryObject);
    //改变状态的方法
    void changeStatus(Long id);

    void changeStatus1(Long id);
    void changeStatus2(Long id);
}
