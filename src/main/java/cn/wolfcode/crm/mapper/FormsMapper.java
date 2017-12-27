package cn.wolfcode.crm.mapper;

import java.util.List;
import java.util.Map;

import cn.wolfcode.crm.query.QueryObject;

/**
 * Created by Administrator on 2017/10/26 0026.
 */
public interface FormsMapper {
	
    List<Map<String, Object>> saleChart(QueryObject queryObject);

    
}
