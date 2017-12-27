package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
public class Guarantee extends BaseDomain {

    private static final long serialVersionUID = 5947478383620611128L;

    private String sn;

    private String productName;

    private String client;//这里本来应是一个已买保险的客户对象
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")//后台到前台使用
    @DateTimeFormat(pattern = "yyyy-MM-dd")//前台到后台存数据的封装
    private Date dueTime;

    private String remark;

    private Boolean status;


}