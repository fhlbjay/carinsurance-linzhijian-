package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Checkingin;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface ICheckinginService {

    int deleteByPrimaryKey(Long id);

    int insert();

    int back(Checkingin record);

    int updata(Checkingin record);

    Checkingin selectByPrimaryKey(Long id);

    List<Checkingin> selectAll();

    int updateByPrimaryKey(Checkingin record);

    PageResult query(QueryObject queryObject);

}
