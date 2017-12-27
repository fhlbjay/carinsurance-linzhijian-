package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
public class Audit extends BaseDomain {

    private static final long serialVersionUID = -5453266316671011248L;

    private Employee auditor;

    private String auditcause;

    private String odd;

    private String checkodd;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date auditdate;

    private Bill bill;

}