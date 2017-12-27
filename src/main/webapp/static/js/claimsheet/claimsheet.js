$(function () {
    var claimsheet_datagrid = $("#claimsheet_datagrid");
    var claimsheet_dialog = $("#claimsheet_dialog");
    var claimsheet_form = $("#claimsheet_form");


    var onData ={
        delete:function () {
            var selected = claimsheet_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/claimsheet/delete.do", {id: selected.id}, function () {
                    claimsheet_datagrid.datagrid("reload");
                });
            }
        },
        add: function add() {
            claimsheet_form.form("clear");
            claimsheet_dialog.dialog("setTitle", "新增售后");
            claimsheet_dialog.dialog("open")
           //claimsheet_dialog.dialog("setTitle", "新增售后").dialog("open");
        },
        edit: function edit() {
            var selected = claimsheet_datagrid.datagrid("getSelected");
            if (selected) {

                claimsheet_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            claimsheet_dialog.dialog("setTitle", "编辑员工").dialog("open");
        },
        cancel: function cancel() {
            claimsheet_dialog.dialog("close");
        },
        reld: function reld() {
            claimsheet_datagrid.datagrid("reload");
        },
        saveOrUpdate: function saveOrUpdate() {
            claimsheet_form.form("submit", {

                url: "/claimsheet/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            claimsheet_dialog.dialog("close");
                            claimsheet_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                }/*,
                onSubmit: function (param) {
                var rows = $("#emp_claim").combobox("getValues");
                for (var i = 0; i < rows.length; i++) {
                    param["employee[" + i + "].id"] = rows[i].id;
                }
            }*/

            });
        },
        changeStatus: function changeStatus() {
            var selected = claimsheet_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/claimsheet/changeStatus.do", {id: selected.id}, function () {
                    claimsheet_datagrid.datagrid("reload");
                });
            }
        },

        search: function search() {
            claimsheet_datagrid.datagrid("load", {
                dueTime: $("#dueTime").textbox("getValue"),
                keywords: $("#keywords").textbox("getValue"),

            });
        }
    }
    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });


    claimsheet_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/claimsheet/query.do?status=0',
        singleSelect: true,
        columns: [[
            /*{field: 'id', hidden: true},*/
            {field: 'sn', title: '单号', width: 80},
            {field: 'informant', title: '报案人',width:80},
            {field: 'tel', title: '电话', width: 100},
            {field: 'status', title: '状态', width: 100,formatter:function (value,row,index) {
               return value==0?"待审核":'';
            }},
            {field: 'place', title: '地点', width: 50},
            {field: 'accidentTime', title: '时间', width: 80},
            {field: 'carNumber', title: '车牌号', width: 80},
            {field: 'employee', title: '派遣人', width: 80,formatter:function (value,row,index) {
                return value?value.username:"";
            }}

        ]],
        toolbar: '#claimsheet_toolbar',//把按钮添加到工具栏
        striped: true,//斑马线
        pagination: true,//DataGrid控件底部显示分页工具栏
        rownumbers: true,//行号
        onClickRow: function (index, row) {
            var selected = claimsheet_datagrid.datagrid("getSelected");
            var str = "审核";
            if (selected.status) {
                str = "拒绝审核";
            }
            $("#changeBtn").linkbutton({
                text: str
            });
        }

    });



    claimsheet_dialog.dialog({
        title: "售后",
        closed: true,
        width: 400,
        height: 380,
        buttons: "#claimsheet_buttons"
    });

    $("#emp_claim").combobox({
        url: "/employee/list.do",
        valueField: 'id',
        textField: 'username'
    });

});
