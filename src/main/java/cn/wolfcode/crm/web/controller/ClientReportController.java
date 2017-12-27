package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.query.ClientReportQueryObject;
import cn.wolfcode.crm.service.IClientReportService;
import cn.wolfcode.crm.util.PermissionName;
import com.alibaba.fastjson.JSON;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("clientReport")
public class ClientReportController {
    @Autowired
    IClientReportService clientReportService;


    @RequestMapping("view")
    @RequiresPermissions("clientReport:view")
    @PermissionName("报表查询")
    public String view() throws Exception {
        return "clientReport/clientReport";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("clientReport:formalClient")
    @PermissionName("报表列表")
    public List<Map<String,Object>> formalClient( ClientReportQueryObject queryObject){
        List<Map<String, Object>> client = clientReportService.formalClient(queryObject);

        return client;
    }

    //柱状报表 页面跳转
    @RequestMapping("clientReportByBar")//clientReportByBar
    public String clientReportByBar(Model model, ClientReportQueryObject queryObject){
        List<String> list = clientReportService.selectGroupingName();
        System.out.println(list);
        //存放所有查询条件的
        List<String> groupByNames = new ArrayList<>();
        //存放所有总个数的集合
        List<String> totalNumbers = new ArrayList<>();


        for (String year:list){
            groupByNames.add(year);
            //totalNumbers.add();
        }
        model.addAttribute("groupByNames", JSON.toJSONString(groupByNames));
        return "clientReport/clientReportByBar";
    }


}
