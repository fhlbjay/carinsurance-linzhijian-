<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/car/car.js"></script>
</head>
<body>
<table id="car_datagrid"></table>
<div id="car_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="edit">编辑</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a>
    <input id="keywords" name="keywords" class="easyui-textbox" prompt="输入车牌号码"/>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="searchS">搜索</a>
</div>
<div id="car_buttons">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="saveOrUpdate">保存</a>
    <a class="easyui-linkbutton" iconCls="icon-cancel" plain=true data-cmd="cancel">取消</a>
</div>
<div id="car_dialog">
    <form id="car_form" method="post">
        <input type="hidden" name="id" class="easyui-testbox"/>
        <table align="center" style="margin-top: 15px;">
            <tr>
                <td>车辆品牌：</td>
                <td>
                    <select id="carBrand" name="carBrand.id" class="easyui-combobox" style="width: 140px;"
                            panelHeight="auto">
                    </select>
                </td>
            </tr>
            <tr>
                <td>车牌号：</td>
                <td><input name="carNumber" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td>估价：</td>
                <td><input name="valuation" class="easyui-numberbox" data-options="prefix:'¥',precision:2"/></td>
            </tr>
            <tr>
                <td>车辆用途：</td>
                <td>
                    <select name="type" class="easyui-combobox" style="width: 140px;" panelHeight="auto">
                        <option value="0">载客</option>
                        <option value="1">普通载货</option>
                        <option value="2">危险品</option>
                        <option value="3">特殊</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>车辆规格：</td>
                <td>
                    <select name="size" class="easyui-combobox" style="width: 140px;" panelHeight="auto">
                        <option value="0">小型</option>
                        <option value="1">中型</option>
                        <option value="2">大型</option>
                        <option value="3">特大型</option>
                    </select>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
