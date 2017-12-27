package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.DictionaryDirectory;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface DictionaryDirectoryMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DictionaryDirectory record);

    DictionaryDirectory selectByPrimaryKey(Long id);

    List<DictionaryDirectory> selectAll();

    int updateByPrimaryKey(DictionaryDirectory record);

    int queryCount(QueryObject queryObject);

    List<DictionaryDirectory> queryList(QueryObject queryObject);

}