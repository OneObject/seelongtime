<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
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
<title>投票管理</title>
<meta name="menu_path" content="ixin.menu_poll" />
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/base.css" type="text/css">
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/ixin/css/uploadify.css">
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }/mgr/ixin/mytoken.xhtml">爱微站</a><i class="icon-angle-right"></i></li>
				<li><span href="#">投票管理</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-comments"></i><span>添加信息</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!-- 添加单图文素材 start -->
					<div id="js_appmsg_editor" class="media_edit_area">
						<div class="" style="margin-top: 0px;">
							<div class="inner">
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">标题</strong>
									</label> 
									<span class="frm_input_box">
										<input type="text" class="frm_input" id="baseTitle">
									</span>
								</div>
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">活动时间</strong>
									</label> 
									<span class="">
										<input type="text" id="startTime" class="Wdate" onFocus="WdatePicker()"/>&nbsp;&nbsp;至&nbsp;&nbsp;<input type="text" id="endTime" class="Wdate" onFocus="WdatePicker()"/>
									</span>
                                </div>
								</div>
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">封面</strong>
									<input id="cover" type="hidden"/>
									</label>
									<div class="frm_input_box">
										<div class="upload_box">
											<div class="upload_area">
												<input type="file" name="file_upload" id="file_upload" />
												<ul class="upload_file_box" style="display: none;"
													id="queue"></ul>
											</div>
										</div>
									</div>
								</div>
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">描述</strong>
									</label> 
									<input id="desc"/>
								</div>	
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">关键字</strong>
									</label> 
									<input id="keywords"/>
								</div>	
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">试题</strong>
									</label> 
									
									题目：<input id="title"/><br><br>
									选项1：<input id="opt1"/>
									<input type="hidden" id="file_opt1"/>
									<!-- <div class="frm_input_box">
										<div class="upload_box">
											<div class="upload_area">
												<input type="file" name="file_upload" id="file_upload1" />
												<ul class="upload_file_box" style="display: none;"
													id="queue"></ul>
											</div>
										</div>
									</div> -->
									<br>
									选项2：<input id="opt2"/>
									<input type="hidden" id="file_opt2"/>
									<!-- <div class="frm_input_box">
										<div class="upload_box">
											<div class="upload_area">
												<input type="file" name="file_upload" id="file_upload2" />
												<ul class="upload_file_box" style="display: none;"
													id="queue"></ul>
											</div>
										</div>
									</div> -->
									<br>
									选项3：<input id="opt3"/>
									<input type="hidden" id="file_opt3"/>
									<!-- <div class="frm_input_box">
										<div class="upload_box">
											<div class="upload_area">
												<input type="file" name="file_upload" id="file_upload3" />
												<ul class="upload_file_box" style="display: none;"
													id="queue"></ul>
											</div>
										</div>
									</div> -->
									<br>
									选项4：<input id="opt4"/>
									<input type="hidden" id="file_opt4"/>
									<!-- <div class="frm_input_box">
										<div class="upload_box">
											<div class="upload_area">
												<input type="file" name="file_upload" id="file_upload4" />
												<ul class="upload_file_box" style="display: none;"
													id="queue"></ul>
											</div>
										</div>
									</div> -->
									<br>
                                </div>
						</div>
					</div>
					<!-- 添加单图文素材 end -->
					<div class="tool_area">
						<div class="tool_bar">
							<span id="js_preview" class="btn btn_input btn_primary"><button>返回</button></span>
							<span id="js_submit" class="btn btn_input btn_primary"><button>保存</button></span>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<content tag="pageCore"> 
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script> 
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
$('#js_preview').click(function(){
	window.history.back();
})
var basePathUrl = "${basepath}";
$(document).ready(function() {
	$('#file_upload').uploadify({
		'formData' : {
			'token' : '${result.uploadToken}',
		},
		'fileObjName' : 'file',
		'buttonText' : '<i class="icon18_common upload_gray"></i>上传',
		'buttonClass' : 'upload_access',
		'swf' : '${basepath}/static/ixin/css/uploadify.swf',
		'uploader' : 'http://up.qiniu.com/',
		'onUploadSuccess' : function(file,
				data, response) {
			var result = eval("(" + data + ")");
			$('#cover').val(result.url);
		}
	});
	/* $('#file_upload1').uploadify({
		'formData' : {
			'token' : '${result.uploadToken}',
		},
		'fileObjName' : 'file',
		'buttonText' : '<i class="icon18_common upload_gray"></i>上传',
		'buttonClass' : 'upload_access',
		'swf' : '${basepath}/static/ixin/css/uploadify.swf',
		'uploader' : 'http://up.qiniu.com/',
		'onUploadSuccess' : function(file,
				data, response) {
			var result = eval("(" + data + ")");
			$('#file_opt1').val(result.url);
		}
	});
	$('#file_upload2').uploadify({
		'formData' : {
			'token' : '${result.uploadToken}',
		},
		'fileObjName' : 'file',
		'buttonText' : '<i class="icon18_common upload_gray"></i>上传',
		'buttonClass' : 'upload_access',
		'swf' : '${basepath}/static/ixin/css/uploadify.swf',
		'uploader' : 'http://up.qiniu.com/',
		'onUploadSuccess' : function(file,
				data, response) {
			var result = eval("(" + data + ")");
			$('#file_opt2').val(result.url);
		}
	});
	$('#file_upload3').uploadify({
		'formData' : {
			'token' : '${result.uploadToken}',
		},
		'fileObjName' : 'file',
		'buttonText' : '<i class="icon18_common upload_gray"></i>上传',
		'buttonClass' : 'upload_access',
		'swf' : '${basepath}/static/ixin/css/uploadify.swf',
		'uploader' : 'http://up.qiniu.com/',
		'onUploadSuccess' : function(file,
				data, response) {
			var result = eval("(" + data + ")");
			$('#file_opt3').val(result.url);
		}
	});
	$('#file_upload4').uploadify({
		'formData' : {
			'token' : '${result.uploadToken}',
		},
		'fileObjName' : 'file',
		'buttonText' : '<i class="icon18_common upload_gray"></i>上传',
		'buttonClass' : 'upload_access',
		'swf' : '${basepath}/static/ixin/css/uploadify.swf',
		'uploader' : 'http://up.qiniu.com/',
		'onUploadSuccess' : function(file,
				data, response) {
			var result = eval("(" + data + ")");
			$('#file_opt4').val(result.url);
		}
	}); */
});
$('#js_submit').click(function (){
	var obj = new Object();
	obj.keywords = $('#keywords').val();
	obj.baseTitle = $('#baseTitle').val();
	obj.desc = $('#desc').val();
	obj.startTime = $('#startTime').val();
	obj.endTime = $('#endTime').val();
	obj.cover = $('#cover').val();
	var question = new Object();
	question.title = $('#title').val();
	var options = new Array();
	var opt = new Object();
	opt.title = $('#opt1').val();
	opt.filePath = $('#file_opt1').val();
	options[0] = opt;
	var opt = new Object();
	opt.title = $('#opt2').val();
	opt.filePath = $('#file_opt2').val();
	options[1] = opt;
	var opt = new Object();
	opt.title = $('#opt3').val();
	opt.filePath = $('#file_opt3').val();
	options[2] = opt;
	var opt = new Object();
	opt.title = $('#opt4').val();
	opt.filePath = $('#file_opt4').val();
	options[3] = opt;
	question.options = options;
	obj.question = question;
	
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/poll/save.xhtml",
		data: JSON.stringify(obj),
		contentType: "application/json; charset=utf-8",
		success:function(data){
			location = basepath+"/mgr/poll/index.xhtml"
		},
		error: function(data){
			alert('保存失败');
		}
	});
});
</script> 
 </content>

