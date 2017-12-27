package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.ChangeRecord;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IChangeRecordService {

    int deleteByPrimaryKey(Long id);

    int insert(ChangeRecord record);

    ChangeRecord selectByPrimaryKey(Long id);

    List<ChangeRecord> selectAll();

    int updateByPrimaryKey(ChangeRecord record);

    PageResult query(QueryObject queryObject);

}
