<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>积分规则列表</title>
<meta name="menu_path" content="system.creditManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<!-- END PAGE HEADER-->
	<!-- 全局搜索组建开始 -->
	<!-- 全局搜索组建结束-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>积分规则列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 60px;">
					<div class="row">
						<span id="openStatusOption">
							<c:if test="${empty openStatus || openStatus.status == 0 }">
								<span class="btn btn-success table_add" onclick="openCredit('1')">&nbsp;启用积分</span>
							</c:if>
							<c:if test="${openStatus.status == 1 }">
								<span class="btn btn-danger table_add" onclick="openCredit('0')">&nbsp;禁用积分</span>
							</c:if>
						</span>
						
					</div>
                    <input type="hidden" id="statusId" value="${openStatus.id }"/>
                    <!-- 表格内容 -->
                    <div id="table_list"  class="mt10"></div>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<!-- 引用核心js包 -->
<script type="text/javascript" src="${basepath }/static/credit/creditrule.js"></script>
  
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
</content>
