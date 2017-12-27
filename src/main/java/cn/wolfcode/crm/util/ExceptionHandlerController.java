package cn.wolfcode.crm.util;

import org.apache.shiro.authz.AuthorizationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletResponse;

@ControllerAdvice
public class ExceptionHandlerController {

    @ExceptionHandler(AuthorizationException.class)
    public void handler(HttpServletResponse response, HandlerMethod handlerMethod) throws Exception {
        ResponseBody responseBody = handlerMethod.getMethod().getDeclaredAnnotation(ResponseBody.class);
        if (responseBody == null) {
            response.getWriter().print(new JsonResult(false, "没有权限"));
        } else {
            response.sendRedirect("/static/nopermission.jsp");
        }
    }
}
