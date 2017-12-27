<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/claimsheet/examine.js"></script>
</head>
<body>
<table id="examine_datagrid"></table>


<div id="examine_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="edit">编辑</a>
    <a class="easyui-linkbutton" iconCls="icon-remove" plain=true data-cmd="delete">删除</a>
    <a id="changeBtn" class="easyui-linkbutton" iconCls="icon-ok" plain=true data-cmd="changeStatus1">理赔</a>
    <a id="changeBtn2" class="easyui-linkbutton" iconCls="icon-no" plain=true data-cmd="changeStatus2">拒赔</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a>
    截止到期时间
    <input id="dueTime" name="dueTime" class="easyui-datetimebox" prompt="选择结束日期"/>
    员工:
    <input id="keywords" name="keywords" class="easyui-textbox" prompt="员工"/>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="search">查询</a>
</div>

<div id="examine_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveOrUpdate">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancel">取消</a>
</div>
<div id="examine_dialog">
    <form id="examine_form" method="post">
        <input type="hidden" name="id" class="easyui-testbox"/>
        <table align="center" style="margin-top: 15px;">

            <tr>
                <td>报案人：</td>
                <td><input name="informant" class="easyui-textbox"/></td>
            </tr>

            <tr>
                <td>电话：</td>
                <td><input name="tel" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>翻车地点：</td>
                <td><input name="place" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>翻车时间：</td>
                <td><input name="accidentTime" class="easyui-datetimebox"/></td>
            </tr>
            <tr>
                <td>车牌号：</td>
                <td><input name="remark" class="easyui-textbox"/></td>
            </tr>

            <tr>
                <td>派遣人：</td>
                <td>
                    <select id="emp_claim" name="employee.id" class="easyui-combobox" style="width: 147px;"
                            panelHeight="auto"></select>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
