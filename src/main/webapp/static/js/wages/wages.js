$(function () {
    var wages_datagrid = $("#wages_datagrid");
    var wages_undo_toolbar=$("#wages_undo_toolbar")
    var wages_form=$("#wages_form")
    var onData ={
        undo: function undo() {

            wages_form.form("clear");
            //admin.combobox("setValue", 0);//设置下拉框的默认值
            wages_undo_toolbar.dialog("setTitle", "导入工资单").dialog("open");
        },
        exportXls:function () {
            window.location.href="/wages/export.do"
        },

        search: function search() {
            wages_datagrid.datagrid("load", {
                inputTime: $("#inputTime").textbox("getValue"),
                outputTime: $("#outputTime").textbox("getValue"),
                keywords: $("#keywords").textbox("getValue"),

            });
        }
    }
    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });


    wages_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/wages/query.do',
        singleSelect: true,
        columns: [[
            /*{field: 'id', hidden: true},*/
            {field: 'id', title: '编号', width: 80},
            {field: 'email', title: '邮箱', width: 80,formatter:function (value,row,index) {
                //console.log(value);

                return row.employee.email;
            }},
            {field: 'inputTime', title: '年份', width: 50},
            {field: 'outputTime', title: '月份', width: 80},
            {field: 'salary', title: '工资', width: 80},
            {field: 'employee', title: '员工', width: 80,formatter:function (value,row,index) {
                return value?value.username:'';
            }}

        ]],
        toolbar: '#wages_toolbar',//把按钮添加到工具栏
        striped: true,//斑马线
        pagination: true//DataGrid控件底部显示分页工具栏
        //rownumbers: true//行号



    });

    wages_undo_toolbar.dialog({
        title: "上传工资表",
        closed: true,
        modal: true,
        width: 200,
        top:100,
        height: 280/*,
        buttons: "#emp_buttons"*/
    });


});
