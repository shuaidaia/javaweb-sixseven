<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/16
  Time: 18:29
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Ultraman</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link rel="stylesheet" type="text/css" href="assets/css/stupid1.css"/>
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid2.css"/>
    <link rel="stylesheet" type="text/css" href="assets/font/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/stupid3.css"/>
    <script type="text/javascript" src="script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function () {

            $(".bttn").on("click", function () {
                var $button = $(this);
                var oldValue = $button.parent().find("input").val();
                if ($button.text() === "+") {
                    var newVal = parseFloat(oldValue) + 1;
                } else {
                    // Don't allow decrementing below zero
                    if (oldValue > 1) {
                        var newVal = parseFloat(oldValue) - 1;
                    } else {
                        newVal = 1;
                    }
                }
                $button.parent().find("input").val(newVal);
                var cowryId = $button.parent().find("input").attr("cowryId");
                // console.log(cowryId)
                // console.log(newVal)
                location.href = "cartServlet?action=modify&id=" + cowryId + "&count=" + newVal;
            });
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
                    <li class="flex-col-4"><h2 class="font-big">购物车</h2></li>
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
    <div class="body-carts">
        <div class="wrapper">
            <div class="body-carts-title">
                <h2><i class="iconfont icon-aixin"></i>我的购物车。</h2>
            </div>
            <div class="flex-row body-carts-order">
                <div class="flex-col-4 carts">
                    <i class="iconfont icon-chenggong"></i>
                </div>
                <div class="flex-col-4 carts">
                    <i class="iconfont icon-tupian"></i>
                </div>
                <div class="flex-col-4 carts">
                    <i class="iconfont icon-fanbei"></i>
                </div>
                <div class="flex-col-4 carts">
                    <i class="iconfont icon-tianjiayouhuiquan"></i>
                </div>
                <div class="flex-col-4 carts">
                    <i class="iconfont icon-yulebao"></i>
                </div>
                <div class="flex-col-4 carts">
                    <i class="iconfont icon-dingdan"></i>
                </div>
                
                <c:if test="${not empty sessionScope.cart.cartItemMap}">
                    <c:forEach items="${sessionScope.cart.cartItemMap}" var="item">
                        <div class="flex-col-4 carts2">
                            <input type="checkbox" name="" id="boxx" value=""/>
                        </div>
                        <div class="flex-col-4 carts2">
                            <img src="${item.value.img_path}"
                                 width="100px" height="100px">
                        </div>
                        <div class="flex-col-4 carts2">
                            <!-- <input type="number" name="" id="box-number" value="" step="1" min="1"/> -->
                            <a class="decrement bttn" style="cursor: pointer;">-</a>
                            <input type="text" name="" id="box-number" cowryId="${item.value.id}"
                                   value="${item.value.count}" step="1" min="1">
                            <a class="increment bttn" style="cursor: pointer;">+</a>
                        </div>
                        <%--<div class="flex-col-4 carts2">--%>
                        <%--    <div class="favourable">--%>
                        <%--        <i class="iconfont icon-youhuiquan"></i>--%>
                        <%--        <span>psum</span>--%>
                        <%--    </div>--%>
                        <%--</div>--%>
                        <div class="flex-col-4 carts2">
                            <div class="price">￥${item.value.price}</div>
                        </div>
                        <div class="flex-col-4 carts2">
                            <div class="price">￥${item.value.totalPrice}</div>
                        </div>
                        <div class="flex-col-4 carts2">
                            <div class="clear">
                                <a href="cartServlet?action=delete&id=${item.value.id}">删除</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            
            
            </div>
            <c:if test="${sessionScope.cart.finalTotalPrice != 0 && not empty sessionScope.cart.finalTotalPrice }">
                <div class="flex-row body-carts-pay">
                    <div class="flex-col-4">
                    
                    </div>
                    <div class="flex-col-4">
                    
                    </div>
                    <div class="flex-col-4">
                    
                    </div>
                    <div class="flex-col-4 total2">
                        <h3>共${sessionScope.cart.number}件</h3>
                    </div>
                    <div class="flex-col-4 total2">
                        <h3>总金额：￥<span class="total3">${sessionScope.cart.finalTotalPrice}</span></h3>
                    </div>
                    <div class="flex-col-4">
                        <div class="pay">
                            <h2><a href="orderServlet?action=order">立即支付</a></h2>
                        </div>
                    </div>
                </div>
            </c:if>
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

