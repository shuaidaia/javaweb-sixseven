<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/17
  Time: 14:56
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>管理中心</title>
    <base href="<%=request.getContextPath() + "/"%>">
</head>
<frameset rows="88,*" cols="*" frameborder="NO" border="0" framespacing="0">
    <frame src="views/manage/header.jsp" name="topFrame" scrolling="NO" noresize >
    <frameset cols="203,9,*" frameborder="NO" border="0" framespacing="0" id="frame-body">
        <frame src="views/manage/left.jsp" name="leftFrame" scrolling="yes" noresize frameborder="no">
        <frame src="views/manage/drag.jsp" name="dragFrame" scrolling="NO" noresize frameborder="no">
        <frame src="cowryServlet?action=page&pageNo=1" name="mainFrame" scrolling="yes" frameborder="no">
    </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>
