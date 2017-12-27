$(function () {
    var order_datagrid = $("#order_datagrid");
    var order_dialog = $("#order_dialog");
    var order_form = $("#order_form");

    var onData = {
        add: function add() {
            order_form.form("clear");
            order_dialog.dialog("setTitle", "新增订单").dialog("open");
        },
        edit: function edit() {
            var selected = order_datagrid.datagrid("getSelected");
            if (selected) {
                order_form.form("load", selected);
            } else {
                $.messager.alert("温馨提示", "请选择需要编辑的行", "info");
                return;
            }
            order_dialog.dialog("setTitle", "编辑部门").dialog("open");
        },
        cancel: function cancel() {
            order_dialog.dialog("close");
        },
        reld: function reld() {
            order_datagrid.datagrid("reload");
        },
        
        saveOrUpdate: function saveOrUpdate() {
            order_form.form("submit", {
                url: "/orderofcontract/saveOrUpdate.do",
                success: function (data) {
                    var jData = $.parseJSON(data);
                    if (jData.flag) {
                        $.messager.alert("温馨提示", "保存成功", "info", function () {
                            order_dialog.dialog("close");
                            order_datagrid.datagrid("reload");
                        });
                    } else {
                        $.messager.alert("温馨提示", jData.msg, "warning");
                    }
                }
            });
        },
        //搜索
        searchS: function searchS() {
            order_datagrid.datagrid("load", {
                keywords: $("#keywords").textbox("getValue"),
                beginDate: $("#beginDate").textbox("getValue"),
                endDate: $("#endDate").textbox("getValue"),
                
            });
        },
        //状态按钮
        changeState: function changeState() {
            var selected = order_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/orderofcontract/changeState.do", {id: selected.id,status:2}, function () {
                    order_datagrid.datagrid("reload");
                });
            }
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });
    
    //页面显示
    order_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/orderofcontract/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'clientorder', title: '定金客户', width: 100},
            {field: 'signtime', title: '签定时间', width: 100},
            {field: 'employeeSeller', title: '销售人员姓名', width: 100, formatter: function (value, row, index) {
                return value?value.username:"";
            }},
            {field: 'totalsum', title: '合同金额', width: 100},
            {field: 'sum', title: '付款金额', width: 100},
            
            {field: 'intro', title: '摘要', width: 100},
            {field: 'employeeModifuser', title: '最近修改人', width: 100,formatter: function (value, row, index) {
                console.log(value);
                return value?value.username:"";
            }},
            {field: 'modifytime', title: '最近修改时间', width: 100},
            {
                field: 'status', title: '状态', width: 100, formatter: function (value, row, index) {
                if(value==2){
                    return '录入合同';
                }else if(value==3){
                    return '生成订单';
                }else if(value==1){
                    return '合同';
                }else if(value==0){
                    return '订单';
                }
            }
            },
        ]],
        toolbar: '#order_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true,
    });

    order_dialog.dialog({
        title: "订单",
        closed: true,
        modal: true,
        width: 400,
        height: 350,
        buttons: "#order_buttons"
    });
    
});
