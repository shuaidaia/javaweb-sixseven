<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/17
  Time: 14:55
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="left_html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>左边菜单</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link href="assets/css/style4.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript" src="assets/js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="assets/js/menu.js"></script>
    <script type="text/javascript" src="script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
                $(".click")[0].click();
        })
    </script>
</head>
<body>
<div class="l_sub">
    <div id="subsider" style="background: #313132">
        <div class="item" style="background: #313132">
            <h2 style="background: #313132"><a>基本信息</a></h2>
            <ul style="background: #313132">
                <li><h3><a href="views/manage/add.jsp" target="mainFrame">修改密码</a></h3></li>
                <li><h3><a href="views/manage/list.jsp" target="mainFrame">栏目管理</a></h3></li>
                <li><h3><a href="views/manage/add.jsp" target="mainFrame">Email参数配置</a></h3></li>
                <%--<li><h3><a href="add.html" target="mainFrame">底部声明</a></h3></li>--%>
                <%--<li><h3><a href="add.html" target="mainFrame">联系方式</a></h3></li>--%>
            </ul>
        </div>
        <div class="item" style="background: #313132">
            <h2><a href="announcementServlet?action=list" target="mainFrame">公告管理</a></h2>
            <ul>
                <li><h3><a href="announcementServlet?action=list" target="mainFrame">公告列表</a></h3></li>
                <li><h3><a href="views/manage/announcement.jsp" target="mainFrame">公告发布</a></h3></li>
            </ul>
        </div>
        <div class="item" style="background: #313132">
            <h2 class="click"><a href="cowryServlet?action=page&pageNo=1" target="mainFrame">商品管理</a></h2>
            <ul>
                <li class="block">
                    <h3><a href="cowryServlet?action=page&pageNo=1" target="mainFrame">商品列表</a></h3>
                    <%--<div class="subitems">--%>
                    <%--    <p><a href="#" target="mainFrame">添加展品</a></p>--%>
                    <%--    <p><a href="#" target="mainFrame">展品列表</a></p>--%>
                    <%--</div>--%>
                </li>
                <li class="block">
                    <h3><a href="views/manage/add.jsp" target="mainFrame">添加商品</a></h3>
                    <%--<div class="subitems">--%>
                    <%--    <p><a href="#" target="mainFrame">添加商品</a></p>--%>
                    <%--    <p><a href="#" target="mainFrame">汽车列表</a></p>--%>
                    <%--</div>--%>
                </li>
            </ul>
        </div>
        <%--<div class="item" style="background: #313132">--%>
        <%--    <h2><a href="#">Banner管理</a></h2>--%>
        <%--    <ul>--%>
        <%--        <li><h3><a href="#" target="mainFrame">添加Banner</a></h3></li>--%>
        <%--        <li><h3><a href="#" target="mainFrame">Banner列表</a></h3></li>--%>
        <%--    </ul>--%>
        <%--</div>--%>
        <div class="item" style="background: #313132">
            <h2><a href="orderServlet?action=allOrders" target="mainFrame">订单管理</a></h2>
            <ul>
                <li><h3><a href="orderServlet?action=allOrders" target="mainFrame">订单列表</a></h3></li>
            </ul>
        </div>
        <%--<div class="item" style="background: #313132">--%>
        <%--    <h2><a href="#" target="mainFrame">用户管理</a></h2>--%>
        <%--    <ul>--%>
        <%--        &lt;%&ndash;<li><h3><a href="#" target="mainFrame">用户留言</a></h3></li>&ndash;%&gt;--%>
        <%--        <li><h3><a href="#" target="mainFrame">用户列表</a></h3></li>--%>
        <%--    </ul>--%>
        <%--</div>--%>
        <%--<div class="item" style="background: #313132">--%>
        <%--    <h2><a href="#">管理员管理</a></h2>--%>
        <%--    <ul>--%>
        <%--        <li><h3><a href="#" target="mainFrame">添加管理员</a></h3></li>--%>
        <%--        <li><h3><a href="" target="mainFrame"> 管理员列表</a></h3></li>--%>
        <%--    </ul>--%>
        <%--</div>--%>
    
    </div>
    <div class="rightcopy" style="background: #313132">版权说明2023年</h2>
    </div>
</div>
</body>

</html>

