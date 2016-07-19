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
<link rel="stylesheet" type="text/css" href="${basepath}/static/css/active.css">
<link rel="stylesheet" type="text/css" href="${basepath}/static/public/easydialog-v2.0/easydialog.css"/>
<style type="text/css">
div.checker, div.checker span, div.checker input {
width: auto;height: auto;
}
.form-horizontal .control-label, .form-horizontal .radio, .form-horizontal .checkbox, .form-horizontal .radio-inline, .form-horizontal .checkbox-inline{
padding-top:0px;
}
.preview-style{
margin-bottom: 30px;
}
</style>

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
						<i class="icon-reorder"></i><span>课件信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
				<div class="col-md-12" id="course_info">
                <ul class="stemp-box">
                <li class="tep-left">
                    <img src="${basepath}/static/img/step-left.png">
                </li>
              <li class="over-step" onclick="next1('${id}');">
			                    1
			                </li>
			                <li class="step-xian-lv"></li>
			                <li class="current-step" onclick="next2('${id}');">
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
                     <label class="col-sm-2 control-label">课程类型 ： </label>
                     <div class="col-sm-10">
                     <label class="radio inline">
                     <input type="radio" name="coursetype" id="scormtype" value="1" <c:if test="${course.resType eq 0 || course.resType eq 1}"> checked</c:if>>scorm课程
                     </label>
                     <label class="radio inline">
                     <input type="radio" name="coursetype" id="smalltype" value="2" <c:if test="${course.resType eq 2}"> checked</c:if>>微课
                     </label>
                     <label class="radio inline">
                     <input type="radio" name="coursetype" id="video" value="3" <c:if test="${course.resType eq 3}"> checked</c:if> >视频
                     </label>
                     <label class="radio inline">
                     <input type="radio" name="coursetype" id=document value="4" <c:if test="${course.resType eq 4}"> checked</c:if> >文档
                     </label>
                     <label class="radio inline">
                     <input type="radio" name="coursetype" id=fodder value="5" <c:if test="${course.resType eq 5}"> checked</c:if> >素材
                     </label>
                     </div>
                    </div>
                 <div class="form-group" >
                    <label class="col-sm-2 control-label">课件:</label>
                   <div class="col-sm-10">
                     <div class="input-group" onclick="opencoursebox()">
                     <c:choose>
                     	<c:when test="${course.resType eq 4 }">
                     		 <input type="text" class="form-control" placeholder="请选择课件"  readonly="readonly" id="courseware_name" name="courseware_name"  value="${documentName}">
                     	</c:when>
                     	<c:when test="${course.resType eq 3 }">
                     		 <input type="text" class="form-control" placeholder="请选择课件"  readonly="readonly" id="courseware_name" name="courseware_name"  value="${videoName}">
                     	</c:when>
                     	<c:when test="${course.resType eq 5 }">
                     		 <input type="text" class="form-control" placeholder="请选择课件"  readonly="readonly" id="courseware_name" name="courseware_name"  value="${fodderName}">
                     	</c:when>
                     	<c:otherwise>
                     	     <input type="text" class="form-control" placeholder="请选择课件"  readonly="readonly" id="courseware_name" name="courseware_name"  value="${course.courseware.name}">
                     	</c:otherwise>
                     </c:choose>
                      <span class="input-group-addon chose_coursewear" >
                       <i class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择
                       </span>
                     </div>
                     </div>
                 </div>
                 
                 <div class="form-group" id="coursewareAddress">   
                     <label class="col-sm-2 control-label">课件首页地址:</label>
                      <div class="col-sm-10">
                      <c:if test="${not empty course.startPage }">
                      <input type="text" class="form-control" id="indexaddress" placeholder="不能为空" value="${course.startPage}" >
                      </c:if>
                      <c:if test="${empty course.startPage  }">
                      <input type="text" class="form-control" id="indexaddress" placeholder="不能为空" value="index.html" >
                      </c:if>
                      </div>
                  </div>
                 </form>
                       <div class="form-group" style="text-align: right">
							<input type="hidden" id="fileid" name="fileid" value="${course.resId}">	                     	
                        <div class="form-group" >
                         	<span class="btn btn-success" onclick="next1('${id}')"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp;&nbsp;上一步</span>
					     	<span class="btn btn-success" onclick="update2('${id}');"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;下一步</span>
					    	<span style="margin-right: 30px;float: right; text-decoration: underline; color:#15A0F5;cursor: pointer;margin-left: 20px;margin-top: 20px;" onclick="next3('${id}')">跳过</span>
					    </div>
                    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- 弹出课程的界面 -->
		<div class="easyDialog_wrapper" id="easyDialogWrapper1">
			<div class="easyDialog_content">
				<h4 class="easyDialog_title" id="easyDialogTitle">
					<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						 onclick="easyDialog.close()">&times;</a> 选择或上传课件
				</h4>
				<div class="easyDialog_text" style="width:700px;height:500px;display:block;overflow-x:hidden;overflow-y:scroll;">
					<!-- 上传课件的地方 -->
					<ul class="nav nav-tabs">
					  <li class="active"><a href="#choosecourse" data-toggle="tab">选择课件</a></li>
					  <li><a href="#uploadscourse" data-toggle="tab">上传课件</a></li>
					</ul>
					
					<!-- Tab panes -->
					<div class="tab-content">
					  	<div class="tab-pane active" id="choosecourse">
					  		<table class="table table-bordered">
					  			<thead>
					  				<tr>
					  					<td>序号</td>
					  					<td>课件名称</td>
					  					<td>操作</td>
					  				</tr>
					  			</thead>
					  			<tbody id="selectcourse">				  			
					  			
					  			</tbody>
					  		</table>
					  		  <div style="width:100%;clear:both;height:30px;margin-top:10px;display:block;" id="pageinit">
                              </div>
					  	</div>
					  	<div class="tab-pane" id="uploadscourse">
					  		<span onclick="$('#uploadfile').click()" id="jia" style="height:100px;width:100%;display:block;font-size:72px;text-align: center;border:1px dashed #eaeaea;color:#eaeaea;cursor: pointer;">
					  			<i class="fa fa-plus" style="margin-top:20px;"></i>
					  		</span>
					  		<div class="drag_upload" id="preview_con"></div>
					  		<input type="file" id="uploadfile" style="display: none;">
					  		<input type="button" class="btn btn-block btn-primary" style="width:126px;display:none;margin-top:5px;margin-bottom:5px;margin-left:80%;"  id="fileSubmit" value="上传课程">
					  		<table class="table table-bordered" id="uploadcourse">
					  		
					  		</table>
						</div>
					</div>
				</div>
				<div class="easyDialog_footer">
					<button class="btn_normal" onclick="easyDialog.close()">取消</button>
				</div>
			</div>
		</div>
		
		
		<!-- 弹出文档的界面 -->
		<div class="easyDialog_wrapper" id="easyDialogWrapper4">
			<div class="easyDialog_content">
				<h4 class="easyDialog_title" id="easyDialogTitle4">
					<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						 onclick="easyDialog.close()">&times;</a> 选择或上传文档
				</h4>
				<div class="easyDialog_text" style="width:700px;height:500px;display:block;overflow-x:hidden;overflow-y:scroll;">
					<!-- 上传文档的地方 -->
					<ul class="nav nav-tabs">
					  <li class="active"><a href="#choosecourse4" data-toggle="tab">选择文档</a></li>
					  <li><a href="#uploadscourse4" data-toggle="tab">上传文档</a></li>
					</ul>
					
					<!-- Tab panes -->
					<div class="tab-content">
					  	<div class="tab-pane active" id="choosecourse4">
					  		<table class="table table-bordered">
					  			<thead>
					  				<tr>
					  					<td>序号</td>
					  					<td>文档名称</td>
					  					<td>操作</td>
					  				</tr>
					  			</thead>
					  			<tbody id="selectcourse4">
					  			
					  			</tbody>
					  		</table>
					  		  <div style="width:100%;clear:both;height:30px;margin-top:10px;display:block;" id="pageinit4">
                              </div>
					  	</div>
					  	<div class="tab-pane" id="uploadscourse4">
					  		<div name="image" id="fileDragArea" class="drag_upload">
                           			<div class="jiahao">
                           				<i class="glyphicon glyphicon-plus"></i>
                           			</div>
                           		</div>
                                <div class="drag_upload" id="preview_con4"></div>
	                            <input type="file"  id="fileImage4" name="file" class="hidden" >
                                <input type="hidden" name="domain" id="domain4" value="longtime"> 
					  			<span style="margin: 10px; margin-top: 30px;" id="notice">支持上传的文件格式有：.doc、.docx、.ppt、.pptx、.xls、.xlsx、.pdf</span>
					  			<input type="button" class="btn-success btn" style="display:none"  id="fileSubmit4" value="上传文档">
					  			<table class="table table-bordered" id="uploadcourse4">
					  			</table>
						</div>
					</div>
				</div>
				<div class="easyDialog_footer">
					<button class="btn_normal" onclick="easyDialog.close()">取消</button>
				</div>
			</div>
		</div>
		
		
		<!-- 弹出视频的界面 -->
		<div class="easyDialog_wrapper" id="easyDialogWrapper2">
			<div class="easyDialog_content">
				<h4 class="easyDialog_title" id="easyDialogTitle">
					<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						 onclick="easyDialog.close()">&times;</a> 选择视频
				</h4>
				<div class="easyDialog_text" style="width:500px;height:300px;display:block;overflow-x:hidden;overflow-y:scroll;">
					<!-- 上传课件的地方 -->
					<ul class="nav nav-tabs">
					  <li class="active"><a href="#choosevideo" data-toggle="tab">选择视频</a></li>
					</ul>
					
					<!-- Tab panes -->
					<div class="tab-content">
					  	<div class="tab-pane active" id="choosevideo">
					  		<table class="table table-bordered">
					  			<thead>
					  				<tr>
					  					<td>序号</td>
					  					<td>视频名称</td>
					  					<td>操作</td>
					  				</tr>
					  			</thead>
					  			<tbody id="selectvideo">
					  			
					  			</tbody>
					  		</table>
					  		  <div style="width:100%;clear:both;height:30px;margin-top:10px;display:block;" id="pageinit2">
                              </div>
					  	</div>
					</div>
				</div>
				<div class="easyDialog_footer">
					<button class="btn_normal" onclick="easyDialog.close()">取消</button>
				</div>
			</div>
		</div>
				
		<!-- 弹出素材的界面 -->
		<div class="easyDialog_wrapper" id="easyDialogWrapper5">
			<div class="easyDialog_content">
				<h4 class="easyDialog_title" id="easyDialogTitle">
					<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						 onclick="easyDialog.close()">&times;</a> 选择素材
				</h4>
				<div class="easyDialog_text" style="width:500px;height:300px;display:block;overflow-x:hidden;overflow-y:scroll;">
					<ul class="nav nav-tabs">
					  <li class="active"><a href="#choosefodder" data-toggle="tab">选择素材</a></li>
					</ul>
					<table style="margin-bottom:20px;">
						<tbody><tr>
							<td>
								<input type="text" name="search" id="search">
							</td>
							<td>
								<button class="btn btn-success dialog-btn" style="margin:0 !important;" onclick="coursewarelist(1)">搜索</button>
							</td>

						</tr>
						</tbody></table>
					<!-- Tab panes -->
					<div class="tab-content">
					  	<div class="tab-pane active" id="choosefodder">
					  		<table class="table table-bordered">
					  			<thead>
					  				<tr>
					  					<td>序号</td>
					  					<td>名称</td>
					  					<td>操作</td>
					  				</tr>
					  			</thead>
					  			<tbody id="selectfodder">
					  			
					  			</tbody>
					  		</table>
					  		  <div style="width:100%;clear:both;height:30px;margin-top:10px;display:block;" id="pageinit5">
                              </div>
					  	</div>
					</div>
				</div>
				<div class="easyDialog_footer">
					<button class="btn_normal" onclick="easyDialog.close()">取消</button>
				</div>
			</div>
		</div>
		
	    <script src="${basepath }/static/public/javascripts/course/zxxFile.js" type="text/javascript"></script>
	    <script src="${basepath}/static/public/easydialog-v2.0/easydialog.js"></script>
        <script type="text/javascript" src="${basepath }/static/js/course/course.js" charset="UTF-8"></script>
        <script type="text/javascript">
        	var init_type= "${course.resType}";
        	var init_resid = "${course.resId}";
        	var init_cwname = "${course.courseware.name}";
        	var courseid = "${course.id}";
        	if ("${course.resType}"=="4"){
        		init_cwname = "${documentName}";
        	}
        	if ("${course.resType}"=="3"){
        		init_cwname = "${videoName}";
        	} 
        	if ("${course.resType}"=="5"){//素材
        		init_cwname = "${fodderName}";
        	} 
        	var init_index = "${course.startPage}";
        </script>
		</body>
</html>

