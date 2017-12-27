package cn.wolfcode.crm.util;

import cn.wolfcode.crm.domain.Employee;
import cn.wolfcode.crm.domain.SystemLog;
import cn.wolfcode.crm.service.ISystemLogService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

public class SystemLogUtil {

    @Autowired
    private ISystemLogService systemLogService;

    public void writeLog(JoinPoint joinPoint) {
        if (joinPoint.getTarget() instanceof ISystemLogService) {
            return;
        }
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        SystemLog systemLog = new SystemLog();
        Subject subject = SecurityUtils.getSubject();
        systemLog.setOpUser((Employee) subject.getPrincipal());
        systemLog.setOpTime(new Date());
        systemLog.setFunction(className + ":" + methodName);
        systemLog.setOpIp(request.getRemoteAddr());
        systemLog.setParams(className + ":" + methodName);
        systemLogService.insert(systemLog);
    }
}
