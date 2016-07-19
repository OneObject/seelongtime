<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy"
	prefix="ajy"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>积分奖惩</title>
<meta name="menu_path" content="system.creditManage" />
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/testmanage.css">
<style type="text/css">
.form-horizontal .control-label, .form-horizontal .radio,
	.form-horizontal .checkbox, .form-horizontal .radio-inline,
	.form-horizontal .checkbox-inline {
	padding: 0px;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }">首页</a><i
					class="icon-angle-right"></i></li>
				<li><a href="${basepath }/mgr/credit/creditmanage.xhtml">积分管理</a><i
					class="icon-angle-right"></i></li>
				<li><span>积分奖惩</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>积分奖惩
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<form id="addForm" class="form-horizontal" role="form" action="">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-4 control-label">用户名:</label>
								<div class="col-md-4">
									<span class="detailesss">${user.username }</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">姓名:</label>
								<div class="col-md-4" id="name">${user.name }</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">总积分:</label>
								<div class="col-md-4" id="totalCredit">${ajy:creditTotal(user.id) }</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">奖惩类型:</label>
								<div class="col-md-4">
									<input type="hidden" id="rewardType" value="1"> <label
										class="radio-inline" onclick="setType('1')"> <input
										type="radio" name="type" value="1" checked="checked">奖励
									</label> <label class="radio-inline" onclick="setType('0')"> <input
										type="radio" name="type" value="0">惩罚
									</label>
								</div>
							</div>
							<div class="form-group" id="con_credit">
								<label class="col-md-4 control-label">积分<span
									class="required">*</span></label>
								<div class="col-md-2">
									<input type="text" id="credit" name="credit"
										onchange="validateCredit()" />
								</div>
								<div class="col-md-4" style="padding-left: 0px;">
									<span id="tip_credit" for="credit" class="help-block " style="">不能为空且为正整数</span>
								</div>
							</div>
						<% if("ennapp".equals(LoginSessionHelper.getCurrentDomain(request))) {%>	
							<!-- 经验值 -->
							<div class="form-group" id="con_experience">
								<label class="col-md-4 control-label">经验值</label>
								<div class="col-md-2">
									<input type="text" id="experience" name="experience" />
								</div>
							<div class="col-md-4" style="padding-left: 0px;">
									<span id="tip_credit" for="credit" class="help-block " style="">可以为空或正整数</span>
								</div>
							</div>
						<%} %>	
							
							<div class="form-group" id="con_remark">
								<label class="col-md-4 control-label">奖惩理由<span
									class="required">*</span></label>
								<div class="col-md-4">
									<textarea class="form-control" id="remark" name="remark"
										onchange="validateRemark()" style="resize: none"></textarea>
								</div>

								<div class="col-md-4" style="padding-left: 0px;">
									<span id="tip_remark" for="remark" class="help-block " style="">必填，100字以内</span>
								</div>
							</div>

							<div class="btn_group_center">
								<input type="hidden" id="uid" value="${user.id }">
								<button type="button" class="btn btn-success"
									onclick="toSubmit();">确定</button>
								<span class="btn default" onclick="goBack();">返回</span>
							</div>
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
<script
	src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js"
	type="text/javascript"></script> <script
	src='${basepath }/static/public/javascripts/commonValidate.js'
	type='text/javascript'></script> <script
	src="${basepath }/static/credit/createcredit.js" type="text/javascript"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> </content>
