<%--
  Created by IntelliJ IDEA.
  User: Belly
  Date: 2023/6/17
  Time: 19:35
  Version: 1.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="width:24px;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <base href="<%=request.getContextPath() + "/"%>">
    <style type="text/css">
        html{ height:100%; }
        *{ margin:0; padding:0;}
        body {
            cursor: E-resize;
            background:#ededed;
            height:100%;
            width:24px;
        }
    </style>
    <script type="text/javascript" language="JavaScript">
        /*var pic = new Image();
        pic.src="images/arrow_right.gif";
        */
        function toggleMenu()
        {
            frmBody = parent.document.getElementById('frame-body');
            imgArrow = document.getElementById('img');
            if (frmBody.cols == "0, 9, *")
            {
                frmBody.cols="203, 9, *";
                imgArrow.src = "assets/images/main_41.gif";
            }
            else
            {
                frmBody.cols="0, 9, *";
                imgArrow.src = "images/main_41.gif";
            }
        }
        var orgX = 0;
        document.onmousedown = function(e)
        {
            var evt = Utils.fixEvent(e);
            orgX = evt.clientX;
            if (Browser.isIE) document.getElementById('tbl').setCapture();
        }
        document.onmouseup = function(e)
        {
            var evt = Utils.fixEvent(e);
            frmBody = parent.document.getElementById('frame-body');
            frmWidth = frmBody.cols.substr(0, frmBody.cols.indexOf(','));
            frmWidth = (parseInt(frmWidth) + (evt.clientX - orgX));
            frmBody.cols = frmWidth + ", 9, *";
            if (Browser.isIE) document.releaseCapture();
        }
        var Browser = new Object();
        Browser.isMozilla = (typeof document.implementation != 'undefined') && (typeof document.implementation.createDocument != 'undefined') && (typeof HTMLDocument != 'undefined');
        Browser.isIE = window.ActiveXObject ? true : false;
        Browser.isFirefox = (navigator.userAgent.toLowerCase().indexOf("firefox") != - 1);
        Browser.isSafari = (navigator.userAgent.toLowerCase().indexOf("safari") != - 1);
        Browser.isOpera = (navigator.userAgent.toLowerCase().indexOf("opera") != - 1);
        var Utils = new Object();
        Utils.fixEvent = function(e)
        {
            var evt = (typeof e == "undefined") ? window.event : e;
            return evt;
        }
    </script>
</head>
<body onselect="return false;" style="width:24px;">
<table width="24" height="100%" cellspacing="0" cellpadding="0" id="tbl">
    <tr><td width="24"><a href="javascript:toggleMenu();" style="display:block; width:24px; height:24px;" ><img src="assets/images/main_41.gif" width="8" height="26" id="img"  border="0" /></a></td></tr>
</table>
</body>
</html>
