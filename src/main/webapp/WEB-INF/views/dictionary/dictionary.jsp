<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/dictionary/dictionary.js"></script>
</head>
<body>
<table id="parent_datagrid"></table>
<table id="son_datagrid"></table>
<div id="son_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-add" plain=true data-cmd="add">新增</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="edit">编辑</a>
    <a id="changeBtn" class="easyui-linkbutton" iconCls="icon-close" plain=true data-cmd="changeState">禁用</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a>
</div>
<div id="son_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveOrUpdate">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancel">取消</a>
</div>
<div id="son_dialog">
    <form id="son_form" method="post">
        <input type="hidden" name="id" class="easyui-testbox"/>
        <table align="center" style="margin-top: 15px;">
            <tr>
                <td>字典明细名称：</td>
                <td><input name="name" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>字典明细简介：</td>
                <td><input name="intro" class="easyui-textbox"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
