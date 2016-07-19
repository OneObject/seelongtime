<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"   %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>作业批改</title>
<meta name="menu_path" content="ixin.menu_task" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">作业批改</span></li>
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
						<i class="icon-reorder"></i><span>作业信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						<div class="form-body">
							<!-- BEGIN FORM-->
							<form id="form_sample_2" class="form-horizontal">
							    <div class="form-group" id="con_name">
									<label class="control-label col-md-3">提交人<span
										class="required"></span></label>
									<div class="col-md-6">
										<input type="text" name="name" id="name" data-required="1" class="form-control" value="${taskuservo.name}" disabled="disabled" />
									</div>
								</div>	
								<div class="form-group" id="con_title">
									<label class="control-label col-md-3">作业名称<span
										class="required"></span></label>
									<div class="col-md-6">
										<input type="text" name="title" id="title" data-required="1" class="form-control" value="${taskuservo.taskUser.taskname }" disabled="disabled" />
									</div>
								</div>	
								<div class="form-group" id="con_taskinfo">
									<label class="control-label col-md-3">作业信息<span
										class="required"></span></label>
									<div class="col-md-6">
										<textarea rows="2" cols="" name="taskinfo" id="taskinfo" class="form-control mytextarea" disabled="disabled" >${taskuservo.taskUser.content}</textarea>
									</div>
									
                                    <div class="col-md-3">
                                        <span id="tip_taskinfo" for="taskinfo" class="help-block " style=""></span>
                                    </div>
								</div>
								
								<div class="form-group" id="con_taskinfo">
									<label class="control-label col-md-3">附件列表
									<span class="required"></span></label>
									
									<div class="col-md-6">
										<c:if test="${taskuservo.taskUser.attachment eq 0 }">
										无附件
										</c:if>
										<c:if test="${taskuservo.taskUser.attachment eq 1 }">
										<c:forEach var="t" items="${attachmentVos}" >
										 <div><a href="<%=Constants.IMG_SERVER_DOWNLOAD%>/${t.url}?download/${t.name}" target="_blank">${t.name}</a></div>
										</c:forEach>
										</c:if>
									</div>
								</div>
								<div class="form-group" id="con_taskcomment">
									<label class="control-label col-md-3">评语<span
										class="required"></span></label>
									<div class="col-md-6">
										<textarea rows="2" cols="" name="taskcomment" id="taskcomment" class="form-control mytextarea"  >${taskuservo.taskUser.comment }</textarea>
									</div>
									
                                    <div class="col-md-3">
                                        <span id="tip_taskcomment" for="taskcomment" class="help-block " style=""></span>
                                    </div>
								</div>
								<div class="form-group" id="con_score">
									<label class="control-label col-md-3">得分<span class="required"></span></label>
									<div class="col-md-6">
										<input type="text" name="score" id="score" data-required="1"
											class="form-control" value="${taskuservo.taskUser.score }" />
									</div>
									<div class="col-md-3">
										<span id="tip_score" for="score" class="help-block " style="">通过分数：${taskuservo.passscore}</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
									    <input type="hidden" id="hid_id" name="hid_id" value="${taskuservo.taskUser.id}">
									    <input type="hidden" id="hid_taskid" name="hid_taskid" value="${taskuservo.taskUser.taskid }">
										<button type="button" id="subButton" class="btn green">提交</button>
									</div>
								</div>

							</form>
							<!-- END FORM-->
						</div>
					</div>
					
			</div>
		</div>

	</div>
	<!-- 弹出层显示树状结构的部门 -->
</body>
</html>
<content tag="pageCore">
<script type="text/javascript">
      $(document).ready(function(){
    	  $("#subButton").click(function(){
        	  var comment=$.trim($("#taskcomment").val());
        	  var score=$.trim($("#score").val());
        	  var taskuserid=$("#hid_id").val();
        	  var taskid=$("#hid_taskid").val();
              if(comment=="" || comment==null){
                  addError("comment");
                  $("#tip_comment").html("评语不能为空");
                  return;
                  }
              var isnumber=zeroFloatCheck(score);
              if(!isnumber){
            	  addError("score");
                  $("#tip_score").html("通过分数不能为空且必须为数字");
                  return;
                  }
              $.ajax({
           	   type:"POST",
           	   url: "${basepath}/mgr/task/pigai.json",
           	   data: "comment="+comment+"&score="+score+"&taskuserid="+taskuserid+"&taskid="+taskid,
           	   success: function(msg){
               	   if(msg.isok=="true"){
                   	   window.location.href="${basepath}/mgr/task/viewhomework.xhtml?id="+msg.taskid+"&status=1"
                   	   }else if(msg.isok=="false"){
                               alert("提交失败!");
                       	   }
           	   }
           	});
              
          });
          });
      /** 添加错误信息 */
		function addError(id){
			$("#con_"+id).addClass("has-error").focus();
		}
	</script>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
<script src='${basepath }/static/public/javascripts/easydialog-static-params.js' type='text/javascript' ></script> 
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script> 
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
</content>	
