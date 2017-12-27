$(function () {
    var audit_datagrid = $("#audit_datagrid");
    var audit_dialog = $("#audit_dialog");
    var audit_form = $("#form");

    var onData = {
        look: function edit() {
            var selected = audit_datagrid.datagrid("getSelected");
            if (selected) {
                console.log(selected)
                //设置批文信息
                $("#approval_bill_id").textbox("setValue", selected.id);
                $("#auditCause").textbox("setValue", selected.approval.cause);
                $("#auditBiginDate").textbox("setValue", selected.approval.checkbegindate);
                $("#auditEndDate").textbox("setValue", selected.approval.checkenddate);
                $("#checkNum").textbox("setValue", selected.approval.checknum);
                $("#auditAppDate").textbox("setValue", selected.approval.checkappdate);
                $("#auditWord").textbox("setValue", selected.approval.checkword);
                $("#auditCompare").textbox("setValue", selected.approval.checkcompare);
                $("#checkNum2").textbox("setValue", selected.approval.checknum);
                $("#odd3").textbox("setValue", selected.basicBill.odd);
                $("#auditId").textbox("setValue", selected.id);
                $("#applicantId").textbox("setValue", selected.applicant.id);
                $("#applicantName").textbox("setValue", selected.applicant.name);
                $("#applicantIdCard").textbox("setValue", selected.applicant.idCard);
                $("#address").textbox("setValue", selected.applicant.address);
                $("#applicantTel").textbox("setValue", selected.applicant.tel);
                $("#recognizeeId").textbox("setValue", selected.recognizee.id);
                $("#recognizeeName").textbox("setValue", selected.recognizee.name);
                $("#recognizeeIdCard").textbox("setValue", selected.recognizee.idCard);
                $("#recognizeeTel").textbox("setValue", selected.recognizee.tel);
                //车辆信息
                $("#carBrand").textbox("setValue", selected.car.carBrand.name);
                $("#carBrandId").textbox("setValue", selected.car.carBrand.id);
                $("#carId").textbox("setValue", selected.car.id);
                $("#carplateNumber").textbox("setValue", selected.car.carNumber);
                $("#valuation").textbox("setValue", selected.car.valuation);
                $("#carType").textbox("setValue", selected.car.type);
                $("#carSize").textbox("setValue", selected.car.size);
                //基本信息
                $("#basicBillId").textbox("setValue", selected.basicBill.id);
                $("#beginDate").datebox("setValue", selected.basicBill.beginDate);
                $("#endDate").datebox("setValue", selected.basicBill.endDate);
                $("#applyDate").datebox("setValue", selected.basicBill.inputDate);
                $("#odd").textbox("setValue", selected.basicBill.odd);
                $("#handle").textbox("setValue", selected.basicBill.handle);
                $("#arbitrament").textbox("setValue", selected.basicBill.arbitrament);
                $("#businessSource").textbox("setValue", selected.basicBill.businessSource);
                $("#inputUser").textbox("setValue", selected.recognizee.inChargeUser.username);
                $("#inputUserId").textbox("setValue", selected.recognizee.inChargeUser.id);
                $("#payWay").textbox("setValue", selected.basicBill.payWay);
                $("#appoint").textbox("setValue", selected.basicBill.appoint);
                $("#channel").textbox("setValue", selected.basicBill.channel);
                //批单信息
                $("#billId").textbox("setValue", selected.basicBill.odd);
                $("#appUser").textbox("setValue", selected.applicant.name);
                $("#appUser_id").textbox("setValue", selected.applicant.id);
                $("#applicant_id").textbox("setValue", selected.applicant.id);
                //保单金额
                $("#productName").textbox("setValue", selected.product.name);
                $("#amount").textbox("setValue", selected.product.amount);
                $("#totalAmount").textbox("setValue", selected.totalamount);
                $("#yearsAmount").textbox("setValue", selected.product.yearsAmount);
                $("#companyName").textbox("setValue", selected.product.company.name);
                $("#companyId").textbox("setValue", selected.product.company.id);

            } else {
                $.messager.alert("温馨提示", "请选择要审核的保单", "info");
                return;
            }
            audit_dialog.dialog("setTitle", "保单审核").dialog("open");
        },
        cancel: function cancel() {
            audit_dialog.dialog("close");
        },
        pass: function () {
            var selected = audit_datagrid.datagrid("getSelected");
            if (selected) {
                $("#auditId").textbox("setValue", selected.id);
                $.messager.confirm('温馨提示', '您确定要通过该申请吗？', function (r) {
                    if (r) {
                        //发送请求,将状改为已通过申请
                        $("#auditform").form('submit', {
                            url: "/bill/passBill.do",
                            success: function (data) {
                                $.messager.alert("温馨提示", "操作成功", "info");
                            }
                        });
                    }
                });
            } else {
                $.messager.alert("温馨提示", "请选择要审核的保单", "info");
                return;
            }
        }, refuse: function () {
            var selected = audit_datagrid.datagrid("getSelected");
            if (selected) {
                $("#auditId").textbox("setValue", selected.id);
                $.messager.confirm('温馨提示', '您确定要拒绝该申请吗？', function (r) {
                    if (r) {
                        //发送请求,将状改为已通过申请
                        $("#auditform").form('submit', {
                            url: "/bill/refuse.do",
                            success: function (data) {
                                $.messager.alert("温馨提示", "操作成功", "info");
                            }
                        });
                    }
                });
            } else {
                $.messager.alert("温馨提示", "请选择要拒绝的保单", "info");
                return;
            }
        },
        searchS: function searchS() {
            audit_datagrid.datagrid("load", {
                comId: $("#comId").combobox("getValue"),
                proId2: $("#productId2").combobox("getValue"),
                proId3: $("#productId3").combobox("getValue"),
                beginDate: $("#beginDate2").datebox("getValue"),
                endDate: $("#endDate2").datebox("getValue"),
                odd: $("#odd2").textbox("getValue"),
                carNumber: $("#Number").textbox("getValue"),
                appId: $("#appId").textbox("getValue"),
                idNumber: $("#idNum").textbox("getValue"),
            });
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });


    audit_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/bill/audit.do',
        singleSelect: true,
        pagination: true,
        columns: [[
            {field: 'id', hidden: true},
            {
                field: 'basicBill', title: '保单号', width: 100, formatter: function (value, row, index) {
                    console.log(row)
                return value ? value.odd : "";
            }
            },
            {
                field: 'product', title: '产品', width: 100, formatter: function (value, row, index) {
                return value ? value.name : "";
            }
            },
            {
                field: 'applicant', title: '投保人', width: 100, formatter: function (value, row, index) {
                return value ? value.name : "";
            }
            },
            {
                field: 'car', title: '车牌号', width: 100, formatter: function (value, row, index) {
                return value ? value.carNumber : "";
            }
            },
            {
                field: 'basicBill2', title: '投保申请日期', width: 100, formatter: function (value, row, index) {
                return row.basicBill ? row.basicBill.inputDate : "";
            }
            },
            {
                field: 'status', title: '状态', width: 100, formatter: function (value, row, index) {
                if (value == -1) {
                    return "<font color='red'>拒保</font>"
                } else if (value == 1) {
                    return "待批改"
                } else if (value == 2) {
                    return "待审核"
                } else if (value == 3) {
                    return "<font color='green'>已通过</font>"
                } else {
                    return "暂存"
                }
            }
            },
            {
                field: 'totalamount', title: '保费合计', width: 100, formatter: function (value, row, index) {
                return value ? value : "";
            }
            },
        ]],
        toolbar: '#audit_toolbar',
        striped: true,
        rownumbers: true
        // onClickRow: function (index, row) {
        //     var selected = audit_datagrid.datagrid("getSelected");
        // }
    });

    audit_dialog.dialog({
        title: "保单批改",
        closed: true,
        modal: true,
        width: 700,
        height: 400,
        buttons: "#emp_buttons"
    });

    $("#comId").combobox({
        url: "/company/list.do",
        valueField: 'id',
        textField: 'name',
    });
    //只要正式客户
    $("#appId").combobox({
        url: "/client/list.do",
        valueField: 'id',
        textField: 'name',
    });
    $("#auditorid").combobox({
        url: "/employee/list.do",
        valueField: 'id',
        textField: 'username',
    });


    $("#accord1 input").prop("readonly", true);
    $("#accord2 input").prop("readonly", true);
    $("#accord3 input").prop("readonly", true);
    $("#accord4 input").prop("readonly", true);
    $("#accord5 input").prop("readonly", true);
    $("#accord6 input").prop("readonly", true);

});
