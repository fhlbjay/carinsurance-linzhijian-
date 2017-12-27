$(function () {
    var product_datagrid = $("#product_datagrid");
    var product_dialog = $("#product_dialog");
    var product_form = $("#product_form");

    var onData = {
        add: function add() {
            product_form.form("clear");
            $("#status").combobox("setValue", 0);
            product_dialog.dialog("setTitle", "新增产品").dialog("open");
        },
        edit: function edit() {
            var selected = product_datagrid.datagrid("getSelected");
            if (selected) {
                product_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            product_dialog.dialog("setTitle", "编辑产品").dialog("open");
        },
        cancel: function cancel() {
            product_dialog.dialog("close");
        },
        reld: function reld() {
            product_datagrid.datagrid("reload");
        },
        saveOrUpdate: function saveOrUpdate() {
            product_form.form("submit", {
                url: "/product/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            product_dialog.dialog("close");
                            product_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                }
            });
        },
        changeState: function changeState() {
            var selected = product_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/product/changeState.do", {id: selected.id}, function () {
                    product_datagrid.datagrid("reload");
                });
            }
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    product_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/product/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'name', title: '保险名称', width: 100},
            {
                field: 'company', title: '保险公司', width: 100, formatter: function (value, row, index) {
                return value ? value.name : "";
            }
            },
            {field: 'years', title: '保险年限', width: 100},
            {field: 'amount', title: '保险总价', width: 100},
            {field: 'yearsAmount', title: '基本年费', width: 100},
            {
                field: 'status', title: '状态', width: 100, formatter: function (value, row, index) {
                return value ? "可用" : "<font color='red'>不可用</font>";
            }
            }
        ]],
        toolbar: '#product_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true,
        onClickRow: function (index, row) {
            var selected = product_datagrid.datagrid("getSelected");
            var str = "生效";
            if (selected.status) {
                str = "失效";
            }
            $("#changeBtn").linkbutton({
                text: str
            });
        }
    });

    product_dialog.dialog({
        title: "保险产品编辑",
        closed: true,
        modal: true,
        width: 400,
        height: 350,
        buttons: "#product_buttons"
    });

    $("#company").combobox({
        url: "/company/list.do",
        valueField: 'id',
        textField: 'name'
    });
});
