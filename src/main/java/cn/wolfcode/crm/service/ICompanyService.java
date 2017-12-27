package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Company;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface ICompanyService {
    
    int deleteByPrimaryKey(Long id);

    int insert(Company record);

    Company selectByPrimaryKey(Long id);

    List<Company> selectAll();

    int updateByPrimaryKey(Company record);

    PageResult query(QueryObject queryObject);

    void changeState(Long id);

}
