<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>添加资料</title>
<meta name="menu_path" content="ext.ext_resource"/>
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
                  <li><a href="${basepath }/base/admin/resource/resource.xhtml">资料库管理</a><i class="icon-angle-right"></i></li>
                  <li><span>添加资料</span></li>
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
                <ul class="stemp-box" style="width: 450px;">
                <li class="tep-left">
                    <img src="${basepath}/static/img/step-left.png">
                </li>
                <li class="current-step" onclick="next1('${id}');">
			        1
                </li>
                <li class="step-xian${stepStatus['2'] ?'-lv':'' }"></li>
                <li class="${stepStatus['2'] ?'over':'nor' }-step" onclick="next2('${id}');">
                    2
                </li>
                <li class="step-xian${stepStatus['3'] ?'-lv':'' }"></li>
                <li class="${stepStatus['3'] ?'over':'nor' }-step" onclick="next3('${id}');">
                    3
                </li>
     
                <li class="tep-right">
			           <img src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
			     </li>
                 </ul>
				 <div class="preview-style">
				  <form class="form-horizontal" role="form">
						   	<div class="form-group" id="tip_fileid">
									<label class="col-sm-2 control-label">上传附件:</label>
									<div class="col-sm-10" id="con_fileid">
										<div class="input-group" onclick="openupload()">

											<input type="text" class="form-control" placeholder="请选择附件资源"
												readonly="readonly" id="resname" name="resname" value="${attach.name }">
											<input type="hidden" id="fileid" name="fileid"
												value="${entity.resid }"> <span
												class="input-group-addon chose_coursewear"> <i
												class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择
											</span>
										</div>
									</div>
							</div>

				  <div class="form-group" id="tip_title">
						<label class="col-sm-2 control-label">标题：</label>	
						<div class="col-sm-10" id="con_title">							
						<input type="text" name="title" id="title" data-required="1" placeholder="不能为空" class="form-control" value="${entity.title }" />
				        </div>
				  </div>
				   <div class="form-group">
				   <label class="col-sm-2 control-label" >封面：</label>
				   <div class="col-sm-10" id="con_cover">
				   <c:if test="${ empty entity.cover}">
				    <img src="" id="active-poster" class="img-responsive" style="width:320px;height:180px;display: none"  >
				    </c:if>
				    <c:if test="${not empty entity.cover}">
				     <img src="<%=Constants.IMG_SERVER_DOWNLOAD%>${entity.cover}-320x180" id="active-poster" class="img-responsive" style="width:320px;height:180px;"  >
				    </c:if>
				    <input id="file_upload" class="form-control" name="file_upload"  type="file" >
				    <input type="hidden" id="cover" name="cover" value="${entity.cover}">
				    <input id="path" type="hidden" name="path" value="<%=Constants.IMG_SERVER_DOWNLOAD%>">
				    </div>
				   </div>
				    <div class="form-group">
                    <label class="col-sm-2 control-label">简介：</label>
                     <div class="col-sm-10">	
                    <textarea class="form-control"  id="remark" style="resize: none" placeholder="简介">${entity.remark}</textarea>
                     </div>
                   </div>
				    <div class="form-group" style="text-align: right">
				    <input id="id" type="hidden" name="id" value="${entity.id }">
				      <span class="btn btn-success" onclick="savestep1();"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;下一步</span>
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
	<script src="${basepath }/static/public/javascripts/resource.js"></script>
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

