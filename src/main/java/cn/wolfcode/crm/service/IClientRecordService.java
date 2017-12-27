package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.ClientRecord;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IClientRecordService {
    int deleteByPrimaryKey(Long id);

    int insert(ClientRecord record);

    ClientRecord selectByPrimaryKey(Long id);

    List<ClientRecord> selectAll();

    int updateByPrimaryKey(ClientRecord record);

    PageResult query(QueryObject queryObject);

}
