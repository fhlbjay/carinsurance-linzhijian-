package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Guarantee;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IGuaranteeService {
    int deleteByPrimaryKey(Long id);

    int insert(Guarantee record);

    Guarantee selectByPrimaryKey(Long id);

    List<Guarantee> selectAll();

    int updateByPrimaryKey(Guarantee record);
    PageResult query(QueryObject queryObject);
    //改变状态的方法
    void changeStatus(Long id);
}
