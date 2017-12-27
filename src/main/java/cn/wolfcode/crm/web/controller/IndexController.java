package cn.wolfcode.crm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping("index")
    public String index() throws Exception {
        return "index";
    }

    @RequestMapping("login")
    public String login() throws Exception {
        return "forward:/login.jsp";
    }

    /*@RequestMapping("logout")
    public String logout(HttpServletRequest request)throws Exception{
        request.getSession().invalidate();
        return "redirect:/login.jsp";
    }*/

}
