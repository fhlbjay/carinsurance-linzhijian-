<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>


    <script type="text/javascript" src="/static/js/clientReport/clientReport.js"></script>
    <script type="text/javascript" src="/static/plugin/artDialog/plugins/iframeTools.source.js"></script>
</head>
<body>
<table id="clientReport_datagrid"></table>

<div id="clientReport_toolbar">
    开始
    <input id="beginTime" name="beginTime" class="easyui-datebox" prompt="选择开始日期"/>
    结束
    <input id="endTime" name="endTime" class="easyui-datebox" prompt="选择结束日期"/>
    分组类型<input id="inputTimeYear"  name="inputTimeYear"/>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="search">查询


    </a>


</div>
<div id="clientReport_undo_toolbar" class="easyui-dialog">
    <form id="clientReport_form" action="/clientReport/import.do" method="post" enctype="multipart/form-data">
        <input type="file" name="file"/>

        <input type="submit" value="提交">
    </form>
</div>
</body>
</html>
