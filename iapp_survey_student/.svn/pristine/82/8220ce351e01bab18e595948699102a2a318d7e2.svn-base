<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
	<title>考试详情</title>
    <style type="text/css">
    	body{background:#f8f8f8;}
    </style>
      <script type="text/javascript">
		    function takeExam(tid){
		    	var sign = $("#sign").val();
		    	var timestamp = $("#timestamp").val();
				var url = "${basepath}/m/h5/exam/takeexam.xhtml?tid="+tid;
				if(sign != null && sign != ""){
					url = url+"&sign="+sign;
				}
				if(timestamp != null && timestamp != ""){
					url = url + "&timestamp="+timestamp;
				}
				 window.top.location.href=url;
			}

			function toRank(){
				var tid = $("#tid").val();
				var uid = $("#uid").val();
				var url = "${basepath}/m/exam/rank.xhtml?tid="+tid+"&uid="+uid;
				window.location.href = url;
			}
			function toResultList(){
				var tid = $("#tid").val();
				var uid = $("#uid").val();
				var url = "${basepath}/m/h5/exam/resultlist.xhtml?tid="+tid+"&uid="+uid;
				window.location.href = url;
			}
    	</script>
</head>
<body>
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);" class="ajyapp"><i class="fa fa-angle-left"></i></a></div>
     	<span class="addWrap" id="ptitle">${exam.examName}</span>
	</header>
	<input type="hidden" value="${uid }" id="uid"/>
	<input type="hidden" id="tid" value="${exam.id}">
	<input type="hidden" value="${sign}" id="sign"/>
	<input type="hidden" id="timestamp" value="${timestamp}">
    <article class="kaoshiDetail ctl_cont">
    	<section class="enterKaoshi">
        	<ul>
            	<li>${exam.examName}</li>
                <li>${ltfun:dateLongToStringFormat(exam.startTime,'yyyy-MM-dd HH:mm') }</li>
                <li class="pic">
                <c:if test="${ empty exam.cover}">
                <img src="${basepath }/static/m/img/kaoshi.png" style="width:100%;">
                </c:if>
                <c:if test="${not empty exam.cover}">
                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${exam.cover}-320x180" style="width:100%;">
                </c:if>
                </li>
            </ul>
            	<c:choose>
            		<c:when test="${exam.examTimes eq 0 || exam.examTimes gt exam.test_times }">
            			<div class="start" onclick="takeExam('${exam.id}');">开始答题</div>
            		</c:when>
            		<c:otherwise>
            			<div class="start" >您已经达到了答题限制次数</div>
            	</c:otherwise>
            </c:choose>
        </section>
        <section class="moreInfo">
        	<ul>
            	<li>规则说明：</li>
                <li>1、点击开始答题进入考试。</li>
                <li>2、答题完毕请根据提示进入下一步操作。</li>
                <!-- 
                <li>3、考试结束后，系统将自动给出成绩。</li>
                 -->
            </ul>
            <div class="rank" style="width:90px;float:left;" onclick="toRank()"><i class="fa fa-sort-amount-desc"></i>排行榜</div>
            <div class="view-result" style="width:90px;float:right;height: 14px;text-align:right;padding-top: 8px;line-height: 14px;font-size: 14px;" onclick="toResultList()">查看分数</div>
        </section>
    	
    		  	
    </article>
    <footer class="ctl_footer"></footer>     
</body>
</html>
