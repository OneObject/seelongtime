<%@page import="com.longtime.app.config.Constants"%>
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
<title>考试详情</title>
<meta name="menu_path" content="test.testManage" />
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
				<li><span href="#">考试详情</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box purple">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>考试详情
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<form id="addForm" onsubmit="return validateAdd()"
						class="form-horizontal" role="form"
						action="${basepath }/base/admin/itest/examination/doupdate.xhtml">
						<div class="form-body">
							<div class="form-group" id="con_examName">
								<label class="col-md-4 control-label">考试名称</label>
								<div class="col-md-4">
									<label class="control-label"><span>${entity.examName
											}</span></label>
								</div>
							</div>
							<%-- <div class="form-group" id="con_examNo">
								<label class="col-md-4 control-label">考试编号</label>
								<div class="col-md-4">
									<label class="control-label"><span>${entity.examNo
											}</span></label>
								</div>
							</div> --%>
							<div class="form-group" id="con_time">
								<label class="col-md-4 control-label">考试时间</label>
								<div class="col-md-4">
									<label class="control-label"><span>${ltfun:dateLongToStringFormat(entity.startTime,'yyyy-MM-dd
											HH:mm') }</span></label> <label class="control-label"><span>&nbsp;至&nbsp;</span></label>
									<label class="control-label"><span>${ltfun:dateLongToStringFormat(entity.endTime,'yyyy-MM-dd
											HH:mm') }</span></label>
								</div>
								<div class="col-md-4">
									<span id="tip_time" for="time" class="help-block hidden"
										style="">不能为空</span>
								</div>
							</div>
							<div class="form-group" id="con_examDate">
								<label class="col-md-4 control-label">考试时长</label>
								<div class="col-md-4">
									<label class="control-label"><span>${entity.examDate
											}分钟</span></label>
								</div>
							</div>
							
							<div class="form-group" id="con_examCover">
								   <label class="col-sm-4 control-label" >考试图片</label>
								   <div class="col-sm-4">
								   <c:if test="${not empty entity.cover }">
								     <img src="<%=Constants.IMG_SERVER_DOWNLOAD%>${entity.cover}-320x180" id="exam-poster" class="img-responsive" style="width:320px;height:180px;"  >
								   </c:if>
								    </div>
							 </div>
							
							<div class="form-group" id="con_keyword">
								<label class="col-md-4 control-label">关键字</label>
								<div class="col-md-4">
									<label class="control-label"><span>${entity.keyword
											}</span></label>
								</div>
							</div>
							
							<%-- <div class="form-group" id="con_manager">
								<label class="col-md-4 control-label">考试负责人</label>
								<div class="col-md-4">
									<label class="control-label"><span>${entity.manager
											}</span></label>
								</div>
							</div> --%>
							<div class="form-group" id="con_examTimes">
								<label class="col-md-4 control-label">重考次数</label>
								<div class="col-md-4">
									<label class="control-label"><span> <%-- <c:out value="${entity.examTimes eq 0? '不限':entity.examTimes }" /> --%>
											${entity.examTimes eq 0? '不限':entity.examTimes }
									</span></label>
								</div>
							</div>
							<%-- <div class="form-group" id="con_domain">
								<label class="col-md-4 control-label">域</label>
								<div class="col-md-4">
									<label class="control-label"> <span> <c:if
												test="${entity.domain eq 'all' }">所有</c:if> <c:if
												test="${entity.domain eq 'ksf' }">康师傅</c:if> <c:if
												test="${entity.domain eq 'longtimeit' }">龙泰</c:if>
									</span>
									</label>
								</div>
							</div> --%>
							
							<%-- <div class="form-group" id="con_paperId">
								<label class="control-label col-md-4">关联试卷</label>
								<div class="col-md-4">
									<label class="control-label"><span> <a
											href="${basepath }/base/admin/itest/testpaper/detail.xhtml?id=${paper.id}">${paper.name
												}</a>
									</span></label>
								</div>
								<div class="col-md-4">
									<span id="tip_paperId" for="paperId" class="help-block hidden"
										style="">不能为空</span>
								</div>
							</div> --%>
							<%-- <div
								class="form-group <c:out value='${paper.generate_type eq 2? "hidden":"" }' />"
								id="con_paperNum">
								<label class="col-md-4 control-label">生成试卷数</label>
								<div class="col-md-4">
									<label class="control-label"><span>${entity.paperNum
											}</span></label>
								</div>
							</div> --%>
							<div class="form-group" id="con_score">
								<label class="col-md-4 control-label">立即显示分数</label>
								<div class="col-md-4">
									<label class="control-label"><span> <c:if
												test="${entity.isShowScore }">是</c:if> <c:if
												test="${!entity.isShowScore }">否</c:if>
									</span></label>
								</div>
							</div>
							<!-- 分割线 -->
							<div class="form-group" id="con_mark">
								<label class="col-md-4 control-label">考试描述</label>
								<div class="col-md-4">
									<textarea rows="3" class="form-control" name="content" id="content"
										onchange="" readonly="readonly">${ltfun:html2Text(entity.content, fn:length(entity.content))}</textarea>
								</div> 
							</div>
						</div>
						<div class="btn_group_center">
							<%-- 未发布 --%>
							<c:if test="${entity.status eq '0' || entity.status eq '-1' }">
								<button type="button" class="btn btn-warning"
									onclick="updateEntity('${entity.id }')">修改</button>
							</c:if>
							<c:if
								test="${entity.status ne '4' && entity.status ne '3' && entity.status ne '2' }">
								<button type="button" class="btn red"
									onclick="deleteSingleInDetail('${entity.id }')">删除</button>
							</c:if>
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
	type='text/javascript'></script> <script
	src="${basepath }/static/public/javascripts/examination.js"
	type="text/javascript"></script> </content>
<content tag="pageInit"> <!-- 初始化窗口 --> <script
	type="text/javascript">
	$(document).ready(function() {
		$('#datetimepicker_start').datetimepicker({
			language : 'zh-CN',
			pickerPosition : 'bottom-right',
			autoclose : true
		});
		$('#datetimepicker_end').datetimepicker({
			language : 'zh-CN',
			pickerPosition : 'bottom-right',
			autoclose : true
		});

		$("#domain").val("${entity.domain}");
	});
</script> </content>
