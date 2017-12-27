package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 正式客户跟进记录
 * 潜在客户开发记录
 */
@Getter
@Setter
public class ClientRecord extends BaseDomain {

    private static final long serialVersionUID = 46493143985422010L;
    //结果
    private String result;
    //跟进/计划日期
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date date;
    //创建人
    private Employee inputUser;
    //客户
    private Client client;
    //主题
    private String theme;
    //实施方式(来自数据字典)
    private DictionaryDetail way;
    //详情
    private String details;
    //备注
    private String remark;
    //状态区分(true为正式,false为潜在)
    private boolean status;
}