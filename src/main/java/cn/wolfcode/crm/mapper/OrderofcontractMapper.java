package cn.wolfcode.crm.mapper;
import cn.wolfcode.crm.domain.Orderofcontract;
import cn.wolfcode.crm.query.QueryObject;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OrderofcontractMapper {
    int deleteByPrimaryKey(Long id);
    int insert(Orderofcontract record);
    Orderofcontract selectByPrimaryKey(Long id);
    List<Orderofcontract> selectAll();
    int updateByPrimaryKey(Orderofcontract record);
    
    int queryCount(QueryObject queryObject);
    List<Orderofcontract> queryList(QueryObject queryObject);
    
    void changeState(@Param("id")Long id,@Param("status")Byte status);
    
}