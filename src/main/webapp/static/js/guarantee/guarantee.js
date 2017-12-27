$(function () {
    var guarantee_datagrid = $("#guarantee_datagrid");
    var guarantee_dialog = $("#guarantee_dialog");
    var guarantee_form = $("#guarantee_form");
    var onData ={
        delete:function () {
            var selected = guarantee_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/guarantee/delete.do", {id: selected.id}, function () {
                    guarantee_datagrid.datagrid("reload");
                });
            }
        },
        add: function add() {
            guarantee_form.form("clear");
            guarantee_dialog.dialog("setTitle", "新增售后");
            guarantee_dialog.dialog("open")
           //guarantee_dialog.dialog("setTitle", "新增售后").dialog("open");
        },
        edit: function edit() {
            var selected = guarantee_datagrid.datagrid("getSelected");
            if (selected) {

                guarantee_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            guarantee_dialog.dialog("setTitle", "编辑员工").dialog("open");
        },
        cancel: function cancel() {
            guarantee_dialog.dialog("close");
        },
        reld: function reld() {
            guarantee_datagrid.datagrid("reload");
        },
        saveOrUpdate: function saveOrUpdate() {
            guarantee_form.form("submit", {
                url: "/guarantee/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            guarantee_dialog.dialog("close");
                            guarantee_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                }

            });
        },
        changeStatus: function changeStatus() {
            var selected = guarantee_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/guarantee/changeStatus.do", {id: selected.id}, function () {
                    guarantee_datagrid.datagrid("reload");
                });
            }
        },

        search: function search() {
            guarantee_datagrid.datagrid("load", {
                dueTime: $("#dueTime").textbox("getValue"),
                keywords: $("#keywords").textbox("getValue"),

            });
        }
    }
    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });


    guarantee_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/guarantee/query.do',
        singleSelect: true,
        columns: [[
            /*{field: 'id', hidden: true},*/
            {field: 'id', title: '编号', width: 80},
            {field: 'client', title: '客户名字', width: 80,formatter:function (value,row,index) {
                return value?value:'';
            }},
            {field: 'sn', title: '保修单号', width: 160},

            {field: 'productName', title: '产品名字', width: 50},
            {field: 'dueTime', title: '到期时间', width: 80},
            {field: 'remark', title: '备注', width: 80},
            {field: 'status', title: '状态', width: 80,formatter:function (value,row,index) {
                return row.status==1?'完成':"<font color='red'>未完成</font>";
            }}

        ]],
        toolbar: '#guarantee_toolbar',//把按钮添加到工具栏
        striped: true,//斑马线
        pagination: true,//DataGrid控件底部显示分页工具栏
        rownumbers: true,//行号
        onClickRow: function (index, row) {
            var selected = guarantee_datagrid.datagrid("getSelected");
            var str = "完成";
            if (selected.status) {
                str = "未完成";
            }
            $("#changeBtn").linkbutton({
                text: str
            });
        }

    });



    guarantee_dialog.dialog({
        title: "售后",
        closed: true,
        width: 400,
        height: 380,
        buttons: "#guarantee_buttons"
    });

});
