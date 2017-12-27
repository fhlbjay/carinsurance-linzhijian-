<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/checkingin/checkingin.js"></script>
</head>
<body>

<table id="my_check"></table>

<div id="check_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-add" plain=true data-cmd="sign">签到</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="back">签退</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="updata">补签</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a>
</div>
</body>
</html>
