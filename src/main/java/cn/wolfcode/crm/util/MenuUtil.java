package cn.wolfcode.crm.util;

import cn.wolfcode.crm.domain.Menu;
import cn.wolfcode.crm.domain.Permission;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import java.util.Iterator;
import java.util.List;

public class MenuUtil {

    public static void checkMenuPermission(List<Menu> menus) {
        Subject subject = SecurityUtils.getSubject();
        Iterator<Menu> iterator = menus.iterator();
        while (iterator.hasNext()) {
            Menu menu = iterator.next();
            Permission permission = menu.getPermission();
            if (permission != null) {
                boolean hasPermitted = subject.isPermitted(permission.getResource());
                if (!hasPermitted) {
                    iterator.remove();
                    continue;
                }
            }
            if (menu.getChildren().size() > 0) {
                checkMenuPermission(menu.getChildren());
            }
        }
    }
}
