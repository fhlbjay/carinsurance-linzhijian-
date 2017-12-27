<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/developAndOffRecord/developOffOffRecord.js"></script>
</head>
<body>
<table id="developAndOffRecord_datagrid"></table>
<div id="developAndOffRecord_toolbar">
    <input id="inChargeUser" name="inChargeUser" class="easyui-textbox" prompt="输入负责人"/>
    <input id="client" name="client" class="easyui-textbox" prompt="输入客户"/>
    <input id="beginDate" name="beginDate" class="easyui-datebox" prompt="选择开始日期"/>
    <input id="endDate" name="endDate" class="easyui-datebox" prompt="选择结束日期"/>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="searchS">搜索</a>
    <a class="easyui-linkbutton" iconCls="icon-reload" plain=true data-cmd="reld">刷新</a>
</div>
</body>
</html>
