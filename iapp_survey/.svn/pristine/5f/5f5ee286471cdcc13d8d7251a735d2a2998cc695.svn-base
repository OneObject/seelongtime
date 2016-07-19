<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>积分值日志列表</title>
<meta name="menu_path" content="system.creditManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/mgr/credit/creditmanage.xhtml">积分管理</a><i class="icon-angle-right"></i></li>
                 <li><span>积分值日志列表</span></li>
                
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>积分值日志列表（用户：${user.name }&nbsp;&nbsp;总积分：${ajy:creditTotal(user.id) }）
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 60px;">
					<div class="row">
						<span class="btn btn-success table_add" onclick="goBack();">&nbsp;返回</span>
					</div>
                    <!-- 表格内容 -->
                    <div id="table_list"  class="mt10"></div>
					
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="uid" value="${user.id }"/>
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<!-- 引用核心js包 -->
<script type="text/javascript" src="${basepath }/static/credit/logdetail.js"></script>
  
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
</content>
