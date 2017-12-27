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
                endDate: $("#endDate").textbox("getValue")
            });
        },
        //状态按钮
        changeState: function changeState() {
            var selected = order_datagrid.datagrid("getSelected");
            if (selected.status==0) {
                $.post("/orderofcontract/changeState.do", {id:selected.id,status:1}, function () {
                    order_datagrid.datagrid("reload");
                });
            }else{
                $.messager.alert('我的消息','订单已审核禁止修改！');
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
            {field: 'employeeSeller', title: '销售人员姓名', width: 100, formatter: function (value, row, index) {
                return value?value.username:"";
            }},
            {field: 'totalsum', title: '总金额', width: 100},
            {field: 'signtime', title: '签定时间', width: 100},
            {field: 'sum', title: '定金金额', width: 100},
            
            {field: 'intro', title: '摘要', width: 100},
            {field: 'employeeModifuser', title: '最近修改人', width: 100,formatter: function (value, row, index) {
                console.log(value);
                return value?value.username:"";
            }},
            {field: 'modifytime', title: '最近修改时间', width: 100},
            {
                field: 'status', title: '状态', width: 100, formatter: function (value, row, index) {
                return value ==0? "订单" : "<font color='red'>合同</font>";
            }
            },
        ]],
        toolbar: '#order_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true,
    });
    //修改弹出界面
    order_dialog.dialog({
        title: "订单",
        closed: true,
        modal: true,
        width: 400,
        height: 350,
        buttons: "#order_buttons"
    });
    
});
