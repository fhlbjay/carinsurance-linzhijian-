<%--
  Created by IntelliJ IDEA.
  User: lz
  Date: 2017/12/24
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>凉凉车险</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="/static/plugin/ft5_81_form/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/plugin/ft5_81_form/css/animate.css">
    <link rel="stylesheet" href="/static/plugin/ft5_81_form/css/style.css">
    <!-- Modernizr JS -->
    <script src="/static/plugin/ft5_81_form/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/static/plugin/ft5_81_form/js/respond.min.js"></script>
    <![endif]-->

</head>
<body class="style-3">

<div class="container" id="mydiv">
    <div class="row">
        <div class="col-md-4 col-md-push-8">
            <!-- Start Sign In Form -->
            <form id="loginForm" class="fh5co-form animate-box" data-animate-effect="fadeInRight">
                <h2>登录</h2>
                <div class="form-group">
                    <label for="username" class="sr-only">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Username" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="remember"><input type="checkbox" id="remember">记住我</label>
                </div>
                <div class="form-group">
                    <p>没有注册? <a href="JavaScript:;" id="a_alt2">注册</a> | <a href="JavaScript:;" id="a_alt">忘记密码?</a></p>
                </div>
                <div class="form-group">
                    <input type="button" value="登录" class="btn btn-primary" onclick="checkLogin()">
                </div>
            </form>
            <!-- END Sign In Form -->
        </div>
    </div>
    <div class="row" style="padding-top: 60px; clear: both;">
        <div class="col-md-12 text-center">
            <p><small>&copy; 版权所有 © 凉凉车险有限公司 &copy; 未经许可不得复制、转载或摘编，违者必究！</small></p>
        </div>
    </div>
</div>
<!-- jQuery -->
<script src="/static/plugin/ft5_81_form/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/static/plugin/ft5_81_form/js/bootstrap.min.js"></script>
<!-- Placeholder -->
<script src="/static/plugin/ft5_81_form/js/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="/static/plugin/ft5_81_form/js/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="/static/plugin/ft5_81_form/js/main.js"></script>
<script type="text/javascript">
    window.onload = function() {
        //配置
        var config = {
            vx: 4,	//小球x轴速度,正为右，负为左
            vy: 4,	//小球y轴速度
            height: 2,	//小球高宽，其实为正方形，所以不宜太大
            width: 2,
            count: 210,		//点个数
            color: "121, 162, 185", 	//点颜色
            stroke: "180,105,255", 		//线条颜色
            dist: 6000, 	//点吸附距离
            e_dist: 20000, 	//鼠标吸附加速距离
            max_conn: 10 	//点到点最大连接数
        };
        //调用
        CanvasParticle(config);
    }
</script>
<script type="text/javascript" src="/static/plugin/CanvasParticles/canvas-particle.js"></script>
<script type="text/javascript" >
    $("#a_alt").click(function () {
        alert("密码都记不住,滚啊");
    });
    $("#a_alt2").click(function () {
        alert("还想注册?滚!");
    });
    function checkLogin() {
        $.post("/login.do", $("#loginForm").serialize(), function (data) {
            data = $.parseJSON(data);
            if (data.flag) {window.parent.location.href = "/index.do"
                } else {
                alert(data.msg);
            }
        });
    }
</script>
</body>
</html>
