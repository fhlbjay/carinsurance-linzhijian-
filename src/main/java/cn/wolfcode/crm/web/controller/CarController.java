package cn.wolfcode.crm.web.controller;

import cn.wolfcode.crm.domain.Car;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.CarQueryObject;
import cn.wolfcode.crm.service.ICarService;
import cn.wolfcode.crm.util.JsonResult;
import cn.wolfcode.crm.util.PermissionName;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("car")
public class CarController {

    @Autowired
    ICarService carService;

    @RequestMapping("view")
    @RequiresPermissions("car:view")
    @PermissionName("车辆查询")
    public String view() throws Exception {
        return "car/car";
    }

    @RequestMapping("query")
    @ResponseBody
    @RequiresPermissions("car:query")
    @PermissionName("车辆列表")
    public PageResult query(CarQueryObject queryObject) throws Exception {
        return carService.query(queryObject);
    }

    @RequestMapping("saveOrUpdate")
    @ResponseBody
    @RequiresPermissions("car:saveOrUpdate")
    @PermissionName("车辆编辑")
    public JsonResult saveOrUpdate(Car car) throws Exception {
        try {
            if (car.getId() == null) {
                carService.insert(car);
            } else {
                carService.updateByPrimaryKey(car);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult(false, "保存失败");
        }
    }
}
