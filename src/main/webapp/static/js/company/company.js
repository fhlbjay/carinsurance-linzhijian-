$(function () {
    var company_datagrid = $("#company_datagrid");
    var company_dialog = $("#company_dialog");
    var company_form = $("#company_form");

    var onData = {
        add: function add() {
            company_form.form("clear");
            $("#status").combobox("setValue",0);
            company_dialog.dialog("setTitle", "新增部门").dialog("open");
        },
        edit: function edit() {
            var selected = company_datagrid.datagrid("getSelected");
            if (selected) {
                company_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            company_dialog.dialog("setTitle", "编辑部门").dialog("open");
        },
        cancel: function cancel() {
            company_dialog.dialog("close");
        },
        reld: function reld() {
            company_datagrid.datagrid("reload");
        },
        saveOrUpdate: function saveOrUpdate() {
            company_form.form("submit", {
                url: "/company/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            company_dialog.dialog("close");
                            company_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                }
            });
        },
        changeState: function changeState() {
            var selected = company_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/company/changeState.do", {id: selected.id}, function () {
                    company_datagrid.datagrid("reload");
                });
            }
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    company_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/company/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'name', title: '公司名称', width: 100},
            {field: 'sn', title: '编码', width: 100},
            {
                field: 'status', title: '状态', width: 100, formatter: function (value, row, index) {
                return value? "合作" : "<font color='red'>待合作</font>";
            }
            }
        ]],
        toolbar: '#company_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true,
        onClickRow: function (index, row) {
            var selected = company_datagrid.datagrid("getSelected");
            var str = "开始合作";
            if (selected.status) {
                str = "结束合作";
            }
            $("#changeBtn").linkbutton({
                text: str
            });
        }
    });

    company_dialog.dialog({
        title: "公司",
        closed: true,
        modal: true,
        width: 400,
        height: 350,
        buttons: "#company_buttons"
    });

});
