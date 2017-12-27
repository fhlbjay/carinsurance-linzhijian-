package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.domain.Menu;
import cn.wolfcode.crm.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Menu record);

    Menu selectByPrimaryKey(Long id);

    List<Menu> selectAll();

    int updateByPrimaryKey(Menu record);

    List<Menu> selectByParentId(Long id);

    int queryCount(QueryObject queryObject);

    List<Employee> queryList(QueryObject queryObject);

    List<Menu> listNoParent();

    List<Menu> selectByParentIdAndEmployeeId(@Param("employeeId") Long employeeId,
                                             @Param("parentId") Long parentId,
                                             @Param("admin") boolean admin);
}