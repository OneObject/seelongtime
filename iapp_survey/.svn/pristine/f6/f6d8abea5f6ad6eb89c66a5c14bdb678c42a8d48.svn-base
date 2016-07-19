<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>修改课程</title>
<meta name="menu_path" content="course.courseManage"/>
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">

</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home">
                     </i>
                     <a href="${basepath }">首页</a> 
                     <i class="icon-angle-right">
                     </i>
                  </li>
                  <li>
                     <a href="${basepath }/base/admin/course/course/course.xhtml">课程管理</a>
                     <i class="icon-angle-right">
                     </i>
                  </li>
                  <li><span>修改课程</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box yellow">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-reorder"></i><span>修改课程</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						<div class="form-body">
							<!-- BEGIN FORM-->
							<form id="form_sample_2" enctype="multipart/form-data" class="form-horizontal" method="post" action="${basepath }/base/admin/course/course/doupdate.xhtml" onsubmit="return validateAdd();">
								<%-- <div class="form-group" id="con_domain">
									<label class="control-label col-md-3">组织<span
										class="required">*</span></label>
									<div class="col-md-4">
										<input type="text" name="domain" data-required="1"
											class="form-control" value="上海龙泰信息科技有限公司" />
										<label>上海龙泰信息科技有限公司</label>
									</div>
									<div class="col-md-4">
										<span id="tip_domain" for="domain" class="help-block"
											style="">默认为当前组织</span>
									</div>
								</div> --%>
                                <div class="form-group" id="con_categoryId">
                                    <label class="control-label col-md-3">课程分类<span
                                        class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="请选择分类" onclick="choose_category(1)" readonly="readonly" name="category_name" id="category_name" value="${entity.courseCategory.name }">
                                                <span class="input-group-addon chose_coursewear" onclick="choose_category(1)">
                                                <i class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择</span>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <span id="tip_categoryId" for="categoryId" class="help-block" style="">必填</span>
                                    </div>
                                </div>
								<div class="form-group" id="con_name">
									<label class="control-label col-md-3">课程名称<span
										class="required">*</span></label>
									<div class="col-md-4">
										<input type="text" name="name" id="name" data-required="1" class="form-control" onchange="v_name();" value="${entity.name }" />
									</div>
                                    <div class="col-md-4">
                                        <span id="tip_name" for="name" class="help-block" style="">必填</span>
                                    </div>
								</div>
								<div class="form-group" id="supportmobile_group">
                                    <label class="col-md-3 control-label">支持移动端<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="radio-list" id="judge" >
                                            <label class="radio-inline">
                                                <input type="radio" name="supportmobile" id="supportmobile1" value="1"  ${entity.supportmobile eq 1 ?'checked="checked"':'' }>支持
                                            </label>
                                            <label  class="radio-inline">
                                                <input type="radio" name="supportmobile" id="supportmobile0" value="0"  ${entity.supportmobile eq 0 ?'checked="checked"':'' }>不支持
                                            </label> 
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group" id="contain_video">
                                    <label class="col-md-3 control-label">包含视频<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="radio-list" id="judge" >
                                            <label class="radio-inline">
                                                <input type="radio" name="containvideo" id="contain_video1" value="1" ${entity.containvideo eq 1 ?'checked="checked"':'' }>是
                                            </label>
                                            <label  class="radio-inline">
                                                <input type="radio" name="containvideo" id="contain_video2" value="0" ${entity.containvideo eq 0 ?'checked="checked"':'' }>否
                                            </label> 
                                        </div>
                                    </div>
                                </div>
								<div class="form-group" id="open_state">
                                    <label class="col-md-3 control-label">公开<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="radio-list" id="judge" >
                                            <label class="radio-inline">
                                                <input type="radio" name="openstate" id="openstate1" value="1"  ${entity.openState eq 1 ?'checked="checked"':'' }>公开
                                            </label>
                                            <label  class="radio-inline">
                                                <input type="radio" name="openstate" id="openstate3" value="2"  ${entity.openState eq 2 ?'checked="checked"':'' }>不公开
                                            </label> 
                                        </div>
                                    </div>
                                </div>
								<div class="form-group" id="con_length">
									<label class="control-label col-md-3">课程时长</label>
									<div class="col-md-4">
										<input type="text" name="length" id="length" data-required="1" onchange="v_length()"
											class="form-control"  value='<fmt:formatNumber value="${entity.length}" pattern="#"/>' />
									</div>
									<div class="col-md-4">
										<span id="tip_length" for="length" class="help-block " style="">（整数）单位为分钟</span>
									</div>
								</div>
								<div class="form-group" id="con_score">
									<label class="control-label col-md-3">合格分数</label>
									<div class="col-md-4">
										<input type="text" name="score" id="score" data-required="1"
											class="form-control" value="${entity.score }" onchange="v_score();" />
									</div>
									<div class="col-md-4">
										<span id="tip_score" for="score" class="help-block " style="">（1~100）整数</span>
									</div>
								</div>
								<div class="form-group" id="con_validityDate">
									<label class="control-label col-md-3">课程有效期</label>
									<div class="col-md-4">
										<div class="input-group" style="width: 100%;">
	                                        <input type="text" id="validityDate" name="validityDate" value="${ltfun:dateLongToStringFormat(entity.validityDate,'yyyy-MM-dd')  }" 
	                                         onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate form-control "/>
											<%-- <div class=" date " id="datetimepicker_end"
												data-date="${ltfun:dateLongToStringFormat(entity.validityDate,'yyyy-MM-dd')  }" data-date-format="yyyy-mm-dd" >
												<input type="text" class="form-control" value="${ltfun:dateLongToStringFormat(entity.validityDate,'yyyy-MM-dd')  }" name="validityDate" id="validityDate"
													readonly> <span class="input-group-btn add-on">
													<button class="btn default" type="button">
														<i class="icon-calendar"></i>
													</button>
												</span>
											</div> --%>
										</div>
									</div>
	                                <div class="col-md-4">
	                                  <span id="tip_validityDate" for="validityDate" class="help-block hidden" style="">不能为空</span>
	                                </div>
								</div>
								
						<!--  -->	
								<div class="form-group" id="con_file">
									<label class="control-label col-md-3">课程图片</label>
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
								<input type="hidden" id="niqiuHash" name="niqiuHash" value="${entity.imagePath}">
								
							<!--  -->
								<div class="form-group" id="con_descript">
									<label class="control-label col-md-3">课程简介</label>
									<div class="col-md-4">
										<textarea rows="" cols="" name="descript" id="descript" class="form-control mytextarea" onchange="v_descript();">${entity.descript }</textarea>
									</div>
                                    <div class="col-md-4">
                                        <span id="tip_descript" for="descript" class="help-block " style="">长度在3000字以内</span>
                                    </div>
								</div>
								<div class="form-group" id="con_remark">
									<label class="control-label col-md-3">备注</label>
									<div class="col-md-4">
										<textarea rows="" cols="" name="remark" id="remark" class="form-control mytextarea" onchange="v_remark();">${entity.remark }</textarea>
									</div>
									<div class="col-md-4">
										<span id="tip_remark" for="remark" class="help-block " style="">长度在255字以内</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
                                        <input type="hidden" name="isChooseLogo" id="isChooseLogo" value="false" >
                                        <input type="hidden" name="coursewareId" id="coursewareId" value="${entity.courseware.id }" >
                                        <input type="hidden" name="categoryId" id="categoryId" value="${entity.courseCategory.id }" >
                                        <input type="hidden" name="id" id="id" value="${entity.id }" >
                                        <button type="button" onclick="validateUpdate()" id="subButton" class="btn btn-warning">提交</button>
										<button type="button" class="btn default" onclick="backToList();">取消</button>
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
	<!-- 弹出层显示树状结构的部门 -->
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
<%-- html5上传
<script src="${basepath }/static/public/javascripts/course/zxxFile.js" type="text/javascript"></script> --%>
<script type="text/javascript" src="${basepath }/static/public/javascripts/course/addcourse.js" charset="UTF-8"></script>    
<%-- dwr --%>
<script type='text/javascript' src='${basepath }/dwr/engine.js'></script>
<script type='text/javascript' src='${basepath }/dwr/util.js'></script>
<script type='text/javascript' src='${basepath }/dwr/interface/DWRService.js'></script>
<%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script> 
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script>
var token = "${qiniuParam.uploadToken}";
var qiniuImageBasePath = "${qiniuParam.qiniuImageBasePath}";
var coverSuffix = "-320x180";
$(document).ready(function(){
	$('#file_upload').uploadify({
		'formData'     : {
			'token'     : token,
		},
		'fileObjName'  : 'file',
		'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
		'buttonClass' : 'upload_access',
		'swf'      : basepath+'/static/ixin/css/uploadify.swf',
		'uploader' : 'http://up.qiniu.com/',
		'onUploadSuccess' : function(file,data,response){
			var result = eval("("+data+")");
			//$('#showImage').attr("src",qiniuImageBasePath+result.hash+coverSuffix);
			//$('#showImage').show();
			$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
			$("#small_prev").show();
			$('#niqiuHash').val(result.hash);
			
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
<c:if test="${not empty entity.imagePath}">
$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${entity.imagePath}"+coverSuffix+"'>");
$("#small_prev").show();
</c:if>
</script>
</content>	
