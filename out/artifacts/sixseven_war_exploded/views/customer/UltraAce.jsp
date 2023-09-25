<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/16
  Time: 11:56
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>UltraAce</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid1.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid2.css"/>
    <link rel="stylesheet" type="text/css" href="assets/font/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid3.css"/>
    <script type="text/javascript" src="script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("a.addCart").click(function () {
                var cowryId = $(this).attr("cowryId");
                // alert(cowryId);
                // location.href = "cartServlet?action=put&id=" + cowryId;
                $.getJSON(
                    "cartServlet",
                    {
                        "action": "put",
                        "id": cowryId
                    },
                    function (data) {
                        if (data.url != null){
                            location.href = data.url;
                        }
                    }
                )
            })
        })
    </script>
    <style>
        .brief a:hover{
            background-color: #f1ebe2;
            border-radius: 5px;
        }
    </style>
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
                    <li class="flex-col-4"><h2 class="font-big">商城</h2></li>
                    <li class="flex-col-4"><h2><a href="views/member/Ultraman.jsp">购物车</a></h2></li>
                    <li class="flex-col-4"><h2><a href="announcementServlet?action=map">评论吧</a></h2></li>
                    <li class="flex-col-4"></li>
                    <li class="flex-col-4"></li>
                </ul>
            </div>
            <div class="flex-col-5">
                <ul class="top-nav-right flex-row">
                    <li class="flex-col-6 box1">
                        <c:if test="${empty sessionScope.member.username}">
                            <a href="views/customer/login.jsp"><i class="iconfont icon-wode"></i></a>
                            <a href="views/customer/login.jsp">登录</a>
                        </c:if>
                        <c:if test="${not empty sessionScope.member.username}">
                            <a><i class="iconfont icon-wode"></i></a>
                            <a style="cursor: pointer">${sessionScope.member.username}</a>
                        </c:if>
                    </li>
                    <li class="flex-col-6 box1">
                        <a href="orderServlet?action=orderList"><i class="iconfont icon-bofangjilu"></i></a>
                        <a href="orderServlet?action=orderList">历史</a>
                    </li>
                    <li class="flex-col-6 box1">
                        <a href="orderServlet?action=orderList"><i class="iconfont icon-xiaoxizhongxin"></i></a>
                        <a href="orderServlet?action=orderList">消息</a>
                    </li>
                    <li class="flex-col-6 box1">
                        <c:if test="${not empty sessionScope.member.username}">
                            <a href="memberServlet?action=logout"><i class="iconfont icon-bangzhu"></i></a>
                            <a href="memberServlet?action=logout">安全退出</a>
                        </c:if>
                        <c:if test="${empty sessionScope.member.username}">
                            <i class="iconfont icon-bangzhu"></i>
                            <a href="#">帮助</a>
                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>
<main>
    <div class="body-mall">
        <div class="wrapper">
            <div class="flex-row body-mall-top">
                <div class="flex-col-16">
                    <h1>这是一座神奇的商城<i class="iconfont icon-shangquan"></i>。</h1>
                    <p><i class="iconfont icon-shijian"></i>有着一个未知的数码世界,</p>
                    <h3>和我们一起,</h3>
                    <h2>开启一道新世界的大门,</h2>
                    <h3>里面有无穷的宝贝<span class="iconfont icon-tishi"></span>等着你去<i class="iconfont icon-sousuo"></i>探索！</h3>
                </div>
                <div class="flex-col-8">
                    <div class="box">
                        <div class="film">
                            <div class="face front">
                                <img src="assets/img/iphone-card-40-iphone14pro-202209.jfif">
                            </div>
                            <div class="face back">
                                <img src="assets/img/iphone-card-40-iphone14-202209.jfif">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="title">
                <h2>这里有几款绝世<i class="iconfont icon-shouji"></i>神机！</h2>
            </div>
            <div class="flex-row body-mall-mid">
                <div class="flex-col-4 body-mall-favourable">
                    <div class="favourable">
                        <i class="iconfont icon-youhuiquan"></i><h3>500</h3>
                        <p>满2000减500</p>
                    </div>
                </div>
                
                
                <c:forEach items="${requestScope.cowryListByThree}" var="cowry">
                    <div class="flex-col-5">
                        <div class="effect1">
                            <div class="box3">
                                <div class="box3-image">
                                    <img src="${cowry.img_path}" >
                                </div>
                                <div class="box3-info">
                                    <h3 class="title">${cowry.name}</h3>
                                    <span class="price">RMB: ${cowry.price}</span>
                                    <del class="text-muted">1299</del>
                                    <p class="brief"><a cowryId="${cowry.id}" class="addCart">加入购物车</a></p>
                                    <p class="shop-name">立即下单</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            
            
            
            </div>
            <div class="flex-row body-mall-mid">
                
                <div class="flex-col-4 body-mall-favourable2">
                    <div class="favourable2">
                        <i class="iconfont icon-youhuiquan"></i><h3>100</h3>
                        <p>满1000减100</p>
                    </div>
                </div>


                <c:forEach items="${requestScope.cowryListByFour}" var="cowry">
                    <div class="flex-col-5">
                        <div class="effect2">
                            <div class="box3">
                                <div class="box3-image">
                                    <img src="${cowry.img_path}">
                                </div>
                                <div class="box3-info">
                                    <h3 class="title">${cowry.name}</h3>
                                    <span class="price">RMB: ${cowry.price}</span>
                                    <del class="text-muted">1288</del>
                                    <p class="brief"><a cowryId="${cowry.id}" class="addCart">加入购物车</a></p>
                                    <p class="shop-name">立即下单</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            
            
            
            </div>
            <div class="title">
                <h2><i class="iconfont icon-shandian"></i>让你意想不到的商品。</h2>
            </div>
            <div class="flex-row body-mall-mid">
    
                <c:forEach items="${requestScope.cowryListByFive}" var="cowry">
                    <div class="flex-col-4 matebook">
                        <img src="${cowry.img_path}" width="200px" height="200px">
                        <h3 class="title">${cowry.name}</h3>
                        <span class="price">RMB:${cowry.price}</span>
                        <del class="text-muted"></del>
                        <p class="brief"><a cowryId="${cowry.id}" class="addCart">加入购物车</a></p>
                    </div>
                </c:forEach>
            
            
            
            
            
            </div>
            <div class="title">
                <h2>小零件任你选<i class="iconfont icon-maiyizengyi"></i>。</h2>
            </div>
            <div class="flex-row body-mall-mid">
    
                <c:forEach items="${requestScope.cowryListBySix}" var="cowry">
                    <div class="flex-col-6 parts">
                        <img src="${cowry.img_path}" width="200px" height="130px">
                        <p class="brief"><a cowryId="${cowry.id}" class="addCart">加入购物车</a></p>
                    </div>
                </c:forEach>
            
            
            
            </div>
        
        </div>
    </div>
</main>
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
