<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/18
  Time: 22:25
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>公告列表</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link href="assets/css/style4.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="assets/js/jquery.js"></script>
    <script language="javascript" src="assets/js/script.js"></script>
    <script type="text/javascript" src="script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    </script>
</head>
<body id="frmain">
<div id="main">
    <div class="title">
        <h2><label>评论列表：</label></h2>
    </div>
    <%--<ul class="optlist">--%>
    <%--    <li class="addopt"><a href="#">添加公告</a></li>--%>
    <%--</ul>--%>
    
    <form name="form2" id="form2" method="post" action="">
        <table cellspacing="0" class="tblist">
            <tr>
                <%--<th scope="col">ID</th>--%>
                <th scope="col">会员id</th>
                <th scope="col">名字</th>
                <th scope="col">发布日期</th>
                <th scope="col">内容</th>
                <th scope="col">操作</th>
            </tr>
            <c:forEach items="${requestScope.commentList}" var="comment">
            <tr>
                <%--<td>${comment.id}</td>--%>
                <td>${comment.member_id}</td>
                <td>${comment.name}</td>
                <td>${comment.datetime}</td>
                <td class="left">${comment.message}</td>
                <td class="opt">
                    <%--<a href="#" class="modifybt">修改</a>--%>
                    <a href="announcementServlet?action=deleteComment&id=${comment.id}" class="delbt">删除</a><br/>
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

