<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/order/order.js"></script>
</head>
<body>
<table id="order_datagrid"></table>
<div id="order_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-add" plain=true data-cmd="add">新增</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="edit">编辑</a>
    <a id="changeBtn" class="easyui-linkbutton" iconCls="icon-remove" plain=true data-cmd="changeState">审核</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a>
    <!-- 查询 -->
    <input id="keywords" name="keywords" class="easyui-textbox" prompt="定金客户"/>
    <input id="beginDate" name="beginDate" class="easyui-datebox" prompt="选择开始日期"/>
    <input id="endDate" name="endDate" class="easyui-datebox" prompt="选择结束日期"/>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="searchS">搜索</a>
</div>

<div id="order_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveOrUpdate">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancel">取消</a>
</div>

<div id="order_dialog">
    <form id="order_form" method="post">
        <input type="hidden" name="id" class="easyui-testbox"/>
        <table align="center" style="margin-top: 15px;">
            <tr>
                <td>定金客户</td>
                <td><input name="clientorder" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>总金额</td>
                <td><input name="totalsum" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>定金金额</td>
                <td><input name="sum" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>摘要</td>
                <td><input name="intro" class="easyui-textbox"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
