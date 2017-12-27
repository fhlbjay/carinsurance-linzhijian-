<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/role/role.js"></script>
</head>
<body>
<table id="rol_datagrid"></table>
<div id="rol_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-add" plain=true data-cmd="add">新增</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="edit">编辑</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a>
</div>
<div id="rol_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveOrUpdate">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancel">取消</a>
</div>
<div id="rol_dialog">
    <form id="rol_form" method="post">
        <input type="hidden" name="id" class="easyui-testbox"/>
        <table align="center" style="margin-top: 15px;">
            <tr>
                <td>编码：<input name="sn" class="easyui-textbox"/></td>
                <td>角色名：<input name="name" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>
                    当前权限：<table id="selfPermissions"></table>
                </td>
                <td>
                    全部权限：<table id="allPermissions"></table>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
