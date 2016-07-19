<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<c:if test="${'1' eq tocp}">
	<title>消息群发(复星通)</title>
	<meta name="menu_path" content="ixin.menu_groupmessage_tocp" />
</c:if>

<c:if test="${'1' ne tocp}">
	<title>消息群发</title>
	<meta name="menu_path" content="ixin.menu_groupmessage" />
</c:if>

<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/testmanage.css">
<link rel="stylesheet" href="${basepath}/static/ixin/css/ixin.css"
	type="text/css">
<link rel="stylesheet" href="${basepath}/static/ixin/css/media.css"
	type="text/css">
<link rel="stylesheet" href="${basepath}/static/ixin/css/media_list.css"
	type="text/css">
<link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
<style type="text/css">
	.optiondialog{padding:10px;min-width:300px;text-align:left;margin-top:-20px;}
	.optiondialog span{display:block;}
	.optiondialog span.head{padding:10px 0px;}
	.optiondialog span{margin:5px;font-size:16px;font-weight:normal;}
	.optiondialog span label{margin-left:5px;}

	.portlet > .portlet-body.green, .portlet.green{
		background-color:#fff !important
	}
	div.msg-tag-box{
		width:100%;
		border:1px solid #e5e5e5;
		padding:10px;
		overflow:hidden;
	}
	div.msg-tag-box span.tag {
	    background: #aaaaaa;
	    border: 0;
	    padding: 3px 6px;
	    margin-top: 0;
	    color:#fff;
	    display: inline-block;
	    white-space: nowrap;
	    height: 24px;
	    margin-right:5px;
	    margin-bottom:5px;
	    float:left;
	    cursor: pointer;
	}
	div.msg-btn{
		width:150px;
	}
	div.msg-info{
		height:24px;
		line-height: 24px;
		margin:8px 0;
		display:none;
	}
	div.msg-tag-box{
		display:none;
	}
	div.msg-tag-box span.tag a{
		font-weight: bold;
		color: #fff; 
		text-decoration:none; 
		font-size: 11px;
		margin-left:4px; 
	}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i
					class="icon-angle-right"></i></li>
				<li><a href="#">消息群发</a></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box green">
				<div class="portlet-title" style="margin-bottom:20px;">
					<div class="caption">
						<i class="icon-globe"></i>发送消息
					</div>
					<div>
						<span class="btn table_add" style="position: absolute;right:5%;top:0;text-decoration:underline;" onclick="list();"><i class="glyphicon "></i>历史消息列表</span>
					</div>
				</div>
				<!--begin  新增-->
				<div class="form-group">
					<label class="control-label col-md-4">选择组织</label>
					<div class="col-md-6">
						<div class="msg-btn" onclick="chooseOrg()">
							<span class="input-group-addon choose_btn">
								<i class="icon-zoom-in"></i>&nbsp;&nbsp;请点击选择组织
							</span>
						</div>
						<div class="msg-info" id="tag-info-1">已选择的组织：</div>
						<div class="msg-tag-box" id="tag-box-1">
							
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">选择用户</label>
					<div class="col-md-6">
						<div class="msg-btn"  onclick="chooseUser()">
							<span class="input-group-addon choose_btn">
								<i class="icon-zoom-in"></i>&nbsp;&nbsp;请点击选择用户
							</span>
						</div>
						<div class="msg-info" id="tag-info-2">已选择的用户：</div>
						<div class="msg-tag-box"  id="tag-box-2">
							
						</div>					
					</div>
				</div>			
				<div class="form-group">
					<label class="col-md-4 control-label">选择展示模式</label>
					<div class="col-md-6">
						<div class="radio-list">
							<label class="radio-inline" data-href="msg-model-1" onclick="changeShow(this);">
							<div class="radio"><span><input type="radio" name="contentType" id="optionsRadios25" value="0" checked="true"></span></div> 图文 </label>
							<label class="radio-inline" data-href="msg-model-2" onclick="changeShow(this);">
							<div class="radio"><span><input type="radio" name="contentType" id="optionsRadios26" value="1"></span></div> 文本框 </label>
						</div>
					</div>
				</div>			
						
				<div class="portlet-body form" id="msg-model-1" style="overflow: hidden;">
					<form id="addForm" class="form-horizontal" role="form">
						<div class="form-body">
							<div class="form-group" id="con_id" style="position: relative;">
								<label class="control-label col-md-4">图文素材</label>
								<div class="col-md-1">
									<div class="input-group">
										
										<span class="input-group-addon choose_btn" onclick="page(1)">
											<i class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择
										</span>
									</div>
								</div>
								<div class="col-md-4">
									<span id="tip_id" for="id" class="help-block hidden" style="">必填</span>
								</div>
							</div>
							<div class="form-group " id="con_matters">
								<label class="control-label col-md-4">已选择图文素材</label>
								<div class="col-md-6">
									<div id="append_div"></div>
								</div>
							</div>
						</div>
	
					</form>
				</div>			
				
				<div class="form-group" id="msg-model-2" style="display: none;">
					<label class="col-md-4 control-label">文本框</label>
					<div class="col-md-6">
						<textarea id="content" class="form-control" rows="8"></textarea>
					</div>
				</div>				
				
				<div class="form-group">
					<div class="col-md-offset-4 col-md-6">
						<button type="button" id="sendToCp" class="btn green" onclick="sendToCp();">提交</button>

						<input type="hidden" id="isFosun" value="${'1' eq tocp}"/>
					</div>
				</div>
				<!--end  新增-->
			</div>
		</div>
	</div>
	<!-- 选择图文素材弹出层 开始 -->
	<div id="dialogBank"
		style="display: none; overflow: hidden; background-color: #fff;">
		<h4 class="easyDialog_title" id="easyDialogTitle">
			&nbsp;&nbsp;选择图文素材 <a href="javascript:void(0)" title="关闭窗口" onclick="easyDialog.close();"
				class="close_btn" id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<input type="hidden" name="matterIds" id="matterIds" value="">
		<div class="easyDialog_text"
			style="background-color: #fff; display: block; overflow: auto; width: 770px; height: 500px;"
			id="easyDialogText">
			<!-- 表格 -->
			<div id="table_list" style="width: 100%;"></div>


		</div>
		<div class="easyDialog_footer" style="margin-bottom: 20px;">
			<button class="btn default dialog-btn" onclick="clear_matters();">清空</button>
			<button class="btn btn-success dialog-btn"
				onclick="easyDialog.close();">确定</button>
		</div>
	</div>
	<!-- 选择图文素材弹出层 结束 -->
	
	<!-- 选择用户弹出层-->
	<jsp:include page="/WEB-INF/jsp/include/component/chooseuser.jsp" />
	
	<!-- 选择组织弹出层 -->
	<jsp:include page="/WEB-INF/jsp/include/component/chooseorg.jsp" />
	
</body>
</html>
<content tag="pageCore"> <!-- 引用核心js包 --> 
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script	src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script> 
<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script> 
<script type="text/javascript"	src="${basepath }/static/ixin/js/groupmessage/addcp.js"></script> 
<script	type="text/javascript">
	appendMatters();
	function list(){
		window.location.href="${basepath}/mgr/fodder/messagelist.xhtml";
	}
	
	function afterComfirmChooseUser(userData){
		createTagList(userData, '#tag-box-2');
	}
	
	function afterComfirmChooseOrg(orgData){
		createTagList(orgData, '#tag-box-1');
	}
</script> 
</content>
<content tag="pageInit"> </content>
