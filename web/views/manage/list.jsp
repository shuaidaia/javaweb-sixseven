<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/17
  Time: 15:01
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>主区域</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link href="assets/css/style4.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="assets/js/jquery.js"></script>
    <script language="javascript" src="assets/js/script.js"></script>
</head>
<body id="frmain">
<div id="main">
    <div class="title">
        <h2><label>商品列表：</label></h2>
    </div>
    <ul class="optlist">
        <li class="addopt"><a href="views/manage/add.jsp?pageTotalCount=${requestScope.page.pageTotalCount}">商品添加</a></li>
    </ul>
    <%--<div id="search">--%>
    <%--    <form action="#" method="get">--%>
    <%--        <p><label>商品：</label><input type="text" name="" class="ltxt" value="" /></p>--%>
    <%--        <input type="submit" name="" value="搜索" class="searchbt" />--%>
    <%--    </form>--%>
    <%--</div>--%>
    
    <form name="form2" id="form2" method="post" action="">
        <table cellspacing="0" class="tblist">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">图片</th>
                <th scope="col">名称</th>
                <th scope="col">价格</th>
                <th scope="col">库存</th>
                <th scope="col">销量</th>
                <th scope="col">摆放区域</th>
                <th scope="col">操作</th>
            </tr>
            <c:forEach items="${requestScope.pageItems}" var="cowry">
            <tr>
                <td>${cowry.id}</td>
                <td class="smpic"><img src="${cowry.img_path}" /></td>
                <td class="left"><a href="#" target="_blank">${cowry.name}</a></td>
                <td>${cowry.price}</td>
                <td>${cowry.stock}</td>
                <td>${cowry.sales}</td>
                <td>
                    <c:if test="${cowry.status == 1}">首页展品</c:if>
                    <c:if test="${cowry.status == 2}">首页商品</c:if>
                    <c:if test="${cowry.status == 3}">折扣一区</c:if>
                    <c:if test="${cowry.status == 4}">折扣二区</c:if>
                    <c:if test="${cowry.status == 5}">电脑专区</c:if>
                    <c:if test="${cowry.status == 6}">配件专区</c:if>
                </td>
                <td class="opt">
                    <a href="cowryServlet?action=singleCowry&id=${cowry.id}&pageNo=${requestScope.page.pageNo}" class="modifybt">修改</a>
                    <a href="cowryServlet?action=delete&id=${cowry.id}" class="delbt">删除</a>
                    <%--<a href="#" class="seebt">查看</a><br/>--%>
                    <%--<a href="#" class="settingbt_02">设置</a>--%>
                    <%--<a href="#" class="settingbt">推荐</a>--%>
                </td>
            </tr>
            </c:forEach>
        
        
        
        </table>
        
        <%--<p class="btp">--%>
        <%--    <input name="" type="submit" value="更新顺序" class="searchbt" />--%>
        <%--</p>--%>
    
    </form>
    
    <div class="pagenav">
        <c:if test="${requestScope.page.pageNo > 1}">
            <a href="cowryServlet?action=page&pageNo=${requestScope.page.pageNo - 1}">&lt;</a>
        </c:if>
        <c:choose>
            <c:when test="${requestScope.page.pageTotalCount <= 3}">
                <c:set var="begin" value="1"/>
                <c:set var="end" value="${requestScope.page.pageTotalCount}"/>
            </c:when>
            <c:when test="${requestScope.page.pageTotalCount > 3}">
                <c:choose>
                    <c:when test="${requestScope.page.pageNo <= 2}">
                        <c:set var="begin" value="1"/>
                        <c:set var="end" value="3"/>
                    </c:when>
                    <c:when test="${requestScope.page.pageNo > requestScope.page.pageTotalCount - 2}">
                        <c:set var="begin" value="${requestScope.page.pageTotalCount - 2}"/>
                        <c:set var="end" value="${requestScope.page.pageTotalCount}"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="begin" value="${requestScope.page.pageNo - 1}"></c:set>
                        <c:set var="end" value="${requestScope.page.pageNo + 1}"></c:set>
                    </c:otherwise>
                </c:choose>
            </c:when>
        </c:choose>
        <c:forEach begin="${begin}" end="${end}" var="num">
            <c:if test="${num == requestScope.page.pageNo}">
                <a href="cowryServlet?action=page&pageNo=${num}" class="cur">${num}</a>
            </c:if>
            <c:if test="${num != requestScope.page.pageNo}">
                <a href="cowryServlet?action=page&pageNo=${num}">${num}</a>
            </c:if>
            <%--<a href="#">2</a>--%>
            <%--<a href="#">3</a>--%>
        </c:forEach>
        <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotalCount}">
            <a href="cowryServlet?action=page&pageNo=${requestScope.page.pageNo + 1}">&gt;</a>
        </c:if>
        <a>共${requestScope.page.pageTotalCount}页</a>
    </div>

</div>

</body>

</html>

