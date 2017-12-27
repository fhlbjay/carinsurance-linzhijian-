package cn.wolfcode.crm.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class JsonResult {
    private boolean flag;
    private String msg;

    public JsonResult() {
        this.flag = true;
    }
}
