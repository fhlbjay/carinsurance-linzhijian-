package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
public class Client extends BaseDomain {

    private static final long serialVersionUID = 8453065011665748126L;

    private String name;

    private Integer age;

    private Integer gender;

    private String tel;

    private String email;

    private String idCard;

    private String qq;

    private String weChat;

    private DictionaryDetail job;

    private DictionaryDetail salaryLevel;

    private DictionaryDetail customerSource;

    private Employee inChargeUser;

    private Employee inputUser;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date inputTime;

    private Byte status;

    private String address;

}