<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/plugin/artDialog/jquery.artDialog.source.js?skin=blue"></script>
    <script type="text/javascript" src="/static/plugin/artDialog/iframeTools.source.js"></script>
    <script src="/static/plugin/echarts/echarts-all.js"></script>
        <script type="text/javascript" >
            $(function(){

                // 基于准备好的dom，初始化echarts图表
                var myChart = echarts.init(document.getElementById('main'));

                var option = {
                    title : {
                        text: '销售报表',
                        subtext: '按${groupType}分组',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        //formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },

                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true,
                                type: ['pie', 'funnel'],
                                option: {
                                    funnel: {
                                        x: '25%',
                                        width: '50%',
                                        funnelAlign: 'center',
                                    }
                                }
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    series : [
                        {
                            name:'访问来源',
                            type:'pie',
                            radius : ['30%', '60%'],
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : true
                                    },
                                    labelLine : {
                                        show : true,
                                        length:40
                                    }
                                },
                                emphasis : {
                                    label : {
                                        show : true,
                                        position : 'center',
                                        textStyle : {
                                            fontSize : '30',
                                            fontWeight : 'bold'
                                        }
                                    }
                                }
                            },
                            data:${groupList},
                        }
                    ]
                };

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

