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
	<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/base.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"> </i> <a href="javascript:;">爱微站</a> <i
					class="icon-angle-right"> </i></li>
				<li><a href="javascript:;">素材管理</a> 
					<i class="icon-angle-right">
                </i>
				</li>
				 <li><span>添加多图文素材</span></li>
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
						<i class="fa fa-comments"></i><span>添加多图文消息</span>
					</div>
				</div>
				<div class="portlet-body box">
					<!-- 添加单图文素材 start -->
					<div class="media_preview_area">
						<div class="appmsg multi editing">
							<div id="js_appmsg_preview" class="appmsg_content">
								<div id="appmsgItem1" data-fileid="" data-id="1"
									class="js_appmsg_item ">

									<div class="appmsg_info">
										<em class="appmsg_date"></em>
									</div>
									<div class="cover_appmsg_item">
										<h4 class="appmsg_title">
											<a href="javascript:void(0);" onclick="return false;"
												target="_blank">标题</a>
										</h4>
										<div class="appmsg_thumb_wrp">
											<img class="js_appmsg_thumb appmsg_thumb" src=""> <i
												class="appmsg_thumb default">封面图片</i>
										</div>
										<div class="appmsg_edit_mask">
											<a onclick="return false;"
												class="icon18_common edit_gray js_edit" data-id="1"
												href="javascript:;" style="margin-top: 70px;">编辑</a>
										</div>
									</div>

								</div>
								<div id="appmsgItem2" data-fileid="" data-id="2"
									class="appmsg_item js_appmsg_item ">
									<img class="js_appmsg_thumb appmsg_thumb" src=""> <i
										class="appmsg_thumb default">缩略图</i>
									<h4 class="appmsg_title">
										<a onclick="return false;" href="javascript:void(0);"
											target="_blank">标题</a>
									</h4>
									<div class="appmsg_edit_mask">
										<a class="icon18_common edit_gray js_edit" data-id="2"
											onclick="return false;" href="javascript:void(0);">编辑</a> <a
											class="icon18_common del_gray js_del" data-id="2"
											onclick="return false;" href="javascript:void(0);">删除</a>
									</div>
								</div>
							</div>
							<div class="appmsg_add">
								<a onclick="addone()" id="js_add_appmsg"
									href="javascript:void(0);"> &nbsp; <i
									class="icon24_common add_gray">增加一条</i>
								</a>
							</div>
						</div>
					</div>
					<div id="js_appmsg_editor" class="media_edit_area">
						<div class="appmsg_editor" style="margin-top: 0px;">
							<div class="inner">
								<div class="appmsg_edit_item">
									<label for="" class="frm_label">标题</label> <span
										class="frm_input_box"><input type="text"
										class="frm_input js_title"></span>
								</div>
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">作者</strong>
										<p class="tips ">（选填）</p>
									</label> <span class="frm_input_box"><input type="text"
										class="frm_input js_author "></span>
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
										<p class="js_cover upload_preview" id="small_prev"style="display: none;">
											<a class="js_removeCover" href="javascript:void(0);"
												onclick="delete_pic()">删除</a>
										</p>
									</div>
									<p class="frm_tips">
										<label for=""	class="frm_checkbox_label js_show_cover_pic selected">
											<input type="checkbox" > 封面图片显示在正文中
										</label>
									</p>
								</div>

								<p>
									<a class="js_addDesc" href="javascript:void(0);"
										onclick="$('#zhaiyao').show()">添加摘要</a>
								</p>
								<div class="js_desc_area dn appmsg_edit_item"
									style="display: none;" id="zhaiyao">
									<label for="" class="frm_label">摘要</label> <span
										class="frm_textarea_box"><textarea
											class="js_desc frm_textarea"></textarea></span>
								</div>
								<div id="js_ueditor" class="appmsg_edit_item content_edit">
									<a href="javascript:void(0);"
										class="icon16_common close jsClose" onclick="return false;">关闭</a>
									<label for="" class="frm_label"> <strong class="title">正文</strong>
										<p class="tips r">
											<em id="js_auto_tips">自动保存：2014/01/09 17:03:24</em> <a
												id="js_cancle" style="display: none;"
												href="javascript:void(0);" onclick="return false;">取消</a>
										</p>
									</label>
									<div id="loading">
										<img alt="正在初始化编辑器，请稍候···" src="${basepath }/static/ixin/img/loading.gif">正在初始化编辑器，请稍候···
									</div>
									<textarea name="后台取值的key" id="myEditor" style="border: #f8f8f8;background-color: #f8f8f8;"></textarea>
								</div>
								<p>
									<a class="js_addURL" href="javascript:void(0);"
										onclick="$('#lianjie').show()">添加原文链接</a>
								</p>
								<div class="js_url_area dn appmsg_edit_item"
									style="display: none;" id="lianjie">
									<label for="" class="frm_label">原文链接</label> <span
										class="frm_input_box"><input type="text"
										class="js_url frm_input"></span>
								</div>

							</div>
							<i class="arrow arrow_out" style="margin-top: 0px;"></i> <i
								class="arrow arrow_in" style="margin-top: 0px;"></i>
							<div class="mask" style="display: none;"></div>
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

	<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.all.min.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> <script
	type="text/javascript">
$(document).ready(function(){
	$('#file_upload').uploadify({
		'formData'     : {
			'token'     : '${uptoken}',
		},
		'fileObjName'  : 'file',
		'buttonText' : '<i class="icon18_common upload_gray"></i>上传',
		'buttonClass' : 'upload_access',
		'swf'      : '${basepath}/static/ixin/css/uploadify.swf',
		'uploader' : 'http://up.qiniu.com/',
		'onUploadSuccess' : function(file,data,response){
			var result = eval("("+data+")");
			$('#showImage').attr("src","http://img0.aijiayou.com/"+result.hash);
			$('#showImage').show();
			$("#small_prev").append("<img style='max-width:100px;max-height:200px;' src = 'http://img0.aijiayou.com/"+result.hash+"'>");
			$("#small_prev").show();
		}
	});
   var editor = UE.getEditor('myEditor');
   editor.addListener( 'ready', function( editor ) {
  	  $("#loading").hide();
	 } );
});
function delete_pic(){
	$("#showImage").hide();
	$("#showImage").removeAttr("src");
	$("#small_prev").hide();
}
function addone(){
	var i = 2;
	i++;
	var html_prev = [];
	html_prev.push('<div id="appmsgItem'+i+'" class="appmsg_item js_appmsg_item ">');
	html_prev.push('<img class="js_appmsg_thumb appmsg_thumb" src="">');
	html_prev.push('<i class="appmsg_thumb default">缩略图</i>');
	html_prev.push('<h4 class="appmsg_title"><a onclick="return false;" href="javascript:void(0);"target="_blank">标题</a></h4>');
	html_prev.push('<div class="appmsg_edit_mask">');
	html_prev.push('<a class="icon18_common edit_gray js_edit" onclick="return false;" href="javascript:void(0);">编辑</a> <a 	class="icon18_common del_gray js_del" data-id="2"onclick="removecurrent('+i+')" href="javascript:void(0);">删除</a>');
	html_prev.push('</div>');
	html_prev.push('</div>');
	$("#js_appmsg_preview").append(html_prev.join(""));
}
function removecurrent(i){
	$("#appmsgItem"+i).remove();
}
function edite_area(){
	
}
    </script> </content>

