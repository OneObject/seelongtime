<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
<head>
    <title>抽奖列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
    <script type="text/javascript">
         function indetail(id){ 
        	 window.location.href= "${basepath}/m/ixin/lottery/cardreward.xhtml?rewardId="+id + "&uid=${uid}";
         }
    </script>
</head>
<body>
<section class="series">
    <c:if test="${empty list}">
               <span class="alert alert-warning" style="display:block;overflow: hidden; text-align: center;">没有抽奖活动</span>
    </c:if>
<c:forEach var="item" items="${list}">
    <section class="a-series" onclick="indetail('${item.id}')" style="curthor:pointer;">
        <!--只有一个课程的-->
        <div class="series-top">
                <span class="course-name">
                	${item.status eq 0 ? item.title1 : item.title2}
                </span>
                <span class="class-time">
                      ${ltfun:dateLongToStringFormat(item.startDate,'MM月dd日 ') }~${ltfun:dateLongToStringFormat(item.endDate,'MM月dd日 ') }
                </span>
                 <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.status eq 0 ? item.picUrl1 : item.picUrl2}-320x180">
        </div>
        <section class="jianjie">
            <span>${ltfun:html2Text((item.status eq 0 ? item.content1 : item.content2),20)}</span>
        </section>
    </section>
</c:forEach>   

</section>
<!--<script type="text/javascript">-->
<!--document.getElementsByClassName('series-top-title-bg').width= (document.getElementsByClassName('bigimg').width-140+"px" );-->
<!--</script>-->
</body>
</html>