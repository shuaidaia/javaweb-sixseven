<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/14
  Time: 23:06
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>UltraSeven</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid1.css"/>
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
                    <li class="flex-col-4"><h2 class="font-big">首页</h2></li>
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
<section>
    <div class="top-search">
        <div class="wrapper search">
            <div class="flex-row">
                <div class="flex-col-3"></div>
                <div class="flex-col-18">
                    <div class="search-box">
                        <form action="" method="post" class="input-search">
                            <div class="input-prepend">
                                <select name="" class="search-type">
                                    <option value="1">手机</option>
                                    <option value="2">电脑</option>
                                </select>
                            </div>
                            <input type="search" list="ls" class="input-inner" placeholder="请输入关键字"/>
                            <datalist id="ls">
                                <option value="HuaWei"></option>
                                <option value="Mac"></option>
                                <option value="手机"></option>
                                <option value="电脑"></option>
                            </datalist>
                            <div class="input-append">
                                <button type="button" class="btn">
                                    <i class="iconfont icon-sousuo"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="flex-col-3"></div>
            </div>
        </div>
    </div>
    <div class="body-notice">
        <div class="wrapper carousel">
            <div class="flex-row">
                <div class="flex-col-24  body-notice-img">
                    <div class="body-notice-p">
                        <p><i class="iconfont icon-gonggao"></i>公告</p>
                    </div>
                    <img src="assets/img/55bd342ebc6b4a47880573d1e3301aec.webp">
                    <ul class="carousel_indicators">
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<main>
    <div class="body-shop">
        <div class="wrapper shop">
            <div class="body-shop1-title">
                <h1>可以永远相信我们的产品。</h1>
                <div class="flex-row product1">
                    
                    <c:forEach items="${requestScope.cowryListByOne}" var="cowry">
                        <div class="flex-col-8 android">
                            <img src="${cowry.img_path}" width="200px" height="200px"/>
                            <p><a href="#">${cowry.name}</a></p>
                        </div>
                    </c:forEach>
                
                </div>
            
            </div>
            <div class="body-shop2-title">
                <h1>一个属于只我们的商城。</h1>
                <div class="flex-row">
                    
                    <c:forEach items="${requestScope.cowryListByTwo}" var="cowry">
                        <div class="flex-col-6 product3">
                            <img src="${cowry.img_path}" width="200px" height="170px"/>
                            <h3 class="title">${cowry.name}</h3>
                            <span class="price">${cowry.price}</span>
                            <del class="text-muted">299</del>
                        </div>
                    </c:forEach>
                
                </div>
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


