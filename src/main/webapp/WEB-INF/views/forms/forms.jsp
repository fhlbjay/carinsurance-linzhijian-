<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/plugin/artDialog/jquery.artDialog.source.js?skin=blue"></script>
    <script type="text/javascript" src="/static/plugin/artDialog/iframeTools.source.js"></script>
    <script type="text/javascript" src="/static/js/forms/forms.js"></script>
    <script type="text/javascript">
        $(function(){
            //图表改变事件
            $(".chart").click(function () {
                var url = $(this).data("url");
                $.dialog.open(url+$("#searchForm").serialize(),{
                    id:"saleChartByLine",
                    title:"客户报表"
                })
            })
        })
    </script>
</head>

<body>
        <table id="forms_datagrid"></table>
        <div id="forms_toolbar">
            <form id="searchForm">
            时间:<input id="beginDate" type="text" class="easyui-datebox" name="beginDate"/>
            ~ <input id="endDate" type="text" class="easyui-datebox" name="endDate"/>
                <table>
                    <tr>
                        <td>分组:
                            <select id="groupType" class="easyui-combobox" data-options="panelHeight:'auto',width:118" name="groupType">
                                <option value="cl.name">客户</option>
                                <option value="date_format(cl.inputTime,'%Y-%m')">保单日期(月)</option>
                                <option value="date_format(cl.inputTime,'%Y-%m-%d')">保单日期(日)</option>
                            </select>
                        </td>
                        <td width="50px"></td>
                        <td><a class="easyui-linkbutton chart" iconCls="icon-large-chart" plain="true"
                           data-url="/chart/listbyline.do?">柱状图</a>
                         <td width="70px"></td>
                         <td><a class="easyui-linkbutton chart" iconCls="icon-filter" plain="true"
                           data-url="/chart/listbypie.do?">饼状图</a>
                         </td>
                        <td width="60px"></td>
                        <td><a class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a> </td>
                    </tr>
                </table>
            </form>
        </div>
</body>
</html>
