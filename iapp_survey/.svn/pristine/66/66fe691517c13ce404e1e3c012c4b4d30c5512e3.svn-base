<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>添加课程</title>
<meta name="menu_path" content="course.courseManage" />
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/course.css">
<link rel="stylesheet"
	href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/ixin/css/uploadify.css">
<link rel="stylesheet" type="text/css"
	href="${basepath}/static/css/active.css">
<link rel="stylesheet" type="text/css"
	href="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css">

<style type="text/css">
div.checker,div.checker span,div.checker input {
	width: auto;
	height: auto;
}
</style>
<script type="text/javascript">
	var zdata = "${tree}";
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i
					class="icon-angle-right"></i></li>
				<li><a
					href="${basepath }/base/admin/course/course/coursemanage.xhtml">课程管理</a><i
					class="icon-angle-right"></i></li>
				<li><span>添加课程</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-reorder"></i><span>基础信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						<ul class="stemp-box">
							<li class="tep-left"><img
								src="${basepath}/static/img/step-left.png"></li>
							<li class="${stepStatus['1'] ?'over':'nor' }-step"
								onclick="next1('${id}');">1</li>
							<li class="step-xian${stepStatus['2'] ?'-lv':'' }"></li>
							<li class="${stepStatus['2'] ?'over':'nor' }-step"
								onclick="next2('${id}');">2</li>
							<li class="step-xian-lv"></li>
							<li class="current-step" onclick="next3('${id}');">3</li>
							<li class="step-xian${stepStatus['4'] ?'-lv':'' }"></li>
							<li class="${stepStatus['4'] ?'over':'nor' }-step"
								onclick="next4('${id}');">4</li>
							<li class="step-xian${stepStatus['5'] ?'-lv':'' }"></li>
							<li class="${stepStatus['5'] ?'over':'nor' }-step"
								onclick="next5('${id}');">5</li>
							<li class="tep-right"><img
								src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
							</li>
						</ul>
						<div class="preview-style">
							<form class="form-horizontal" role="form">

								<div class="form-group">
									<label class="col-sm-2 control-label">是否练习：</label>
									<div class="col-sm-10">
						<%--				<c:if test="${haspractice eq 0}">
											<div class="switch">
												<input type="checkbox" id="myswitch3" value="0" />
											</div>
										</c:if>
 --%>
										<c:if test="${haspractice eq 1 }">
											<div class="switch">
												<input type="checkbox" checked id="myswitch3" value="1" />
											</div>
										</c:if>

										<c:if test="${empty haspractice }">
											<div class="switch">
												<input type="checkbox" id="myswitch3" value="0" />
											</div>
										</c:if>
									</div>
								</div>

								<div class="form-group" id="practice_group"
							<c:if test="${empty haspractice }">			style="display: none;" </c:if>  >
									<label class="col-sm-2 control-label">练习：</label>
									<div class="col-sm-10">
										<div class="input-group" onclick="pagePractice(1)">
											<input type="text" class="form-control" placeholder="请选择练习"
												readonly="readonly" id="practicename" name="practicename"
												value="${practice.name}"> <span
												class="input-group-addon chose_coursewear"> <i
												class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择 
												<input
												type="hidden" name="practiceid" id="practiceid"
												value="${practice.id }">
											</span>
										</div>
									</div>
								</div>
								<%
									String domains = "-1,ajy,MERCER,robam,chtwm,resource,langham,amblem,tlzb";
									request.setAttribute("domains",domains);
								%>

								<div class="form-group" style="${fn:contains(domains, domain)  ? '' : 'display:none;'}">
									<label class="col-sm-2 control-label">是否考试：</label>
									<div class="col-sm-6">
										<c:if test="${hasexam eq 1 }">
											<div class="switch">
												<input type="checkbox" checked id="myswitch4" value="1" />
											</div>
										</c:if>

										<c:if test="${hasexam eq 0 }">
											<div class="switch">
												<input type="checkbox" id="myswitch4" value="0" />
											</div>
										</c:if>
										<span style="color:#ccc;font-size:12px;">目前只建立课程考试关系，其它功能未提供</span>
									</div>
								</div>

								<div class="form-group" id="exam_group"
									<c:if test="${hasexam eq 0 || ( !fn:contains(domains, domain) )}">	style="display: none;" </c:if>  >
									<label class="col-sm-2 control-label">考试：</label>
									<div class="col-sm-10">
										<div class="input-group" onclick="pageExam(1)">
											<input type="text" class="form-control" placeholder="请选择考试"
												readonly="readonly" id="examname" name="examname"
												value="${exam.examName}"> <span
												class="input-group-addon chose_coursewear"> <i
												class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择 
												<input
												type="hidden" name="tid" id="tid"
												value="${exam.id }">
											</span>
										</div>
									</div>
								</div>
								
							</form>
							<div class="form-group" style="text-align: right"> 
								<div class="form-group">
									<span class="btn btn-success" onclick="next2('${id}')"><i
										class="glyphicon glyphicon-arrow-left"></i>&nbsp;&nbsp;上一步</span> <span
										class="btn btn-success" onclick="update3('${id}');"><i
										class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;下一步</span> <span
										style="margin-right: 30px; float: right; text-decoration: underline; color: #15A0F5; cursor: pointer; margin-left: 20px; margin-top: 20px;"
										onclick="next4('${id}')">跳过</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
<!-- 弹出练习的界面 -->
<div class="easyDialog_wrapper" id="easyDialogWrapperPra">
	<div class="easyDialog_content">
		<h4 class="easyDialog_title" id="easyDialogTitle">
			<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
				 onclick="easyDialog.close()">&times;</a> 选择练习
		</h4>
		<div class="easyDialog_text" style="width: 600px;height:650px;display:block;overflow-x:hidden;overflow-y:scroll;">
			<ul class="nav nav-tabs">
			  <li class="active"><a href="#choosefodder" data-toggle="tab">选择练习</a></li>
			</ul>					
			<!-- Tab panes -->
			<div class="tab-content">
			  	<div class="tab-pane active" id="choosefodder">
			  		<table class="table table-bordered">
			  			<thead>
			  				<tr>
			  					<td>序号</td>
			  					<td>名称</td>
			  					<td>操作</td>
			  				</tr>
			  			</thead>
			  			<tbody id="selectpractice">
			  			
			  			</tbody>
			  		</table>
			  		  <div style="width:100%;clear:both;height:30px;margin-top:10px;display:block;" id="pageinit">
	                           </div>
			  	</div>
			</div>
		</div>
		<div class="easyDialog_footer">
			<button class="btn_normal" onclick="easyDialog.close()">取消</button>
		</div>
	</div>
</div>

<!-- 弹出考试的界面 -->
<div class="easyDialog_wrapper" id="easyDialogWrapperTest">
	<div class="easyDialog_content">
		<h4 class="easyDialog_title" id="easyDialogTitleTest">
			<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
				 onclick="easyDialog.close()">&times;</a> 选择考试
		</h4>
		<div class="easyDialog_text" style="width: 600px;height:650px;display:block;overflow-x:hidden;overflow-y:scroll;">
			<ul class="nav nav-tabs">
			  <li class="active"><a href="#choosefodderTest" data-toggle="tab">选择考试</a></li>
			</ul>					
			<!-- Tab panes -->
			<div class="tab-content">
			  	<div class="tab-pane active" id="choosefodderTest">
			  		<table class="table table-bordered">
			  			<thead>
			  				<tr>
			  					<td>序号</td>
			  					<td>名称</td>
			  					<td>操作</td>
			  				</tr>
			  			</thead>
			  			<tbody id="selecttest">
			  			
			  			</tbody>
			  		</table>
			  		  <div style="width:100%;clear:both;height:30px;margin-top:10px;display:block;" id="pageinitexam">
	                           </div>
			  	</div>
			</div>
		</div>
		<div class="easyDialog_footer">
			<button class="btn_normal" onclick="easyDialog.close()">取消</button>
		</div>
	</div>
</div>
	
	
	<script type="text/javascript"
		src="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js"></script>
	<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${basepath }/static/public/javascripts/course/addcourse.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="${basepath }/static/js/course/course.js?v=20150428" charset="UTF-8"></script>
	<script
		src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js"
		type="text/javascript"></script>
	<script
		src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js"
		type="text/javascript"></script>
	<script
		src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$("#myswitch3").bootstrapSwitch({
				onText : "是",
				offText : "否"
			});

			$("#myswitch3").on('switchChange.bootstrapSwitch',
					function(event, state) {
						if (state.value) {
							$("#practice_group").css('display', 'block');
							$(this).val('1');
						} else {
							$("#practice_group").css('display', 'none');
							$(this).val('0');
						}
					});
			
			$("#myswitch4").bootstrapSwitch({
				onText : "是",
				offText : "否"
			});

			$("#myswitch4").on('switchChange.bootstrapSwitch',
					function(event, state) {
						if (state.value) {
							$("#exam_group").css('display', 'block');
							$(this).val('1');
						} else {
							$("#exam_group").css('display', 'none');
							$(this).val('0');
						}
					});
		});
	</script>
</body>
</html>

