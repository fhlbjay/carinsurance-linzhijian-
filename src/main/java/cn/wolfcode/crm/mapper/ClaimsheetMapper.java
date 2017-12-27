package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Claimsheet;

import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface ClaimsheetMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Claimsheet record);

    Claimsheet selectByPrimaryKey(Long id);

    List<Claimsheet> selectAll();

    int updateByPrimaryKey(Claimsheet record);


    int queryCount(QueryObject queryObject);

    List<Claimsheet> queryList(QueryObject queryObject);

    void changeStatus(Long id);


    void changeStatus1(Long id);
    void changeStatus2(Long id);
}