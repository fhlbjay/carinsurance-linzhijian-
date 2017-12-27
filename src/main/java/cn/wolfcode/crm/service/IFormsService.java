package cn.wolfcode.crm.service;
import java.util.List;
import java.util.Map;

import cn.wolfcode.crm.query.QueryObject;

public interface IFormsService {
	
    List<Map<String, Object>> saleChart(QueryObject queryObject);

}
