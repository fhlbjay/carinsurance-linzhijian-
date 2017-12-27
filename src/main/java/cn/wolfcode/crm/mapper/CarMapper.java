package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Car;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface CarMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Car record);

    Car selectByPrimaryKey(Long id);

    List<Car> selectAll();

    int updateByPrimaryKey(Car record);

    int queryCount(QueryObject queryObject);

    List<Car> queryList(QueryObject queryObject);

    Car selectByBillId(Long billId);

    void deleteByBillId(Long id);
}