package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.domain.Menu;
import cn.wolfcode.crm.mapper.EmployeeMapper;
import cn.wolfcode.crm.mapper.MenuMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IMenuService;
import cn.wolfcode.crm.util.MenuUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class MenuServiceImpl implements IMenuService {

    @Autowired
    MenuMapper menuMapper;
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return menuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Menu record) {
        menuMapper.insert(record);
    }

    @Override
    public Menu selectByPrimaryKey(Long id) {
        return menuMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Menu> selectAll() {
        return menuMapper.selectAll();
    }

    @Override
    public void updateByPrimaryKey(Menu record) {
        menuMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = menuMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, menuMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

    @Override
    public List<Menu> listNoParent() {
        Session session = SecurityUtils.getSubject().getSession();
        List<Menu> menusInSession = (List<Menu>) session.getAttribute("MENUS_IN_SESSION");
        if (menusInSession == null) {
            List<Menu> menus = menuMapper.listNoParent();
            MenuUtil.checkMenuPermission(menus);
            session.setAttribute("MENUS_IN_SESSION", menus);
            return menus;
        }
        return menusInSession;
    }

    @Override
    public List<Menu> selectByParentIdAndEmployeeId(Long employeeId, Long parentId) {
        Employee employee = employeeMapper.selectByPrimaryKey(employeeId);
        return menuMapper.selectByParentIdAndEmployeeId(employeeId, parentId, employee.isAdmin());
    }

}
