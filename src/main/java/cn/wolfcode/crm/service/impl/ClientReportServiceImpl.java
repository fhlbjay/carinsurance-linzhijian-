package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.mapper.ClientReportMapper;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IClientReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class ClientReportServiceImpl implements IClientReportService{
    @Autowired
    ClientReportMapper clientReportMapper;
    @Override
    public List<Map<String, Object>> formalClient(QueryObject queryObject) {
        //报表
        List<Map<String, Object>> formalClient = clientReportMapper.formalClient(queryObject);
        return formalClient;
    }

    @Override
    public List selectGroupingName() {
        List<String> list = clientReportMapper.selectGroupingName();
        return list;
    }
}
