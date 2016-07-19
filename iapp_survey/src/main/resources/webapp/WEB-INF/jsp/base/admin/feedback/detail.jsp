<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page import="com.longtime.app.config.Constants"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>

<%
	String domain = LoginSessionHelper.getCurrentDomain(request);
	pageContext.setAttribute("domain", domain);
%>
 
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>反馈详情</title>
<meta name="menu_path" content="system.feedback" />
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }">首页</a><i
					class="icon-angle-right"></i></li>
				<li><a
					href="${basepath }/base/admin/feedback/index.xhtml">反馈管理</a><i
					class="icon-angle-right"></i></li>
				<li><span href="#">反馈详情</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box purple">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>反馈详情
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<form id="addForm" class="form-horizontal" role="form" action="">
						<div class="form-body">
							<div class="form-group" id="con_examName">
								<label class="col-md-4 control-label">用户姓名</label>
								<div class="col-md-4">
									<label class="control-label"><span>${entity.name}</span></label>
								</div>
							</div>
						
							<div class="form-group" id="con_time">
								<label class="col-md-4 control-label">创建时间</label>
								<div class="col-md-4">
									<label class="control-label"><span>${ltfun:dateLongToStringFormat(entity.createTime,'yyyy-MM-dd
											HH:mm') }</span></label> <label class="control-label"></label>
									
								</div>
								
							</div>
							
							
							
							
							<div class="form-group" id="con_keyword">
								<label class="col-md-4 control-label">类型</label>
								<div class="col-md-4">
									<label class="control-label"><span>
									<c:if test="${domain ne 'muyang' }">
										${entity.type eq 0 ?"建议":"投诉"}
									</c:if>
									<c:if test="${domain eq 'muyang'}">
										${entity.type eq 0 ?"新产品开发":entity.type eq 1 ?"技术创新":entity.type eq 2?"产品问题":"其他"}
									</c:if>
									</span></label>
								</div>
							</div>
							
							<c:if test="${not empty entity.keyword }">
								<div class="form-group" id="con_keyword">
									<label class="col-md-4 control-label">关键字</label>
									<div class="col-md-4">
										<label class="control-label"><span>${entity.keyword}</span></label>
									</div>
								</div>
							</c:if>
							
						
							
							
					
							<!-- 分割线 -->
							<div class="form-group" id="con_mark">
								<label class="col-md-4 control-label">内容</label>
								<div class="col-md-4">
									<textarea rows="3" class="form-control" name="content" id="content"
										onchange="" readonly="readonly">${ltfun:html2Text(entity.context, fn:length(entity.context))}</textarea>
								</div> 
							</div>
						</div>
						<div class="btn_group_center">
							<button type="button" class="btn default" onclick="backToList();">返回</button>
						</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<content tag="pageCore"> <!-- 引用核心js包 --> <script
	type="text/javascript"
	src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript"
	src="${basepath }/static/public/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script> <script type="text/javascript"
	src="${basepath }/static/public/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script> 
	<script
	src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js"
	type="text/javascript"></script>
	
 </content>
<content tag="pageInit"> <!-- 初始化窗口 -->
<script type="text/javascript">
function backToList(){
	window.history.back();
}
</script> </content>
