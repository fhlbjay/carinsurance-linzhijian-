package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Checkingin;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface CheckinginMapper {
    int insert(Checkingin record);

    int back(Checkingin record);

    int updata(Checkingin record);

    //查询
    int queryCount(QueryObject queryObject);

    List<Checkingin> queryList(QueryObject queryObject);
}