package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Company;
import cn.wolfcode.crm.mapper.CompanyMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.ICompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class CompanyServiceImpl implements ICompanyService {

    @Autowired
    CompanyMapper companyMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return companyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Company record) {
        return companyMapper.insert(record);
    }

    @Override
    public Company selectByPrimaryKey(Long id) {
        return companyMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Company> selectAll() {
        return companyMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Company record) {
        return companyMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = companyMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, companyMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

    @Override
    public void changeState(Long id) {
        companyMapper.changeState(id);
    }

}
