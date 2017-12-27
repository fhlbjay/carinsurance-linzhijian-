package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
/**
 * 本类是工资类   Wages工资
 */
public class Wages extends BaseDomain {

    private static final long serialVersionUID = -4311944693270731715L;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")//后台到前台使用
    @DateTimeFormat(pattern = "yyyy-MM-dd")//前台到后台存数据的封装
    private Date inputTime;//时间高级查询用到分别根据

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")//后台到前台使用
    @DateTimeFormat(pattern = "yyyy-MM-dd")//前台到后台存数据的封装
    private Date outputTime;//时间高级查询用到分别根据
    private BigDecimal salary;//薪水

    private Employee employee;//对应的员工

}