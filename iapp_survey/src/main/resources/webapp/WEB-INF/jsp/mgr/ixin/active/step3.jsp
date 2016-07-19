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
<link rel="stylesheet" type="text/css" href="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css">
<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script src="${basepath}/static/js/activity/active.js"></script>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js" ></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
  <script type="text/javascript">
/*   $(function(){
      $("input[type='radio']").bind("click",function(){
          if($(this).val() == "no"){
              $("input[class='form-control']").attr("disabled","disabled");
          }else{
              $("input[class='form-control']").removeAttr("disabled");
          }
      });
  }) */
  var activityId="${activityInfo.id}";
  var domain="${activityInfo.domain}";
	
	function createCode(){
		var url="${basepath}/mgr/activity/createcode.list?activityId="+activityId;
		window.open(url,'_blank');
		}

  $(function(){
	  $("#myswitch").bootstrapSwitch({
			onText:"是",
			offText:"否"
			});
	 $("#myswitch").on('switchChange.bootstrapSwitch', function(event, state) {
			if(state.value){
				$(this).val('1');
			} else {
				$(this).val('0');
			}
		});
	
      $("input[type='radio']").bind("click",function(){
          if($(this).val() == 0){
              $("#con_signinCode").hide();
              $("#con_startSignLocation").hide();
              $("#createcode").hide();
              $("#signinCode").attr("disabled","disabled");
              $("#signinCode").val("");
          }else{
              $("#signinCode").removeAttr("disabled");
              $("#con_signinCode").show();
              $("#con_startSignLocation").show();
              $("#createcode").show();
          }
      });
     
          var signin = $('input[name="signin"]:checked').val();
          if(signin == 0){
              $("#con_signinCode").hide();
              $("#con_startSignLocation").hide();
              $("#createcode").hide();
              $("#signinCode").attr("disabled","disabled");
              $("#signinCode").val("");
          }else{
              $("#signinCode").removeAttr("disabled");
              $("#con_signinCode").show();
              $("#createcode").show();
              $("#con_startSignLocation").show();
          }
  });
 
  function addonce(){
      var num =$("form").find(".once").lenght;//统计总共有几次签到
      var html=[];
      html.push('<div class="once">');
      html.push('<div class="form-group">');
      html.push('<label class="sr-only" for="start-time-"'+(num+1)+'>开始时间</label>');
      html.push('<input type="text" class="form-control" id="start-time-"'+(num+1)+' placeholder="开始时间">');
      html.push('</div>');
      html.push('<div class="form-group" style="margin-left: 20px;">');
      html.push('<label class="sr-only" for="end-time-"'+(num+1)+'>结束时间</label>');
      html.push('<input type="text" class="form-control" id="end-time-"'+(num+1)+' placeholder="结束时间">');
      html.push('</div>');
      html.push('<div class="form-group" style="margin-left: 20px;">');
      html.push('<span class="btn btn-danger" onclick="removeonce(this)"><i class="glyphicon glyphicon-remove"></i></span>');
      html.push('</div>');
      html.push('</div>');
      $("form").append(html.join(""));
  }
  function removeonce(o){
      $(o).parents(".once").remove();
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
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box green" style="min-width:770px">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bookmark-o"></i><span>是否需要签到</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
				<ul class="stemp-box">
                <li class="tep-left">
                    <img src="${basepath}/static/img/step-left.png">
                </li>
                <li class="${stepStatus['1'] ?'over':'nor' }-step" onclick="next1('${id}')">
                    1
                </li>
                <li class="step-xian${stepStatus['2'] ?'-lv':'' }" ></li>
                <li class="over-step" onclick="next2('${id}')">
                    2
                </li>
                <li class="step-xian-lv"></li>
                <li class="current-step" onclick="next3('${id}');">
                    3
                </li>
                <li class="step-xian${stepStatus['4'] ?'-lv':'' }" ></li>
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
                <form id="form1" >
                
                <div class="form-group" id="con_signin">
                        <label>
                            <input type="radio" checked="checked" name="signin" value="1" ${signin eq 1?'checked="checked"':''}> 需要签到
                        </label></br>
                        <label>
                            <input  type="radio" name="signin" value="0" ${signin eq 0?'checked="checked"':''}> 无需签到
                        </label>   
                        <a href="#" style="margin-left:70%;" id="createcode" onclick="createCode();">生成签到二维码 </a>
                </div>
                <div class="form-group" id="con_signinCode">
                    <div class="form-group">
                        <label class="control-label ">签到码<span class="required">*</span></label>
						<input type="text" class="form-control" id="signinCode"  value="${signinCode}" placeholder="签到码">
                    </div>
                    <div class="">
					<span id="tip_signinCode" for="signinCode" class="help-block " style="">签到码必须为4位数字且首个数字不能为0</span>
					</div>
                </div>
               <div class="form-group" id="con_startSignLocation" >
                     <label class="active-synopsis" >是否开启位置限制</label>
                     <c:if test="${activityInfo.startSignLocation eq 0 }">	
                     <div class="switch " >
                     <input type="checkbox"  id="myswitch" value="0" <c:if test='${empty activityInfo.coordinate}'> disabled="disabled" </c:if> />
                     </div>
                     </c:if>
                     
                     <c:if test="${activityInfo.startSignLocation eq 1 }">
                      <div class="switch " >
                     <input type="checkbox" checked  id="myswitch" value="1" <c:if test='${empty activityInfo.coordinate}'> disabled="disabled" </c:if>  />
                     </div>
                     </c:if>
                     
                     <c:if test="${empty activityInfo.startSignLocation}">
                       <div class="switch " >
                     <input type="checkbox"   id="myswitch" value="0" <c:if test='${empty activityInfo.coordinate}'> disabled="disabled" </c:if>  />
                     </div>
                     </c:if>
				    </div>
                
                 <div class="form-group" style="text-align: right;margin-top: 10px;">
                    <span class="btn btn-success" onclick="next2('${id}')"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp;&nbsp;上一步</span>
                    <%-- <span class="btn btn-success"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;保存</span>--%>
                    <span class="btn btn-success" onclick="updatestep3('${id}')">下一步&nbsp;&nbsp;<i class="glyphicon glyphicon-arrow-right"></i></span>
                 </div>
                <%--
                    <div class="once">
                        <div class="form-group">
                            <label class="sr-only" for="start-time-1">开始时间</label>
                            <input type="text" class="form-control" id="start-time-1" placeholder="开始时间">
                        </div>
                        <%-- <div class="form-group" style="margin-left: 17px;">
                            <label class="sr-only" for="end-time-1">结束时间</label>
                            <input type="text" class="form-control" id="end-time-1" placeholder="结束时间">
                        </div>
                        <div class="form-group" style="margin-left: 16px;">
                            <span class="btn btn-danger" onclick="removeonce(this)"><i class="glyphicon glyphicon-remove"></i></span>
                        </div>
                    </div>
                    --%>
                   
                </form>
                <%--
                <div class="form-group" style="margin-top: 20px;">
                    <span class="btn btn-info" onclick="addonce()"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加一次签到</span>
                </div>
                --%>
                
            </div>
					</div>
					
			</div>
		</div>

	</div>
	<!-- 弹出层显示树状结构的部门 -->
      <div  id="qrcodeTablebox" style="display:none; ">
			<div id="qrcodeTable" class="qrcodeTable"></div>
		</div>
	
</body>
</html>
