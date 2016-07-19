<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.common.utils.HtmlUtils"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>排行榜列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
       <link rel="stylesheet" href="${basepath}/plugins/fonticon/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
</head>
<body>
<section class="GM-list-box">
    <!--通用列表页 微信端的所有列表页，都可使用-->
    <ul>
    <c:if test="${empty ranklist}">
    <li>
     <span class="alert alert-warning" style="display:block;overflow: hidden; text-align: center;">没有排行榜</span>
    </li>
    </c:if>
    <c:forEach  var="item" items="${ranklist}">
        <li onclick="toDetail('${item.id}');">
            <div class="GM-list-item">
                <c:if test="${empty item.cover }">
                   <img src="${basepath}/static/img/rank/rank_default.png" class="GM-item-poster">
                </c:if>
                <c:if test="${not empty item.cover}">
                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover}" class="GM-item-poster"><!--封面 在左边就放上面，在右边就放下面-->
                </c:if>
                </div>
                <div class="GM-list-item-content img-for-left">
                    <span class="GM-item-title">${item.title }</span>
                    <span class="GM-item-jianjie">${ltfun:html2Text(item.remark,200)}</span>
                </div>
            </div>
        </li>
     </c:forEach>
    </ul>
</section>
<script type="text/javascript">
var admin_root ="<%=Constant.ADMIN_ROOT %>";
function toDetail(id){
	window.open(admin_root+"/protal/rank/"+id+".xhtml");
}
</script>
</body>
</html>