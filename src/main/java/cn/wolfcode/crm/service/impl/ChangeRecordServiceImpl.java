package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.ChangeRecord;
import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.mapper.ChangeRecordMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IChangeRecordService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Date;
import java.util.List;

@Service
public class ChangeRecordServiceImpl implements IChangeRecordService {

    @Autowired
    ChangeRecordMapper changeRecordMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return changeRecordMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(ChangeRecord record) {
        return changeRecordMapper.insert(record);
    }

    @Override
    public ChangeRecord selectByPrimaryKey(Long id) {
        return changeRecordMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<ChangeRecord> selectAll() {
        return changeRecordMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(ChangeRecord record) {
        return changeRecordMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = changeRecordMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, changeRecordMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }


}
