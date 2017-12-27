package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Wages;
import cn.wolfcode.crm.mapper.WagesMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IWagesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
@Service
public class WagesServiceImpl implements IWagesService{
    @Autowired
    private WagesMapper wagesMapper;

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = wagesMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, wagesMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }
    @Override
    public int deleteByPrimaryKey(Long id) {
        int count = wagesMapper.deleteByPrimaryKey(id);
        return count;
    }

    @Override
    public int insert(Wages record) {
        int insert = wagesMapper.insert(record);

        return insert;
    }


    @Override
    public Wages selectByPrimaryKey(Long id) {
        Wages wages = wagesMapper.selectByPrimaryKey(id);
        return wages;
    }

    @Override
    public List<Wages> selectAll() {

        return wagesMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Wages record) {
        int count = wagesMapper.updateByPrimaryKey(record);
        return count;
    }
}
