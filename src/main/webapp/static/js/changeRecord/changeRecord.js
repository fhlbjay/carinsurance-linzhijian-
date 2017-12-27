$(function () {
    var changeRecord_datagrid = $("#changeRecord_datagrid");

    var onData = {
        reld: function reld() {
            changeRecord_datagrid.datagrid("reload");
        },
        searchS: function searchS() {
            changeRecord_datagrid.datagrid("load", {
                beginDate: $("#beginDate").textbox("getValue"),
                endDate: $("#endDate").textbox("getValue")
            });
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    changeRecord_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/changeRecord/query.do',
        singleSelect: true,
        columns: [[
            {field: 'changeDate', title: '移交时间', width: 100},
            {
                field: 'handler', title: '操作人员', width: 100, formatter: function (value, row, index) {
                return value ? value.username : "";
            }
            },
            {
                field: 'client', title: '客户', width: 100, formatter: function (value, row, index) {
                return value ? value.name : "";
            }
            },
            {
                field: 'oldMan', title: '原市场专员', width: 100, formatter: function (value, row, index) {
                return value ? value.username : "";
            }
            },
            {
                field: 'newMan', title: '现市场专员', width: 100, formatter: function (value, row, index) {
                return value ? value.username : "";
            }
            },
            {field:'cause',title:'详细原因',width:100}
        ]],
        striped: true,
        pagination: true,
        rownumbers: true,
        toolbar: '#changeRecord_toolbar'
    })
});
