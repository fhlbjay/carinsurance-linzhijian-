$(function () {
    var moment_datagrid = $("#moment_datagrid");
    var moment_dialog = $("#moment_dialog");
    var moment_form = $("#form");

    var onData = {
        look: function edit() {
            var selected = moment_datagrid.datagrid("getSelected");
            if (selected) {
                console.log(selected)
                $("#momentId").textbox("setValue", selected.id);
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
                $("#carBrand").combobox("setValue", selected.car.carBrand.name);
                $("#carplateNumber").textbox("setValue", selected.car.carNumber);
                $("#valuation").textbox("setValue", selected.car.valuation);
                $("#carId").textbox("setValue", selected.car.id);
                $("#carType").combobox("setValue", selected.car.type);
                $("#carSize").combobox("setValue", selected.car.size);
                //基本信息
                $("#basicId").textbox("setValue", selected.basicBill.id);
                $("#beginDate").datebox("setValue", selected.basicBill.beginDate);
                $("#endDate").datebox("setValue", selected.basicBill.endDate);
                $("#applyDate").datebox("setValue", selected.basicBill.inputDate);
                $("#odd").textbox("setValue", selected.basicBill.odd);
                $("#handle").textbox("setValue", selected.basicBill.handle);
                $("#arbitrament").textbox("setValue", selected.basicBill.arbitrament);
                $("#businessSource").textbox("setValue", selected.basicBill.businessSource);
                $("#inputUser").combobox("setValue", selected.recognizee.inChargeUser.username);
                $("#inputUserId").textbox("setValue", selected.recognizee.inChargeUser.id)
                $("#payWay").combobox("setValue", selected.basicBill.payWay);
                $("#channel").textbox("setValue", selected.basicBill.channel)
                $("#appoint").textbox("setValue", selected.basicBill.appoint);
                //回显金额
                $("#productId").textbox("setValue", selected.product.id);
                $("#productName").textbox("setValue", selected.product.name);
                $("#amount").textbox("setValue", selected.product.amount);
                $("#totalAmount").textbox("setValue", selected.totalamount);
                $("#yearsAmount").textbox("setValue", selected.product.yearsAmount);
                $("#companyName").combobox("setValue", selected.product.company.name);
                $("#companyId").textbox("setValue", selected.product.company.id);
                //设置tx的id
                $("#txId").textbox("setValue", selected.taxAndIns.id);
            } else {
                $.messager.alert("温馨提示", "请选择要查看的暂存单", "info");
                return;
            }
            moment_dialog.dialog("setTitle", "暂存单明细").dialog("open");
        },
        cancel: function cancel() {
            moment_dialog.dialog("close");
            $("#insurance_dialog").dialog("close");
        }, insurance: function () {
            $("#insurance_dialog").dialog("setTitle", "选择客户");
            $("#insurance_dialog").dialog("open")
        },
        commit: function () {
            $.messager.confirm('温馨提示', '您确认想要提交批改该暂存单吗？', function (r) {
                if (r) {
                    //获取省市区
                    var eprovinceName = $("#eprovinceName").val();
                    var ecityName = $("#ecityName").val();
                    var edistrictName = $("#edistrictName").val();
                    //=获取到详细地址
                    var address = $("#address").textbox("getValue");
                    //将所有地址拼接然后重新设置给address
                    address = eprovinceName + ecityName + edistrictName + address;
                    $("#address").textbox("setValue", address)
                    $("#form").form('submit', {
                        url: "/bill/checkBill.do",
                        success: function () {
                            //再次发送请求
                            $("#insuranceForm").form("submit", {
                                url: "/bill/checkBill.do",
                                success: function (data) {
                                    $.messager.alert("温馨提示", "提交成功!", "info");
                                }
                            })
                            //清空表单
                            $("#form").form("clear");
                        }
                    });
                }
                //关闭窗口刷新页面
                moment_dialog.dialog("close");
                moment_datagrid.datagrid("reload");
            });
        },
        delete: function () {
            var selected = moment_datagrid.datagrid("getSelected")
            if (selected) {
                $.messager.confirm('温馨提示', '您确认想要删除该暂存单吗？', function (r) {
                    $.get("/bill/delete.do", {id: selected.id}, function (data) {
                        if (data.flag) {
                            $.messager.alert("温馨提示", "删除成功", "info");
                        } else {
                            $.messager.alert("温馨提示", "删除失败", "info");
                        }
                    })
                })
            } else {
                $.messager.alert("温馨提示", "请选择要删除的暂存单", "info");
                return;
            }
        }, reload: function () {
            moment_datagrid.datagrid("reload");
        }
        ,
        searchS: function searchS() {
            moment_datagrid.datagrid("load", {
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

    moment_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/bill/moment.do',
        singleSelect: true,
        pagination: true,
        columns: [[
            {field: 'id', hidden: true},
            {
                field: 'basicBill', title: '申请单号', width: 100, formatter: function (value, row, index) {
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
                field: 'recognizee', title: '被投保人', width: 100, formatter: function (value, row, index) {
                return value ? value.name : "";
            }
            },
            {
                field: 'idCar', title: '投保人身份证', width: 100, formatter: function (value, row, index) {
                return row.car ? row.applicant.idCard : "";
            }
            },
            {
                field: 'row', title: '车辆品牌', width: 100, formatter: function (value, row, index) {
                return row.car ? row.car.carBrand.name : "";
            }
            },
            {
                field: 'car', title: '车牌号', width: 100, formatter: function (value, row, index) {
                console.log(row)
                return value ? value.carNumber : "";
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
        toolbar: '#moment_toolbar',
        striped: true,
        rownumbers: true
        // onClickRow: function (index, row) {
        //     var selected = moment_datagrid.datagrid("getSelected");
        // }
    });

    moment_dialog.dialog({
        title: "暂存单明细",
        closed: true,
        modal: true,
        width: 700,
        height: 400,
        buttons: "#emp_buttons"
    });

    $("#insurance_dialog").dialog({
        width: 800,
        height: 350,
        buttons: '#insurance__btns',
        closed: true,
        modal: true
    });

    $("#inputUser").combobox({
        url: "/employee/list.do",
        valueField: 'id',
        textField: 'username',
    });
    $("#appoint").combobox({
        url: "/dictionaryDetail/selectByParentSn.do?sn=appoint",
        valueField: 'id',
        textField: 'name',
    });
    $("#carBrand").combobox({
        url: "/dictionaryDetail/selectByParentSn.do?sn=carBrand",
        valueField: 'id',
        textField: 'name',
    });

    $("#companyName").combobox({
        url: "/company/list.do",
        valueField: 'id',
        textField: 'name',
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


});
