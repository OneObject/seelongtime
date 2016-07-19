<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>添加课程</title>
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
                  <li><a href="${basepath }/base/admin/course/course/course.xhtml">课程管理</a><i class="icon-angle-right"></i></li>
                  <li><span>添加课程</span></li>
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
							<form id="form_sample_1" enctype="multipart/form-data" class="form-horizontal" method="post" action="${basepath }/base/admin/course/course/doadd.xhtml" >
                                <div class="form-group" id="con_categoryId">
                                    <label class="control-label col-md-3">课程分类<span
                                        class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="请选择分类" onclick="choose_category(1)" readonly="readonly" name="category_name" id="category_name">
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
										<input type="text" name="name" id="name" data-required="1" class="form-control" value="" onchange="v_name();" />
									</div>
                                    <div class="col-md-4">
                                        <span id="tip_name" for="name" class="help-block" style="">必填</span>
                                    </div>
								</div>
								<div class="form-group" id="con_courseNO">
									<label class="control-label col-md-3">课程编号<span
										class="required">*</span></label>
									<div class="col-md-4">
										<input type="text" name="courseNO" id="courseNO" data-required="1" value=""
											class="form-control" value="" onchange="v_courseNO('', false);" />
									</div>
									<div class="col-md-4">
										<span id="tip_courseNO" for="courseNO" class="help-block " style="">编号必须为英文或者数字</span>
									</div>
		                              <div class="col-md-4">
		                                <span id="tip2_courseNO" for="courseNO" class="help-block hidden" style="">编号已经被使用！</span>
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
                                    <div class="col-md-4">
                                      <span id="tip_score" for="score" class="help-block hidden" style="">不能为空</span>
                                    </div>
                                </div>
                                
								 <div class="form-group" id="con_type">
                                    <label class="col-md-3 control-label">课件类型<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="radio-list" id="judge" >
                                            <label class="radio-inline">
                                                <input type="radio" name="type" id="type1" value="1" onclick="mySpecial('con_startPage','con_isDel')">scorm
                                            </label> 
                                            <label  class="radio-inline">
                                                <input type="radio" name="type" id="type2" value="2" onclick="myShow('con_startPage','con_isDel')" checked="checked">非scorm
                                            </label>
                                             <label  class="radio-inline">
                                                <input type="radio" name="type" id="type3" value="3" onclick="myHide('con_startPage','con_isDel')">视频
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                      <span id="tip_score" for="score" class="help-block hidden" style="">不能为空</span>
                                    </div>
                                </div>
                                <div class="form-group" id="con_coursewareId">
                                    <label class="control-label col-md-3">课件<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="请选择课件" onclick="pageCourseware(1)"  readonly="readonly" id="courseware_name" name="courseware_name">
                                                <span class="input-group-addon chose_coursewear" onclick="pageCourseware(1)">
                                                <i class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择</span>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <span id="tip_coursewareId" for="coursewareId" class="help-block" style="">必填</span>
                                    </div>
                                </div>
                                <div class="form-group" id="contain_video">
                                    <label class="col-md-3 control-label">包含视频<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="radio-list" id="judge" >
                                            <label class="radio-inline">
                                                <input type="radio" name="containvideo" id="contain_video1" value="1">是
                                            </label>
                                            <label  class="radio-inline">
                                                <input type="radio" name="containvideo" id="contain_video2" value="0" checked="checked">否
                                            </label> 
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group" id="open_state">
                                    <label class="col-md-3 control-label">公开<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="radio-list" id="judge" >
                                            <label class="radio-inline">
                                                <input type="radio" name="openstate" id="openstate1" value="1">公开
                                            </label>
                                            <label  class="radio-inline">
                                                <input type="radio" name="openstate" id="openstate3" value="2" checked="checked">不公开
                                            </label> 
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" id="con_isDel">
                                    <label class="control-label col-md-3">删除原课件<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="radio-list" id="judge" >
                                            <label class="radio-inline">
                                                <input type="radio" name="isDel" id="isDel1" value="1" checked="checked">是
                                            </label> 
                                            <label  class="radio-inline">
                                                <input type="radio" name="isDel" id="isDel0" value="0">否
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <span id="tip_isDel" for="isDel" class="help-block hidden" style="">必填</span>
                                    </div>
                                </div>
                                <div class="form-group " id="con_startPage">
                                    <label class="col-md-3 control-label">课件首页地址<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <input type="text" name="startPage" id="startPage" data-required="1" 
                                            class="form-control" value="index.html" onchange="v_startPage();" />
                                    </div>
                                    <div class="col-md-4">
                                      <span id="tip_startPage" for="startPage" class="help-block " style="">课件播放的首页文件名称。如：index.html（index.htm，index.xhtml）</span>
                                    </div>
                                </div>
								<div class="form-group" id="con_length">
									<label class="control-label col-md-3">课程时长</label>
									<div class="col-md-4">
										<input type="text" name="length" id="length" data-required="1" onchange="v_length()"
											class="form-control" value="" />
									</div>
									<div class="col-md-4">
										<span id="tip_length" for="length" class="help-block " style="">（整数）单位为分钟</span>
									</div>
								</div>
								<div class="form-group" id="con_score">
									<label class="control-label col-md-3">合格分数</label>
									<div class="col-md-4">
										<input type="text" name="score" id="score" data-required="1"
											class="form-control" value="" onchange="v_score();" />
									</div>
									<div class="col-md-4">
										<span id="tip_score" for="score" class="help-block " style="">（1~100）整数</span>
									</div>
								</div>
								<div class="form-group" id="con_validityDate">
									<label class="control-label col-md-3">课程有效期</label>
									<div class="col-md-4">
                                        <input type="text" id="validityDate" name="validityDate" value="${nowtime }" 
                                         onfocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:'${nowtime }'})" class="form-control Wdate"/>
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
								<input type="hidden" id="niqiuHash" name="niqiuHash" value="">
								
							<!--  -->	
								
								
								
								<div class="form-group" id="con_descript">
									<label class="control-label col-md-3">课程简介</label>
									<div class="col-md-4">
										<textarea rows="" cols="" name="descript" id="descript" class="form-control mytextarea" onchange="v_descript();"></textarea>
									</div>
                                    <div class="col-md-4">
                                        <span id="tip_descript" for="descript" class="help-block " style="">3000字以内</span>
                                    </div>
								</div>
								<div class="form-group" id="con_remark">
									<label class="control-label col-md-3">备注</label>
									<div class="col-md-4">
										<textarea rows="" cols="" name="remark" id="remark" class="form-control mytextarea" onchange="v_remark();"></textarea>
									</div>
									<div class="col-md-4">
										<span id="tip_remark" for="remark" class="help-block " style="">255字以内</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
                                        <input type="hidden" name="domain" id="domain" value="longtime"> 
                                        <input type="hidden" name="isChooseLogo" id="isChooseLogo" value="false" >
                                        <input type="hidden" name="coursewareId" id="coursewareId" >
                                        <input type="hidden" name="categoryId" id="categoryId" >
                                        <input type="hidden" name="path" id="path" >
										<button type="button" onclick="validateAdd()" id="subButton" class="btn green">提交</button>
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
    <!-- 选择课件弹出层 开始 -->
    <div id="dialogBank" style="display: none;">
        <h4 class="easyDialog_title" id="easyDialogTitle">&nbsp;&nbsp;选择课件
            <a href="javascript:easyDialog.close()" title="关闭窗口" class="close_btn"
                id="closeBtn">&times;&nbsp;&nbsp;</a>
        </h4>
        <div class="easyDialog_text" style="background-color: #fff;" id="easyDialogText">
            <table style="width:100%;">
                <tr>
                    <td>
                        <span>课件名称:</span> <input type="text" name="searchContent" id="searchContent"><br>
                    </td>
                    <td>
                        <span class="btn yellow" onclick="pageCourseware(1)" style="margin: 10px;"><i class="icon-search"></i>检索</span>
                    </td>
                </tr>
            </table>
            <!-- 表格 -->
            <div id="table_list" style=""></div>
	        
	        <div class="easyDialog_footer" style="clear:both;">
	          <button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
	          <button class="btn btn-success dialog-btn" onclick="sureCousewear()">确定选择</button>
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
<%-- html5上传 --%>
<!--  
<script src="${basepath }/static/public/javascripts/course/zxxFile.js" type="text/javascript"></script>-->
<script type="text/javascript" src="${basepath }/static/public/javascripts/course/addcourse.js" charset="UTF-8"></script>    
<%-- dwr --%>
<script type='text/javascript' src='${basepath }/dwr/engine.js'></script>
<script type='text/javascript' src='${basepath }/dwr/util.js'></script>
<script type='text/javascript' src='${basepath }/dwr/interface/DWRService.js'></script> 
</content>
<content tag="pageInit">
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
   </script>
</content>	
