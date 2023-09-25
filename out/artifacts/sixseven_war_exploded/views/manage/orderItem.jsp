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
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="assets/js/jquery.js"></script>
    <script language="javascript" src="assets/js/script.js"></script>
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
                <th scope="col">id</th>
                <th scope="col">名称</th>
                <th scope="col">数量</th>
                <th scope="col">单价</th>
                <th scope="col">总价</th>
            </tr>
            <c:forEach items="${requestScope.orderItems}" var="orderItem">
                <tr>
                    <td>${orderItem.id}</td>
                    <td>${orderItem.name}</td>
                    <td>${orderItem.count}</td>
                    <td>${orderItem.price}</td>
                    <td>${orderItem.total_price}</td>
                </tr>
            </c:forEach>
        </table>
    
    
    </form>

</div>

</body>

</html>

