package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Company;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface CompanyMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Company record);

    Company selectByPrimaryKey(Long id);

    List<Company> selectAll();

    int updateByPrimaryKey(Company record);

    int queryCount(QueryObject queryObject);

    List<Company> queryList(QueryObject queryObject);

    void changeState(Long id);

}