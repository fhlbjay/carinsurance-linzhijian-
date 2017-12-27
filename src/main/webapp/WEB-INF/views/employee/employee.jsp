<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/employee/employee.js"></script>
</head>
<body>
<table id="emp_datagrid"></table>
<div id="emp_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-add" plain=true data-cmd="add">新增</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="edit">编辑</a>
    <a id="changeBtn" class="easyui-linkbutton" iconCls="icon-user" plain=true data-cmd="changeState">离职</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a>
    <input id="keywords" name="keywords" class="easyui-textbox" prompt="输入用户名或电话"/>
    <select id="deptId" name="deptId" class="easyui-combobox" style="width: 140px;"
            panelHeight="auto" prompt="选择部门"></select>
    <input id="beginDate" name="beginDate" class="easyui-datebox" prompt="选择开始日期"/>
    <input id="endDate" name="endDate" class="easyui-datebox" prompt="选择结束日期"/>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="searchS">搜索</a>
</div>
<div id="emp_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveOrUpdate">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancel">取消</a>
</div>
<div id="emp_dialog">
    <form id="emp_form" method="post">
        <input type="hidden" name="id" class="easyui-textbox"/>
        <table align="center" style="margin-top: 15px;">
            <tr>
                <td>用户名：</td>
                <td><input name="username" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>真实姓名：</td>
                <td><input name="realname" class="easyui-textbox"/></td>
            </tr>
            <tr id="emp_password">
                <td>密码：</td>
                <td><input name="password" class="easyui-passwordbox"/></td>
            </tr>
            <tr>
                <td>电话：</td>
                <td><input name="tel" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td><input name="email" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>部门：</td>
                <td>
                    <select id="emp_dept" name="department.id" class="easyui-combobox" style="width: 140px;"
                            panelHeight="auto"></select>
                </td>
            </tr>
            <tr>
                <td>入职时间：</td>
                <td><input name="inputtime" class="easyui-datebox"/></td>
            </tr>
            <tr>
                <td>是否管理员：</td>
                <td>
                    <select id="admin" name="admin" class="easyui-combobox" style="width: 140px;" panelHeight="auto">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>角色：</td>
                <td>
                    <select id="emp_roles" class="easyui-combobox" style="width: 140px;"
                            panelHeight="auto">
                    </select>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
