package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Wages;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface WagesMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Wages record);

    Wages selectByPrimaryKey(Long id);

    List<Wages> selectAll();

    int updateByPrimaryKey(Wages record);

    int queryCount(QueryObject queryObject);

    List<Wages> queryList(QueryObject queryObject);
}