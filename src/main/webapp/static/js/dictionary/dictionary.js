$(function () {
    var parent_datagrid = $("#parent_datagrid");
    var son_datagrid = $("#son_datagrid");
    var son_dialog = $("#son_dialog");
    var son_form = $("#son_form");

    var onData = {
        add: function add() {
            var selectedParent = parent_datagrid.datagrid("getSelected");
            if (!selectedParent) {
                $.messager.alert("温馨提示", "请选择需要新增的字典目录", "info");
                return;
            }
            son_form.form("clear");
            son_dialog.dialog("setTitle", "新增字典明细").dialog("open");
        },
        edit: function edit() {
            var selected = son_datagrid.datagrid("getSelected");
            var selectedParent = parent_datagrid.datagrid("getSelected");
            if (!selectedParent) {
                $.messager.alert("温馨提示", "请选择需要编辑的字典目录", "info");
                return;
            }
            if (selected) {
                son_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的字典明细", "info");
                return;
            }
            son_dialog.dialog("setTitle", "编辑字典明细").dialog("open");
        },
        cancel: function cancel() {
            son_dialog.dialog("close");
        },
        reld: function reld() {
            son_datagrid.datagrid("reload");
        },
        saveOrUpdate: function saveOrUpdate() {
            son_form.form("submit", {
                url: "/dictionaryDetail/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            son_dialog.dialog("close");
                            son_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                },
                onSubmit: function (param) {
                    var selected = parent_datagrid.datagrid("getSelected");
                    param["parent.id"] = selected.id;
                }
            });
        },
        changeState: function changeState() {
            var selected = son_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/dictionaryDetail/changeState.do", {id: selected.id}, function () {
                    son_datagrid.datagrid("reload");
                });
            }
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    parent_datagrid.datagrid({
        fitColumns: true,
        width: 1350,
        height: 295,
        url: '/dictionaryDirectory/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'sn', title: '字典编码', width: 100},
            {field: 'name', title: '字典名称', width: 100},
            {field: 'intro', title: '字典简介', width: 100}
        ]],
        striped: true,
        pagination: true,
        rownumbers: true,
        onClickRow: function (index, row) {
            var selected = parent_datagrid.datagrid("getSelected");
            son_datagrid.datagrid("load", {
                parentId: selected.id
            });
        }
    });

    son_datagrid.datagrid({
        fitColumns: true,
        width: 1350,
        height: 295,
        url: '/dictionaryDetail/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'name', title: '字典明细名称', width: 100},
            {field: 'intro', title: '字典明细简介', width: 100},
            {
                field: 'state', title: '状态', width: 100, formatter: function (value, row, index) {
                return value ? "启用" : "<font color='red'>禁用</font>";
            }
            },
            {
                field: 'parent', title: '字典目录', width: 100, formatter: function (value, row, index) {
                return value ? value.name : "";
            }
            }
        ]],
        toolbar: '#son_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true,
        onClickRow: function (index, row) {
            var selected = son_datagrid.datagrid("getSelected");
            var str = "启用";
            if (selected.state) {
                str = "禁用";
            }
            $("#changeBtn").linkbutton({
                text: str
            });
        }
    });

    son_dialog.dialog({
        title: "字典明细",
        closed: true,
        modal: true,
        width: 400,
        height: 200,
        buttons: "#son_buttons"
    });

});
