$(function () {
    var developAndOffRecord_datagrid = $("#developAndOffRecord_datagrid");

    var onData = {
        reld: function reld() {
            developAndOffRecord_datagrid.datagrid("reload");
        },
        searchS: function searchS() {
            developAndOffRecord_datagrid.datagrid("load", {
                keywords: $("#client").textbox("getValue"),
                deptId: $("#inChargeUser").textbox("getValue"),
                beginDate: $("#beginDate").textbox("getValue"),
                endDate: $("#endDate").textbox("getValue")
            });
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    developAndOffRecord_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/developAndLoseRecord/queryOff.do',
        singleSelect: true,
        columns: [[
            {field: 'date', title: '时间', width: 100},
            {
                field: 'client', title: '客户', width: 100, formatter: function (value, row, index) {
                console.log(value)
                return value ? value.name : "";
            }
            },
            {
                field: 'inChargeUser', title: '负责人', width: 100, formatter: function (value, row, index) {
                return value ? value.username : "";
            }
            },
            {field: 'cause', title: '详细原因', width: 100}
        ]],
        striped: true,
        pagination: true,
        rownumbers: true,
        toolbar: '#developAndOffRecord_toolbar'
    })
});
