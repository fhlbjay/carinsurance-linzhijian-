$(function () {
    var clientRecord_datagrid = $("#clientRecord_datagrid");
    var clientRecord_form = $("#clientRecord_form");
    var clientRecord_dialog = $("#clientRecord_dialog");

    var onData = {

        add: function add() {
            clientRecord_form.form("clear");
            $("#status").textbox("setValue",true);
            clientRecord_dialog.dialog("setTitle", "新增跟进计划").dialog("open");
        },

        edit: function edit() {
            var selected = clientRecord_datagrid.datagrid("getSelected");
            if (selected) {
                clientRecord_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            clientRecord_dialog.dialog("setTitle", "计划编辑").dialog("open");
        },

        cancel: function cancel() {
            clientRecord_dialog.dialog("close");
        },

        saveOrUpdate: function saveOrUpdate() {
            clientRecord_form.form("submit", {
                url: "/clientRecord/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            clientRecord_dialog.dialog("close");
                            clientRecord_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                }
            });
        },

        move: function move() {
            var selected = clientRecord_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/clientRecord/delete.do", {id: selected.id}, function () {
                    clientRecord_datagrid.datagrid("reload");
                });
            }
        },

        reld: function reld() {
            clientRecord_datagrid.datagrid("reload");
        }
        ,
        searchS: function searchS() {
            clientRecord_datagrid.datagrid("load", {
                inputUser: $("#inputUser").textbox("getValue"),
                client: $("#client").textbox("getValue"),
                wayId: $("#wayId").textbox("getValue"),
                beginDate: $("#beginDate").textbox("getValue"),
                endDate: $("#endDate").textbox("getValue")
            });
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    clientRecord_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/clientRecord/query.do?status=true',
        singleSelect: true,
        columns: [[
            {field: 'date', title: '计划时间', width: 100},
            {
                field: 'inputUser', title: '创建人', width: 100, formatter: function (value, row, index) {
                return value ? value.username : "";
            }
            },
            {
                field: 'client', title: '客户', width: 100, formatter: function (value, row, index) {
                return value ? value.name : "";
            }
            },
            {field: 'theme', title: '计划主题', width: 100},
            {
                field: 'way', title: '实施方式', width: 100, formatter: function (value, row, index) {
                return value ? value.name : "";
            }
            },
            {field: 'details', title: '详情', width: 100},
            {field: 'result', title: '实施结果', width: 100},
            {field: 'remark', title: '备注', width: 100}
        ]],
        striped: true,
        pagination: true,
        rownumbers: true,
        toolbar: '#clientRecord_toolbar'
    });
    $("#way,#wayId").combobox({
        url: "/dictionaryDetail/selectByParentSn.do?sn=type",
        valueField: 'id',
        textField: 'name'
    });

    clientRecord_dialog.dialog({
        title: "新增计划",
        closed: true,
        modal: true,
        width: 400,
        height: 380,
        buttons: "#clientRecord_buttons"
    });
    $("#clientId").combobox({
        url:"/client/list.do",
        valueField: 'id',
        textField: 'name'
    });

});

