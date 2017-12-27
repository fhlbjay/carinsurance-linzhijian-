<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/client/client.js"></script>
</head>
<body>
<table id="client_datagrid"></table>
<div id="client_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-add" plain=true data-cmd="add">新增</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="edit">编辑</a>
    <a class="easyui-linkbutton" iconCls="icon-move" plain=true data-cmd="move">移入资源池</a>
    <a class="easyui-linkbutton" iconCls="icon-move2" plain=true data-cmd="change">移交</a>
    <a class="easyui-linkbutton" iconCls="icon-defeated" plain=true data-cmd="defeated">开发失败</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a><br/>
    关键字:<input id="keywords" name="keywords" class="easyui-textbox" prompt="姓名或手机号"/>
    <select id="status" name="status" class="easyui-combobox" style="width: 140px;"
            panelHeight="auto">
        <option value="0">潜在客户</option>
        <option value="-1">开发失败</option>
    </select>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="searchS"></a>
</div>
<div id="client_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveOrUpdate">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancel">取消</a>
</div>
<div id="client_dialog">
    <form id="client_form" method="post">
        <input type="hidden" name="id" class="easyui-testbox"/>
        <table align="center" style="margin-top: 15px;">
            <tr>
                <td>客户名:</td>
                <td><input name="name" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>年龄:</td>
                <td><input name="age" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>性别:</td>
                <td>
                    <select name="gender" class="easyui-combobox" style="width: 147px;" panelHeight="auto">
                        <option value="1">男</option>
                        <option value="0">女</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>身份证号码:</td>
                <td><input name="idCard" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>职业:</td>
                <td>
                    <select id="client_job" name=job.id class="easyui-combobox" style="width: 147px;"
                            panelHeight="auto">
                    </select>
                </td>
            </tr>
            <tr>
                <td>收入水平:</td>
                <td>
                    <select id="client_salary" name=salaryLevel.id class="easyui-combobox" style="width: 147px;"
                            panelHeight="auto">
                    </select>
                </td>
            </tr>
            <tr>
                <td>客户来源:</td>
                <td>
                    <select id="client_way" name="customerSource.id" class="easyui-combobox" style="width: 147px;"
                            panelHeight="auto">
                    </select>
                </td>
            </tr>
            <tr>
                <td>电话号码:</td>
                <td><input name="tel" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>邮箱:</td>
                <td><input name="email" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>qq:</td>
                <td><input name="qq" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>微信:</td>
                <td><input name="weChat" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>录入时间:</td>
                <td><input name="inputTime" class="easyui-datebox"/></td>
            </tr>
        </table>
    </form>
</div>
<div id="inputUser_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveChangeRecord">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancelInputUser">取消</a>
</div>
<div id="inputUser_dialog">
    <form id="inputUser_form" method="post">
        <table align="center" style="margin-top: 15px;">
            <input name="id" type="hidden"/>
            <tr>
                <td>客户名:</td>
                <td><input name="name" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>原市场经理:</td>
                <td>
                    <select id="oldMan" name="oldMan.id" class="easyui-combobox" style="width: 147px;"
                            panelHeight="auto"></select>
                </td>
            </tr>
            <tr>
                <td>现市场经理:</td>
                <td>
                    <select id="newMan" name="newMan.id" class="easyui-combobox" style="width: 147px;"
                            panelHeight="auto"></select>
                </td>
            </tr>
            <tr>
                <td>原因:</td>
                <td><input name="cause" class="easyui-textbox"/></td>
            </tr>
        </table>
    </form>
</div>
<div id="defeat_dialog">
    <form id="defeat_form" method="post">
        <table align="center" style="margin-top: 15px;">
            <tr>
                <td>失败原因:</td>
                <td><input name="cause" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>时间:</td>
                <td><input name="date" class="easyui-datebox"/></td>
            </tr>
        </table>
    </form>
</div>
<div id="defeat_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="save">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="defeatcancel">取消</a>
</div>
</body>
</html>
