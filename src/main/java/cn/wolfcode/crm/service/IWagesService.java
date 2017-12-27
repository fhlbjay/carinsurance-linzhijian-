package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Wages;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IWagesService {
    int deleteByPrimaryKey(Long id);

    int insert(Wages record);

    Wages selectByPrimaryKey(Long id);

    List<Wages> selectAll();

    int updateByPrimaryKey(Wages record);
    PageResult query(QueryObject queryObject);
}
