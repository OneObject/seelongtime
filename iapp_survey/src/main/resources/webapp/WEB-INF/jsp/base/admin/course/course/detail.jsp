<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.longtime.app.config.Constants" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>课程详情</title>
<meta name="menu_path" content="course.courseManage"/>
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">

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
                     <a href="${basepath }/base/admin/course/course/coursemanage.xhtml">课程管理</a>
                     <i class="icon-angle-right">
                     </i>
                  </li>
                  <li><span>课程详情</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box purple">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-reorder"></i><span>课程详情</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						<div class="form-body">
							<!-- BEGIN FORM-->
							<form id="form_sample_2" enctype="multipart/form-data" class="form-horizontal" method="post" action="${basepath }/base/admin/course/course/doadd.xhtml" onsubmit="return validateAdd();">
								<%-- <div class="form-group" id="con_domain">
									<label class="control-label col-md-3">组织<span
										class="required">*</span></label>
									<div class="col-md-4">
										<input type="text" name="domain" data-required="1"
											class="form-control" value="上海龙泰信息科技有限公司" />
										<label>上海龙泰信息科技有限公司</label>
									</div>
								</div> --%>
                                <div class="form-group" id="con_categoryId">
                                    <label class="control-label col-md-3">课程分类<span
                                        class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <label class="control-label"><span>${entity.courseCategory.name }</span></label>
                                        </div>
                                    </div>
                                </div>
								<div class="form-group" id="con_name">
									<label class="control-label col-md-3">课程名称<span
										class="required">*</span></label>
									<div class="col-md-4">
                                            <label class="control-label"><span>${entity.name }</span></label>
									</div>
								</div>
								<div class="form-group" id="con_courseNO">
									<label class="control-label col-md-3">课程编号<span
										class="required">*</span></label>
									<div class="col-md-4">
                                            <label class="control-label"><span>${entity.courseNO }</span></label>
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
								
								<div class="form-group" id="supportmobile_state">
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
                                
								 <div class="form-group" id="con_type">
                                    <label class="col-md-3 control-label">课件类型<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="radio-list" id="judge" >
                                            <label class="radio-inline">
                                                <input type="radio" name="type" disabled="disabled" ${entity.resType eq 1 ?'checked="checked"':'' } >scorm
                                            </label> 
                                            <label  class="radio-inline">
                                                <input type="radio" name="type" disabled="disabled" ${entity.resType eq 2 ?'checked="checked"':'' } >非scorm
                                            </label>
                                             <label  class="radio-inline">
                                                <input type="radio" name="type" disabled="disabled" ${entity.resType eq 3 ?'checked="checked"':'' } >视频
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
                                            <label class="control-label">
                                            <a href="javascript:void(0)" onclick="detailCourseware()">
                                            	<c:if test="${entity.resType eq 3 }">
                                            		${resource.displayName }
                                            	</c:if>
                                            	<c:if test="${entity.resType ne 3 }">
                                            		${entity.courseware.name }
                                            	</c:if>
                                            </a>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                
                                 <div class="form-group" id="open_state">
                                    <label class="col-md-3 control-label">公开<span class="required">*</span></label>
                                    <div class="col-md-4">
                                        <div class="radio-list" id="judge" >
                                            <label class="radio-inline">
                                                <input type="radio" name="openstate" disabled="disabled" ${entity.openState eq 1 ?'checked="checked"':'' }>公开
                                            </label>
                                            <label  class="radio-inline">
                                                <input type="radio" name="openstate" disabled="disabled" ${entity.openState eq 2 ?'checked="checked"':'' }>不公开
                                            </label> 
                                        </div>
                                    </div>
                                </div>
                                
                                <c:if test="${entity.resType eq 2 }">
	                                <div class="form-group " id="con_startPage">
	                                    <label class="col-md-3 control-label">课件首页地址<span class="required">*</span></label>
	                                    <div class="col-md-4">
	                                            <label class="control-label"><span>${entity.courseware.startPage }</span></label>
	                                    </div>
	                                </div>
                                </c:if>
								<div class="form-group" id="con_length">
									<label class="control-label col-md-3">课程时长</label>
									<div class="col-md-4">
                                            <label class="control-label"><span><fmt:formatNumber value="${entity.length}" pattern="#"/>分钟</span></label>
									</div>
								</div>
								<div class="form-group" id="con_score">
									<label class="control-label col-md-3">合格分数</label>
									<div class="col-md-4">
                                            <label class="control-label"><span>${entity.score }</span></label>
									</div>
								</div>
								<div class="form-group" id="con_validityDate">
									<label class="control-label col-md-3">课程有效期</label>
									<div class="col-md-4">
                                            <label class="control-label"><span>${ltfun:dateLongToStringFormat(entity.createTime,'yyyy-MM-dd') }</span></label>
									</div>
								</div>
                                <div class="form-group" id="con_file">
                                    <label class="control-label col-md-3">课程图片</label>
                                    <div class="col-md-4">
                                        <c:if test="${'' != entity.imagePath }">
                                            <img id="imgDetail" style="width:320px; height:180px;" alt="cover" src="<%=Constants.IMG_SERVER_DOWNLOAD %>/${entity.imagePath}-320x180">
                                        </c:if>
                                    </div>
                                </div>
								<div class="form-group" id="con_descript">
									<label class="control-label col-md-3">课程简介</label>
									<div class="col-md-4">
										<textarea rows="" cols="" name="descript" id="descript" class="form-control mytextarea" onchange="v_descript();" readonly="readonly">${entity.descript }</textarea>
									</div>
								</div>
								<div class="form-group" id="con_remark">
									<label class="control-label col-md-3">备注</label>
									<div class="col-md-4">
										<textarea rows="" cols="" name="remark" id="remark" class="form-control mytextarea" onchange="v_remark();" readonly="readonly">${entity.remark }</textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
                                       <input type="hidden" name="domain" id="domain" value="longtime"> 
									   
	                                     <button type="button" class="btn btn-warning" onclick="updateEntity('${entity.id }')">修改</button>
		                               <c:if test="${entity.releaseStatus == 0 }"> 
		                                 <button type="button" class="btn red" onclick="deleteSingleInDetail('${entity.id }')">删除</button>  
									   </c:if>
									   <input type="hidden" name="from" id="from" value="${from }">
		                               <button type="button" class="btn default" onclick="backToList();">返回</button>          
									</div>
								</div>

							</form>
							
							
     <!-- 弹出层 开始 -->
    <div class="easyDialog_wrapper" id="dialogbank" style="display: none;">
        <div class="easyDialog_content">
            <h4 class="easyDialog_title" id="easyDialogTitle">
            	<c:if test="${entity.resType eq 3 }">视频信息</c:if>
            	<c:if test="${entity.resType ne 3 }">课件信息</c:if>
                <a href="javascript:void(0)" title="关闭窗口" class="close_btn"
                    id="closeBtn">&times;</a> <span id="dialog_title"></span>
            </h4>
            <div class="easyDialog_text">
            	<c:if test="${entity.resType eq 3 }">
            		<div style="width:500px;" class="form-horizontal ">
	                    <div class="form-group" id="con_name">
	                        <label class="control-label col-md-3" >视频名称：</label>
	                        <div class="col-md-9">
	                             <label class="control-label"><span>${resource.displayName }</span></label>
	                        </div>
	                    </div>
	                    <div class="form-group" id="con_name">
	                        <label class="control-label col-md-3" >时长：</label>
	                        <div class="col-md-9">
	                             <label class="control-label"><span>${resource.duration }</span></label>
	                        </div>
	                    </div>
	                    <div class="form-group" id="con_name">
	                        <label class="control-label col-md-3" >文件大小：</label>
	                        <div class="col-md-9">
	                             <label class="control-label"><span>${resource.size}</span></label>
	                        </div>
	                    </div>
	                    <div class="form-group" id="con_name">
	                        <label class="control-label col-md-3" >创建日期：</label>
	                        <div class="col-md-9">
	                             <label class="control-label"><span>${resource.formatCreateDate}</span></label>
	                        </div>
	                    </div>
	                </div>
            	</c:if>
            	<c:if test="${entity.resType ne 3 }">
	                <div style="width:500px;" class="form-horizontal ">
	                    <div class="form-group" id="con_name">
	                        <label class="control-label col-md-3" >课件名称：</label>
	                        <div class="col-md-9">
	                             <label class="control-label"><span>${entity.courseware.name }</span></label>
	                        </div>
	                    </div>
	                    <div class="form-group" id="con_name">
	                        <label class="control-label col-md-3" >课件路径：</label>
	                        <div class="col-md-9">
	                             <textarea class="control-label " disabled="disabled" style="width: 350px; height: 100px;text-align:left; ">${entity.courseware.path }</textarea>
	                        </div>
	                    </div>
	                    <div class="form-group" id="con_name">
	                        <label class="control-label col-md-3" >创建人：</label>
	                        <div class="col-md-9">
	                             <label class="control-label"><span>${entity.courseware.creater }</span></label>
	                        </div>
	                    </div>
	                    <div class="form-group" id="con_name">
	                        <label class="control-label col-md-3" >创建日期：</label>
	                        <div class="col-md-9">
	                             <label class="control-label"><span>${ltfun:dateLongToStringFormat(entity.courseware.createTime,'yyyy-MM-dd HH:mm') }</span></label>
	                        </div>
	                    </div>
	                </div>
                </c:if>
                <div class="form-group">
                    <div id="btn_con" class="col-md-offset-5 col-md-5">
                        <span id="btn_close" class="btn default" onclick="easyDialog.close()">关闭</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
<%-- html5上传 --%>
<script src="${basepath }/static/public/javascripts/course/zxxFile.js" type="text/javascript"></script>
<script type="text/javascript" src="${basepath }/static/public/javascripts/course/course.js" charset="UTF-8"></script>    
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
</content>	
