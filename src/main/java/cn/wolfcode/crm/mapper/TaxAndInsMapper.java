package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.TaxAndIns;

public interface TaxAndInsMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TaxAndIns record);

    TaxAndIns selectByPrimaryKey(Long id);

    int updateByPrimaryKey(TaxAndIns record);

    void deleteByBillId(Long id);
}