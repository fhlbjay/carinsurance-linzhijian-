<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/client/pool.js"></script>
</head>
<body>
<table id="pool_datagrid"></table>
<div id="pool_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-user" plain=true data-cmd="Absorb">吸纳</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a><br/>
    关键字:<input id="keywords" name="keywords" class="easyui-textbox"/>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="searchS"></a>
</div>
<div id="pool_buttons">
</div>
<div id="pool_dialog">
</div>
</body>
</html>
