<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/20
  Time: 1:12
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>主区域</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="assets/js/jquery.js"></script>
    <script language="javascript" src="assets/js/script.js"></script>
    <script type="text/javascript" src="script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("select.status").blur(function () {
                // var statusVal = $(this).find("select").val();
                // var orderIdVal = $(this).find("select").attr("orderId");
                var statusVal = $(this).val();
                var orderIdVal = $(this).attr("orderId");
                // console.log(statusVal, orderIdVal);
                $.getJSON(
                    "orderServlet",
                    {
                        "action": "status",
                        "status": statusVal,
                        "orderId": orderIdVal
                    },
                    function (data) {
                        // if (data.isStatus){
                        //     location.href = "orderServlet?action=allOrders";
                        // }
                    }
                )
            })
            
        })
    </script>
</head>
<body id="frmain">
<div id="main">
    <div class="title">
        <h2><label>订单列表：</label></h2>
    </div>
    <%--<ul class="optlist">--%>
    <%--    <li class="addopt"><a href="#">添加</a></li>--%>
    <%--</ul>--%>
    <%--<div id="search">--%>
    <%--    <form action="#" method="get">--%>
    <%--        <p><label>标题：</label><input type="text" name="" class="ltxt" value="" /></p>--%>
    <%--        <input type="submit" name="" value="搜索" class="searchbt" />--%>
    <%--    </form>--%>
    <%--</div>--%>
    
    <form name="form2" id="form2" method="post" action="">
        <table cellspacing="0" class="tblist">
            <tr>
                <th scope="col">订单号</th>
                <th scope="col">会员id</th>
                <th scope="col">日期</th>
                <th scope="col">价格</th>
                <th scope="col">状态</th>
                <th scope="col">操作</th>
            </tr>
            <c:forEach items="${requestScope.orders}" var="order">
                <tr>
                    <td class="orderId">${order.id}</td>
                    <td>${order.member_id}</td>
                    <td>${order.datetime}</td>
                    <td>${order.price}</td>
                    <td class="fun">
                        <select class="status" orderId="${order.id}" style="border: none;background: #f6f3e6">
                            <c:choose>
                                <c:when test="${order.status == 0}">
                                    <option value="0">未发货</option>
                                    <option value="1">已发货</option>
                                    <option value="2">已结算</option>
                                </c:when>
                                <c:when test="${order.status == 1}">
                                    <option value="1">已发货</option>
                                    <option value="0">未发货</option>
                                    <option value="2">已结算</option>
                                </c:when>
                                <c:when test="${order.status == 2}">
                                    <option value="2">已结算</option>
                                    <option value="0">未发货</option>
                                    <option value="1">已发货</option>
                                </c:when>
                            </c:choose>
                        
                        </select>
                    </td>
                    <td class="opt">
                            <%--<a href="#" class="modifybt">修改</a>--%>
                            <a href="orderServlet?action=allOrderItems&orderId=${order.id}" class="seebt">查看</a>
                            <%--<a href="#" class="delbt">删除</a>--%>
                            <%--<a href="#" class="settingbt_02">设置</a>--%>
                            <%--<a href="#" class="settingbt">推荐</a>--%>
                    </td>
                </tr>
            </c:forEach>
        </table>
    
    
    </form>

</div>

</body>

</html>

