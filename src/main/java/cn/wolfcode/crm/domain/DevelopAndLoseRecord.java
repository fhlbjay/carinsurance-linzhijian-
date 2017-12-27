package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 开发/流失客户记录
 */
@Getter
@Setter
public class DevelopAndLoseRecord extends BaseDomain {

    private static final long serialVersionUID = 7851243424180859288L;
    //日期
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date date;
    //客户
    private Client client;
    //负责人
    private Employee inChargeUser;
    //原因
    private String cause;
    //状态区分
    private Byte status;
}