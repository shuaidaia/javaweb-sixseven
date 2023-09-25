<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/15
  Time: 19:44
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Ultramantaro</title>
  <base href="<%=request.getContextPath() + "/"%>">
  <link rel="stylesheet" type="text/css" href="assets/css/stupid1.css"/>
  <link rel="stylesheet" type="text/css" href="assets/css/stupid2.css"/>
  <link rel="stylesheet" type="text/css" href="assets/font/iconfont.css"/>
  <script type="text/javascript" src="script/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/stupid3.css"/>
  <style type="text/css">
    main{
      background-image: url(assets/img/486.png);
    }
  </style>
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
          <li class="flex-col-4"><h2><a href="views/member/Ultraman.jsp">购物车</a></h2></li>
          <li class="flex-col-4"><h2 class="font-big">评论吧</h2></li>
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
  <div class="body-comment">
    <div class="wrapper">
      <div class="flex-row">
        <div class="flex-col-4">
          <div class="body-comment-left">
            <ul class="list-group">
              <li class="list-group-item pointer"><i class="iconfont icon-huati"></i>热门推荐</li>
              <li class="list-group-item"><i class="iconfont icon-taolunqu"></i><a href="#">社区热榜</a></li>
              <li class="list-group-item"><i class="iconfont icon-dianzan"></i><a href="#">我点赞过的</a></li>
              <li class="list-group-item"><i class="iconfont icon-shoucang"></i><a href="#">我收藏的</a></li>
              <li class="list-group-item"><i class="iconfont icon-pengyouquan"></i><a href="#">全部专栏</a></li>
            </ul>
          </div>
        </div>
        <div class="flex-col-16">
          <div class="body-comment-center">
            <div class="body-comment-center-top flex-row">
              <div class="flex-col-3">
                <h3>全部</h3>
              </div>
              <div class="flex-col-21">
              </div>
            </div>
            
            
            <c:forEach items="${requestScope.announcement}" var="annAndComs">
              <div class="body-comment-center-mian">
                <div class="comment flex-row">
                  <div class="flex-col-3">
                    <div class="head">
                      <i class="iconfont icon-wode"></i>
                    </div>
                  </div>
                  <div class="flex-col-21">
                    <div class="comment-name">
                      <h3>${annAndComs.value.announcement.name}</h3>
                      <p>${annAndComs.value.announcement.datetime} 2.4k阅读</p>
                    </div>
                    <div class="comment-txt">
                        ${annAndComs.value.announcement.text}
                    </div>
                    <div class="video">
                      <img src="${annAndComs.value.announcement.img_path}" style="width: 200px; height: 200px"/>
                      <%--<video id="watchvideo" src="video/f2069e50c2315dfc6096e24919f63f.MP4" height="250px">你的浏览器不支持该视频文件</video>--%>
                      <%--<br>--%>
                      <%--<button type="button" id="playbtn" onclick="pp()">播放</button>--%>
                      <%--<button type="button" id="" onclick="goback(5)">快进5秒</button>--%>
                      <%--<button type="button" id="" onclick="goback(-5)">后退5秒</button>--%>
                      <%--<button type="button" id="" onclick="volume(0.1)">音量＋</button>--%>
                      <%--<button type="button" id="" onclick="volume(-0.1)">音量-</button>--%>
                      <%--<button type="button" id="mutedvideo" onclick="ismuted()">静音</button>--%>
                    </div>
                  </div>
                </div>
                <div class="flex-row comment-underside">
                  <div class="flex-col-6">
                    <i class="iconfont icon-shoucang">收藏</i>
                  </div>
                  <div class="flex-col-6">
                    <i class="iconfont icon-fenxiang">分享</i>
                  </div>
                  <div class="flex-col-6 red">
                    <i class="iconfont icon-xiaoxi">评论</i>
                  </div>
                  <div class="flex-col-6">
                    <i class="iconfont icon-aixin">喜欢</i>
                  </div>
                </div>
              </div>
              <div class="body-comment-center-bottom">
                <ul class="observer">
                  
                  <c:forEach items="${annAndComs.value.commentList}" var="comment">
                    <li class="flex-row">
                      <div class="flex-col-3">
                        <div class="head">
                          <i class="iconfont icon-wode"></i>
                        </div>
                      </div>
                      <div class="flex-col-21">
                        <div class="observer-name">
                          <h3>${comment.name}</h3>
                          <p>${comment.datetime}</p>
                        </div>
                        <div class="comment-observer-txt">
                            ${comment.message}
                        </div>
                      </div>
                    </li>
                  </c:forEach>
                  
                  <%--<li class="flex-row">--%>
                  <%--  <div class="flex-col-3">--%>
                  <%--    <div class="head">--%>
                  <%--      <i class="iconfont icon-wode"></i>--%>
                  <%--    </div>--%>
                  <%--  </div>--%>
                  <%--  <div class="flex-col-21">--%>
                  <%--    <div class="observer-name">--%>
                  <%--      <h3>小乙</h3>--%>
                  <%--      <p>2022-12-08 13:24</p>--%>
                  <%--    </div>--%>
                  <%--    <div class="comment-observer-txt">--%>
                  <%--      我是学生，送我！希望你不要不识好歹--%>
                  <%--    </div>--%>
                  <%--  </div>--%>
                  <%--</li>--%>
                </ul>
                <form action="announcementServlet?action=addComment" method="post" class="body-comment-center-bottom-message">
                  <input type="hidden" name="announcementId" value="${annAndComs.value.announcement.id}">
                  <input type="hidden" name="name" value="${sessionScope.member.username}">
                  <input type="hidden" name="memberId" value="${sessionScope.member.id}">
                  <div class="box">
                    <textarea name="message" class="txt" rows="3" cols="105"></textarea>
                    <button type="submit" class="btn">发表评论</button>
                  </div>
                </form>
              </div>
            </c:forEach>
            
            
          </div>
        </div>
        <div class="flex-col-4">
          <div class="body-comment-right">
            <div class="top-box">
              <div class="flex-row">
                <div class="flex-col-8 mypho">
                  <i class="iconfont icon-wode"></i>
                </div>
                <div class="flex-col-16 myname">
                  <h4>管理员</h4>
                </div>
              </div>
              <ul class="flex-row body-comment-right-list">
                <li class="flex-col-8 body-comment-right-item">
                  <i>22</i>
                  <a href="#">关注</a>
                </li>
                <li class="flex-col-8 body-comment-right-item">
                  <i>22</i>
                  <a href="#">粉丝</a>
                </li>
                <li class="flex-col-8 body-comment-right-item">
                  <i>22</i>
                  <a href="#">动态</a>
                </li>
              </ul>
            </div>
            <div class="mid-box">
              <div class="goods-title">
                <h4>热门商品推荐</h4>
              </div>
              <div class="flex-row body-comment-right-goods">
                <div class="flex-col-8">
                  <img src="assets/img/iphone-card-40-iphone14pro-202209.jfif" width="65px" height="50px">
                </div>
                <div class="flex-col-8">
                  <img src="assets/img/iphone-card-40-iphone12-202209.jfif" width="65px" height="50px">
                </div>
                <div class="flex-col-8">
                  <img src="assets/img/iphone-card-40-iphone13-202209.jfif" width="65px" height="50px">
                </div>
              </div>
              <div class="flex-row body-comment-right-goods">
                <div class="flex-col-8">
                  <img src="assets/img/iphone-card-40-iphone14-202209.jfif" width="65px" height="50px">
                </div>
                <div class="flex-col-8">
                  <img src="assets/img/iphone-card-40-iphonese-202203.jfif" width="65px" height="50px">
                </div>
                <div class="flex-col-8">
                  <img src="assets/img/iphone-card-40-iphone14pro-202209.jfif" width="65px" height="50px">
                </div>
              </div>
              <div class="flex-row body-comment-right-goods">
                <div class="flex-col-8">
                  <img src="assets/img/800_800_95FE8760DCE1A41CD62C942DE8FD7F4Cmp.png" width="65px" height="58px">
                </div>
                <div class="flex-col-8">
                  <img src="assets/img/800_800_391F78057B02534E33860A555B5D66B4mp.webp" width="65px" height="58px">
                </div>
                <div class="flex-col-8">
                  <img src="assets/img/800_800_F9299E9275D751EB3B64858C389779358A27128E74B4B0DCmp.png" width="65px" height="58px">
                </div>
              </div>
            </div>
            <div class="bottom-box">
              <div class="goods-theme">
                <h4>热门话题</h4>
              </div>
              <div class="flex-row body-comment-right-theme">
                <p><a href="#">#限时返厂#</a></p>
              </div>
              <div class="flex-row body-comment-right-theme">
                <p><a href="#">#一表用三代，人走表还...#</a></p>
              </div>
              <div class="flex-row body-comment-right-theme">
                <p><a href="#">#双11特价优惠#</a></p>
              </div>
              <div class="flex-row body-comment-right-theme">
                <p><a href="#">#优惠卷大礼来袭#</a></p>
              </div>
              <div class="flex-row body-comment-right-theme">
                <p><a href="#">#是兄弟就来砍我一刀#</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
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
<script>
  var watchvideo = document.getElementById('watchvideo');
  var playbtn = document.getElementById('playbtn');
  var videomuted = docmument.getElementById('videomuted');
  function pp(){
    if(watchvideo.paused){
      watchvideo.play();
      playbtn.innerHTML = '暂停';
    }else{
      watchvideo.pause();
      playbtn.innerHTML = '开始';
    }
  }
  function goback(val){
    watchvideo.currentTime += val;
  }
  function volume(val){
    watchvideo.volume += val;
  }
  function ismuted(){
    if(watchvideo.muted){
      watchvideo.muted = false;
      mutedvideo.innerHTML = '静音';
    }else{
      watchvideo.muted = true;
      mutedvideo.innerHTML = '声音';
    }
  }
</script>
</body>
</html>

