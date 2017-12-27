package cn.wolfcode.crm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wolfcode.crm.mapper.FormsMapper;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IFormsService;

import java.util.List;
import java.util.Map;


@Service
public class FormsServiceImpl implements IFormsService {
    @Autowired
    private FormsMapper mapper;


    //销售报表
    @Override
    public List<Map<String, Object>> saleChart(QueryObject queryObject) {
        return mapper.saleChart(queryObject);
    }

    
}
