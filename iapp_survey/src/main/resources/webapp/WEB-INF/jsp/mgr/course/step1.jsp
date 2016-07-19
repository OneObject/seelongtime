<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
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
<link rel="stylesheet" type="text/css" href="${basepath}/static/css/active.css">
<link rel="stylesheet" type="text/css" href="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css">

<style type="text/css">
div.checker, div.checker span, div.checker input {
width: auto;height: auto;
}
</style>
<script type="text/javascript">
var zdata ="${tree}";
</script>
</head>
<body>
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><a href="${basepath }/base/admin/course/course/coursemanage.xhtml">课程管理</a><i class="icon-angle-right"></i></li>
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
						<i class="icon-reorder"></i><span>基础信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
				<div class="col-md-12" id="course_info">
                <ul class="stemp-box">
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
                <li class="step-xian${stepStatus['4'] ?'-lv':'' }"></li>
                <li class="${stepStatus['4'] ?'over':'nor' }-step" onclick="next4('${id}');">
                    4
                </li>
               	<li class="step-xian${stepStatus['5'] ?'-lv':'' }"></li>
			    <li class="${stepStatus['5'] ?'over':'nor' }-step" onclick="next5('${id}');">
			        5
			    </li>
                <li class="tep-right">
			           <img src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
			     </li>
                 </ul>
				 <div class="preview-style">
				  <form class="form-horizontal" role="form">
				  
                    <div class="form-group" >
                     <label class="col-sm-2 control-label">课程分类：</label>
                     <div class="col-sm-10">
                         <div class="input-group">
                             <input type="text" class="form-control" placeholder="请选择分类" onclick="choose_category(1)" value="${course.courseCategory.name }" readonly="readonly" name="category_name" id="category_name">
                                 <span class="input-group-addon chose_coursewear" onclick="choose_category(1)">
                                 <i class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择</span>
                         </div>
                     </div>
                    </div>
                   <div class="form-group" id="tip_name">
						<label class="col-sm-2 control-label">课程名称：</label>	
						<div class="col-sm-10">							
						<input type="text" name="name" id="name" data-required="1" placeholder="不能为空" class="form-control" value="${course.name}" />
				        </div>
				  </div>
				  
				  <div class="form-group">
					<label class="col-sm-2 control-label">讲师姓名：</label>
					<div class="col-sm-10">
						<input type="text" name="lecturername" id="lecturername" class="form-control" value="${course.lecturername}"   data-required="1"/>
					</div>
				</div>
				  
                 <div class="form-group" >
                     <label class="col-sm-2 control-label" >支持移动端：</label>
                     <div class="col-sm-10">
                     <c:if test="${course.supportmobile eq 0 }">	
                     <div class="switch " >
                     <input type="checkbox"  id="myswitch" value="0"  />
                     </div>
                     </c:if>
                     
                     <c:if test="${course.supportmobile eq 1 }">
                      <div class="switch " >
                     <input type="checkbox" checked  id="myswitch" value="1"  />
                     </div>
                     </c:if>
                     
                     <c:if test="${empty course.supportmobile}">
                       <div class="switch " >
                     <input type="checkbox"   id="myswitch" value="0"  />
                     </div>
                     </c:if>
                     </div>
					    
				</div>
				 <div class="form-group" >
                     <label class="col-sm-2 control-label" >包含视频：</label>
                     <div class="col-sm-10">
                     <c:if test="${course.containvideo  eq 0 }"	>
                     <div class="switch" tabindex="0">
                     <input type="checkbox"  id="myswitch2" value="0" />
                     </div>
                     </c:if>
                     <c:if test="${course.containvideo eq 1 }">
                     <div class="switch" tabindex="0">
                     <input type="checkbox" checked  id="myswitch2" value="1" />
                     </div>
                     </c:if>
                     <c:if test="${empty course.containvideo}">
                      <div class="switch" tabindex="0">
                     <input type="checkbox"   id="myswitch2" value="0" />
                     </div>
                     </c:if>
                     </div>
				</div>
				<div class="form-group" >
				<label class="col-sm-2 control-label" >是否公开：</label>
				 <div class="col-sm-10">
				<c:if test="${course.openState eq 2}">
				<div class="switch">
				<input type="checkbox"  id="myswitch3" value="2" />
				</div>
				</c:if>
				
				<c:if test="${course.openState eq 1 }">
				<div class="switch">
				<input type="checkbox" checked  id="myswitch3" value="1" />
				</div>
				</c:if>
				
				<c:if test="${empty course.openState }">
				 <div class="switch" >
                     <input type="checkbox"   id="myswitch3" value="2" />
                 </div>
				</c:if>
				</div>
				</div>
				  <div class="form-group" >
				  		<div id="tip_length">
										<label class="col-sm-2 control-label">课程时长：</label>
										<div class="col-sm-3">
											<input type="text" style="width: 160px;" name="length"
												id="length" data-required="1" placeholder="只能为整数,单位分钟"
												class="form-control"
												value="<fmt:formatNumber value='${course.length}' pattern='#' type='number'/>" />
										</div>
						</div>
						<div id="tip_completepercent">
							<label class="col-sm-3 control-label" style="text-align:left;width:190px;margin-top:8px;font-size:12px;padding:0px;">学习时长要求(只针对scorm课程)：</label>	
								<div class="col-sm-3" style="padding:0px 5px;">						
									<input type="text" style="width:167px;" name="completepercent" id="completepercent"  placeholder="0~100的整数,默认100"  class="form-control" value="<fmt:formatNumber value='${course.completePercent}' pattern='#' type='number'/>"/>
								</div>
							<label class="col-sm-1 control-label" style="padding:0px;float:left;width:20px;margin-top:7px;margin-left:-10px;">%</label>
				 		</div>
				  </div>
				   <div class="form-group">
				   <label class="col-sm-2 control-label" >课程图片：</label>
				   <div class="col-sm-10">
				  <%--
				    <c:if test="${ empty course.imagePath}">
				    <img src="<%=Constants.IMG_SERVER_DOWNLOAD%>default_course_cover-320x180" id="active-poster" class="img-responsive" style="width:320px;height:180px;"  >
				    </c:if>
				   --%>
				      <c:if test="${ empty course.imagePath or  course.imagePath eq 'default_course_cover'}">
				    <img src="${basepath}/static/img/default_course_cover-320x180.png" id="active-poster" class="img-responsive" style="width:320px;height:180px;"  >
				    </c:if>
				    <c:if test="${not empty course.imagePath and course.imagePath ne 'default_course_cover'}">
				     <img src="<%=Constants.IMG_SERVER_DOWNLOAD%>${course.imagePath}-320x180" id="active-poster" class="img-responsive" style="width:320px;height:180px;"  >
				    </c:if>
				    <input id="file_upload" class="form-control" name="file_upload"  type="file" >
				    <input type="hidden" id="cover" name="cover" value="${course.imagePath}">
				    <input id="path" type="hidden" name="path" value="<%=Constants.IMG_SERVER_DOWNLOAD%>">
				    </div>
				   </div>
				    <div class="form-group">
                    <label class="col-sm-2 control-label">课程简介：</label>
                     <div class="col-sm-10">	
                    <textarea class="form-control"  id="jianjie" style="resize: none" placeholder="课程简介">${course.descript}</textarea>
                     </div>
                   </div>
				    <div class="form-group" style="text-align: right">
				     <input type="hidden" name="categoryId" id="categoryId" >
				     <input type="hidden" id="hid_id" name="hid_id" value="${id}">
				      <span class="btn btn-success" onclick="addcourse();"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;下一步</span>
                    </div>
                    </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script type="text/javascript" src="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js" ></script>
	<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${basepath }/static/public/javascripts/course/addcourse.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${basepath }/static/js/course/course.js" charset="UTF-8"></script>
	<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>    
	<script type="text/javascript">
	$(function(){
       var id=$("#hid_id").val();
       if(id==null || id==""){
              $("#cover").val("default_course_cover");
           }
		$("#myswitch").bootstrapSwitch({
			onText:"是",
			offText:"否"
			});
		$("#myswitch2").bootstrapSwitch({
			onText:"包含",
			offText:"不包含"
			});
		$("#myswitch3").bootstrapSwitch({
			onText:"公开",
			offText:"不公开"
			});
		
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
					$("#cover").val(result.hash);
				}
			});

		$("#myswitch").on('switchChange.bootstrapSwitch', function(event, state) {
			if(state.value){
				$(this).val('1');
			} else {
				$(this).val('0');
			}
		});

		$("#myswitch2").on('switchChange.bootstrapSwitch', function(event, state) {
			if(state.value){
				$(this).val('1');
			} else {
				$(this).val('0');
			}
		});

		$("#myswitch3").on('switchChange.bootstrapSwitch', function(event, state) {
			if(state.value){
				$(this).val('1');
			} else {
				$(this).val('2');
			}
		});
		});

	
		
	</script>
</body>
</html>

