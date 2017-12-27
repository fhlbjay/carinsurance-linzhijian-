$(function () {
    var exclusions_datagrid = $("#exclusions_datagrid");
    var exclusions_dialog = $("#exclusions_dialog");
    var exclusions_form = $("#exclusions_form");


    var onData ={
        delete:function () {
            var selected = exclusions_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/claimsheet/delete.do", {id: selected.id}, function () {
                    exclusions_datagrid.datagrid("reload");
                });
            }
        },
        edit: function edit() {
            var selected = exclusions_datagrid.datagrid("getSelected");
            if (selected) {

                exclusions_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            exclusions_dialog.dialog("setTitle", "编辑拒保").dialog("open");
        },
        cancel: function cancel() {
            exclusions_dialog.dialog("close");
        },
        reld: function reld() {
            exclusions_datagrid.datagrid("reload");
        },
        saveOrUpdate: function saveOrUpdate() {
            exclusions_form.form("submit", {

                url: "/claimsheet/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            exclusions_dialog.dialog("close");
                            exclusions_datagrid.datagrid("reload");
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

        search: function search() {
            exclusions_datagrid.datagrid("load", {
                dueTime: $("#dueTime").textbox("getValue"),
                keywords: $("#keywords").textbox("getValue"),

            });
        }
    };
    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });


    exclusions_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/claimsheet/query.do?status=-1',
        singleSelect: true,
        columns: [[
            /*{field: 'id', hidden: true},*/
            {field: 'sn', title: '单号', width: 80},
            {field: 'informant', title: '姓名',width:80},
            {field: 'tel', title: '电话', width: 100},
            {field: 'status', title: '状态', width: 100,formatter:function (value,row,index) {
               return value==-1?"已审核":'hhh';
            }},
            {field: 'place', title: '地点', width: 50},
            {field: 'accidentTime', title: '时间', width: 80},
            {field: 'carNumber', title: '车牌号', width: 80},

            {field: 'employee', title: '审核人', width: 80,formatter:function (value,row,index) {
                return value?value.username:'';
            }}

        ]],
        toolbar: '#exclusions_toolbar',//把按钮添加到工具栏
        striped: true,//斑马线
        pagination: true,//DataGrid控件底部显示分页工具栏
        rownumbers: true//行号
      /*  onClickRow: function (index, row) {
            var selected = exclusions_datagrid.datagrid("getSelected");
            var str = "理赔";
            if (selected.status==1 ) {
                str = "理赔";
            }
            $("#changeBtn").linkbutton({
                text: str
            });
        }*/

    });



    exclusions_dialog.dialog({
        title: "售后",
        closed: true,
        width: 400,
        height: 380,
        buttons: "#exclusions_buttons"
    });

    $("#emp_claim").combobox({
        url: "/employee/list.do",
        valueField: 'id',
        textField: 'username'
    });

});
