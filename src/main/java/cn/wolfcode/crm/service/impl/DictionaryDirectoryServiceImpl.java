package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.DictionaryDirectory;
import cn.wolfcode.crm.mapper.DictionaryDirectoryMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IDictionaryDirectoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class DictionaryDirectoryServiceImpl implements IDictionaryDirectoryService {

    @Autowired
    DictionaryDirectoryMapper dictionaryDirectoryMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return dictionaryDirectoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(DictionaryDirectory record) {
        return dictionaryDirectoryMapper.insert(record);
    }

    @Override
    public DictionaryDirectory selectByPrimaryKey(Long id) {
        return dictionaryDirectoryMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<DictionaryDirectory> selectAll() {
        return dictionaryDirectoryMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(DictionaryDirectory record) {
        return dictionaryDirectoryMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = dictionaryDirectoryMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, dictionaryDirectoryMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

}
