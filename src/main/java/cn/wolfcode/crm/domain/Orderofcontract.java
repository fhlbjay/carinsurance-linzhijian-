package cn.wolfcode.crm.domain;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Orderofcontract extends BaseDomain {

    private static final long serialVersionUID = 4611540259617513415L;
    //签订时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date signtime;
    //总金额
    private BigDecimal totalsum;
    //定金金额
    private BigDecimal sum;
    private String clientorder;
    //摘要
    private String intro;
    //创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date creatatime;
    //签到时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date modifytime;
    //状态
    private Byte status = 0;
    private String sn;
    //合同金额
    private Long money;
    //付款金额
    private Date paytime;
    //附件
    private String file;
    //销售人员
    private Employee employeeSeller;
    //最近修改人
//    private Employee employeeModifuser;


}