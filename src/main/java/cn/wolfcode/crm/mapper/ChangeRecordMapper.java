package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.ChangeRecord;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface ChangeRecordMapper {

    int deleteByPrimaryKey(Long id);

    int insert(ChangeRecord record);

    ChangeRecord selectByPrimaryKey(Long id);

    List<ChangeRecord> selectAll();

    int updateByPrimaryKey(ChangeRecord record);

    int queryCount(QueryObject queryObject);

    List<ChangeRecord> queryList(QueryObject queryObject);

}