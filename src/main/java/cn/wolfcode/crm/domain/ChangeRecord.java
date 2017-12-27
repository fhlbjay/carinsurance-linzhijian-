package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 客户移交记录
 */
@Setter
@Getter
public class ChangeRecord extends BaseDomain {

    private static final long serialVersionUID = 8312192889714037254L;
    /**
     * 移交日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date changeDate;
    /**
     * 处理人
     */
    private Employee handler;
    /**
     * 客户
     */
    private Client client;
    /**
     * 原负责人
     */
    private Employee oldMan;
    /**
     * 现负责人
     */
    private Employee newMan;
    /**
     * 原因
     */
    private String cause;

}