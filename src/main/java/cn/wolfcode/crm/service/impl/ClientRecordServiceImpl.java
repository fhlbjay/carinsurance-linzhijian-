package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.ClientRecord;
import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.mapper.ClientRecordMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IClientRecordService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class ClientRecordServiceImpl implements IClientRecordService {

    @Autowired
    ClientRecordMapper clientRecordMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return clientRecordMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(ClientRecord record) {
        Employee principal = (Employee) SecurityUtils.getSubject().getPrincipal();
        record.setInputUser(principal);
        return clientRecordMapper.insert(record);
    }

    @Override
    public ClientRecord selectByPrimaryKey(Long id) {
        return clientRecordMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<ClientRecord> selectAll() {
        return clientRecordMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(ClientRecord record) {
        return clientRecordMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = clientRecordMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, clientRecordMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }


}
