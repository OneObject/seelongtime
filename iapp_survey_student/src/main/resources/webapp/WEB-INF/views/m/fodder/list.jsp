<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
<head>
    <title>素材列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
    <script type="text/javascript">
    	 var admin_root ="<%=Constant.ADMIN_ROOT %>";
         function indetail(id){
        	 window.location.href="${basepath}/m/ixin/fodder/detail.xhtml?id="+id;
         }
    </script>
</head>
<body>
<section class="series">
    <c:if test="${empty list}">
               <span class="alert alert-warning" style="display:block;overflow: hidden; text-align: center;">暂无素材</span>
    </c:if>
<c:forEach var="item" items="${list}">
    <section class="a-series" onclick="indetail('${item.id}')" style="curthor:pointer;">
        <!--只有一个的-->
        <div class="series-top">
                <span class="course-name">
                    ${item.title}
                </span>
                <span class="class-time">
                     ${ltfun:dateLongToStringFormat(item.modifyTime,'yyyy年MM月dd日 ')}
                </span>
                 <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.coverPath}-320x180">
        </div>
        <section class="jianjie">
           <c:if test="${not empty item.summary }">${ltfun:html2Text(item.summary, 20)}</c:if>
        </section>
    </section>
</c:forEach>   

</section>
<!--<script type="text/javascript">-->
<!--document.getElementsByClassName('series-top-title-bg').width= (document.getElementsByClassName('bigimg').width-140+"px" );-->
<!--</script>-->
</body>
</html>