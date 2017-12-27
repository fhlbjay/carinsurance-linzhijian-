package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Orderofcontract;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;

import java.util.List;

public interface IOrderofcontractService {
    int deleteByPrimaryKey(Long id);
    int insert(Orderofcontract record);
    Orderofcontract selectByPrimaryKey(Long id);
    List<Orderofcontract> selectAll();
    int updateByPrimaryKey(Orderofcontract record);
    PageResult query(QueryObject queryObject);
    
	void changeState(Long id,Byte status);
	

}
