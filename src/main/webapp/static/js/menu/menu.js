$(function () {
    var menu_datagrid = $("#menu_datagrid");
    var menu_dialog = $("#menu_dialog");
    var menu_form = $("#menu_form");
    var menu_parent = $("#menu_parent");
    var permission = $("#permission");

    var onData = {
        add: function add() {
            menu_form.form("clear");
            menu_dialog.dialog("setTitle", "新增菜单").dialog("open");
        },
        edit: function edit() {
            var selected = menu_datagrid.datagrid("getSelected");
            if (selected) {
                menu_form.form("clear");
                if (selected.parentMenu) {
                    menu_parent.combobox("setValue", selected.parentMenu.id);
                }
                if (selected.permission) {
                    permission.combobox("setValue", selected.permission.id);
                }
                menu_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            menu_dialog.dialog("setTitle", "编辑菜单").dialog("open");
        },
        cancel: function cancel() {
            menu_dialog.dialog("close");
        },
        reld: function reld() {
            menu_datagrid.datagrid("reload");
        },
        saveOrUpdate: function saveOrUpdate() {
            menu_form.form("submit", {
                url: "/menu/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            menu_dialog.dialog("close");
                            menu_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                }
            });
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    menu_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/menu/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'text', title: '菜单名称', width: 100},
            {field: 'url', title: 'URL', width: 100},
            {
                field: 'parentMenu', title: '父菜单', width: 100, formatter: function (value, row, index) {
                return value ? value.text : "";
            }
            }
        ]],
        toolbar: '#menu_toolbar',
        border:false,
        pagination: true,
        rownumbers: true
    });

    menu_dialog.dialog({
        title: "菜单",
        closed: true,
        modal: true,
        width: 400,
        height: 350,
        buttons: "#menu_buttons"
    });

    menu_parent.combobox({
        url: "/menu/list.do",
        valueField: 'id',
        textField: 'text'
    });

    permission.combobox({
        url: "/permission/selectPermissionView.do",
        valueField: 'id',
        textField: 'name'
    });

});
