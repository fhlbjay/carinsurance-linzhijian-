package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.DictionaryDetail;
import cn.wolfcode.crm.mapper.DictionaryDetailMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IDictionaryDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class DictionaryDetailServiceImpl implements IDictionaryDetailService {

    @Autowired
    DictionaryDetailMapper dictionaryDetailMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return dictionaryDetailMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(DictionaryDetail record) {
        return dictionaryDetailMapper.insert(record);
    }

    @Override
    public DictionaryDetail selectByPrimaryKey(Long id) {
        return dictionaryDetailMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<DictionaryDetail> selectAll() {
        return dictionaryDetailMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(DictionaryDetail record) {
        return dictionaryDetailMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = dictionaryDetailMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, dictionaryDetailMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

    @Override
    public void changeState(Long id) {
        dictionaryDetailMapper.changeState(id);
    }

    @Override
    public List<DictionaryDetail> selectByParentSn(String sn) {
        return dictionaryDetailMapper.selectByParentSn(sn);
    }

}
