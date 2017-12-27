package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.DevelopAndLoseRecord;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ClientQueryObject;

import java.util.List;

public interface IDevelopAndLoseRecordService {
    int deleteByPrimaryKey(Long id);

    void insert(DevelopAndLoseRecord record);

    DevelopAndLoseRecord selectByPrimaryKey(Long id);

    List<DevelopAndLoseRecord> selectAll();

    int updateByPrimaryKey(DevelopAndLoseRecord record);

    PageResult query(ClientQueryObject queryObject);

    PageResult queryOff(ClientQueryObject queryObject);

}
