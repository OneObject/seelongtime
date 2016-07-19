<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>添加资料</title>
<meta name="menu_path" content="test.testManage" />
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
  	<link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
  	<link rel="stylesheet" href="${basepath}/static/css/active.css">
  	<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
  	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
  	<link rel="stylesheet" href="${basepath}/static/plugins/fonticon/css/font-awesome.css">
  	<script src="${basepath }/static/public/javascripts/course/zxxFile.js" type="text/javascript"></script>
  	<script src="${basepath }/static/public/javascripts/resource.js"></script>
  	
</head>
<body>
	  <!-- 创建考试基本信息 -->
       <!-- BEGIN PAGE HEADER-->
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
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bookmark-o"></i><span>预览发布</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info" >
					    <ul class="stemp-box" style="width: 450px;">
								<li class="tep-left"><img
								src="${basepath}/static/img/step-left.png"></li>
							<li class="${stepStatus['1'] ?'over':'nor' }-step"
								onclick="next1('${id}');">1</li>
							<li class="step-xian${stepStatus['2'] ?'-lv':'' }"></li>
							<li class="${stepStatus['2'] ?'over':'nor' }-step"
								onclick="next2('${id}');">2</li>
							<li class="step-xian-lv"></li>
							<li class="current-step" onclick="next3('${id}');">3</li>
							<li class="tep-right"><img
								src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
							</li>
						</ul>
			            <div class="preview-style">
			                <div class="portlet-body" style="overflow: hidden;padding-bottom: 30px;">
			                	<input type="hidden" name="id" id="id" value=${id } >
		                       
			                    <div class="form-group" style="text-align: right;margin-top: 40px;">
					                <span class="btn btn-success" onclick="savestep3(0);"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;完成</span>
					                <span class="btn btn-success" onclick="savestep3(1);"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;完成并发布</span>
					            </div>
			                </div>
			            </div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="phone-preview" style="display: none">
		    <span onclick="easyDialog.close()" style="width: 30px;height: 30px;background-color: #999999;color: #ffffff;display: block;line-height: 30px!important;text-align: center;border-radius: 50%!important;position: absolute;margin-left: 240px;cursor: pointer;">
		        <i class="fa fa-times" style="font-size: 20px;margin-top: 5px;"></i>
		    </span>
		    <table>
		        <tr>
		            <td colspan="3">
		                <img src="${basepath}/static/img/iphone-top.png" style="width: 264px;">
		            </td>
		        </tr>
		        <tr>
		            <td style="width: 24px;height: 357px;"><img src="${basepath}/static/img/iphone-left.png" style="width: 24px;height: 357px;"></td>
		            <td style="width: 218px;height: 357px;display: block;overflow: hidden" id="frameWrapper">
		                
		            </td>
		            <td style="width: 20px;height: 357px;"><img src="${basepath}/static/img/iphone-right.png" style="width: 20px;height: 357px;"></td>
		        </tr>
		        <tr>
		            <td colspan="3"><img src="${basepath}/static/img/iphone-bottom.png" style="width: 264px;height: 80px;"></td>
		        </tr>
		    </table>
		</div>
		<div  id="qrcodeTablebox" style="display:none; ">
			<div id="qrcodeTable" class="qrcodeTable" style="width:228px;height:228px;"></div>
		</div>
</body>
</html>
