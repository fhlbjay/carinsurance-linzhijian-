<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/plugin/artDialog/jquery.artDialog.source.js?skin=blue"></script>
    <script type="text/javascript" src="/static/plugin/artDialog/iframeTools.source.js"></script>
    <script src="/static/plugin/echarts/echarts-all.js"></script>
    <script type="text/javascript">
        $(function(){
            // 基于准备好的dom，初始化echarts图表
            var myChart = echarts.init(document.getElementById('main'));
            var option = {
                title : {
                    text: '报表',
                    subtext: '按${groupType}分组',
                    x:'center'
                },
                tooltip : {
                    trigger: 'axis'
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                grid:{
                    y:90
                },
                xAxis : [
                    {
                        type : 'category',
                        data : ${groupTypeList},
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                 series : [
                    {
                        name:'销售额',
                        type:'bar',
                        data:${totalCountList},
                         markPoint : {
                            data : [
                                {type : 'max', name: '最大值'},
                                {type : 'min', name: '最小值'}
                            ]
                        },
                        markLine : {
                            data : [
                                {type : 'average', name: '平均值'}
                            ]
                        } 
                    } 
                ]
            } 
            // 为echarts对象加载数据
            myChart.setOption(option);
        })
    </script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="height:400px;width:650px"></div>
</body>
</html>

