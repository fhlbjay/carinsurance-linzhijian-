$(function () {
    var pemis_datagrid = $("#pemis_datagrid");

    var onData = {
        reld: function reld() {
            $.post("/permission/reload.do", function () {
                pemis_datagrid.datagrid("load");
            });
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    pemis_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/permission/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'name', title: '权限名称', width: 100},
            {field: 'resource', title: '权限表达式', width: 100}
        ]],
        toolbar: '#pemis_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true
    });

});
