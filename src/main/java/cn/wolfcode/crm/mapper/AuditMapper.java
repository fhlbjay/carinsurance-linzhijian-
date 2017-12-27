package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Audit;
import java.util.List;

public interface AuditMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Audit record);

    Audit selectByPrimaryKey(Long id);

    List<Audit> selectAll();

    int updateByPrimaryKey(Audit record);
}