$(function () {
    var dept_datagrid = $("#dept_datagrid");
    var dept_dialog = $("#dept_dialog");
    var dept_form = $("#dept_form");

    var onData = {
        add: function add() {
            dept_form.form("clear");
            dept_dialog.dialog("setTitle", "新增部门").dialog("open");
        },
        edit: function edit() {
            var selected = dept_datagrid.datagrid("getSelected");
            if (selected) {
                dept_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            dept_dialog.dialog("setTitle", "编辑部门").dialog("open");
        },
        cancel: function cancel() {
            dept_dialog.dialog("close");
        },
        reld: function reld() {
            dept_datagrid.datagrid("reload");
        },
        saveOrUpdate: function saveOrUpdate() {
            dept_form.form("submit", {
                url: "/department/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            dept_dialog.dialog("close");
                            dept_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                }
            });
        },
        changeState: function changeState() {
            var selected = dept_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/department/changeState.do", {id: selected.id}, function () {
                    dept_datagrid.datagrid("reload");
                });
            }
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    dept_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/department/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'name', title: '部门名称', width: 100},
            {field: 'sn', title: '编码', width: 100},
            {
                field: 'state', title: '状态', width: 100, formatter: function (value, row, index) {
                return value ? "有效" : "<font color='red'>无效</font>";
            }
            }
        ]],
        toolbar: '#dept_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true,
        onClickRow: function (index, row) {
            var selected = dept_datagrid.datagrid("getSelected");
            var str = "生效";
            if (selected.state) {
                str = "失效";
            }
            $("#changeBtn").linkbutton({
                text: str
            });
        }
    });

    dept_dialog.dialog({
        title: "部门",
        closed: true,
        modal: true,
        width: 400,
        height: 350,
        buttons: "#dept_buttons"
    });

});
