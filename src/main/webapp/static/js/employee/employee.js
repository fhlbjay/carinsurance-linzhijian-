$(function () {
    var emp_datagrid = $("#emp_datagrid");
    var emp_dialog = $("#emp_dialog");
    var emp_form = $("#emp_form");
    var emp_roles = $("#emp_roles");
    var admin = $("#admin");

    var onData = {
        add: function add() {
            $("#emp_password").show();
            emp_form.form("clear");
            admin.combobox("setValue", 0);
            emp_dialog.dialog("setTitle", "新增员工").dialog("open");
        },
        edit: function edit() {
            var selected = emp_datagrid.datagrid("getSelected");
            if (selected) {
                $("#emp_password").hide();
                selected['department.id'] = selected.department.id;
                $.post("/role/getRoleIdsByEmployeeId.do", {id: selected.id}, function (data) {
                    emp_roles.combobox("setValues", data);
                }, "json");
                emp_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            emp_dialog.dialog("setTitle", "编辑员工").dialog("open");
        },
        cancel: function cancel() {
            emp_dialog.dialog("close");
        },
        reld: function reld() {
            emp_datagrid.datagrid("reload");
        },
        saveOrUpdate: function saveOrUpdate() {
            emp_form.form("submit", {
                url: "/employee/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            emp_dialog.dialog("close");
                            emp_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                },
                onSubmit: function (param) {
                    var rows = emp_roles.combobox("getValues");
                    for (var i = 0; i < rows.length; i++) {
                        param["roles[" + i + "].id"] = rows[i];
                    }
                }
            });
        },
        changeState: function changeState() {
            var selected = emp_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/employee/changeState.do", {id: selected.id}, function () {
                    emp_datagrid.datagrid("reload");
                });
            }
        },
        searchS: function searchS() {
            emp_datagrid.datagrid("load", {
                keywords: $("#keywords").textbox("getValue"),
                deptId: $("#deptId").textbox("getValue"),
                beginDate: $("#beginDate").textbox("getValue"),
                endDate: $("#endDate").textbox("getValue")
            });
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    emp_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/employee/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'username', title: '用户名', width: 100},
            {field: 'realname', title: '真实姓名', width: 100},
            {field: 'tel', title: '电话', width: 100},
            {field: 'email', title: '邮箱', width: 100},
            {
                field: 'department', title: '部门', width: 100, formatter: function (value, row, index) {
                return value ? value.name : "";
            }
            },
            {field: 'inputtime', title: '入职时间', width: 100},
            {
                field: 'state', title: '状态', width: 100, formatter: function (value, row, index) {
                return value ? "在职" : "<font color='red'>离职</font>";
            }
            },
            {
                field: 'admin', title: '是否管理员', width: 100, formatter: function (value, row, index) {
                return value ? "是" : "否";
            }
            }
        ]],
        toolbar: '#emp_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true,
        onClickRow: function (index, row) {
            var selected = emp_datagrid.datagrid("getSelected");
            var str = "复职";
            if (selected.state) {
                str = "离职";
            }
            $("#changeBtn").linkbutton({
                text: str
            });
        }
    });

    emp_dialog.dialog({
        title: "员工",
        closed: true,
        modal: true,
        width: 400,
        height: 380,
        buttons: "#emp_buttons"
    });

    $("#emp_dept,#deptId").combobox({
        url: "/department/list.do",
        valueField: 'id',
        textField: 'name'
    });

    emp_roles.combobox({
        url: "/role/list.do",
        valueField: 'id',
        textField: 'name',
        multiple: true
    });

});
