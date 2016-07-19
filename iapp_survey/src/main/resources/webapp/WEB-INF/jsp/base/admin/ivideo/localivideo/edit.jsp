<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>编辑视频</title>
<meta name="menu_path" content="video.localvideo"/>
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<link rel="stylesheet" type="text/css" href="${basepath}/static/css/active.css">
<link rel="stylesheet" type="text/css" href="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css">

<style type="text/css">
div.checker, div.checker span, div.checker input {
width: auto;height: auto;
}
</style>
</head>
<body>
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><a href="${basepath }/base/admin/localivideo/video.xhtml">本地视频管理</a><i class="icon-angle-right"></i></li>
                  <li><span>编辑视频</span></li>
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
                
				 <div class="preview-style">
				  <form class="form-horizontal" role="form">
						   	<div class="form-group" id="tip_fileid">
									<label class="col-sm-2 control-label">上传视频:</label>
									<div class="col-sm-10" id="con_fileid">
										<div class="input-group" onclick="openupload()">

											<input type="text" class="form-control" placeholder="请选择附件资源"
												readonly="readonly" id="resname" name="resname" value="${attach.name }">
											<input type="hidden" id="fileid" name="fileid"
												value="${attach.id }"> <span
												class="input-group-addon chose_coursewear"> <i
												class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择
											</span>
										</div>
									</div>
							</div>

				  <div class="form-group" id="tip_title">
						<label class="col-sm-2 control-label">标题：</label>	
						<div class="col-sm-10" id="con_title">							
						<input type="text" name="name" id="name" data-required="1"  class="form-control" value="${entity.name }" />
				        </div>
				  </div>
				   <div class="form-group">
				   <label class="col-sm-2 control-label" >封面：</label>
				   <div class="col-sm-10" id="con_cover">
				   <c:if test="${ empty entity.posterURL}">
				    <img src="" id="active-poster" class="img-responsive" style="width:320px;height:180px;display: none"  >
				    </c:if>
				    <c:if test="${not empty entity.posterURL}">
				     <img src="<%=Constants.IMG_SERVER_DOWNLOAD%>${entity.posterURL}-320x180" id="active-poster" class="img-responsive" style="width:320px;height:180px;"  >
				    </c:if>
				    <input id="file_upload" class="form-control" name="file_upload"  type="file" >
				    <input type="hidden" id="cover" name="cover" value="${entity.posterURL}">
				    <input id="path" type="hidden" name="path" value="<%=Constants.IMG_SERVER_DOWNLOAD%>">
				    </div>
				   </div>
				 
				    <div class="form-group" style="text-align: right">
				    <input id="id" type="hidden" name="id" value="${entity.id }">
				      <span class="btn btn-success" onclick="save();"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;保存</span>
                    </div>
                    </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="easyDialog_wrapper" id="easyDialogWrapper1">
			<div class="easyDialog_content">
				<h4 class="easyDialog_title" id="easyDialogTitle">
					<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						 onclick="easyDialog.close()">&times;</a> 上传附件
				</h4>
				<div class="easyDialog_text" style="width:700px;height:500px;display:block;overflow-x:hidden;overflow-y:scroll;">
					<!-- 上传课件的地方 -->
					<ul class="nav nav-tabs">
					  <li class="active"><a href="#uploadattachments" data-toggle="tab">上传附件</a></li>
					</ul>
					
					<!-- Tab panes -->
					<div class="tab-content">
					  	<div class="tab-pane active" id="uploadattachments">
					  		<span onclick="$('#uploadfile').click()" id="jia" style="height:100px;width:100%;display:block;font-size:72px;text-align: center;border:1px dashed #eaeaea;color:#eaeaea;cursor: pointer;">
					  			<i class="fa fa-plus" style="margin-top:20px;"></i>
					  		</span>
					  		<div class="drag_upload" id="preview_con"></div>
					  		只支持小于100MB的mp4格式视频
					  		<input type="file" id="uploadfile" style="display: none;">
					  		<input type="button" class="btn btn-block btn-primary" style="width:126px;display:none;margin-top:5px;margin-bottom:5px;margin-left:80%;"  id="fileSubmit" value="上传">
					  		<table class="table table-bordered" id="uploadattachment">
					  		
					  		</table>
						</div>
					</div>
				</div>
				<div class="easyDialog_footer">
					<button class="btn_normal" onclick="easyDialog.close()">取消</button>
				</div>
			</div>
		</div>
</div>
	<script src="${basepath }/static/public/javascripts/course/zxxFile.js" type="text/javascript"></script>
	<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
	<script src="${basepath }/static/public/javascripts/localvideo.js"></script>
	<script type="text/javascript">
		$("#file_upload").uploadify({
				'formData' :{
					'token':"${uptoken}",
				},
				'fileObjName' : 'file',
				'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
				'buttonClass' : 'upload_access',
				'swf'      : basepath+'/static/ixin/css/uploadify.swf',
				//'uploader' : 'http://up.qiniu.com/',
				'uploader' : uploadurl,
				'onUploadSuccess' : function(file,data,response){
					var result = eval("("+data+")");
					var path=$("#path").val()+result.hash;
					$("#active-poster").attr("src",path);
					$("#active-poster").show();
					$("#cover").val(result.hash);
				}
			});
	</script>
</body>
</html>

