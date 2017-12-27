package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class Bill extends BaseDomain {
    //退回
    public static final Byte STATUS_BACK = -1;
    //暂存
    public static final Byte STATUS_SAVE = 0;
    //批改
    public static final Byte STATUS_CHECK = 1;
    //核保
    public static final Byte STATUS_AUDIT = 2;
    //通过
    public static final Byte STATUS_ORDER = 3;

    private static final long serialVersionUID = 1961743740457386176L;

    private Byte status;

    //投保人
    private Client applicant;

    //被保人
    private Client recognizee;

    //总金额
    private BigDecimal totalamount;

    //商品
    private Product product;

    //车辆
    private Car car;

    //基本信息明细
    private BasicBill basicBill;

    //保险信息
    private TaxAndIns taxAndIns;

    //保单批文
    private Approval approval;

    //缴费状态
    private Byte pay;

    //审核信息
    private Audit audit;


}