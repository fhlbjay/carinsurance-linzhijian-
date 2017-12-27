package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.DevelopAndLoseRecord;
import cn.wolfcode.crm.query.ClientQueryObject;

import java.util.List;

public interface DevelopAndLoseRecordMapper {

    int deleteByPrimaryKey(Long id);

    int insert(DevelopAndLoseRecord record);

    DevelopAndLoseRecord selectByPrimaryKey(Long id);

    List<DevelopAndLoseRecord> selectAll();

    int updateByPrimaryKey(DevelopAndLoseRecord record);

    int queryCount(ClientQueryObject qo);

    List<DevelopAndLoseRecord> queryList(ClientQueryObject qo);
}