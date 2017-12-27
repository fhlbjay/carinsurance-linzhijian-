$(function () {
    var rol_datagrid = $("#rol_datagrid");
    var rol_dialog = $("#rol_dialog");
    var rol_form = $("#rol_form");
    var allPermissions = $("#allPermissions");
    var selfPermissions = $("#selfPermissions");

    var onData = {
        add: function add() {
            selfPermissions.datagrid("loadData", []);
            rol_form.form("clear");
            rol_dialog.dialog("setTitle", "新增角色").dialog("open");
        },
        edit: function edit() {
            var selected = rol_datagrid.datagrid("getSelected");
            if (selected) {
                selfPermissions.datagrid("load", {
                    id: selected.id
                });
                rol_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            rol_dialog.dialog("setTitle", "编辑角色").dialog("open");
        },
        cancel: function cancel() {
            rol_dialog.dialog("close");
        },
        reld: function reld() {
            rol_datagrid.datagrid("reload");
        },
        saveOrUpdate: function saveOrUpdate() {
            rol_form.form("submit", {
                url: "/role/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            rol_dialog.dialog("close");
                            rol_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                },
                onSubmit: function (param) {
                    var rows = selfPermissions.datagrid("getRows");
                    for (var i = 0; i < rows.length; i++) {
                        param["permissions[" + i + "].id"] = rows[i].id;
                    }
                }
            });
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    rol_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/role/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'sn', title: '编码', width: 100},
            {field: 'name', title: '角色名', width: 100}
        ]],
        toolbar: '#rol_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true
    });

    allPermissions.datagrid({
        fitColumns: true,
        url: '/permission/list.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'name', title: '权限名', width: 100}
        ]],
        striped: true,
        rownumbers: true,
        width: 200,
        height: 300,
        onClickRow: function (index, row) {
            var rows = selfPermissions.datagrid("getRows");
            for (var i = 0; i < rows.length; i++) {
                if (rows[i].id == row.id) {
                    selfPermissions.datagrid("selectRow", i);
                    return;
                }
            }
            selfPermissions.datagrid("insertRow", {
                row: row,
                index: 0
            });
        }
    });

    selfPermissions.datagrid({
        fitColumns: true,
        url: '/permission/listByRoleId.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'name', title: '权限名', width: 100}
        ]],
        striped: true,
        rownumbers: true,
        width: 200,
        height: 300,
        onClickRow: function (index, row) {
            selfPermissions.datagrid("deleteRow", index);
        }
    });

    rol_dialog.dialog({
        title: "角色",
        closed: true,
        modal: true,
        width: 500,
        height: 470,
        buttons: "#rol_buttons"
    });

});
