package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Wages;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.query.WagesQueryObject;
import cn.wolfcode.crm.service.IEmployeeService;
import cn.wolfcode.crm.service.IWagesService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("wages")
public class WagesController {

    @Autowired
    IWagesService wagesService;
    @Autowired
    IEmployeeService employeeService;
    @RequestMapping("list")
    @ResponseBody
    public List<Wages> list() throws Exception {
        return wagesService.selectAll();
    }

    @RequestMapping("view")
    @RequiresPermissions("wages:view")
    @PermissionName("薪资列表")
    public String view() throws Exception {
        return "wages/wages";
    }
    @RequestMapping("query")
    @ResponseBody
    public PageResult query(WagesQueryObject queryObject) throws Exception {
        return wagesService.query(queryObject);
    }

    @RequestMapping("selectAll")
    @ResponseBody
    public List<Wages> selectAll(QueryObject queryObject) throws Exception {
        return wagesService.selectAll();
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Wages wages) throws Exception {
        try {
            if (wages.getId() == null) {
                wagesService.insert(wages);
            } else {
                wagesService.updateByPrimaryKey(wages);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }
    //上传工资单的方法
    @RequestMapping("import")
    @ResponseBody
    @RequiresPermissions("wages:importXls")
    @PermissionName("薪资导入")
    //执行这个方法 后面加一个参数 传递过来的文件
    public void importXls(MultipartFile file) throws Exception{
        //读取传过俩的文件
        Workbook workbook = Workbook.getWorkbook(file.getInputStream());
        //读取某个工薄
        Sheet sheet = workbook.getSheet(0);//第0个
        //获取总行数
        int rows = sheet.getRows();
        //每一循环每一行
        for (int i=1;i<rows;i++){
            Wages wages = new Wages();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

            wages.setInputTime(format.parse(sheet.getCell(0,i).getContents()));//parse 解析一个字符串为时间格式
            wages.setOutputTime(format.parse(sheet.getCell(1,i).getContents()));
            wages.setSalary(new BigDecimal(sheet.getCell(2,i).getContents()));
            wages.setEmployee(employeeService.selectByPrimaryKey(Long.valueOf(sheet.getCell(3,i).getContents())));
           // wages.getEmployee().setId(Long.valueOf(sheet.getCell(3,i).getContents()));
            //插入到数据库
            wagesService.insert(wages);
        }
        workbook.close();
    }

    //导出的方法
    @RequestMapping("export")
    public void export(HttpServletResponse response) throws  Exception{
        //文件下载的响应头
        response.setHeader("Content-Disposition","attachment;filename=wages.xls");

        //创建xls文件
        WritableWorkbook workbook = Workbook.createWorkbook(response.getOutputStream());
        //创建工作薄
        WritableSheet sheet = workbook.createSheet("day01", 0);
        //添加标题
        sheet.addCell(new Label(0,0,"开始时间"));
        sheet.addCell(new Label(1,0,"结束时间"));
        sheet.addCell(new Label(2,0,"工资"));
        //获取真实的员工数据
        List<Wages> wages = wagesService.selectAll();
        for (int i=0,j=1;i<wages.size();i++,j++){
            //拿到每一个 对象

            Wages wages1 = wages.get(i);
            //if 对象不等于空

            //创建文本单元格
            //Label label = new Label(0, 0, wages1.getInputTime().toString());
            //往工作薄中添加内容
            sheet.addCell(new Label(0, j, wages1.getInputTime().toString()));
            sheet.addCell(new Label(1, j, wages1.getOutputTime().toString()));
            sheet.addCell(new Label(2, j, wages1.getSalary().toString()));
            //sheet.addCell(new Label(3, i, wages1.getEmployee().getUsername()));
        }

       /* //创建文本单元格
        Label label = new Label(0, 0, "java");
        //往工作薄中添加内容
        sheet.addCell(label);
        //创建时间单元格
        DateTime dateTime = new DateTime(0,1,new Date());
        //往工作本中添加内容
        sheet.addCell(dateTime);*/
        workbook.write();
        //关闭资源
        workbook.close();

    }
}
