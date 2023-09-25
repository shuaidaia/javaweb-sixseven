<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/19
  Time: 21:26
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Ultramantiga</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid1.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid2.css"/>
    <link rel="stylesheet" type="text/css" href="assets/font/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid3.css"/>
    <link href="assets/css/style4.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="assets/js/jquery.js"></script>
    <script language="javascript" src="assets/js/script.js"></script>
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
<div id="frmain" style="background: #ffffff">
    <div id="main">
        <div class="title">
            <h2><label>订单详情：</label></h2>
        </div>
        <ul class="optlist">
            <li class="addopt"><a href="#">继续购物</a></li>
        </ul>
        
        <form name="form2" id="form2" method="post" action="">
            <table cellspacing="0" class="tblist">
                <tr>
                    <th scope="col">名字</th>
                    <th scope="col">数量</th>
                    <th scope="col">单价</th>
                    <th scope="col">总价</th>
                </tr>
                <c:forEach items="${orderItemList}" var="item">
                    <tr>
                        <td>${item.name}</td>
                        <td>${item.count}</td>
                        <td>${item.price}</td>
                        <td>${item.total_price}</td>
                    </tr>
                </c:forEach>
            </table>
        
        </form>
    
    
    </div>

</div>
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
