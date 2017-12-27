$(function () {
    var bill_datagrid = $("#bill_datagrid");
    var bill_dialog = $("#bill_dialog");
    var bill_form = $("#form");

    var onData = {
        editOrLook: function edit() {
            var selected = bill_datagrid.datagrid("getSelected");
            if (selected) {
                console.log(selected)
                $("#auditCause").textbox("setValue", selected.approval.cause);
                $("#auditBiginDate").textbox("setValue", selected.approval.checkbegindate);
                $("#auditEndDate").textbox("setValue", selected.approval.checkenddate);
                $("#checkNum").textbox("setValue", selected.approval.checknum);
                $("#auditAppDate").textbox("setValue", selected.approval.checkappdate);
                $("#auditWord").textbox("setValue", selected.approval.checkword);
                $("#auditCompare").textbox("setValue", selected.approval.checkcompare);
                $("#checkNum2").textbox("setValue",selected.approval.checknum);
                $("#billId2").textbox("setValue", selected.basicBill.odd);
                $("#appUser").textbox("setValue", selected.applicant.name);
                $("#applicantId").val(selected.id);
                $("#applicantId").textbox("setValue",selected.applicant.id);
                $("#applicantName").textbox("setValue",selected.applicant.name);
                $("#applicantIdCard").textbox("setValue",selected.applicant.idCard);
                $("#address").textbox("setValue",selected.applicant.address);
                $("#applicantTel").textbox("setValue",selected.applicant.tel);
                $("#recognizeeId").textbox("setValue",selected.recognizee.id);
                $("#recognizeeName").textbox("setValue",selected.recognizee.name);
                $("#recognizeeIdCard").textbox("setValue",selected.recognizee.idCard);
                $("#recognizeeTel").textbox("setValue",selected.recognizee.tel);
                //车辆信息
                $("#carBrand").combobox("setValue",selected.car.carBrand.name);
                $("#carplateNumber").textbox("setValue",selected.car.carNumber);
                $("#valuation").textbox("setValue",selected.car.valuation);
                $("#carType").combobox("setValue",selected.car.type);
                $("#carSize").combobox("setValue",selected.car.size);
                //基本信息
                $("#applicantId").textbox("setValue",selected.applicant.id);
                $("#beginDate").datebox("setValue",selected.basicBill.beginDate);
                $("#endDate").datebox("setValue",selected.basicBill.endDate);
                $("#applyDate").datebox("setValue",selected.basicBill.inputDate);
                $("#odd").textbox("setValue",selected.basicBill.odd);
                $("#handle").textbox("setValue",selected.basicBill.handle);
                $("#arbitrament").textbox("setValue",selected.basicBill.arbitrament);
                $("#businessSource").textbox("setValue",selected.basicBill.businessSource);
                $("#inputUser").combobox("setValue",selected.recognizee.inChargeUser.username);
                $("#payWay").combobox("setValue",selected.basicBill.payWay);
                $("#appoint").textbox("setValue",selected.basicBill.appoint);
                //保单金额
                $("#productName").textbox("setValue", selected.product.name);
                $("#amount").textbox("setValue", selected.product.amount);
                $("#totalAmount").textbox("setValue", selected.totalamount);
                $("#yearsAmount").textbox("setValue", selected.product.yearsAmount);
                $("#companyName").textbox("setValue",selected.product.company.name);
                $("#companyId").textbox("setValue",selected.product.company.id);
                $("#auditorid").textbox("setValue",selected.audit.auditor.username);
                $("#auditdate").datebox("setValue",selected.audit.auditdate)
                $("#auditwork").textbox("setValue",selected.audit.auditcause);
                $("#odd3").textbox("setValue",selected.basicBill.odd);
            } else {
                $.messager.alert("温馨提示", "请选择要查看的申请单", "info");
                return;
            }
            bill_dialog.dialog("setTitle", "申请单明细").dialog("open");
        },
        cancel: function cancel() {
            bill_dialog.dialog("close");
        },
        searchS: function searchS() {
            bill_datagrid.datagrid("load", {
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

    bill_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/bill/query.do',
        singleSelect: true,
        pagination: true,
        columns: [[
            {field: 'id', hidden: true},
            {
                field: 'basicBill', title: '订单号', width: 100, formatter: function (value, row, index) {
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
                    console.log(row)
                return row.basicBill ? row.basicBill.inputDate : "";
            }
            },
            {
                field: 'status', title: '状态', width: 100, formatter: function (value, row, index) {
                    if(value == -1){
                        return "<font color='red'>拒保</font>"
                    }else if(value == 1){
                        return "待批改"
                    }else if(value == 2){
                        return "待审核"
                    }else if(value == 3){
                        return "<font color='green'>已通过</font>"
                    }else{
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
        toolbar: '#bill_toolbar',
        striped: true,
        rownumbers: true
        // onClickRow: function (index, row) {
        //     var selected = bill_datagrid.datagrid("getSelected");
        // }
    });

    bill_dialog.dialog({
        title: "申请单明细",
        closed: true,
        modal: true,
        width: 700,
        height: 450,
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

    $("#form input").prop("readonly", true);

});
