<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
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
<title>租户个性化配置</title>
<meta name="menu_path" content="system.tenantconfig" />
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/ixin/css/uploadify.css">
<link
	href="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${basepath }/static/public/easydialog-v2.0/easydialog.css"
	type="text/css">
<script
	src="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js"></script>
	<script type="text/javascript" src="${basepath }/static/plugins/jscolor/jscolor.js"></script>
<script type="text/javascript">
	var token = "${result.uploadToken}";
	//var qiniuImageBasePath = "${result.qiniuImageBasePath}";
	var qiniuImageBasePath = "<%=Constants.IMG_SERVER_DOWNLOAD%>";
	var coverSuffix = "-80x80";
	var summary = "${entity.summary}";

	$(function() {
		$("#isShowIsOpen").bootstrapSwitch({
			onText : "是",
			offText : "否",
			onColor : "success",
			offColor : "default"
		});
		$("#isfoddershare").bootstrapSwitch({
			onText : "是",
			offText : "否",
			onColor : "success",
			offColor : "default"
		});
		$("#isautosyn").bootstrapSwitch({
			onText : "是",
			offText : "否",
			onColor : "success",
			offColor : "default"
		});
		$("#syncfromwx").bootstrapSwitch({
			onText : "是",
			offText : "否",
			onColor : "success",
			offColor : "default"
		});
		$("#openRegister").bootstrapSwitch({
			onText : "是",
			offText : "否",
			onColor : "success",
			offColor : "default"
		});
		$("#showNavigation").bootstrapSwitch({
			onText : "是",
			offText : "否",
			onColor : "success",
			offColor : "default"
		});
		
		if ("${tenantConfig.isopen}" == "true") {
			$("#table_list").css("display", "block");
		} else {
			$("#table_list").css("display", "none");
		}
		$("#isShowIsOpen").on('switchChange.bootstrapSwitch',
				function(event, state) {
					if (state.value) {
						$("#table_list").css("display", "block");
						$("#isShowIsOpen").val(1);
						updateTenantSiteInfo();
					} else {
						$("#table_list").css("display", "none");
						$("#isShowIsOpen").val(0);
						updateTenantSiteInfo();
					}
				});
		
		$("#isautosyn").on('switchChange.bootstrapSwitch',
				function(event, state) {
					if (state.value) {
						$("#isautosyn").val(1);
						updateTenantSiteInfo();
					} else {
						$("#isautosyn").val(0);
						updateTenantSiteInfo();
					}
				});
		$("#syncfromwx").on('switchChange.bootstrapSwitch',
				function(event, state) {
					if (state.value) {
						$("#syncfromwx").val(1);
						updateTenantSiteInfo();
					} else {
						$("#syncfromwx").val(0);
						updateTenantSiteInfo();
					}
				});
		$("#openRegister").on('switchChange.bootstrapSwitch',
				function(event, state) {
					if (state.value) {
						$("#openRegister").val(1);
						updateTenantSiteInfo();
					} else {
						$("#openRegister").val(0);
						updateTenantSiteInfo();
					}
				});
		
		$("#isfoddershare").on('switchChange.bootstrapSwitch',
				function(event, state) {
					if (state.value) {
						$("#isfoddershare").val(1);
						updateTenantSiteInfo();
					} else {
						$("#isfoddershare").val(0);
						updateTenantSiteInfo();
					}
				});
		
		$("#showNavigation").on('switchChange.bootstrapSwitch',
				function(event, state) {
					if (state.value) {
						$("#showNavigation").val(1);
						updateTenantSiteInfo();
					} else {
						$("#showNavigation").val(0);
						updateTenantSiteInfo();
					}
				});
	});

	//保存话题信息
	function saveTopicInfo() {
		var title = $.trim($("#topicname").val());
		var cover = $("#coverPath3").val();
		var descript = $("#descript").val();
		var id = $("#topicid").val();

		if (title == null || title == "") {
			$("#topicInfo").show();
			return;
		} else {
			$("#topicInfo").hide();
		}
		$.ajax({
			type : "post",
			url : "${basepath}/base/admin/topicconfig/add.json",
			data : {
				"title" : title,
				"cover" : cover,
				"descript" : descript,
				"id" : id
			},
			success : function(data) {
				if (data.msg) {
					showMsgDialog("操作成功");
					$("#topicid").val(data.id);
				} else {
					showMsgDialog("操作失败");
				}
			}
		});
	}
	
	//保存系统色调
	function saveColorInfo() {
		var color = $.trim($("#color").val());
		if(color != null && color != ""){
			updateTenantSiteInfo();
		}
	}
	
	//保存邮件服务配置
	function saveEmailInfo() {
		var host = $.trim($("#host").val());
		var port = $.trim($("#port").val());
		var username = $.trim($("#username").val());
		var password = $.trim($("#password").val());
		

		if (host == null || host == "") {
			$("#hostInfo").show();
			return;
		} else {
			$("#hostInfo").hide();
		}
		
		if (port == null || port == "") {
			$("#portInfo").show();
			return;
		} else {
			$("#portInfo").hide();
		}
		
		if (username == null || username == "") {
			$("#usernameInfo").show();
			return;
		} else {
			$("#usernameInfo").hide();
		}
		
		if (password == null || password == "") {
			$("#passwordInfo").show();
			return;
		} else {
			$("#passwordInfo").hide();
		}
		
		updateTenantSiteInfo();
	}
</script>
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="">系统管理</a><i
					class="icon-angle-right"></i></li>
				<li><span href="#">企业配置</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>

	<!-- END PAGE HEADER-->
	<!-- 全局搜索组建开始 -->
	<ul class="nav nav-tabs">
		<li class="active tabLi"><a href="#tenantbasic" data-toggle="tab">基本配置</a></li>
		<%-- <li class="tabLi"><a href="#mgrsitebasic" id="tabAttFodder" 
			data-toggle="tab">站点配置</a></li>
		<li class="tabLi"><a href="#topicbasic" data-toggle="tab">话题配置</a></li>
		<li class="tabLi"><a href="#colorbasic" data-toggle="tab">系统色调配置</a></li> --%>
		<li class="tabLi"><a href="#emailbasic" data-toggle="tab">邮件配置</a></li>
		<li class="tabLi"><a href="#emailmodule" data-toggle="tab">邮件模板配置</a></li>
		<%--<li class="tabLi"><a href="#replybasic" data-toggle="tab">回复配置</a></li> --%>
	</ul>
	<div class="tab-content">
		<!-- Tab panes -->
		<div class="tab-pane  active" id="tenantbasic">
			<div class="row">
				<div class="col-lg-12">
					<div class="portlet box yellow">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-bar-chart-o"></i><span>企业信息</span>
							</div>
						</div>
						<div class="portlet-body main_bd box">
							<div class="mauto">
								<div class="col-md-12">
									<!-- 创建 start-->
									<div class="form">
										<form role="form" id="tenantForm"
											action="${basepath}/base/admin/tenantconfig/edittenant.xhtml"
											method="post">
											<div class="form-body">
												<div class="form-group">
													<label for="biaoti">企业名称</label> <input type="text"
														class="form-control" value="${tenant.name}"
														id="tenantName" name="tenantName" placeholder="">
													<input type="hidden" name="id" value="${tenant.id}">
													<span class="help-block" style="display: none; color: red;"
														id="tenantInfo"> 名称不能为空 </span>
												</div>
												<div class="form-group">
													<label for="logindomain">登录域名</label> <input type="text"
														class="form-control" value="${domain}.aijiayou.com"
														disabled="disabled" placeholder="">
												</div>
												<div class="appmsg_edit_item" style="margin-bottom: 10px;">
													<label for="">logo</label>
													<div class="frm_input_box"
														style="border: 1px solid #e5e5e5; padding-top: 3px; padding-bottom: -5px; padding-left: 10px;">
														<div class="upload_box">
															<div class="upload_area">
																<input type="file" name="file_upload" id="file_upload" />
																<ul class="upload_file_box" style="display: none;"
																	id="queue"></ul>
															</div>
														</div>
														<div style="display: none; margin-bottom: 20px;"
															id="small_prev">
															<span id="image_cover"></span><a class="js_removeCover"
																href="javascript:void(0);" onclick="deleteCover();">删除</a>
															<input type="hidden" name="coverPath" id="coverPath"
																value="${tenant.logo}" />
														</div>
													</div>
												</div>

												<div class="appmsg_edit_item" style="margin-bottom: 10px;display: none;">
													<label for="">登录页背景图片</label>
													<div class="frm_input_box"
														style="border: 1px solid #e5e5e5; padding-top: 3px; padding-bottom: -5px; padding-left: 10px;">
														<div class="upload_box">
															<div class="upload_area">
																<input type="file" name="file_upload2" id="file_upload2" />
																<ul class="upload_file_box" style="display: none;"
																	id="queue"></ul>
															</div>
														</div>
														<div style="display: none; margin-bottom: 20px;"
															id="small_prev2">
															<span id="image_cover2"></span><a class="js_removeCover"
																href="javascript:void(0);" onclick="deleteCover2();">删除</a>
															<input type="hidden" name="coverPath2" id="coverPath2"
																value="${tenant.logincover}" />
														</div>
													</div>
												</div>

											</div>
										</form>
									</div>
									<!-- 创建 end-->
								</div>

							</div>
							<!-- 添加 end -->
							<div class="btngroup" style="text-align: center;">
								<div class="btn btn-warning" onclick="saveTenantInfo();">保存</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 以下是微信端租户站点的配置页面 -->
		<div class="tab-pane" id="mgrsitebasic">
			<div class="row">
				<div class="col-md-12">
					<div class="portlet box yellow">
						<div class="portlet-title">
							<div class="caption">
								<i class="icon-globe"></i>站点信息
							</div>
						</div>
						<div class="portlet-body"
							style="overflow: hidden; padding-bottom: 100px;">
							<div class="mauto">
								<div class="col-md-12">
									<!-- 创建 start-->
									<div class="form">
										
										<div class="form-body">
											<div class="form-group">
												<div class="col-md-10">
													<div class="switch ">
														<label for="biao" style="margin-left: -15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;微信端是否显示导航：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<input type="checkbox"
															${(tenantConfig.shownavigation == true) ? 'checked' : '' }
															value="${tenantConfig.shownavigation==true?1:0 }"
															id=showNavigation />
													</div>
												</div>
											</div>
										</div>

										<div class="form-body">
											<div class="form-group">
												<div class="col-md-10">
													<div class="switch ">
														<label for="biao" style="margin-left: -15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;微信端是否开放注册：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<input type="checkbox"
															${(tenantConfig.openregister == true) ? 'checked' : '' }
															value="${tenantConfig.openregister==true?1:0 }"
															id="openRegister" />
													</div>
												</div>
											</div>
										</div>
										
										<div class="form-body">
											<div class="form-group">
												<div class="col-md-10">
													<div class="switch ">
														<label for="biao" style="margin-left: -15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登录绑定页提示信息：&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<textarea class="form-control" id="login_prompt"
														style="resize: none" placeholder="登录绑定页提示信息">${tenantConfig.login_prompt}</textarea>
													</div>
												</div>
											</div>
										</div>
										
										<div class="form-body">
											<div class="form-group">
												<div class="col-md-10">
													<div class="switch ">
														<label for="biaoti" style="margin-left: -15px;">微信端访问是否全站点开放：&nbsp;&nbsp;</label>
														<input type="checkbox"
															${(tenantConfig.isopen == true) ? 'checked' : '' }
															value="${tenantConfig.isopen==true?1:0 }"
															id="isShowIsOpen" />
													</div>
												</div>
											</div>
										</div>
										
										<div class="form-body">
											<div class="form-group">
												<div class="col-md-10">
													<div class="switch ">
														<label for="biaoti" style="margin-left: -15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;同步至微信：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<input type="checkbox"
															${(tenantConfig.isautosyn == true ) ? 'checked' : '' }
															value="${(tenantConfig.isautosyn==true )?1:0 }"
															id="isautosyn" />
															<span style="color:#666;margin:0px 0px 0px 5px;position:relative;top:2px;">用户、组织变更同步到企业公众平台</span>
													</div>
												</div>
											</div>
										</div>
										
										<div class="form-body">
											<div class="form-group">
												<div class="col-md-10">
													<div class="switch ">
														<label for="biaoti" style="margin-left: -15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;从微信同步：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<input type="checkbox"
															${(tenantConfig.syncfromwx == true ) ? 'checked' : '' }
															value="${(tenantConfig.syncfromwx==true )?1:0 }"
															id="syncfromwx" />
															<span style="color:#666;margin:0px 0px 0px 5px;position:relative;top:2px;">从企业公众平台同步组织、用户信息</span>
													</div>
												</div>
											</div>
										</div>
										
										<div class="form-body">
											<div class="form-group">
												<div class="col-md-10">
													<div class="switch ">
														<label for="biao" style="margin-left: -15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;素材可分享：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
														<input type="checkbox"
															${(tenantConfig.isfoddershare == true) ? 'checked' : '' }
															value="${tenantConfig.isfoddershare==true?1:0 }"
															id="isfoddershare" />
													</div>
												</div>
											</div>
										</div>
										
									</div>
									<!-- 创建 end-->
								</div>
							</div>
				
							<div id="table_list" class="mt10">
								<table
									class="table table-striped table-bordered table-hover table-full-width datatable"
									id="sample_2">
									<thead>
										<tr>
											<th>模块名称</th>
											<th>当前状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="tbody">

										<c:choose>
											<c:when test="${fn:length(mlistvo) eq 0 }">
												<tr>
													<td colspan="14">没有相关记录！</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="item" items="${mlistvo }" varStatus="st">
													<tr>
														<td>${item.modulename}</td>
														<td><c:if test="${item.moduleConfig.isopen}">
																<span id="isopen_${item.id}">开放</span>
															</c:if> <c:if test="${!item.moduleConfig.isopen}">
																<span id="isopen_${item.id}">不开放</span>
															</c:if></td>
														<td><a href="javascript:void(0);"
															onclick="updateModuleConfig('${item.id }')">点击修改状态</a></td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
							
							
							
							
							<div class="btngroup" style="text-align: center;">
								<div class="btn btn-warning" onclick="save_login_prompt();">保存</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="tab-pane" id="topicbasic">
			<div class="row">
				<div class="col-lg-12">
					<div class="portlet box yellow">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-bar-chart-o"></i><span>话题信息</span>
							</div>
						</div>
						<div class="portlet-body main_bd box">
							<div class="mauto">
								<div class="col-md-12">
									<!-- 创建 start-->
									<div class="form">
										<form role="form" action="#">
											<div class="form-body">
												<div class="form-group">
													<label for="biaoti">话题名称</label> <input type="text"
														class="form-control" value="${topicconfig.title }"
														id="topicname" name="topicname" placeholder=""> <span
														class="help-block" style="display: none; color: red;"
														id="topicInfo"> 名称不能为空 </span>
												</div>
												<div class="appmsg_edit_item" style="margin-bottom: 10px;">
													<label for="">话题logo</label>
													<div class="frm_input_box"
														style="border: 1px solid #e5e5e5; padding-top: 3px; padding-bottom: -5px; padding-left: 10px;">
														<div class="upload_box">
															<div class="upload_area">
																<input type="file" name="file_upload3" id="file_upload3" />
																<ul class="upload_file_box" style="display: none;"
																	id="queue"></ul>
															</div>
														</div>
														<div style="display: none; margin-bottom: 20px;"
															id="small_prev3">
															<span id="image_cover3"></span><a class="js_removeCover"
																href="javascript:void(0);" onclick="deleteCover3();">删除</a>
															<input type="hidden" name="coverPath3" id="coverPath3"
																value="" />
														</div>
													</div>
												</div>

												<div class="form-group">
													<label for="active-synopsis">话题简介</label>
													<textarea class="form-control" id="descript"
														style="resize: none" placeholder="话题简介">${topicconfig.descript }</textarea>
												</div>
											</div>
										</form>
									</div>
									<!-- 创建 end-->
								</div>

							</div>
							<!-- 添加 end -->
							<div class="btngroup" style="text-align: center;">
								<input type="hidden" id="topicid" name="topicid"
									value="${topicconfig.id}">
								<div class="btn btn-warning" onclick="saveTopicInfo();">保存</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="tab-pane" id="colorbasic">
			<div class="row">
				<div class="col-lg-12">
					<div class="portlet box yellow">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-bar-chart-o"></i><span>系统色调设置</span>
							</div>
						</div>
						<div class="portlet-body main_bd box">
							<div class="mauto">
								<div class="form-group" id="color_con">
	                              <label class="control-label col-md-2">系统色调<span class="required">*</span></label>
	                              <div class="col-md-4">
	                                 <div class="input-group">
	                                    <input type="text" class="form-control color" value="${not empty tenantConfig.color ? tenantConfig.color : '9ACF60'}" id="color" name="color" placeholder="">
	                                 </div>
	                              </div>
	                              <div class="col-md-5">
	                                <span id="name_tip" for="name" class="help-block" style="">不能为空</span>
	                              </div>
	                           </div>
							</div>
							<!-- 添加 end -->
							<div class=" col-md-offset-4 col-md-10" >
								<div class="btn btn-warning" onclick="saveColorInfo();">保存</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Tab panes 邮件配置-->
		<div class="tab-pane" id="emailbasic">
			<div class="row">
				<div class="col-lg-12">
					<div class="portlet box yellow">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-bar-chart-o"></i><span>邮件配置</span>
							</div>
						</div>
						<div class="portlet-body main_bd box">
							<div class="mauto">
								<div class="col-md-12">
									<!-- 创建 start-->
									<div class="form">
										<form role="form" id="emailForm"
											action="${basepath}/base/admin/tenantconfig/edittenant.xhtml"
											method="post">
											<div class="form-body">
												<div class="form-group">
													<label for="biaoti">smtp服务器地址</label><label style="color:#ccc;font-size:11px;">&nbsp;(请联系企业技术人员获取)</label> <input type="text"
														class="form-control" value="${tenantConfig.host}"
														id="host" name="host" placeholder="">
													<span class="help-block" style="display: none; color: red;"
														id="hostInfo">不能为空 </span>
												</div>
												<div class="form-group">
													<label for="biaoti">smtp服务器端口</label><label style="color:#ccc;font-size:11px;">&nbsp;(请联系企业技术人员获取)</label> <input type="text"
														class="form-control" value="${tenantConfig.port}"
														id="port" name="port" placeholder="">
													<span class="help-block" style="display: none; color: red;"
														id="portInfo">不能为空 </span>
												</div>
												
												<div class="form-group">
													<label for="biaoti">服务邮箱账号</label> <input type="text"
														class="form-control" value="${tenantConfig.username}"
														id="username" name="username" placeholder="">
													<span class="help-block" style="display: none; color: red;"
														id="usernameInfo">不能为空 </span>
												</div>
												
												<div class="form-group">
													<label for="biaoti">服务邮箱密码</label> <input type="password"
														class="form-control" value="${tenantConfig.password}"
														id="password" name="password" placeholder="">
													<span class="help-block" style="display: none; color: red;"
														id="passwordInfo">不能为空 </span>
												</div>
												
												<div class="form-group">
													<label for="biaoti">发件人别名</label><label style="color:#ccc;font-size:11px;">&nbsp;(接受者看到的发件人名称)</label> <input type="text"
														class="form-control" value="${tenantConfig.alias}"
														id="alias" name="alias" placeholder="">
												</div>
											</div>
										</form>
									</div>
									<!-- 创建 end-->
								</div>

							</div>
							<!-- 添加 end -->
							<div class="btngroup" style="text-align: center;">
								<div class="btn btn-warning" onclick="saveEmailInfo();">保存</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 邮件模板配置 -->
		<div class="tab-pane" id="emailmodule">
			<div class="row">
				<div class="col-lg-12">
					<div class="portlet box yellow">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-bar-chart-o"></i><span>邮件模板配置</span>
							</div>
						</div>
						<div class="portlet-body main_bd box">
							<div class="mauto">
								<div class="col-md-12">
									<!-- 创建 start-->
									<div class="form">
										<form role="form" id="emailForm"
											action="${basepath}/base/admin/tenantconfig/edittenant.xhtml"
											method="post">
											<div class="form-body">
												<div class="form-group">
													<label for="biaoti">变量表示的含义</label>
													<!-- JSTL表达式转义 -->
													<span>\${name}：表示发送到的姓名; \${surveyName}：调研报告的名字; \${surveyUrl}：调研报告的地址;
													 \${remark}; \${author}：作者; \${sendDate}：发送的时间</span>
												</div>
												
												<div class="form-group">
													<label for="biaoti">模板的HTML代码</label>
													<textarea class="form-control textareaheight" id="mailmodule"
														style="resize: none" placeholder="html代码" rows="8" ><c:if test="${tenantConfig.mailmodule ne null}">${tenantConfig.mailmodule}</c:if><c:if test="${tenantConfig.mailmodule eq null}">\${name},您好<br/><br/>诚挚邀请您参加\${surveyName}，谢谢您的配合！<br/><a href="\${surveyUrl}"> 请点击这里 </a>或在浏览器输入： \${surveyUrl}<br/>用户名/密码：工号/888888<br/><br/>\${remark}<br/><br/>\${author}<br/>\${sendDate}</c:if></textarea>
												</div>
												
												
											</div>
										</form>
									</div>
									<!-- 创建 end-->
								</div>

							</div>
							<!-- 添加 end -->
							<div class="btngroup" style="text-align: center;">
								<div class="btn btn-warning" onclick="saveEmailModule();">保存</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
 
	</div>
	<!-- 条件选择结束 -->
	<input type="hidden"
	 value="${tenantConfig.isreply==true?1:0 }" id="isShowIsReply" />
</body>
</html>
<content tag="pageCore"> <script
	src="${basepath }/static/ixin/js/jquery.uploadify.min.js"
	type="text/javascript"></script> </content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script	type="text/javascript"	src="${basepath }/static/js/tenantconfig/tenantconfig.js"></script> 
<script	type="text/javascript"	src="${basepath }/static/public/easydialog-v2.0/easydialog.js"></script>
<script type="text/javascript">
	<c:if test="${not empty tenant && not empty tenant.logo}">
	$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${tenant.logo}'>");
	$("#small_prev").show();
	</c:if>
	<c:if test="${not empty tenant && not empty tenant.logincover}">
	$("#image_cover2").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${tenant.logincover}"+coverSuffix+"'>");
	$("#small_prev2").show();
	</c:if>
	<c:if test="${not empty topicconfig && not empty topicconfig.cover}">
	$("#image_cover3").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${topicconfig.cover}"+coverSuffix+"'>");
	$("#small_prev3").show();
	</c:if>

	var replycontent = "${tenantConfig.replycontent}";
	
	/*
	 * 用来更新邮件模板的内容
	 */
	function saveEmailModule() {
		var mailmodule = $("#mailmodule").val();
		
		$.ajax({
			type: "POST",
			url: basepath + "/base/admin/tenantconfig/updatemailmodule.json",
			data: {
				"mailmodule": mailmodule
			},
			success: function(data) {
				if (data == null) {
					showMsgDialog("修改失败");
				} else {
					showMsgDialog("修改成功");
				}
			}
		})
	}
	
	function updateTenantSiteInfo() {
		var isopen = $("#isShowIsOpen").val();
		var isfoddershare = $("#isfoddershare").val();
		var isautosyn = $("#isautosyn").val();
		var syncfromwx = $("#syncfromwx").val();
		var isreply =  $("#isShowIsReply").val();
		var isregister = $("#openRegister").val();
		var shownavigation = $("#showNavigation").val();
		var color = $("#color").val();
		
		var host = $.trim($("#host").val());
		var port = $.trim($("#port").val());
		var username = $.trim($("#username").val());
		var password = $.trim($("#password").val());
		var alias = $.trim($("#alias").val());
		
		$.ajax({
			type : "POST",
			url : basepath + "/base/admin/tenantconfig/updatetenantsite.json",
			data : {
				"isopen" : isopen,
				"isfoddershare" : isfoddershare,
				"isreply" : isreply,
				"replycontent" : replycontent,
				"isautosyn" : isautosyn,
				"syncfromwx" : syncfromwx,
				"isregister" : isregister,
				"color" : color,
				"shownavigation": shownavigation,
				"host" : host,
				"port" : port,
				"username" : username,
				"password" : password,
				"alias" : alias
			},
			success : function(data) {
				if (data == null) {
					showMsgDialog("修改失败");
				} else {
					showMsgDialog("修改成功");
				}
			}
		});
	}

	function updateModuleConfig(id) {
		$
				.ajax({
					type : "POST",
					url : basepath
							+ "/base/admin/moduleconfig/updatemoduleconfig.json",
					data : {
						"moduleid" : id
					},
					async : true,
					success : function(data) {
						if (data == null) {
							showMsgDialog("修改失败");
						} else {
							showMsgDialog("修改成功");
							if (data.isopen == true) {
								$("#isopen_" + id).html("开放");
							} else {
								$("#isopen_" + id).html("不开放");
							}
						}
					}
				});
	}

	//保存回复信息
	function saveReplyInfo() {
		var replycontent = $.trim($("#replyContent").val()); 
		if ($("#isShowIsReply").val() == "1") {//设置回复
			if (replycontent == null || replycontent == "") {//回复消息为空
				$("#replyInfoMsg").show();
				return;
			} else {
				$("#replyInfoMsg").hide();
			}
		}
		updateTenantSiteInfo();
	}

	//保存登录、绑定提示信息 
	function save_login_prompt(){
		var promptMessage = $("#login_prompt").val();
		if(getBytesCount(promptMessage)>250){
				showMsgDialog("保存登录、绑定提示信息长度过长.");
				return;
			}
		$.ajax({
			type : "post",
			url : "${basepath}/base/admin/tenantconfig/saveloginprompt.json",
			data : {
				"login_prompt":promptMessage
			},
			success :function(data){
				if (data == null) {
					showMsgDialog("修改失败");
				} else {
					showMsgDialog("修改成功");
				}
				},
			error :function(data){
				showMsgDialog("操作失败");
				}
			});
		}
	
	function showMsgDialog(content) {
		easyDialog
				.open({
					container : {
						header : '提示',
						content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'
								+ content + '</div>'
					},
					autoClose : 1200
				});
	}
	
	function getBytesCount(str)
	{
	  var bytesCount = 0;
	  if (str != null)
	  {
	    for (var i = 0; i < str.length; i++)
	    {
	      var c = str.charAt(i);
	          if (c.match(/[^\x00-\xff]/ig) != null) //全角
	           {
	              bytesCount += 2;
	           }
	          else
	           {
	              bytesCount += 1;
	           }
	    }
	  }
	  return bytesCount;
	}
</script> </content>