package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Guarantee;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface GuaranteeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Guarantee record);

    Guarantee selectByPrimaryKey(Long id);

    List<Guarantee> selectAll();

    int updateByPrimaryKey(Guarantee record);
    int queryCount(QueryObject queryObject);

    List<Guarantee> queryList(QueryObject queryObject);
    void changeStatus(Long id );
}