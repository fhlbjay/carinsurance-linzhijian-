$(function () {
    var car_datagrid = $("#car_datagrid");
    var car_dialog = $("#car_dialog");
    var car_form = $("#car_form");
    var carBrand = $("#carBrand");

    var onData = {
        edit: function edit() {
            var selected = car_datagrid.datagrid("getSelected");
            if (selected) {
                car_form.form("load", selected);
                carBrand.combobox("setValue", selected.carBrand.id);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            car_dialog.dialog("setTitle", "编辑车辆").dialog("open");
        },
        cancel: function cancel() {
            car_dialog.dialog("close");
        },
        reld: function reld() {
            car_datagrid.datagrid("reload");
        },
        saveOrUpdate: function saveOrUpdate() {
            car_form.form("submit", {
                url: "/car/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            car_dialog.dialog("close");
                            car_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                }
            });
        },
        searchS: function searchS() {
            car_datagrid.datagrid("load", {
                keywords: $("#keywords").textbox("getValue")
            });
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });

    car_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/car/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {
                field: 'bill', title: '被保人', width: 100, formatter: function (value, row, index) {
                    console.log(row)
                //return value ? value.recognizee.name : "";
            }
            },
            {
                field: 'carBrand', title: '车辆品牌', width: 100, formatter: function (value, row, index) {
                return value ? value.name : "";
            }
            },
            {field: 'carNumber', title: '车牌号', width: 100},
            {field: 'valuation', title: '估价', width: 100},
            {
                field: 'type', title: '车辆用途', width: 100, formatter: function (value, row, index) {
                if (value == 0) {
                    return '载客';
                } else if (value == 1) {
                    return '普通载货';
                } else if (value == 2) {
                    return '危险品';
                } else if (value == 3) {
                    return '特殊';
                }
                return '<font color=\'red\'>异常</font>';
            }
            },
            {
                field: 'size', title: '车辆规格', width: 100, formatter: function (value, row, index) {
                if (value == 0) {
                    return '小型';
                } else if (value == 1) {
                    return '中型';
                } else if (value == 2) {
                    return '大型';
                } else if (value == 3) {
                    return '特大型';
                }
                return '<font color=\'red\'>异常</font>';
            }
            }
        ]],
        toolbar: '#car_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true
    });

    car_dialog.dialog({
        title: "车辆",
        closed: true,
        modal: true,
        width: 400,
        height: 350,
        buttons: "#car_buttons"
    });

    carBrand.combobox({
        url: "/dictionaryDetail/selectByParentSn.do?sn=carBrand",
        valueField: 'id',
        textField: 'name'
    });

});
