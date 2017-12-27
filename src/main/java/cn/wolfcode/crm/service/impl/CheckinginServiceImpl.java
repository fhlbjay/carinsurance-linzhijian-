package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Checkingin;
import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.mapper.CheckinginMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.ICheckinginService;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class CheckinginServiceImpl implements ICheckinginService {

	@Autowired
	CheckinginMapper checkinginMapper;

	@Override
	public int insert() {
		Checkingin record = new Checkingin();
		// 获取当前对象
		Subject currentUser = SecurityUtils.getSubject();
		Employee principal = (Employee) currentUser.getPrincipal();
		record.setEmpId(principal);
		return checkinginMapper.insert(record);
	}

	@Override
	public int back(Checkingin record) {
		// 获取当前对象
		Subject currentUser = SecurityUtils.getSubject();
		Employee principal = (Employee) currentUser.getPrincipal();
		record.setEmpId(principal);
		return checkinginMapper.back(record);
	}

	@Override
	public int updata(Checkingin record) {
		// 获取当前对象
		Subject currentUser = SecurityUtils.getSubject();
		Employee principal = (Employee) currentUser.getPrincipal();
		record.setEmpId(principal);
		return checkinginMapper.updata(record);
	}

	@Override
	public PageResult query(QueryObject queryObject) {
		int count = checkinginMapper.queryCount(queryObject);
		if (count > 0) {
			return new PageResult(count, checkinginMapper.queryList(queryObject));
		}
		return new PageResult(count, Collections.emptyList());
	}

	@Override
	public int deleteByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Checkingin selectByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Checkingin> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKey(Checkingin record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
