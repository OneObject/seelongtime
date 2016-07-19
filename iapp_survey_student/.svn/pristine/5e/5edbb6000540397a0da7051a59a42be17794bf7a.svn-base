<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%
String uid = MwebHelper.getCurrentUid(); 

String img_suffix="-320x180";
%>
<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
    <script type="text/javascript" src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript">

    //去掉右上角选项
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideOptionMenu');
    });

</script>
</head>
<body>
<section class="series">
    <input type="hidden" id="hid_adminroot" name="hid_adminroot" value="<%=Constant.ADMIN_ROOT%>">
    <c:if test="${empty list}">
           <div  id="nothing">
           <h1 class="nothing" >没有该${title}栏目列表信息</h1>
           </div>
    </c:if>
<c:forEach var="item" items="${list}">
    <section class="a-series"  style="curthor:pointer;" onclick="linkdetail('${item.resourceid}',this);" data-restype="${item.restype}">
        <div class="series-top">
                <span class="course-name">
                    ${item.resname}
                </span>
               <!-- <span class="class-time">
                      ${ltfun:dateLongToStringFormat(item.weight,'MM月dd日 ')}
                </span>  -->
                <c:if test="${empty item.rescover}">
                   <img src="${basepath}/static/m/img/lm.png">
                </c:if>
                <c:if test="${not empty item.rescover}">
                <%--<img src="${basepath}/static/m/img/lm.png" data-src = "<%=Constant.IMG_SERVER_DOWNLOAD%>${item.rescover}<%=img_suffix%>" onload="showimg(this)"> --%> 
                <img src = "<%=Constant.IMG_SERVER_DOWNLOAD%>${item.rescover}<%=img_suffix%>" >
                 </c:if>
        </div>
    </section>
</c:forEach>   

</section>
<script type="text/javascript">
/*function showimg(_this){
	console.log("1");
	$(_this).attr("src",$(_this).attr("data-src"));
	}*/
function linkdetail(resourceid,thi){
	var type=$(thi).data("restype");
	var admin_root=$("#hid_adminroot").val();
	var url="";
    switch(type){
    case 0://素材
        url="${basepath}/m/ixin/fodder/detail.xhtml?id="+resourceid;
        break;
    case 1://调研
    	//url="${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+resourceid;
       url = admin_root + "/protal/uservote/index.xhtml?voteId="
				+ resourceid +"&uid=<%=uid%>";
        break;
    case 2://投票
    	//url="${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+resourceid;
    	 url = admin_root + "/protal/uservote/index.xhtml?voteId="
				+ resourceid +"&uid=<%=uid%>";
        break;
    case 3://抽奖    	
        url=admin_root+"/protal/activity/cardreward.xhtml?rewardId="+resourceid;
        break;
    case 4://排行榜
    	url="";
        break;
    case 5://课程
    	url="${basepath}/m/ixin/study/detail/"+resourceid+".xhtml?id="+resourceid;
    	if (window.top.location!= window.location) {
            window.top.location.href=url;
            return;
          }
    	break;
    case 6://考试
    	url="${basepath}/m/exam/detail.xhtml?tid="+resourceid;
    	if (window.top.location!= window.location) {
            window.top.location.href=url;
            return;
         }
        break;
    case 7://活动
    	//url="${basepath}/m/ixin/activity/detail.xhtml?id="+resourceid;
    	url = "${basepath}/m/ixin/activity/detaildispatch.xhtml?id="+resourceid;
        break;
    case 8://作业
        url="${basepath}/m/task/tlist.xhtml?id="+resourceid;
        break;
    }

    window.location.href=url;
}

</script>
</body>
</html>