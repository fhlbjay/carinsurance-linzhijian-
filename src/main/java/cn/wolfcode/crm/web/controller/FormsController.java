package cn.wolfcode.crm.web.controller;
import com.alibaba.fastjson.JSON;
import cn.wolfcode.crm.query.ReportQueryObject;
import cn.wolfcode.crm.service.IFormsService;
import cn.wolfcode.crm.util.PermissionName;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("chart")
public class FormsController {

    @Autowired
    private IFormsService service;

    //销售报表

    @RequestMapping("view")
    @RequiresPermissions("forms:view")
    @PermissionName("报表页面")
    public String view() {
        return "/forms/forms";
    }

    @RequestMapping("list")
    @ResponseBody
    public List<Map<String,Object>> list(ReportQueryObject qo) {
        return service.saleChart(qo);
    }


    //柱形图
    @RequestMapping("listbyline")
    @ResponseBody
    public ModelAndView listByLine(ReportQueryObject qo, HttpServletRequest request) {
        ArrayList<Object> groupTypeList = new ArrayList<>();
        ArrayList<Object> totalCountList = new ArrayList<>();
        List<Map<String, Object>> maps = service.saleChart(qo);
        for (Map<String, Object> map : maps) {
            groupTypeList.add(map.get("groupType"));
            totalCountList.add(map.get("totalCount"));
        }
        if ("date_format(ip.beginDate,'%Y-%m')".equals(qo.getGroupType())) {
            request.setAttribute("groupType", "销售日期(月)");
        }else if ("date_format(ip.beginDate,'%Y-%m-%d')".equals(qo.getGroupType())) {
            request.setAttribute("groupType", "销售日期(日)");
        }
        request.setAttribute("groupTypeList", JSON.toJSONString(groupTypeList));
        request.setAttribute("totalCountList", JSON.toJSONString(totalCountList));
        return new ModelAndView("/forms/salechartbyline");
    }

  //饼图
    @RequestMapping("listbypie")
    @ResponseBody
    public ModelAndView listByPie(ReportQueryObject qo, HttpServletRequest request) {
        List<Map<String, Object>> groupList = new ArrayList<>();
        List<Map<String, Object>> mapList = service.saleChart(qo);
        for (Map<String, Object> item : mapList) {
            Map<String,Object> map = new HashMap<>();
            map.put("name", item.get("groupType"));
            map.put("value", item.get("totalCount"));
            groupList.add(map);
        }

        if ("date_format(ip.beginDate,'%Y-%m')".equals(qo.getGroupType())) {
            request.setAttribute("groupType", "销售日期(月)");
        }else if ("date_format(ip.beginDate,'%Y-%m-%d')".equals(qo.getGroupType())) {
            request.setAttribute("groupType", "销售日期(日)");
        }
        request.setAttribute("groupList", JSON.toJSONString(groupList));
        return new ModelAndView("/forms/salechartbypie");
    }
}
