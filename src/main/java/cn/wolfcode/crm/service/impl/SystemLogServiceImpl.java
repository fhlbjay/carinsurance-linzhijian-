package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.SystemLog;
import cn.wolfcode.crm.mapper.SystemLogMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.ISystemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class SystemLogServiceImpl implements ISystemLogService {

    @Autowired
    SystemLogMapper systemLogMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return systemLogMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SystemLog record) {
        return systemLogMapper.insert(record);
    }

    @Override
    public SystemLog selectByPrimaryKey(Long id) {
        return systemLogMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<SystemLog> selectAll() {
        return systemLogMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(SystemLog record) {
        return systemLogMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = systemLogMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, systemLogMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

}
