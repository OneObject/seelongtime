<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
long currentTime = System.currentTimeMillis();
pageContext.setAttribute("currentTime", currentTime);
%>
<!DOCTYPE html>
<html>
<head>
    <title>文档列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/plugins/fonticon/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
    <link rel="stylesheet" href="${basepath}/static/css/easydialog.css">
</head>
<body>
<section class="GM-list-box">
    <!--通用列表页 微信端的所有列表页，都可使用-->
    <ul>
    <c:if test="${empty list}">
    <li>
     <span class="alert alert-warning" style="display:block;overflow: hidden; text-align: center;">暂时没有已转换成功的文档</span>
    </li>
    </c:if>
    <c:forEach  var="item" items="${list}">
       <li onclick="toDetail('${item.id}');">
            <div class="GM-list-item" >
              	<img src="${SERVER}/document/getpicpath.xhtml?id=${item.id}&num=1"  onerror="javascript:this.src='${basepath }/static/img/file.png'"class="GM-item-poster" style="border: 1px solid #cccccc;padding: 1px;">
                <div class="GM-list-item-content img-for-left has-time">
                    <span class="GM-item-title" style="align:center ">
                   		 ${item.originalname}
                    </span>
                </div>
            </div>
        </li>
     </c:forEach>
    </ul>
</section>
<script type="text/javascript" src="${basepath }/static/js/easydialog.min.js"></script>
<script type="text/javascript">
var admin_root ="<%=Constant.ADMIN_ROOT %>";

function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
        },
        autoClose:3000
    });
}
function toDetail(id){
	window.open("${SERVER}/document/play.xhtml?id="+id);
}
</script>
</body>
</html>