package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.domain.Role;
import cn.wolfcode.crm.mapper.EmployeeMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IEmployeeService;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class EmployeeServiceImpl implements IEmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Employee record) {
        SimpleHash simpleHash = new SimpleHash("sha", record.getPassword(), record.getUsername(), 2);
        record.setPassword(simpleHash.toString());
        employeeMapper.insert(record);
        for (Role role : record.getRoles()) {
            employeeMapper.insertRelation(record.getId(), role.getId());
        }
    }

    @Override
    public Employee selectByPrimaryKey(Long id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Employee> selectAll() {
        return employeeMapper.selectAll();
    }

    @Override
    public void updateByPrimaryKey(Employee record) {
        employeeMapper.deleteRelationByEmployeeId(record.getId());
        employeeMapper.updateByPrimaryKey(record);
        for (Role role : record.getRoles()) {
            employeeMapper.insertRelation(record.getId(), role.getId());
        }
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = employeeMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, employeeMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

    @Override
    public void changeState(Long id) {
        employeeMapper.changeState(id);
    }

    @Override
    public Employee selectByUsername(String username) {
        return employeeMapper.selectByUsername(username);
    }
}
