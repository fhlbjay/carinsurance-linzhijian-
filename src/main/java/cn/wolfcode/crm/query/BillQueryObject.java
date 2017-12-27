package cn.wolfcode.crm.query;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
public class BillQueryObject extends QueryObject{

    //承包公司
    private Long comId;
    //产品大类
    private Long proId2;
    //产品
    private Long proId3;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date beginDate;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date endDate;

    //保单号
    private String odd;
    //车牌号
    private String carNumber;
    //投保人
    private Long appId;
    //车牌号
    private String idNumber;
    //状态
    private Byte status;
    //缴费状态
    private Byte pay;
}
