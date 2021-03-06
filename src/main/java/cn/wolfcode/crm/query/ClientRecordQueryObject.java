package cn.wolfcode.crm.query;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
public class ClientRecordQueryObject extends QueryObject{

    private String inputUser;

    private String client;

    private Long wayId;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date beginDate;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date endDate;

    private boolean status;
}
