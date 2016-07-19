<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>添加系列</title>
<meta name="menu_path" content="course.courseManage"/>
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
    <script type="text/javascript">
        var zdata = ${tree};
    </script>
</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><a href="${basepath }/base/admin/course/course/coursemanage.xhtml">课程管理</a><i class="icon-angle-right"></i></li>
                  <li><span>添加系列</span></li>
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
						<i class="icon-reorder"></i><span>新增信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						<div class="form-body">
							<!-- BEGIN FORM-->
							<form id="form_sample_1" class="form-horizontal" > 
                                <div class="form-group" id="con_categoryId">
                                    <label class="control-label col-md-3">系列分类<span
                                        class="required"></span></label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="请选择分类" onclick="choose_category(1)" readonly="readonly" name="category_name" id="category_name" value="">
                                             <input type="hidden" id="categoryid" name="categoryid" value=""/>
                                                <span class="input-group-addon chose_coursewear" onclick="choose_category(1)">
                                                <i class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择</span>
                                        </div>
                                    </div>
                                    <!-- 
                                    <div class="col-md-4">
                                        <span id="tip_categoryId" for="categoryId" class="help-block" style="">必填</span>
                                    </div> -->
                                </div>
								<div class="form-group" id="con_name">
									<label class="control-label col-md-3">系列名称<span
										class="required">*</span></label>
									<div class="col-md-4">
										<input type="text" name="name" id="name" data-required="1" class="form-control" value=""  />
									</div>
                                    <div class="col-md-4">
                                        <span id="tip_name" for="name" class="help-block" style="">必填</span>
                                    </div>
								</div>
								
								
								<div class="form-group" id="con_type_support_mobile">
                                    <label class="col-md-3 control-label">支持移动端<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="radio-list" id="judge" >
                                            <label class="radio-inline">
                                                <input type="radio" name="supportmobile" id="supportmobile1" value="1">支持
                                            </label> 
                                            <label  class="radio-inline">
                                                <input type="radio" name="supportmobile" id="supportmobile0" value="0" checked="checked">不支持
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <!--  
                                 <div class="form-group" id="open_state">
                                    <label class="col-md-3 control-label">公开<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="radio-list" id="judge" >
                                            <label class="radio-inline">
                                                <input type="radio" name="openstate" id="openstate1" value="1">公开
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                -->	
							<div class="form-group" id="con_file">
									<label class="control-label col-md-3">封面图片<span
										class="required">*</span></label>
									<div class="col-md-4">
				                        <div class="frm_input_box">
										<div class="upload_box">
											<div class="upload_area">
												<input type="file" name="file_upload" id="file_upload" />
												<ul class="upload_file_box" style="display: none;" id="queue"></ul>
											</div>
										</div>
											<div style="display: none;margin-bottom:20px;" id="small_prev">
												<span id="image_cover"></span><a class="js_removeCover" href="javascript:void(0);"
												onclick="deleteCover();">删除</a>
											</div>
										</div>
									
									</div>
                                    <div class="col-md-4">
                                        <span id="tip_file" for="file" class="help-block hidden" style="">文件类型错误！</span>
                                    </div>
								</div>
								<!-- 封面路径 -->
								<input type="hidden" id="qiniuHash" name="qiniuHash" value="">
								
							<!--  -->	
								
								
								
								<div class="form-group" id="con_descript">
									<label class="control-label col-md-3">课程简介</label>
									<div class="col-md-4">
										<textarea rows="" cols="" name="descript" id="descript" class="form-control mytextarea" ></textarea>
									</div>
                                    <div class="col-md-4">
                                        <span id="tip_descript" for="descript" class="help-block " style="">3000字以内</span>
                                    </div>
								</div>
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
									    <input type="hidden" name="categoryId" id="categoryId" >
									    <input type="hidden" name="packageid" id="packageid" value="${packageEntity.id}">
										<button type="button" onclick="insertEntity()" id="subButton" class="btn green">下一步</button>
									</div>
								</div>

						</form>  
							<!-- END FORM-->
						</div>
					</div>
				</div>
				<!-- END VALIDATION STATES-->
			</div>
		</div>
	</div>
  
</body>
</html>
<content tag="pageCore">
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script><%-- 
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script> --%>
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
<script type='text/javascript' src='${basepath }/dwr/engine.js'></script>
<script type='text/javascript' src='${basepath }/dwr/util.js'></script>
<script type='text/javascript' src='${basepath }/dwr/interface/DWRService.js'></script> 
<script type="text/javascript" src="${basepath}/static/public/javascripts/course/packagelist.js"></script>
<script type="text/javascript" src="${basepath }/static/public/javascripts/course/addcourse.js" charset="UTF-8"></script>    
</content>
<content tag="pageInit">
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script>
var token = "${result.uploadToken}";
//var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var qiniuImageBasePath = "<%=Constants.IMG_SERVER_DOWNLOAD%>";
var coverSuffix = "-320x180";
var edit="${edit}";
if(edit!="" && edit!=null){
    $("#category_name").val("${coursecategory.name}");
    $("#categoryId").val("${coursecategory.id}");
	$("#name").val("${packageEntity.name}");
	if("${packageEntity.supportmobile}"==1){
		   $("#supportmobile1").attr("checked","checked");
		}else{
			$("#supportmobile0").attr("checked","checked");
			}
	$("#qiniuHash").val("${packageEntity.cover}");
	$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${packageEntity.cover}"+coverSuffix+"'>");
	$("#small_prev").show();
	$("#descript").val("${packageEntity.descript}");
}

$(document).ready(function(){
	$('#file_upload').uploadify({
		'formData'     : {
			'token'     : token,
		},
		'fileObjName'  : 'file',
		'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
		'buttonClass' : 'upload_access',
		'swf'      : basepath+'/static/ixin/css/uploadify.swf',
		//'uploader' : 'http://up.qiniu.com/',
		'uploader' : uploadurl,
		'onUploadSuccess' : function(file,data,response){
			var result = eval("("+data+")");
			//$('#showImage').attr("src",qiniuImageBasePath+result.hash+coverSuffix);
			//$('#showImage').show();
			$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
			$("#small_prev").show();
			$('#qiniuHash').val(result.hash);
			
		}
	});
  
});

/**
 * 删除封面
 */
function deleteCover(){
	$("#small_prev").hide();
	$('#niqiuHash').val("");
}
   </script>
</content>	
