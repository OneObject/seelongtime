<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.longtime.ajy.player.framework.PlayerHelper"%>
<%@ page import="com.longtime.ajy.player.bean.ResourceType"%>

<%@page import="com.longtime.common.utils.UAgentInfo"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%
	PlayerHelper helper = new PlayerHelper(request, response);
	helper.parse();
	boolean istrace = helper.getIs_trace();
	String udomain = helper.getUdomain();
	String userid = helper.getUser_id();
	String resourceid = helper.getResource_id();
	String resourcetype = helper.getResource_type().name();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- jquery js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/player/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/player/js/jquery-ui-1.9.2.custom.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/player/js/jquery.timer.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/player/js/jquery.cookie.js"></script>

<!-- 页面计时 -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/player/js/study.time.js?v=2"></script>


<script type="text/javascript">
var trace_url = '<%=request.getContextPath()%>/player/trace';
tracker = new StudyTimeTracker(trace_url, "<%=udomain%>", "<%=userid%>", "<%=resourceid%>", "<%=resourcetype%>");
	$(function() {
		//只有当用户播放时才记录学习记录和时长
		if (<%=istrace%>) {
			tracker.init();
			tracker.start();
		}
	});
</script>
</head>
<body>
</body>
</html>