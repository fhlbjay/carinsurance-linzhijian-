package cn.wolfcode.crm.query;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;


@Getter
@Setter
public class ReportQueryObject extends QueryObject {
    private String keywords;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date beginDate;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date endDate;
    
    private String groupType = "cl.name";
}
