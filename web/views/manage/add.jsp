<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/17
  Time: 15:00
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>主区域</title>
    <base href="<%=request.getContextPath() + "/"%>">
    <link href="assets/css/style4.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="assets/js/jquery.js"></script>
    <script language="javascript" src="assets/js/script.js"></script>
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
    <script type="text/javascript">
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
    <%--<div class="title">--%>
    <%--    <h2><label>添加商品：</label></h2>--%>
    <%--</div>--%>
    <div class="opttips">
        <h3><label>添加商品说明：</label>1：首页展品，2：首页商品，3：折扣一区，4：折扣二区，5：电脑专区，6：配件专区</h3>
    </div>
    <%--<ul class="optlist">--%>
    <%--    <li class="addopt"><a href="#">添加</a></li>--%>
    <%--</ul>--%>
    
    <form name="form2" id="form2" method="post" action="cowryServlet?action=add&pageTotalCount=${param.pageTotalCount}" enctype="multipart/form-data">
        <table cellspacing="0" class="tblist">
            <tr>
                <th scope="col">图片</th>
                <th scope="col">名称</th>
                <th scope="col">价格</th>
                <th scope="col">库存</th>
                <th scope="col">销量</th>
                <th scope="col">摆放区域</th>
                <th scope="col">操作</th>
            </tr>
                <tr>
                    <td class="smpic">
                        <div id="pic">
                        <img id="prevView" class="img-responsive ml-3"
                             src="assets/img/IMG_2371(20230618-205333).JPG"
                             alt=""/>
                        <input type="file" style="height: 160px; width: 180px" name="img_path" id="" value="" onchange="prev(this)"/>
                        </div>
                    </td>
                    <td class="left"><input name="name" type="text" value="Name"/></td>
                    <td><input name="price" style="width: 50%" type="text" value="99"/></td>
                    <td><input name="stock" style="width: 50%" type="text" value="100"/></td>
                    <td><input name="sales" style="width: 50%" type="text" value="0"/></td>
                    <td><input name="status" style="width: 50%" type="text" value="1"/></td>
                    <td class="opt">
                        <button type="submit" value="添加商品">点击添加</button>
                        <%--<a href="#" class="modifybt">修改</a>--%>
                        <%--<a href="#" class="delbt">删除</a>--%>
                            <%--<a href="#" class="seebt">查看</a><br/>--%>
                            <%--<a href="#" class="settingbt_02">设置</a>--%>
                            <%--<a href="#" class="settingbt">推荐</a>--%>
                    </td>
                </tr>
               
        </table>
        <%--<p>注释：</p>--%>
        <%--<button type="submit" style="width: 90%;background-color: silver;border: silver;border-radius: 20%;" value="添加商品"/>--%>
    </form>

</div>

</body>

</html>
