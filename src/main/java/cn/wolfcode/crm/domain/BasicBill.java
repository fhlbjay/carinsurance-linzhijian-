package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
/**
 * 明细:基本信息
 */
public class BasicBill extends BaseDomain {

    private static final long serialVersionUID = 4682169323393436728L;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date beginDate;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date endDate;

    /**
     * 新增日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date inputDate;

    /**
     * 订单号
     */
    private String odd;

    /**
     * 争议处理
     */
    private String handle;

    /**
     * 仲裁名称
     */
    private String arbitrament;

    /**
     * 缴费方式
     */
    private Integer payWay;

    /**
     * 业务来源
     */
    private String businessSource;

    /**
     * 渠道
     */
    private String channel;

    /**
     * 业务员
     */
    private Employee inputUser;

    /**
     * 特别约定
     */
    private Integer appoint;


    private Bill bill;

}