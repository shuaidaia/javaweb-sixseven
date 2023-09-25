<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/14
  Time: 19:46
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>UltramanJack</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link rel="stylesheet" type="text/css" href="assets/css/stupid1.css"/>
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid2.css"/>
    <link rel="stylesheet" type="text/css" href="assets/font/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid3.css"/>
    <script type="text/javascript" src="script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".username").blur(function () {
                //ajax提交
                $.get(
                    "memberServlet",
                    {
                        "action": "isExistsName",
                        "name": $(".username").val(),
                        "date": new Date()
                    },
                    function (data) {
                        // console.log(data.isExist);
                        if (data.isExist) {
                            $("span[class='errorMsg']").text("该用户名存在");
                        } else if (!data.regexName) {
                            $("span[class='errorMsg']").text("用户名格式不正确，需要4-10个字符");
                        } else {
                            $("span[class='errorMsg']").text("用户名可用");
                        }

                    },
                    "json"
                )
            })


            //刷新验证码
            $("#codeImg").click(function () {
                this.src = "<%=request.getContextPath()%>/kaptchaServlet?date=" + new Date();
            })

            $("#subbtn").click(function () {
                var usernameVal = $(".username").val();
                var usernamePattern = /^\w{4,10}$/;
                if (!usernamePattern.test(usernameVal)) {
                    $("span[class='errorMsg']").text("用户名格式不正确，需要4-10个字符");
                    return false;
                }

                var passwordVal = $(".psd").val();
                var passwordPattern = /^\w{6,10}$/;
                if (!passwordPattern.test(passwordVal)) {
                    $("span[class='errorMsg']").text("密码格式不正确，需要6-10个字符");
                    return false;
                }

                var repwdVal = $(".repsd").val();
                if (repwdVal != passwordVal) {
                    $("span[class='errorMsg']").text("两次密码不相同");
                    return false;
                }

                var emailVal = $(".email").val();
                var emailPattern = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                if (!emailPattern.test(emailVal)) {
                    $("span[class='errorMsg']").text("email格式不正确");
                    return false;
                }

                var codeText = $("#code").val();
                var trim = $.trim(codeText);
                if (trim == null || codeText == "") {
                    $("span[class='errorMsg']").text("验证码不能为空");
                    return false;
                }
                return true;
            })
        })
    </script>
</head>
<body>
<header>
    <div class="top-nav">
        <div class="flex-row wrapper">
            <div class="flex-col-3">
                <h1 class="top-nav-logo"><img src="assets/img/IMG_2020.PNG" width="167px" height="60px"></h1>
            </div>
            <div class="flex-col-16">
                <ul class="top-nav-center flex-row">
                    <li class="flex-col-4"><h2><a href="cowryServlet?action=list">首页</a></h2></li>
                    <li class="flex-col-4"><h2><a href="cowryServlet?action=list2">商城</a></h2></li>
                    <li class="flex-col-4"><h2><a href="views/member/Ultraman.jsp">购物车</a></h2></li>
                    <li class="flex-col-4"><h2><a href="announcementServlet?action=map">评论吧</a></h2></li>
                    <li class="flex-col-4"></li>
                    <li class="flex-col-4"></li>
                </ul>
            </div>
            <div class="flex-col-5">
                <ul class="top-nav-right flex-row">
                    <li class="flex-col-6 box1">
                        <i class="iconfont icon-wode"></i>
                        <a href="zoffy.html">登录</a>
                    </li>
                    <li class="flex-col-6 box1">
                        <i class="iconfont icon-bofangjilu"></i>
                        <a href="#">历史</a>
                    </li>
                    <li class="flex-col-6 box1">
                        <i class="iconfont icon-xiaoxizhongxin
		"></i>
                        <a href="#">消息</a>
                    </li>
                    <li class="flex-col-6 box1">
                        <i class="iconfont icon-bangzhu"></i>
                        <a href="#">帮助</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>
<section>
    <div class="wrapper">
        <div class="userform">
            <div class="loginform">
                <h2><span>注册</span>丨<a href="zoffy.html">登录</a></h2>
                <form action="memberServlet" method="post" class="form-logo">
                    <input type="hidden" name="action" value="register">
                    <span class="errorMsg" style="font-weight: bold; font-size: 5pt; color: orangered">${msg}</span>
                    <p><input type="text" name="username" class="username" id="txtinfor" placeholder="请输入用户名"
                              value="${requestScope.reUsername}"/></p>
                    <p><input type="password" name="password" class="psd" id="txtinfor" placeholder="请输入密码"
                              value="${requestScope.rePassword}"/></p>
                    <p><input type="password" name="repassword" class="repsd" id="txtinfor" placeholder="再次输入密码"
                              style="width: 250px;height: 40px;border: #000000 solid 2px;padding-left: 40px;" value="${requestScope.rePassword}"/></p>
                    <p><input type="email" name="email" class="email" id="txtinfor" placeholder="请输入邮箱"
                              value="${requestScope.reEmail}"/></p>
                    
                    <p><input type="text" id="code" name="code" style="width: 50%"
                              placeholder="验证码"/></p>　　
                    <p><img alt="" id="codeImg" src="kaptchaServlet"></p>
                    <p><input type="checkbox" class="ckbox" value="" checked=""/>我已读阅并同意</p>
                    <p>有账号，请<a href="zoffy.html"><span id="red">登录</span></a>
                        <button type="subimt" class="loginbt" id="subbtn" name="" value=""/>
                        注册
                    </p>
                </form>
            </div>
        </div>
    </div>
</section>
<footer>
    <div class="footer-bottom">
        <div class="flex-row">
            <div class="flex-col-6">
            </div>
            <div class="flex-col-12 flex-row">
                <div class="flex-col-4">
                    <ul class="footer-bottom-link">
                        <li class="link-item"><a href="#">服务条款</a></li>
                        <li class="link-item"><a href="#">警</a></li>
                    </ul>
                </div>
                <div class="flex-col-4">
                    <ul class="footer-bottom-link">
                        <li class="link-item"><a href="#">隐私保护指引</a></li>
                        <li class="link-item"><a href="#">告</a></li>
                    </ul>
                </div>
                <div class="flex-col-4">
                    <ul class="footer-bottom-link">
                        <li class="link-item"><a href="#">隐私政策</a></li>
                        <li class="link-item"><a href="#">别</a></li>
                    </ul>
                </div>
                <div class="flex-col-4">
                    <ul class="footer-bottom-link">
                        <li class="link-item"><a href="#">使用条款</a></li>
                        <li class="link-item"><a href="#">来</a></li>
                    </ul>
                </div>
                <div class="flex-col-4">
                    <ul class="footer-bottom-link">
                        <li class="link-item"><a href="#">销售政策</a></li>
                        <li class="link-item"><a href="#">沾</a></li>
                    </ul>
                </div>
                <div class="flex-col-4">
                    <ul class="footer-bottom-link noborder">
                        <li class="link-item"><a href="#">法律信息</a></li>
                        <li class="link-item"><a href="#">边</a></li>
                    </ul>
                </div>
            </div>
            <div class="flex-col-6">
            </div>
        </div>
    </div>
</footer>
</body>
</html>

