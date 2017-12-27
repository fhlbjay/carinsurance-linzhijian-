package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
public class Claimsheet extends BaseDomain {
    private static final int STATUS_SUBMIT = 0;//已报案状态

    private static final int STATUS_EXAMINE = 1;//已审核状态

    private static final int STATUS_COMPENSATE = 2;//已理赔状态

    private static final int STATUS_RETURN = -1;//已退回状态

    private static final long serialVersionUID = -5959426886631522669L;

    private Integer status = STATUS_SUBMIT;//状态   0提交保   1审核中 2理赔 -1退回

    private String informant;//报案人

    private String tel;//电话

    private String place;//事发地
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date accidentTime;//时间

    private String sn;//单号

    private String carNumber;//车牌号

    private BigDecimal damages;//理赔金额

    private Employee employee;//处理人
}