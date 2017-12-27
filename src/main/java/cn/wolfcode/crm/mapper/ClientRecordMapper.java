package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.ClientRecord;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface ClientRecordMapper {

    int deleteByPrimaryKey(Long id);

    int insert(ClientRecord record);

    ClientRecord selectByPrimaryKey(Long id);

    List<ClientRecord> selectAll();

    int updateByPrimaryKey(ClientRecord record);

    int queryCount(QueryObject queryObject);

    List<ClientRecord> queryList(QueryObject queryObject);
}