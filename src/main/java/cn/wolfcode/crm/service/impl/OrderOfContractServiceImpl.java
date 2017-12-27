package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Orderofcontract;
import cn.wolfcode.crm.mapper.OrderofcontractMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IOrderofcontractService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class OrderOfContractServiceImpl implements IOrderofcontractService {

    @Autowired
    OrderofcontractMapper orderofcontractMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return orderofcontractMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Orderofcontract record) {
    	
        return orderofcontractMapper.insert(record);
    }

    @Override
    public Orderofcontract selectByPrimaryKey(Long id) {
        return orderofcontractMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Orderofcontract> selectAll() {
        return orderofcontractMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Orderofcontract record) {
        return orderofcontractMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = orderofcontractMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, orderofcontractMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }
    

	@Override
	public void changeState(Long id,Byte status) {
		orderofcontractMapper.changeState(id,status);
		
	}


}
