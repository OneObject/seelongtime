<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<title>考试详情</title>
<meta name="menu_path" content="test.practiceManage" />
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
					href="${basepath }/base/admin/itest/examination/examination.xhtml">考试管理</a><i
					class="icon-angle-right"></i></li>
				<li><span href="#">练习详情</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box purple">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>练习详情
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<form id="addForm" onsubmit="return validateAdd()"
						class="form-horizontal" role="form"
						action="${basepath }/base/admin/itest/examination/doupdate.xhtml">
						<div class="form-body">
							<div class="form-group" id="con_examName">
								<label class="col-md-4 control-label">练习名称</label>
								<div class="col-md-4">
									<label class="control-label"><span>${practice.name
											}</span></label>
								</div>
							</div>
							<div class="form-group" id="con_examNo">
								<label class="col-md-4 control-label">练习题库</label>
								<div class="col-md-4">
									<label class="control-label"><span>${itemNames }</span></label>
								</div>
							</div>
							<div class="form-group" id="con_keyword">
								<label class="col-md-4 control-label">题目总数</label>
								<div class="col-md-4">
									<label class="control-label"><span>${practice.total
											}</span></label>
								</div>
							</div>
							<div class="form-group" id="con_examDate">
								<label class="col-md-4 control-label">练习图片</label>
								<div class="col-md-4">
									<c:if test="${not empty practice.cover }">
										<img
											src="<%=Constants.IMG_SERVER_DOWNLOAD%>${practice.cover}-320x180"
											id="exam-poster" class="img-responsive"
											style="width: 320px; height: 180px;">
									</c:if>
								</div>
							</div>
							<div class="form-group" id="con_manager">
								<label class="col-md-4 control-label">练习创建人</label>
								<div class="col-md-4">
									<label class="control-label"><span>${practice.creater
											}</span></label>
								</div>
							</div>
							<div class="form-group" id="con_domain">
								<label class="col-md-4 control-label">域</label>
								<div class="col-md-4">
									<label class="control-label"> <span> <c:if
												test="${practice.domain eq 'all' }">所有</c:if> <c:if
												test="${practice.domain eq 'ksf' }">康师傅</c:if> <c:if
												test="${practice.domain eq 'longtimeit' }">龙泰</c:if>
									</span>
									</label>
								</div>
							</div>
							<div class="form-group" id="con_time">
								<label class="col-md-4 control-label">练习创建时间</label>
								<div class="col-md-4">
									<label class="control-label"><span>${ltfun:dateLongToStringFormat(practice.createTime,'yyyy-MM-dd
											HH:mm') }</span></label>
								</div>
							</div>


							<!-- 分割线 -->
							<div class="form-group" id="con_mark">
								<label class="col-md-4 control-label">练习描述</label>
								<div class="col-md-4">
									<textarea rows="3" class="form-control" name="content"
										id="content" onchange="" readonly="readonly">${ltfun:html2Text(practice.content, fn:length(practice.content))}</textarea>
								</div>
							</div>
						</div>
						<div class="btn_group_center">
							<button type="button" class="btn btn-warning"
								onclick="updateEntity('${practice.id }')">修改</button>
							<button type="button" class="btn red"
								onclick="deleteSingleInDetail('${practice.id }')">删除</button>
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
	charset="UTF-8"></script> <script
	src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js"
	type="text/javascript"></script> <script
	src="${basepath }/static/public/javascripts/testmanage.js"></script> <%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js'
	type='text/javascript'></script> <script type="text/javascript"
	src="${basepath }/static/public/javascripts/practice.js"></script>
type="text/javascript"></script> </content>
<content tag="pageInit"> <!-- 初始化窗口 --> <script
	type="text/javascript">
	$(document).ready(function() {
		$('#datetimepicker_start').datetimepicker({
			language : 'zh-CN',
			pickerPosition : 'bottom-right',
			autoclose : true
		});

		$("#domain").val("${practice.domain}");
	});
</script> </content>
