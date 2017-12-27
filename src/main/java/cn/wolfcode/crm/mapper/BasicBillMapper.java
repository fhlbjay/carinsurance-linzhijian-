package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.BasicBill;
import java.util.List;

public interface BasicBillMapper {

    int deleteByPrimaryKey(Long id);

    int insert(BasicBill record);

    BasicBill selectByPrimaryKey(Long id);

    List<BasicBill> selectAll();

    int updateByPrimaryKey(BasicBill record);

    void deleteByBillId(Long id);
}