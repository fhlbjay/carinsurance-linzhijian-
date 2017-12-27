$(function () {
    var sysl_datagrid = $("#sysl_datagrid");

    var onData = {
        reld: function reld() {
            sysl_datagrid.datagrid("reload");
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    sysl_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/systemLog/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {
                field: 'opUser', title: '操作用户', width: 100, formatter: function (value, row, index) {
                return value ? value.username : "";
            }
            },
            {field: 'opTime', title: '操作时间', width: 100},
            {field: 'opIp', title: '登录IP', width: 100},
            {field: 'function', title: '使用功能', width: 100},
            {field: 'params', title: '操作参数信息', width: 100}
        ]],
        toolbar: '#sysl_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true
    });

});
