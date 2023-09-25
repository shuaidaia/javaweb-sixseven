<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/17
  Time: 14:58
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>头部</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link href="assets/css/style4.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="headerwrap" style="background: #313132">
    <div class="welcome" style="background: #313132">"SixSeven"</div>
    <img src="assets/img/IMG_2020.PNG" width="167px" height="60px" class="logo"/>
    <ul id="subnav">
        <li class="home"><a href="cowryServlet?action=list" target="_blank">进入网站</a></li>
        <%--<li class="mpwd"><a href="#" target="mainFrame">修改密码</a></li>--%>
        <li class="logout"><a href="memberServlet?action=logout">退出</a></li>
    </ul>
</div>
</body>
</html>


