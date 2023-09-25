<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/14
  Time: 18:57
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Zoffy</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link rel="stylesheet" type="text/css" href="assets/css/stupid1.css"/>
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid2.css"/>
    <link rel="stylesheet" type="text/css" href="assets/font/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid3.css"/>
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
                        <a href="#">登录</a>
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
                <h2><span>登录</span>丨<a href="UltramanJack.html">注册</a></h2>
                <form class="form-logo" action="memberServlet" method="post">
                    <input type="hidden" name="action" value="login">
                    <span class="errorMsg" style="font-weight: bold; font-size: 5pt; color: orangered">${msg}</span>
                    <p><input type="text" name="username" class="username"  value="${requestScope.username}" id="txtinfor" placeholder="请输入用户名" /></p>
                    <p><input type="password" name="password" class="psd" id="txtinfor" placeholder="请输入密码" /></p>
                    <p><input type="checkbox" class="ckbox"  value="" checked="checked" />记住我（请在私人设备上使用该功能）</p>
                    <p>还没账号，先<a href="UltramanJack.html"><span id="red">注册</span></a><button type="subimt" class="loginbt" id="" name="" value="" />登录</p>
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

