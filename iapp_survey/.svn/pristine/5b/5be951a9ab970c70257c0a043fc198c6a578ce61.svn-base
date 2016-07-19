<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
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
<script type="text/javascript" src="${basepath }/static/js/course/course.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.zclip.js"></script>
<style type="text/css">
div.checker, div.checker span, div.checker input {
width: auto;height: auto;
}
</style>

<style type="text/css">
		#qrcodeTable table{margin-left:48px;}
	</style>
<script type="text/javascript">
var zdata ="${tree}";

function qrcode(url){
	$('#qrcodeTable').html("");
	jQuery('#qrcodeTable').qrcode({
		render	: "table",
		text	: url
	});	
	$("#url").html(url);
	easyDialog.open({
		  container : {
		    header : '使用微信扫描二维码',
		    content : $('#qrcodeTablebox').html()
		    //noFn : true
		  }
		});
	$(".copy-btn").zclip({
		path: "${basepath }/static/js/ZeroClipboard.swf",
		copy: function(){
			var str = $('#url').html().replace(/(&amp;)/g, '&');
			return str;
		},
		afterCopy:function(){/* 复制成功后的操作 */
			var html="<div style='width:300px;text-align:center;'>复制成功！</div>";
			easyDialog.open({
				container : {
					header : '提示',
					content : html
				},
				autoClose : 1000
			});
	    }
	});	
	$('.qrcodeTable').find("table").removeAttr("style");
}

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
						<i class="icon-reorder"></i><span>预览</span>
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
			                      <li class="step-xian-lv"></li>
			                <li class="current-step" onclick="next5('${id}');">
			                    5
			                </li>
                <li class="tep-right">
                     <img src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
                </li>
                 </ul>
                 
                   <div class="preview-style">
			                <div class="portlet-body" style="overflow: hidden;padding-bottom: 30px;">
			                	<input type="hidden" name="hid_id" id="hid_id" value=${id } >
			                	<input type="hidden" name="hid_root" id="hid_root" value="<%=Constants.STUDENT_WEB_ROOT%>" >
		                        <div class="form-group" style="text-align: center;margin-top:50px;margin-bottom: 60px;">
		                        	<img src="${basepath}/static/img/qrcode.png" onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT%>/m/study/detail/${id}.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>');" style="cursor: pointer;margin-left: 30px;">
		                        <%--	<img src="${basepath}/static/img/phone-preview.png" onclick="phonepreview();" style="cursor: pointer;margin-left: 30px;"> --%>
		                        	<img src="${basepath}/static/img/pc-preview.png" onclick="pcPrev();" style="cursor: pointer; margin-left: 30px;">
					            </div>
			                    <div class="form-group" style="text-align: right;">
					                <span class="btn btn-success" onclick="complete();"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;完成</span>
					                <span class="btn btn-success" onclick="release();"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;完成并发布</span>
					            </div>
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
		            <td style="width: 218px;height: 357px;display: block;overflow: hidden" id="courseframe">
		               
		            </td>
		            <td style="width: 20px;height: 357px;"><img src="${basepath}/static/img/iphone-right.png" style="width: 20px;height: 357px;"></td>
		        </tr>
		        <tr>
		            <td colspan="3"><img src="${basepath}/static/img/iphone-bottom.png" style="width: 264px;height: 80px;"></td>
		        </tr>
		    </table>
		</div>
		<div  id="qrcodeTablebox" style="display:none; width: 380px;">
			<div id="qrcodeTable" class="qrcodeTable" style="margin: 0px auto;"></div>
			<div id="url" style="word-break:break-all;width: 380px;"></div>
			<div class="copy-btn" style="cursor: pointer;text-align:center;color:#529bea;line-height:32px;width:150px;margin:0 auto;"> 点击复制URL</div>
		</div>
       </body>
   </html>
