<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/menu/menu.js"></script>
</head>
<body>
<table id="menu_datagrid"></table>
<div id="menu_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-add" plain=true data-cmd="add">新增</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="edit">编辑</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a>
</div>
<div id="menu_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveOrUpdate">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancel">取消</a>
</div>
<div id="menu_dialog">
    <form id="menu_form" method="post">
        <input type="hidden" name="id" class="easyui-testbox"/>
        <table align="center" style="margin-top: 15px;">
            <tr>
                <td>菜单名称：</td>
                <td><input name="text" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>URL：</td>
                <td><input name="url" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>父菜单：</td>
                <td>
                    <select id="menu_parent" name="parentMenu.id" class="easyui-combobox" style="width: 140px;"
                            panelHeight="auto"></select>
                </td>
            </tr>
            <tr>
                <td>权限：</td>
                <td>
                    <select id="permission" name="permission.id" class="easyui-combobox" style="width: 140px;"
                            panelHeight="auto"></select>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
