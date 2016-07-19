<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>角色管理</title>
	<meta name="menu_path" content="system.role"/>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/role.css">
</head>
<body>
	  <div class="row" >
	     <div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
			    <li><i class="icon-home"></i> <a href="${basepath }">首页</a>
			        <i class="icon-angle-right"></i></li>
			    <li><span href="#">角色管理</span></li>
			</ul>
	     </div>
	  </div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-group"></i>角色列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                    <div class="row">
					   <span class="btn btn-success add_role" onclick="add_role()"><i class="icon-plus"></i>增加角色</span>
					</div>
					
                    <%-- 分页内容 --%>
                    <div id="table_list" class="mt10"></div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
<script src="${basepath }/static/public/javascripts/role.js" type="text/javascript"></script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
</content>	


