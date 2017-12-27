package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Car;
import cn.wolfcode.crm.mapper.CarMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class CarServiceImpl implements ICarService {

    @Autowired
    CarMapper carMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return carMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Car record) {
        return carMapper.insert(record);
    }

    @Override
    public Car selectByPrimaryKey(Long id) {
        return carMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Car> selectAll() {
        return carMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Car record) {
        return carMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = carMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, carMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

}
