$(function () {
    var pool_datagrid = $("#pool_datagrid");
    var pool_dialog = $("#pool_dialog");

    var onData = {
        Absorb: function absorb() {
            var selected = pool_datagrid.datagrid("getSelected");
            if (selected) {
                $.messager.confirm('温馨提示', '确认吸纳该用户吗？', function (r) {
                    if (r) {
                        //发送请求,将状态改为潜在客户
                        $.get("/client/absorb.do", {id: selected.id}, function (index, item) {
                            if (index.flag) {
                                $.messager.alert("温馨提示", "吸纳成功", "info");
                            }
                        })
                    }
                    pool_datagrid.datagrid("reload");
                });
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }

        },
        cancel: function cancel() {
            pool_dialog.dialog("close");
        },
        reld: function reld() {
            pool_datagrid.datagrid("reload");
        },
        searchS: function searchS() {
            pool_datagrid.datagrid("load", {
                keywords: $("#keywords").textbox("getValue"),
            });
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    pool_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/pool/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'name', title: '客户姓名', width: 100},
            {field: 'age', title: '年龄', width: 100},
            {field: 'gender', title: '性别', width: 100},
            {field: 'tel', title: '电话', width: 100},
            {field: 'email', title: '邮箱', width: 100},
            {field: 'qq', title: 'qq', width: 100},
            {field: 'weChat', title: '微信', width: 100},
            {
                field: 'job', title: '职业', width: 100, formatter: function (value, row, index) {
                return row.job ? row.job.name : "";
            }
            },
            {
                field: 'salaryLevel', title: '收入水平', width: 100, formatter: function (value, row, index) {
                return row.salaryLevel ? row.salaryLevel.name : "";
            }
            },
            {
                field: 'customerSource', title: '客户来源', width: 100, formatter: function (value, row, index) {
                return row.customerSource ? row.customerSource.name : "";
            }
            },
            {
                field: 'inputUser', title: '创建人', width: 100, formatter: function (value, row, index) {
                return value ? value.username : "";
            }
            },
            {field: 'inputTime', title: '录入时间', width: 100}
        ]],
        toolbar: '#pool_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true
    });


    pool_dialog.dialog({
        title: "资源池",
        closed: true,
        modal: true,
        width: 500,
        height: 470,
        buttons: "#pool_buttons"
    });

});
