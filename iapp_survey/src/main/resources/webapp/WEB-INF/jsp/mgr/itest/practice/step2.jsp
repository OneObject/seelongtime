<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>新建练习</title>
<meta name="menu_path" content="test.practiceManage" />
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet"
	href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
<link rel="stylesheet" href="${basepath}/static/css/active.css">
<script
	src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
	<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/testmanage.css">
<link
	href="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css"
	rel="stylesheet">
<script
	src="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js"></script>
<script src="${basepath}/static/itest/admin/practice.js"></script>
<style type="text/css">
div.checker,div.checker span,div.checker input {
	width: auto;
	height: auto;
}
</style>
<script type="text/javascript">
	function resizeheightforedite(o) {
		$(".edite-img").height($(o).height());
		$(".edite-img").attr(
				"style",
				"margin-top:-" + $(o).height() + "px;height:" + $(o).height()
						+ "px;line-height:" + $(o).height() + "px;");
	}
	function showother() {
		$(".othermsg").slideToggle("fast");
		$(".moremsg").slideToggle("fast");
		$(".moremsg-up").slideToggle("fast");
	}
	function qrcode(url){
		$('#qrcodeTable').html("");
		jQuery('#qrcodeTable').qrcode({
			render	: "table",
			text	: url
		});	
		easyDialog.open({
			  container : {
			    header : '使用微信扫描二维码',
			    content : $('#qrcodeTablebox').html()
			    //noFn : true
			  }
			});
		$('.qrcodeTable').find("table").removeAttr("style");
	}
	function phonepreview(){
		var tid = $("#tid").val();
		var html = "<iframe style=\"width: 218px;height:357px;border: none; font-size: 75%; \" src=\"<%=Constants.STUDENT_WEB_ROOT %>m/practice/detail.xhtml?id=${practice.id }\" ready=\"changgefontsize(this)\"> </iframe>";
		$("#frameWrapper").html(html);
	    easyDialog.open({
	        container :"phone-preview"
	    });
	}
</script>
</head>
<body>
	  <!-- 创建考试基本信息 -->
       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }/base/admin/itest/practice/practice.xhtml">练习管理</a><i class="icon-angle-right"></i></li>
				<li><span href="#">新建练习</span></li>
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
					      <ul class="stemp-box"  style="width: 590px;">
			                <li class="tep-left">
			                    <img src="${basepath}/static/img/step-left.png">
			                </li>
			                <li class="over-step" onclick="next1('${tid}');">
			                    1
			                </li>
			                  
			                <li class="step-xian-lv"></li>
			                <li class="current-step" onclick="next2('${tid}');">
			                    2
			                </li>
			                <li class="tep-right">
			                    <img src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
			                </li>
			            </ul>
			            <div class="preview-style">
			                <div class="portlet-body" style="overflow: hidden;padding-bottom: 30px;">
			                	<input type="hidden" name="tid" id="tid" value=${tid } >
		                        <input type="hidden" name="uid" id="uid" value=${uid } >
		                        <input type="hidden" name="name" id="name" value=${name } >
		                        <div class="form-group" style="text-align: center;margin-top:50px;margin-bottom: 60px;">
		                        	<img src="${basepath}/static/img/qrcode.png" onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT %>m/practice/detail.xhtml?id=${practice.id }')" style="cursor: pointer;margin-left: 45px;">
		                        	<img src="${basepath}/static/img/phone-preview.png" onclick="phonepreview();" style="cursor: pointer;margin-left: 45px;">
					            </div>
			                    <div class="form-group" style="text-align: right;">
								  	<input type="hidden" id="tid" name="tid" value="${tid }" />
					                <span class="btn btn-success" onclick="complete();"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;完成</span>
					                <span class="btn btn-success" onclick="release();"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;完成并发布</span>
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
			<div id="qrcodeTable" class="qrcodeTable"></div>
		</div>
</body>
</html>
