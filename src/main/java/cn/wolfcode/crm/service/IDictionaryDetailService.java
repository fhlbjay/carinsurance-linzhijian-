package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.DictionaryDetail;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IDictionaryDetailService {
    int deleteByPrimaryKey(Long id);

    int insert(DictionaryDetail record);

    DictionaryDetail selectByPrimaryKey(Long id);

    List<DictionaryDetail> selectAll();

    int updateByPrimaryKey(DictionaryDetail record);

    PageResult query(QueryObject queryObject);

    void changeState(Long id);

    List<DictionaryDetail> selectByParentSn(String sn);
}
