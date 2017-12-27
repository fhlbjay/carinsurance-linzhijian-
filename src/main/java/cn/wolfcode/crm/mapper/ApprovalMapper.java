package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Approval;
import java.util.List;

public interface ApprovalMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Approval record);

    Approval selectByPrimaryKey(Long id);

    List<Approval> selectAll();

    int updateByPrimaryKey(Approval record);
}