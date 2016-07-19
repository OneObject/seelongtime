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
<title>素材管理</title>
<meta name="menu_path" content="" />
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
				<div class="portlet-body main_bd box">
					<!-- 添加单图文素材 start -->
					<div id="js_appmsg_editor" class="media_edit_area">
						<div class="" style="margin-top: 0px;">
							<div class="inner">
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">标题</strong>
									</label> 
									<span class="frm_input_box">
										<input type="text" class="frm_input">
									</span>
								</div>
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">活动时间</strong>
									</label> 
									<span class="">
										<input type="text" class="Wdate" onFocus="WdatePicker()"/>&nbsp;&nbsp;至&nbsp;&nbsp;<input type="text" class="Wdate" onFocus="WdatePicker()"/>
									</span>
                                </div>
								</div>
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">封面</strong>
									</label>
									<div class="frm_input_box">
										<div class="upload_box">
											<div class="upload_area">
												<input type="file" name="file_upload" id="file_upload" />
												<ul class="upload_file_box" style="display: none;"
													id="queue"></ul>
											</div>
										</div>
										<p class="js_cover upload_preview">
										<div style="display: none;" id="small_prev">
											<span id="image_cover">sss</span><a class="js_removeCover"
												href="javascript:void(0);" onclick="delete_pic()">删除</a>
										</div>
										</p>
									</div>
								</div>
								
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">试题</strong>
									</label> 
                                </div>
						</div>
					</div>
					<!-- 添加单图文素材 end -->
					<div class="tool_area">
						<div class="tool_bar">
							<span id="js_preview" class="btn btn_input btn_primary"><button>预览</button></span>
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
var basePathUrl = "${basepath}";
$(document).ready(function() {
	$('#file_upload').uploadify({
		'formData' : {
			'token' : '${uptoken}',
		},
		'fileObjName' : 'file',
		'buttonText' : '<i class="icon18_common upload_gray"></i>上传',
		'buttonClass' : 'upload_access',
		'swf' : '${basepath}/static/ixin/css/uploadify.swf',
		'uploader' : 'http://up.qiniu.com/',
		'onUploadSuccess' : function(file,
				data, response) {
			var result = eval("(" + data
					+ ")");
			$('#showImage').attr(
					"src",
					"http://img0.aijiayou.com/"
							+ result.hash);
			$('#showImage').show();
			$("#image_cover")
					.html(
							"<img style='max-width:100px;max-height:200px;' src = 'http://img0.aijiayou.com/"+result.hash+"'>");
			$("#small_prev").show();
			saveFile(file, result);
		}
	});
});
</script> 
 </content>

