$(function () {
    var add_datagrid = $("#add_datagrid");
    var add_dialog = $("#add_dialog");
    var add_form = $("#add_form");

    $("#product_datagrid").datagrid({
        fit: true,
        fitColumns: true,
        striped: true,
        //toolbar: '#product_toolbar',
        url: "/product/query.do",
        pagination: true,
        rownumbers: true,
        ctrlSelect: true,
        columns: [[
            {field: 'name', title: '产品名称', width: 100},
            {field: 'yearsAmount', title: '产品年费', width: 100},
            {
                field: 'company', title: '保险机构', width: 100, formatter: function (value, row, index) {
                return value ? value.name : '';
            }
            },
            {
                field: 'status', title: '销售状态', width: 100, formatter: function (value, row, index) {
                return value ? "<font color='blue'>在售</font>" : "<font color='red'>停售</font>"
            }
            }
        ]]
    });

    var onData = {
        add: function add() {
            add_form.form("clear");
            add_dialog.dialog("setTitle", "保单录入").dialog("open");
        },
        choose_customer: function () {
            $("#choose_customer_dialog").dialog("setTitle", "选择客户");
            $("#choose_customer_dialog").dialog("open")
        },
        choose_customer2: function () {
            $("#choose_recognizee_dialog").dialog("setTitle", "选择客户");
            $("#choose_recognizee_dialog").dialog("open")
        },
        save: function () {
            $.messager.confirm('确认', '您确认想要暂时保存该保单吗吗？', function (r) {
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
                        url: "/bill/saveOrUpdate.do",
                        success: function () {
                            //再次发送请求
                            $("#insuranceForm").form("submit", {
                                url: "/bill/saveOrUpdate.do",
                                success: function (data) {
                                    $.messager.alert("温馨提示", "保存成功!", "info");
                                }
                            })
                            //清空表单
                            $("#form").form("clear");
                        }
                    });
                }
            });
        }, insurance: function () {
            $("#insurance_dialog").dialog("setTitle", "选择客户");
            $("#insurance_dialog").dialog("open")
        },
        check: function () {
            $.messager.confirm('确认', '您确认想要提交批改该申请单吗？', function (r) {
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
            });
        }, select_applicant: function () {
            var customer = $("#customer_datagrid").datagrid("getSelected");
            $("#applicantId").textbox("setValue", customer.id);
            $("#applicantName").textbox("setValue", customer.name);
            $("#address").textbox("setValue", customer.address);
            $("#applicantIdCard").textbox("setValue", customer.idCard);
            $("#applicantTel").textbox("setValue", customer.tel);
            $("#choose_customer_dialog").dialog("close");
        }, select_recognizee: function () {
            var customer = $("#recognizee_datagrid").datagrid("getSelected");
            $("#recognizeeId").textbox("setValue", customer.id);
            $("#recognizeeName").textbox("setValue", customer.name);
            $("#recognizeeIdCard").textbox("setValue", customer.idCard);
            $("#recognizeeTel").textbox("setValue", customer.tel);
            $("#choose_recognizee_dialog").dialog("close");
        }, add_product: function () {
            var safeId = $("#company").combobox("getValue");
            if (safeId == "请选择" || safeId == null || safeId == '') {
                $.messager.alert("亲,请选择购买保险的机构!", "warning");
                return;
            }
            $("#choose_product_dialog").dialog("open");
            $("#choose_product_dialog").dialog("setTitle", "选择商品");
            $.get("/product/query.do", {comId: safeId, status: 1}, function (data) {
                $("#product_datagrid").datagrid("loadData", data);
            });
            var clone = $("#hidethis").clone(true);

        }, select_product: function () {
            var product = $("#product_datagrid").datagrid("getSelected");
            //将产品信息设置到框中
            $("#productId").textbox("setValue", product.id);
            $("#productName").textbox("setValue", product.name);
            $("#choose_product_dialog").dialog("close");
        }, count: function () {
            //点击计算保费,获取到4个参数
            $.get("/bill/taxAndIns.do", $("#insuranceForm").serialize(), function (data) {
                console.log(data)
                //设置车船税
                $("#tax").textbox("setValue", data.tax)
                //设置交强险
                $("#ins").textbox("setValue", data.ins)
                //设置交强险系数
                $("#insModulus").textbox("setValue", data.insModulus);
                //设置保险年费
                $("#yearsAmount").textbox("setValue", data.ins + data.insModulus)
                //设置保额
                $("#amount").textbox("setValue", (data.ins + data.insModulus) * 10)
                //设置总价
                $("#totalAmount2").textbox("setValue", data.ins + data.insModulus)
                //关闭窗口
                $("#insurance_dialog").dialog("close");
            });

        }, cancel: function () {
            $("#insurance_dialog").dialog("close");
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    $("#choose_customer_dialog").dialog({
        width: 800,
        height: 350,
        buttons: '#customer_btns',
        closed: true,
        modal: true
    });
    $("#choose_recognizee_dialog").dialog({
        width: 800,
        height: 350,
        buttons: '#customer_btns2',
        closed: true,
        modal: true
    });
    $("#customer_datagrid").datagrid({
        fit: true,
        fitColumns: true,
        striped: true,
        // toolbar: '#customer_toolbar',
        url: "/client/list.do",
        pagination: true,
        singleSelect: true,
        rownumbers: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'name', title: '客户名称', width: 70},
            {
                field: 'gender', title: '性别', width: 40, formatter: function (value, row, index) {
                console.log(value)
                if (value == null) {
                    return '';
                }
                if (value) {
                    return '';
                }
                if (!value) {
                    return '';
                }
            }
            },
            {field: 'tel', title: '电话', width: 100},
            {field: 'idCard', title: '身份证', width: 100}
        ]],
        onDblClickRow: function () {
            // sure_customer();
        }
    })
    $("#recognizee_datagrid").datagrid({
        fit: true,
        fitColumns: true,
        striped: true,
        // toolbar: '#customer_toolbar',
        url: "/client/list.do",
        pagination: true,
        singleSelect: true,
        rownumbers: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'name', title: '客户名称', width: 70},
            {
                field: 'gender', title: '性别', width: 40, formatter: function (value, row, index) {
                console.log(value)
                if (value == null) {
                    return '';
                }
                if (value) {
                    return '';
                }
                if (!value) {
                    return '';
                }
            }
            },
            {field: 'tel', title: '电话', width: 100},
            {field: 'idCard', title: '身份证', width: 100}
        ]],
        onDblClickRow: function () {
            // sure_customer();
        }
    })

    $("#company").combobox({
        url: "/company/list.do",
        valueField: 'id',
        textField: 'name',
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

    $("#choose_product_dialog").dialog({
        width: 800,
        height: 350,
        buttons: '#product_btns2',
        closed: true,
        modal: true
    });
    $("#insurance_dialog").dialog({
        width: 800,
        height: 350,
        buttons: '#insurance__btns',
        closed: true,
        modal: true
    });

});

function delete_this(data) {
    $(data).closest("#hidethis").remove();
    var amount = 0;
    $.each($(".yearsAmount"), function (index, item) {
        amount = amount + parseInt(item.innerHTML);
    })
    duration = $("#duration").val();
    $("#totalAmount").html(amount * duration);
}

function revser() {
}

