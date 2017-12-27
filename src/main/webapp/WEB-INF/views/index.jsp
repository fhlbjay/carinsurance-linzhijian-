<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>凉凉车险有限公司</title>
    <link type="text/css" href="/static/plugin/egpp_8_edmin/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="/static/plugin/egpp_8_edmin/bootstrap/css/bootstrap-responsive.min.css"
          rel="stylesheet">
    <link type="text/css" href="/static/plugin/egpp_8_edmin/css/theme.css" rel="stylesheet">
    <link type="text/css" href="/static/plugin/egpp_8_edmin/images/icons/css/font-awesome.css" rel="stylesheet">
    <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
          rel='stylesheet'>
    <style type="text/css">
        .pause {
            background-position: 0 bottom;
        }
        .mscBtn {
            height: 25px;
            display: block;
        }
    </style>
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <i class="icon-reorder shaded"></i>
            </a>
            <a class="brand" href="index.jsp">
                一首凉凉 为您送行!
            </a>
            <div class="nav-collapse collapse navbar-inverse-collapse">
                <ul class="nav nav-icons">
                    <li class="active"><a class="mscBtn" style="cursor:pointer;" id="audioBtn">
                        <i class="icon-music"></i>
                    </a></li>
                    <li><a href="404.jsp">
                        <i class="icon-eye-open"></i>
                    </a></li>
                    <li class="active"><a class="mscBtn" style="cursor:pointer;" id="audioCat">
                        <i class="icon-dashboard"></i>
                    </a></li>
                </ul>
                <form class="navbar-search pull-left input-append" action="#">
                    <input type="text" class="span3">
                    <button class="btn" type="button">
                        <i class="icon-search"></i>
                    </button>
                </form>
                <ul class="nav pull-right">
                    <li><a><shiro:principal property="username"/></a></li>
                    <li class="nav-user dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="../../static/img/1.jpg" class="nav-avatar"/>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="javaScript:;" id="sign">签到</a></li>
                            <li><a href="javaScript:;" id="out">退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.nav-collapse -->
        </div>
    </div><!-- /navbar-inner -->
</div><!-- /navbar -->


<div class="wrapper" id="mydiv">
    <div class="container">
        <div class="row">
            <div class="span3">
                <div class="sidebar" id="">
                    <ul class="widget widget-menu unstyled">
                        <li class="name">
                            <a class="collapsed" data-toggle="collapse" href="#togglePages0">
                                <i class="menu-icon icon-cog"></i>
                                <i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
                                系统管理
                            </a>
                            <ul id="togglePages0" class="collapse unstyled" data-id="1">
                            </ul>
                        </li>
                    </ul>
                    <ul class="widget widget-menu unstyled">
                        <li class="name">
                            <a class="collapsed" data-toggle="collapse" href="#togglePages1">
                                <i class="menu-icon icon-table"></i>
                                <i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
                                客户管理
                            </a>
                            <ul id="togglePages1" class="collapse unstyled" data-id="10">
                            </ul>
                        </li>
                    </ul>
                    <ul class="widget widget-menu unstyled">
                        <li class="name">
                            <a class="collapsed" data-toggle="collapse" href="#togglePages2">
                                <i class="menu-icon icon-bar-chart"></i>
                                <i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
                                保单管理
                            </a>
                            <ul id="togglePages2" class="collapse unstyled" data-id="23">
                            </ul>
                        </li>
                    </ul>
                    <ul class="widget widget-menu unstyled">
                        <li class="name">
                            <a class="collapsed" data-toggle="collapse" href="#togglePages3">
                                <i class="menu-icon icon-paste"></i>
                                <i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
                                信息管理
                            </a>
                            <ul id="togglePages3" class="collapse unstyled" data-id="26">
                            </ul>
                        </li>
                    </ul>
                    <ul class="widget widget-menu unstyled">
                        <li class="name">
                            <a class="collapsed" data-toggle="collapse" href="#togglePages4">
                                <i class="menu-icon icon-book"></i>
                                <i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
                                理赔管理
                            </a>
                            <ul id="togglePages4" class="collapse unstyled" data-id="30">
                            </ul>
                        </li>
                    </ul>
                    <ul class="widget widget-menu unstyled">
                        <li class="name">
                            <a class="collapsed" data-toggle="collapse" href="#togglePages5">
                                <i class="menu-icon icon-book"></i>
                                <i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
                                报表管理
                            </a>
                            <ul id="togglePages5" class="collapse unstyled" data-id="39">
                            </ul>
                        </li>
                    </ul>
                </div><!--/.sidebar-->
            </div><!--/.span3-->

            <div class="span9">
                <div class="content">

                    <div class="module">
                        <div class="module-head">
                            <h3 id="adress">当前位置:主页</h3>
                        </div>
                        <div class="module-body">
                            <%--正中间的页面--%>
                            <iframe name="right" id="rightMain" src="/static/img/main.jpg" frameborder="no" scrolling="auto"
                                    width="100%" height="75%"
                                    allowtransparency="true"></iframe>
                        </div>
                    </div>
                </div><!--/.content-->
            </div><!--/.span9-->
        </div>
    </div><!--/.container-->
</div><!--/.wrapper-->

<div class="footer">
    <div class="container">
        <b class="copyright">&copy; 版权所有 © 凉凉车险有限公司 © 未经许可不得复制、转载或摘编，违者必究！
        </b>
    </div>
</div>
<li id="tmp_li" hidden="true">
    <a href="javascript:;" class="a_url" data-url="">
        <i class="icon-inbox"></i>
    </a>
</li>

<audio id="bgMusic" hidden src="/static/music/liangliang.mp3"></audio>
<audio id="catMusic" hidden src="/static/music/cat.mp3"></audio>
<audio id="bsm" hidden src="../../static/music/liangliang.mp3"></audio>
<script src="/static/plugin/egpp_8_edmin/scripts/jquery-1.9.1.min.js"></script>
<script src="/static/plugin/egpp_8_edmin/scripts/jquery-ui-1.10.1.custom.min.js"></script>
<script src="/static/plugin/egpp_8_edmin/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/plugin/egpp_8_edmin/scripts/datatables/jquery.dataTables.js"></script>
<script type="text/javascript" src="/static/plugin/artDialog/jquery.artDialog.source.js?skin=black"></script>
<script type="text/javascript" src="/static/plugin/artDialog/iframeTools.source.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.datatable-1').dataTable();
        $('.dataTables_paginate').addClass("btn-group datatable-pagination");
        $('.dataTables_paginate > a').wrapInner('<span />');
        $('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
        $('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
    });
    for (var i = 0; i < 6; i++) {
        var id = $("#togglePages" + i).data("id");
        /*使用同步请求,可以在请求执行完之后再进行迭代*/
        $.ajax({
            url: "/menu/selectByParentIdAndEmployeeId.do",
            data: {employeeId: <shiro:principal property="id"/>, parentId: id},
            async: false,
            success: function (data) {
                for (var j = 0; j < data.length; j++) {
                    var li = $("#tmp_li").clone(true);
                    li.find("a").attr("data-url", data[j].url);
                    li.prop("hidden", false);
                    li.find("a").html("");
                    var tt = '<i class="icon-inbox"></i>';
                    li.find("a").html(tt + data[j].text);
                    li.appendTo($("#togglePages" + i));
                }
            }
        });
    }
    $(".a_url").click(function () {
        $("#adress").text("");
        var url = $(this).data("url");
        $("#rightMain").prop("src", url);
        var abb = $(this).closest(".name").find("a :first").text();
        var adress = $(this).text();
        $("#adress").text("当前位置:" + abb +">"+ adress);
    })
</script>
<script type="text/javascript">
    $(function () {
        var music = document.getElementById("bgMusic");
        $("#audioBtn").click(function () {
            if (music.paused) {
                music.play();
                $("#audioBtn").removeClass("pause").addClass("play");
            } else {
                music.pause();
                $("#audioBtn").removeClass("play").addClass("pause");
            }
        });
    });
    $(function () {
        var music = document.getElementById("catMusic");
        $("#audioCat").click(function () {
            if (music.paused) {
                music.play();
                $("#audioCat").removeClass("pause").addClass("play");
            } else {
                music.pause();
                $("#audioCat").removeClass("play").addClass("pause");
            }
        });
    });
    //签到
    $("#sign").click(function () {
        $.get("/checkingin/sign.do",function (data) {
            if(data.flag){
                $.dialog({
                    title : "温馨提示",
                    content: '已签到成功',
                    ok:true,
                    cancel:true
                })
            }
        },"json");
    });
    //退出
    $("#out").click(function () {
        window.location.href="/logOut";
    })
</script>
</body>
</html>
