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
<meta name="menu_path" content="" />
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/base.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<link >
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"> </i> <a href="javascript:;">爱微站</a> <i
					class="icon-angle-right"> </i></li>
				<li><a href="javascript:;">素材管理</a> <!-- <i class="icon-angle-right">
                </i> --></li>
				<!-- <li><span>添加课程</span></li> -->
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
				<div class="portlet-body main_bd box ">
					<div class="media_preview_area">
						<div class="appmsg  editing">
							<div id="js_appmsg_preview" class="appmsg_content">
								<div id="appmsgItem1" data-fileid="" data-id="1"
									class="js_appmsg_item ">

									<h4 class="appmsg_title">
										<a onclick="return false;" href="javascript:void(0);"
											target="_blank" id="single_title">标题</a>
									</h4>
									<div class="appmsg_info">
										<em class="appmsg_date"></em>
									</div>
									<div class="appmsg_thumb_wrp">
										<img class="js_appmsg_thumb appmsg_thumb"  id="showImage" src=""> <i
											class="appmsg_thumb default">封面图片</i>
									</div>
									<p class="appmsg_desc" id="msg_desc"></p>

								</div>
							</div>
						</div>
					</div>
					<div id="js_appmsg_editor" class="media_edit_area">
						<div class="appmsg_editor" style="margin-top: 0px;">
							<div class="inner">
								<div class="appmsg_edit_item">
									<label for="" class="frm_label">标题</label> <span
										class="frm_input_box"><input type="text" id="single_title_source"
										class="frm_input js_title" onkeyup="setSingleTitle(this,'single_title')"  onblur="autoSave();"></span>
								</div>
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">封面</strong>
										<p class="js_cover_tip tips r">大图片建议尺寸：360像素 * 200像素</p>
									</label>
									<div class="frm_input_box">
										<div class="upload_box">
											<div class="upload_area">
												<input type="file" name="file_upload" id="file_upload" />
												<ul class="upload_file_box" style="display: none;" id="queue"></ul>
											</div>
										</div>
										<p class="js_cover upload_preview" >
											<div style="display: none;" id="small_prev">
												<span id="image_cover">sss</span><a class="js_removeCover" href="javascript:void(0);"
												onclick="delete_pic()">删除</a>
											</div>
									</div>
								</div>
								<div class="appmsg_edit_item">
									<label for="" class="frm_label">时间</label> 
									<table>
										<tr>
											<td>
											<span	class="frm_input_box time_input" style="width: 200px;display: block;">
										<input type="text" class="frm_input js_title" onClick="WdatePicker()"></span>
											</td>
											<td>
												<span>至</span>
											</td>
											<td>
												<span	class="frm_input_box  time_input" style="width: 200px">
										<input type="text" class="frm_input js_title" onClick="WdatePicker()"></span>
											</td>
										</tr>
									</table>
								</div>
									<div class="js_desc_area dn appmsg_edit_item">
									<label for="" class="frm_label">摘要</label> <span
										class="frm_textarea_box"><textarea
											class="js_desc frm_textarea" onblur="autoSave();" onkeyup="setSingleTitle(this,'msg_desc')"></textarea></span>
								</div>
						</div>
					</div>
				</div>
				<!-- 下一步 -->
				<div class="row">
					<div class="col-md-12">
					<hr>
						<span class="btn green btn-block"><i class="glyphicon glyphicon-arrow-right"></i>&nbsp;下一步</span>
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
	$('#file_upload1').uploadify({
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
	});
});
$('#js_submit').click(function (){
	var obj = new Object();
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
			
		},
		error: function(data){
			alert('保存失败');
		}
	});
});
</script> 
 </content>

