package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IEmployeeService {
    int deleteByPrimaryKey(Long id);

    void insert(Employee record);

    Employee selectByPrimaryKey(Long id);

    List<Employee> selectAll();

    void updateByPrimaryKey(Employee record);

    PageResult query(QueryObject queryObject);

    void changeState(Long id);

    Employee selectByUsername(String username);
}
