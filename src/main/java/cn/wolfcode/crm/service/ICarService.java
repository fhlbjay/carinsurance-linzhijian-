package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Car;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface ICarService {
    int deleteByPrimaryKey(Long id);

    int insert(Car record);

    Car selectByPrimaryKey(Long id);

    List<Car> selectAll();

    int updateByPrimaryKey(Car record);

    PageResult query(QueryObject queryObject);
}
