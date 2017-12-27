package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.DictionaryDetail;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface DictionaryDetailMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DictionaryDetail record);

    DictionaryDetail selectByPrimaryKey(Long id);

    List<DictionaryDetail> selectAll();

    int updateByPrimaryKey(DictionaryDetail record);

    int queryCount(QueryObject queryObject);

    List<DictionaryDetail> queryList(QueryObject queryObject);

    void changeState(Long id);

    List<DictionaryDetail> selectByParentSn(String sn);
}