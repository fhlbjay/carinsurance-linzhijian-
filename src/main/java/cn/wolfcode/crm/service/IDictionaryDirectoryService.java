package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.DictionaryDirectory;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IDictionaryDirectoryService {
    int deleteByPrimaryKey(Long id);

    int insert(DictionaryDirectory record);

    DictionaryDirectory selectByPrimaryKey(Long id);

    List<DictionaryDirectory> selectAll();

    int updateByPrimaryKey(DictionaryDirectory record);

    PageResult query(QueryObject queryObject);
}
