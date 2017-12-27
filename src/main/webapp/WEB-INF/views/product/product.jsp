<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/product/product.js"></script>
</head>
<body>
<table id="product_datagrid"></table>
<div id="product_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-add" plain=true data-cmd="add">新增</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="edit">编辑</a>
    <a id="changeBtn" class="easyui-linkbutton" iconCls="icon-remove" plain=true data-cmd="changeState">合作失效</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a>
</div>
<div id="product_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveOrUpdate">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancel">取消</a>
</div>
<div id="product_dialog">
    <form id="product_form" method="post">
        <input type="hidden" name="id" class="easyui-testbox"/>
        <table align="center" style="margin-top: 15px;">
            <tr>
                <td>保险名称：</td>
                <td><input name="name" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>保险公司：</td>
                <td>
                    <select id="company" name="company.id" class="easyui-combobox" style="width: 140px;"
                            panelHeight="auto"></select>
                </td>
            </tr>
            <tr>
                <td>保险年限：</td>
                <td><input name="years" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>保险总价：</td>
                <td><input name="amount" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>基本年费：</td>
                <td><input name="yearsAmount" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>当前状态：</td>
                <td>
                    <select id="status" name="status" class="easyui-combobox" style="width: 140px;" panelHeight="auto">
                        <option value="0">不可用</option>
                        <option value="1">可用</option>
                    </select>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
