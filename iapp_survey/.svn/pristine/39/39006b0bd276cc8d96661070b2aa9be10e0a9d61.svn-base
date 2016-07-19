<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>群发消息列表</title>
<meta name="menu_path" content="ixin.menu_groupmessage" />
<link rel="stylesheet" href="${basepath}/static/css/active.css">
<link rel="stylesheet" href="${basepath}/static/ixin/css/base.css"
	type="text/css">
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
<style>
* {
	padding: 0px;
	margin: 0px;
}

.clr {
	clear: both;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
}

.myShow {
	width: 312px;
	float: left;
	margin-top: 10px;
}

.myShow a:hover {
	text-decoration: underline;
}

.pHead {
	width: 312px;
	position: relative;
}

.pHead img {
	width: 312px;
	height: 156px;
}

.myShow .pHead a {
	display: block;
}

.myShow .pHead span.a {
	display: block;
	width: 312px;
	text-align: left;
	height: 36px;
	line-height: 36px;
	position: absolute;
	bottom: 0px;
	background: #000;
	filter: alpha(opacity = 65);
	-moz-opacity: 0.65;
	-khtml-opacity: 0.65;
	opacity: 0.65;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
}

.pHead span.a span {
	padding: 0px 6px;
}

a.box {
	display: block;
	float: left;
}

.myShow ul {
	width: 312px;
	padding: 6px 0;
	float: left;
}

.myShow ul li {
	float: left;
}

.myShow ul.b {
	border-top: 1px solid #ddd;
	color: #666;
}

.myShow ul.b li {
	text-align: left;
}

.myShow ul.b li.txt {
	width: 205px;
	padding: 10px;
}

.myShow ul.b li.pic {
	width: 78px;
	height: 70px;
	float: right;
}

.myShow ul.b img {
	width: 78px;
	height: 70px;
}

.myShow .pHead+a ul {
	padding-top: 10px;
	border: none;
}
</style>
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath}">首页</a><i class="icon-angle-right"></i></li>
				<li><span>群发记录</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>

	<!-- END PAGE HEADER-->



	<c:if test="${ empty list }">
		<div>暂无记录</div>
	</c:if>

	<div class="portlet-body box" id="msgListBody">
		<div class="portlet-body box">
			<c:if test="${not empty list }">

				<c:forEach items="${list}" var="info">
					<div class="clo-lg-4 ixin_item ">
						<div class="appmsg ">
							<div class="appmsg_content">
								<h4 class="appmsg_title">
									<em class="appmsg_date"> <d:formatDate
											currentTime="${info.sendTime }" format="yyyy/MM/dd" />
									</em>
								</h4>
								<div class="myShow">
									<c:if test="${info.contentType == 1 }">
										<div class="pHead">
											<div style="line-height:20px;font-size:14px;margin-bottom:10px;">${info.content }</div>
										</div>
									</c:if>
									<c:if test="${info.contentType == 0 }">
										<c:forEach items="${info.list }" var="item" varStatus="v">
	
											<c:if test="${v.first }">
												<div class="pHead">
													<a href="javascript:detail('${item.id}');"> 
													<c:if test="${ empty item.coverPath}">
					    								<img src="<%=Constants.IMG_SERVER_DOWNLOAD%>default_course_cover"   >
					    							</c:if>
					    							<c:if test="${not empty item.coverPath}">
					     								<img src="<%=Constants.IMG_SERVER_DOWNLOAD%>${item.coverPath}"   >
					    							</c:if>
													<span class="a">
															<span>${item.title } </span>
													</span>
													</a>
												</div>
											</c:if>
											<c:if test="${!v.first }">
												<a href="javascript:detail('${item.id}');" class="box">
													<ul class="b">
														<li class="txt">${item.title }</li>
														<li class="pic">
															<c:if test="${ empty item.coverPath}">
					    										<img src="<%=Constants.IMG_SERVER_DOWNLOAD%>default_course_cover"   >
					    									</c:if>
					    									<c:if test="${not empty item.coverPath}">
					     										<img src="<%=Constants.IMG_SERVER_DOWNLOAD%>${item.coverPath}"   >
					    									</c:if>
														</li>
													</ul>
												</a>
											</c:if>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<div>
			<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
		</div>
	</div>





</body>
</html>
<content tag="pageCore"> <script type="text/javascript">
	function page(i) {
		window.location.href = "${basepath}/mgr/fodder/messagelist.xhtml?currPage="
				+ i;
	}

	function detail(id){
		window.open("${basepath }/protal/fodder/detail.xhtml?id="+id);
	}
</script> </content>
