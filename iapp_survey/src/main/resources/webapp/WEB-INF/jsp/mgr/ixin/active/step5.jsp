<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>编辑活动</title>
<meta name="menu_path" content="active.menu_activity" />
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
  <link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
  <link rel="stylesheet" href="${basepath}/static/css/active.css">
  <script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
  <script src="${basepath}/static/js/activity/active.js"></script>
  <script type="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
  <script type="text/javascript">
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
</script>
</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">活动管理</span></li>
				</ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
			 <div class="main-box-title">
            <div class="caption">
                <i class="fa fa-bookmark-o"></i>&nbsp;&nbsp;<span>选择模板</span>
            </div>
        </div>
        <div class="main-box-body">
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
                <form id="form1" >
                    <div class="form-group" id="con_module">
                        <label style="text-align: center;">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" checked="checked" name="module" value="1" ${module eq 1 ? 'checked="checked"' :''}>系列模板<br>
                            <img src="${basepath}/static/ixin/img/seriesstyle.png" style="width:180px;height:240px;margin-top:10px;border:1px solid gray;"></img><br>
                            <span class="btn btn-success"  style="margin-top: 10px;"  onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT%>m/ixin/activity/seriesactivity.xhtml?fdomain=${activityInfo.domain}&id=${id}')">&nbsp;&nbsp;生成二维码</span>
                        </label>
                        &nbsp;&nbsp;&nbsp;
                        <label style="text-align: center;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input  type="radio" name="module" value="0" ${module eq 0 ? 'checked="checked"' :''}> 时间轴模板<br>
                            <img src="${basepath}/static/ixin/img/timestyle.png" style="width:180px;height:240px;margin-top:10px;border:1px solid gray;"></img><br>
                            <span class="btn btn-success"  style="margin-top: 10px;" onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT%>m/ixin/activity/timeactivity.xhtml?fdomain=${activityInfo.domain}&id=${id}')" >&nbsp;&nbsp;生成二维码</span>
                        </label>  
                        &nbsp;&nbsp;&nbsp; 
                        <label style="text-align: center;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input  type="radio" name="module" value="2" ${module eq 2 ? 'checked="checked"' :''}> 格子模板<br>
                            <img src="${basepath}/static/ixin/img/stemp.png" style="width:180px;height:240px;margin-top:10px;border:1px solid gray;"></img><br>
                            <span class="btn btn-success"  style="margin-top: 10px;" onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT%>m/ixin/activity/stempactivity.xhtml?fdomain=${activityInfo.domain}&id=${id}')" >&nbsp;&nbsp;生成二维码</span>
                        </label>   
                    </div>
                    <div class="form-group" style="text-align: right">
                        <span class="btn btn-success" onclick="next4('${id}')"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp;&nbsp;上一步</span>
                        <span class="btn btn-success" onclick="update5('${id}')"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;保存</span>
                    </div>
                    
                </form>
               </div>
               
        </div>
	<!-- 弹出层显示树状结构的部门 -->
         <div  id="qrcodeTablebox" style="display:none; ">
			<div id="qrcodeTable" class="qrcodeTable"></div>
		</div>
	
</body>
</html>
