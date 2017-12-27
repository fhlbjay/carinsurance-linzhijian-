package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class SystemLog extends BaseDomain {

    private static final long serialVersionUID = -6654182726791125615L;

    private Employee opUser;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date opTime;

    private String opIp;

    private String function;

    private String params;
}