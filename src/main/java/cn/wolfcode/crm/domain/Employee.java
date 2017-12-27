package cn.wolfcode.crm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
@Setter
public class Employee extends BaseDomain {

    private static final long serialVersionUID = -4958543658732265723L;

    private String username;

    private String realname;

    private String password;

    private String tel;

    private String email;

    private Department department;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date inputtime;

    private boolean state = true;

    private boolean admin;

    private List<Role> roles = new ArrayList<>();
}
