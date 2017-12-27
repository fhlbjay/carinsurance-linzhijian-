<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/guarantee/guarantee.js"></script>
</head>
<body>
<table id="guarantee_datagrid"></table>


<div id="guarantee_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-add" plain=true data-cmd="add">新增</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="edit">编辑</a>
    <a class="easyui-linkbutton" iconCls="icon-remove" plain=true data-cmd="delete">删除</a>
    <a id="changeBtn" class="easyui-linkbutton" iconCls="icon-sorting" plain=true data-cmd="changeStatus">状态设置</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a>
    截止到期时间
    <input id="dueTime" name="dueTime" class="easyui-datebox" prompt="选择结束日期"/>
    员工:
    <input id="keywords" name="keywords" class="easyui-textbox" prompt="员工"/>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="search">查询</a>
</div>

<div id="guarantee_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveOrUpdate">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancel">取消</a>
</div>
<div id="guarantee_dialog">
    <form id="guarantee_form" method="post">
        <input type="hidden" name="id" class="easyui-testbox"/>
        <table align="center" style="margin-top: 15px;">

            <tr>
                <td>客户：</td>
                <td><input name="client" class="easyui-textbox"/></td>
            </tr>

            <tr>
                <td>产品名字：</td>
                <td><input name="productName" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>到期时间：</td>
                <td><input name="dueTime" class="easyui-datebox"/></td>
            </tr>
            <tr>
                <td>备注：</td>
                <td><input name="remark" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>状态：</td>
                <td>
                    <select id="selected" name="status" class="easyui-combobox" style="width: 140px;" panelHeight="auto">
                        <option value="0">未完成</option>
                        <option value="1">完成</option>
                    </select>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
