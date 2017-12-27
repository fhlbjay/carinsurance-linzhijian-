$(function () {
    var client_datagrid = $("#client_datagrid");
    var client_dialog = $("#client_dialog");
    var client_form = $("#client_form");

    var onData = {
        add: function add() {
            client_form.form("clear");
            client_dialog.dialog("setTitle", "新增客户").dialog("open");
        },
        edit: function edit() {
            var selected = client_datagrid.datagrid("getSelected");
            if (selected) {
                client_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            client_dialog.dialog("setTitle", "编辑客户").dialog("open");
        },
        cancel: function cancel() {
            client_dialog.dialog("close");
            $("#off_dialog").dialog("close");

        },
        reld: function reld() {
            client_datagrid.datagrid("reload");
        },
        off: function off() {
            var selected = client_datagrid.datagrid("getSelected");
            if (selected) {
                client_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择用户", "info");
                return;
            }
            //发送请求,更改状态
            $.messager.confirm('温馨提示', '确认该用户已经流失吗？', function (r) {
                if (r) {
                    //发送请求,将该用户状态改为已经失败
                    $.get("/client/off.do", {id: selected.id}, function () {
                        //然后打开输入框,输入原因
                        $("#off_dialog").dialog("open");
                    });
                }
            });
        },
        saveOrUpdate: function saveOrUpdate() {
            client_form.form("submit", {
                url: "/officialClient/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            client_dialog.dialog("close");
                            client_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                }
            });
        },
        save: function save() {
            var selected = client_datagrid.datagrid("getSelected");
            $("#off_form").form("submit", {
                url: "/developAndLoseRecord/off.do?id=" + selected.id,
                success: function (data) {
                    $.messager.alert("温馨提示", "保存成功", "info", function () {
                    });
                    //保存成功后,关闭界面
                    $("#off_dialog").dialog("close");
                    client_datagrid.datagrid("reload");
                }
            });
        },
        searchS: function searchS() {
            client_datagrid.datagrid("load", {
                keywords: $("#keywords").textbox("getValue"),
                status: $("#status").textbox("getValue")
            });
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    client_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/officialClient/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'name', title: '客户姓名', width: 100},
            {field: 'age', title: '年龄', width: 100},
            {field: 'gender', title: '性别', width: 100},
            {field: 'tel', title: '电话', width: 100},
            {field: 'email', title: '邮箱', width: 100},
            {field: 'qq', title: 'qq', width: 100},
            {field: 'weChat', title: '微信', width: 100},
            {
                field: 'job', title: '职业', width: 100, formatter: function (value, row, index) {
                return row.job ? row.job.name : "";
            }
            },
            {
                field: 'salaryLevel', title: '收入水平', width: 100, formatter: function (value, row, index) {
                return row.salaryLevel ? row.salaryLevel.name : "";
            }
            },
            {
                field: 'customerSource', title: '客户来源', width: 100, formatter: function (value, row, index) {
                return row.customerSource ? row.customerSource.name : "";
            }
            },
            {
                field: 'inputUser', title: '创建人', width: 100, formatter: function (value, row, index) {
                return value ? value.username : "";
            }
            },
            {
                field: 'inChargeUser', title: '负责人', width: 100, formatter: function (value, row, index) {
                return value ? value.username : "";
            }
            },
            {field: 'inputTime', title: '录入时间', width: 100},
            {
                field: 'status', title: '状态', width: 100, formatter: function (value, row, index) {
                return value == 1 ? "正式客户" : "<font color='red'>流失客户</font>";
            }
            },
        ]],
        toolbar: '#client_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true
    });


    client_dialog.dialog({
        title: "客户",
        closed: true,
        modal: true,
        width: 500,
        height: 470,
        buttons: "#client_buttons"
    });
    $("#off_dialog").dialog({
        title: "流失原因",
        closed: true,
        modal: true,
        width: 400,
        height: 380,
        buttons: "#off_buttons"
    })

    $("#client_job").combobox({
        url: "/dictionaryDetail/selectByParentSn.do?sn=job",
        valueField: 'id',
        textField:  'name',
    });
    $("#client_salary").combobox({
        url: "/dictionaryDetail/selectByParentSn.do?sn=salaryLevel",
        valueField: 'id',
        textField:  'name',
    });
    $("#client_way").combobox({
        url: "/dictionaryDetail/selectByParentSn.do?sn=customerSource",
        valueField: 'id',
        textField:  'name',
    });

});
