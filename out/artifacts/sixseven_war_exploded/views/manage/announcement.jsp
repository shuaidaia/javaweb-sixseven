<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/18
  Time: 20:45
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加公告</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link href="assets/css/style4.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="assets/js/jquery.js"></script>
    <script language="javascript" src="assets/js/script.js"></script>
    <script language="javascript" src="assets/js/utils.js"></script>
    <script language="javascript" src="assets/js/validator.js"></script>
    <link href="assets/js/calendar/Calendar.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="assets/js/calendar/jquery.calendar.js" type="text/javascript"></script>
    <style type="text/css">

        #pic {
            position: relative;
        }

        input[type="file"] {
            position: absolute;
            left: 0;
            top: 0;
            height: 150px;
            opacity: 0;
            cursor: pointer;
        }
    </style>
    <script language="javascript" type="text/javascript">

        $(function(){
            $('.txtDate').calendar();
        });
        function prev(event) {
            //获取展示图片的区域
            var img = document.getElementById("prevView");
            //获取文件对象
            var file = event.files[0];
            //获取文件阅读器： Js的一个类，直接使用即可
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function () {
                //给img的src设置图片url
                img.setAttribute("src", this.result);
            }
        }
    </script>
    
</head>
<body id="frmain">
<div id="main">
    
    <div class="title"><h2><span>添加公告：</span></h2></div>
    <%--<ul class="optlist">--%>
    <%--    <li class="listopt"><a href="#">[新闻中心]信息列表</a></li>--%>
    <%--</ul>--%>
    <div class="opttips">
        <h3><label>操作说明：</label>需要上传封面图片（570×320）。在“摘要”输入简要描述。</h3>
    </div>
    <form action="announcementServlet?action=add" method="post" enctype="multipart/form-data">
        <table border="0" cellspacing="0" class="tbedit">
            <tr>
                <th width="280" align="right" scope="row">作者：</th>
                <td align="left">
                    <input type="text" name="name" id="" class="mtxt" value="${sessionScope.member.username}" style="width: 40px" />
                </td>
            </tr>
            <tr>
                <th width="280" align="right" scope="row">*上传图片：</th>
                <td align="left">
                    <div id="pic">
                        <img id="prevView" class="img-responsive ml-3" style="width: 180px;height: 160px;"
                             src="assets/img/IMG_2371(20230618-205333).JPG"
                             alt=""/>
                        <input type="file" style="height: 160px; width: 180px" name="img_path"  value="" onchange="prev(this)"/>
                    </div>
                </td>
            </tr>
            <tr>
                <th width="280" align="right" scope="row">*内容：</th>
                <td align="left">
                    <textarea  name="text" ></textarea>
                </td>
            </tr>
            <tr>
                <th scope="row">&nbsp;</th>
                <td align="left">
                    <button name="" type="submit" value="添加"  class="savebt">添加</button></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
