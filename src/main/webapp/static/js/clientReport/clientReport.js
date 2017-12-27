$(function () {
    var clientReport_datagrid = $("#clientReport_datagrid");
    var clientReport_undo_toolbar=$("#clientReport_undo_toolbar")
    var clientReport_form=$("#clientReport_form")
    var onData ={



        search: function search() {
            clientReport_datagrid.datagrid("load", {
                beginTime: $("#beginTime").textbox("getValue"),
                endTime: $("#endTime").textbox("getValue"),
                inputTimeYear: $("#inputTimeYear").combobox("getValue"),

            });
        }
    }
    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });


    clientReport_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/clientReport/query.do',
        singleSelect: true,
        columns: [[

            {field: 'inputYear', title: '分组类型', width: 50,formatter:function (value,row,index) {
                return value?value:'全部';
            }},
            {field: 'totalNumber', title: '开发个数', width: 80},
            {field: 'inputUsername', title: '员工'/*, width: 80,formatter:function (value,row,index) {
                return value?value.username:'';
            }*/}

        ]],
        toolbar: '#clientReport_toolbar',//把按钮添加到工具栏
        striped: true,//斑马线
        pagination: true//DataGrid控件底部显示分页工具栏
        //rownumbers: true//行号
    });

    clientReport_undo_toolbar.dialog({
        title: "上传工资表",
        closed: true,
        modal: true,
        width: 200,
        top:100,
        height: 280/*,
        buttons: "#emp_buttons"*/
    });
    $("#inputTimeYear").combobox({
        url: "/dictionaryDetail/selectByParentSn.do?sn=time",
        valueField: 'name',
        textField: 'intro',
        multiple: false//不支持多选
    });
});
