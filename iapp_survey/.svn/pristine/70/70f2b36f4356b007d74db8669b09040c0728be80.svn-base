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
  <script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript">
  $(function(){
      $("input[type='radio']").bind("click",function(){
          if($(this).val() == 0){
              $("#times").hide();
              $("#lastApplyDate").attr("disabled","disabled");
              $("#lastApplyDate").val("");
          }else{
              $("#lastApplyDate").removeAttr("disabled");
              $("#times").show();
          }
      });
     
          var apply = $('input[name="apply"]:checked').val();
          if(apply == 0){
              $("#times").hide();
              $("#lastApplyDate").attr("disabled","disabled");
              $("#lastApplyDate").val("");
          }else{
              $("#lastApplyDate").removeAttr("disabled");
              $("#times").show();
          }
  });
 
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
                <i class="fa fa-bookmark-o"></i>&nbsp;&nbsp;<span>是否需要报名</span>
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
                <li class="step-xian${stepStatus['5'] ?'-lv':'' }" ></li>
                <li class="${stepStatus['5'] ?'over':'nor' }-step" onclick="next5('${id}');">
                    5
                </li>
                <li class="tep-right">
                     <img src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
                </li>
            </ul>
            <div class="preview-style">
                <form id="form1" >
                    <div class="form-group" id="con_apply">
                        <label>
                            <input type="radio" checked="checked" name="apply" value="1" ${apply eq 1 ? 'checked="checked"' :''}> 需要报名
                        </label></br>
                        <label>
                            <input  type="radio" name="apply" value="0" ${apply eq 0 ? 'checked="checked"' :''}> 无需要报名
                        </label>   
                    </div>
                    
                    <%-- <div class="form-group">
                        <label for="start-time">开始时间</label>
                        <input type="text" class="form-control" id="start-time"  placeholder="开始时间">
                    </div>
                    --%>
                    <div class="form-group" id="times">
                        <label for="end-time">报名截止时间</label>
                        <c:if test="${lastApplyDate eq 0}">
                        <input type="text" class="form-control" id="lastApplyDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m'})" placeholder="报名截止时间" >
                        </c:if>
                        <c:if test="${lastApplyDate ne 0}">
                        <input type="text" class="form-control" id="lastApplyDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m'})" placeholder="报名截止时间" value='<d:formatDate format="yyyy-MM-dd HH:mm" currentTime="${lastApplyDate}"/>'>
                    	</c:if >
                    </div>
                    <div class="form-group" style="text-align: right">
                        <span class="btn btn-success" onclick="next1('${id}')"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp;&nbsp;上一步</span>
                        <%--<span class="btn btn-success"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;保存</span>--%>
                        <span class="btn btn-success" onclick="updatestep2('${id}')">下一步&nbsp;&nbsp;<i class="glyphicon glyphicon-arrow-right"></i></span>
                    </div>
                </form>
               </div>
        </div>
	<!-- 弹出层显示树状结构的部门 -->

	
</body>
</html>
