<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/wages/wages.js"></script>
</head>
<body>
<table id="wages_datagrid"></table>

<div id="wages_toolbar">
    开始
    <input id="inputTime" name="inputTime" class="easyui-datebox" prompt="选择开始日期"/>
    结束
    <input id="outputTime" name="outputTime" class="easyui-datebox" prompt="选择结束日期"/>
    员工:
    <input id="keywords" name="keywords" class="easyui-textbox" prompt="员工"/>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="search">查询</a>
    <a class="easyui-linkbutton" iconCls="icon-undo" plain=true data-cmd="undo">导入</a>
    <a class="easyui-linkbutton" iconCls="icon-redo" plain=true data-cmd="exportXls">导出</a>
   <%-- <form id="wages_form" action="">
        导入工资文件:
        <input class="easyui-filebox" iconCls="icon-undo"  buttonText="添加文件"></input>
        <input type="submit" value="提交">
    </form>--%>
</div>
<div id="wages_undo_toolbar" class="easyui-dialog"  <%--data-options="width=350,height=100"--%>>
    <form id="wages_form" action="/wages/import.do" method="post" enctype="multipart/form-data">
        <input type="file" name="file"/>
        <%-- <input class="easyui-filebox" iconCls="icon-undo"  buttonText="添加文件"></input>--%>
        <input type="submit" value="提交">
    </form>
</div>



</body>
</html>
