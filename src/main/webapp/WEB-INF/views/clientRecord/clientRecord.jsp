<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/clientRecord/clientRecord.js"></script>
</head>
<body>
<table id="clientRecord_datagrid"></table>
<div id="clientRecord_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-add" plain=true data-cmd="add">新增</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="edit">编辑</a>
    <a class="easyui-linkbutton" iconCls="icon-remove" plain=true data-cmd="move">删除</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a><br/>
</select>
    <input id="beginDate" name="beginDate" class="easyui-datebox" prompt="选择开始日期"/>
    <input id="endDate" name="endDate" class="easyui-datebox" prompt="选择结束日期"/>
    <input id="client" name="client" class="easyui-textbox" prompt="客户"/>
    <input id="inputUser" name="inputUser" class="easyui-textbox" prompt="创建人"/>
    <select id="wayId" name="wayId" class="easyui-combobox" style="width: 140px;"
            panelHeight="auto" prompt="实施方式"></select>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="searchS">搜索</a>
</div>
<div id="clientRecord_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveOrUpdate">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancel">取消</a>
</div>
<div id="clientRecord_dialog">
    <form id="clientRecord_form" method="post">
        <input type="hidden" name="id" class="easyui-testbox"/>
        <table align="center" style="margin-top: 15px;">
            <input type="hidden" id="status" name="status" class="easyui-textbox">
            <tr>
                <td>计划时间:</td>
                <td><input name="date" class="easyui-datebox"/></td>
            </tr>
            <tr>
                <td>客户:</td>
                <td>
                    <select id="clientId" name=client.id class="easyui-combobox" style="width: 147px;"
                            panelHeight="auto">
                    </select>
                </td>
            </tr>
            <tr>
                <td>计划主题:</td>
                <td><input name="theme" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>实施方式:</td>
                <td>
                    <select id="way" name="way.id" class="easyui-combobox" style="width: 147px;"
                            panelHeight="auto">
                    </select>
                </td>
            </tr>
            <tr>
                <td>详情:</td>
                <td><input name="details" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>实施结果:</td>
                <td><input name="result" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>备注:</td>
                <td><input name="remark" class="easyui-textbox"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
