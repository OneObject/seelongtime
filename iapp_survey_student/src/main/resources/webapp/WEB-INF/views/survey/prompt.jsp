<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><fmt:message key="prompt.title" bundle="${bundle}"/></title>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/css/survey/style.css" />
	<script type="text/javascript" src="${staticpath}/static/js/jquery-2.1.0.min.js"></script>

	<script type="text/javascript">
		function toSurveyIndex(){
			window.location.href = "${basepath}/survey/index.xhtml";
		}
		
		function showResult(id){
			window.location.href = "${basepath}/survey/result.xhtml?id="+id;
		}
	</script>
</head>
<body>
	<div class="paper">
		<div class="exam_top">
			<h2><fmt:message key="prompt.thanks" bundle="${bundle}"/></h2>
		</div>
		<%-- <c:if test="${not empty activity.coverPath }">
			<div class="exam-ban">
				<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${activity.coverPath }-640x360" alt="" />
			</div>
		</c:if> --%>
		<div class="exam-content">
			<p class="title"><fmt:message key="prompt.tips" bundle="${bundle}"/></p>
			<p><fmt:message key="prompt.tips_one" bundle="${bundle}"/></p>
			<p><fmt:message key="prompt.tips_two" bundle="${bundle}"/></p>
		</div>
		<div class="go-exam fl" onclick="toSurveyIndex();"><fmt:message key="prompt.back" bundle="${bundle}"/></div>
		<div class="go-exam fr" onclick="showResult('${activity.id}');"><fmt:message key="prompt.see_answer" bundle="${bundle}"/></div>
	</div>
</body>
</html>        