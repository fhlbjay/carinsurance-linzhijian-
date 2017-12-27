package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.query.QueryObject;

import java.util.List;
import java.util.Map;

public interface ClientReportMapper {
    /**
     * 正式客户新增报表
     *
     * @param queryObject 高级查询语句条件
     * @return 将查询出来的数据封装到map 里面 返回多条数据
     */

    List<Map<String,Object>> formalClient(QueryObject queryObject);

    List<String> selectGroupingName();
}
