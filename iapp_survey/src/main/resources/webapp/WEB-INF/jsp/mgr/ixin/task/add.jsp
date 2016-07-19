<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="com.longtime.app.config.Constants"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>新建作业</title>
<meta name="menu_path" content="ixin.menu_task" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
 <link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
 <style type="text/css">
 .form-horizontal .control-label, .form-horizontal .radio, .form-horizontal .checkbox, .form-horizontal .radio-inline, .form-horizontal .checkbox-inline{
 padding-top: 0px;}
 </style>
    <script type="text/javascript">
        //alert(zdada);
    </script>
</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">作业管理</span></li>
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
						<i class="icon-reorder"></i><span id="addinfo">新增信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						<div class="form-body">
							<!-- BEGIN FORM-->
							<form id="form_sample_2" class="form-horizontal">
								<div class="form-group" id="con_title">
									<label class="control-label col-md-3">作业名称<span
										class="required">*</span></label>
									<div class="col-md-6">
										<input type="text" name="title" id="title" data-required="1" class="form-control" value="${task.title}" />
									</div>
                                    <div class="col-md-3">
                                        <span id="tip_name" for="name" class="help-block" style="">必填</span>
                                    </div>
								</div>	
								<div class="form-group">
									<label for="" class="control-label col-md-3"> 封面
									</label>
									<div class="col-md-6 frm_input_box " style="border: 1px solid #ddd;margin-left: 15px;width:475px;">
										<div class="upload_box">
											<div class="upload_area">
												<input type="file" name="file_upload" id="file_upload" />
												<ul class="upload_file_box" style="display: none;" id="queue"></ul>
											</div>
										</div>
										<div style="display: none;margin-bottom:20px;" id="small_prev">
											<span id="image_cover"></span><a class="js_removeCover" href="javascript:void(0);"
											onclick="deleteCover();">删除</a>
										</div>
										<input type="hidden" id="fileId" value="">
										<input type="hidden" id="coverPath" value=""/>
									</div>
									<div class="col-md-3">
	                                  <span id="tip_begintime" for="begintime" class="help-block hidden" style=""></span>
	                                </div>
								
								</div>
								<div class="form-group" id="con_begintime">
									<label class="control-label col-md-3">开始时间<span class="required">*</span></label>
									<div class="col-md-6">
                                        <input type="text"  class="form-control"  id="begintime" name="begintime" value="" 
                                         onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/>
									</div>
	                                <div class="col-md-3">
	                                  <span id="tip_begintime" for="begintime" class="help-block hidden" style="">不能为空</span>
	                                </div>
								</div>
								<div class="form-group" id="con_endtime">
									<label class="control-label col-md-3">结束时间<span class="required">*</span></label>
									<div class="col-md-6">
                                        <input type="text" class="form-control"  id="endtime" name="endtime" value="" 
                                         onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'#F{$dp.$D(\'activityStartDate\')}'})"  class="form-control Wdate"/>
									</div>
	                                <div class="col-md-3">
	                                  <span id="tip_endtime" for="endtime" class="help-block hidden" style="">不能为空</span>
	                                </div>
								</div>
								<div class="form-group" id="con_address" style="padding-top: 0px;">
									<label class="control-label col-md-3">是否可再次提交作业</label>
									<div class="col-md-6">
										<input type="radio" name="informstatus" id="inform_yes" value="1" checked="checked" style="margin-left: 0px;"/>是&nbsp;&nbsp;
										<input type="radio" name="informstatus" id="inform_no" value="0" style="margin-left: 0px;"/>否
									</div>
								</div>
								<div class="form-group" id="con_address" style="padding-top: 0px;">
									<label class="control-label col-md-3">是否开放</label>
									<div class="col-md-6">
										<input type="radio" name="isopen" id="open_yes" value="1"  style="margin-left: 0px;"/>是&nbsp;&nbsp;
										<input type="radio" name="isopen" id="open_no" value="0" checked="checked" style="margin-left: 0px;"/>否
									</div>
								</div>
								<div class="form-group" id="con_taskrequire">
									<label class="control-label col-md-3">作业要求<span class="required">*</span></label>
									<div class="col-md-6">
										<textarea rows="2" cols="" name="taskrequire" id="taskrequire" class="form-control mytextarea" placeholder="120字以内">${task.taskrequire}</textarea>
									</div>
									
                                    <div class="col-md-3">
                                        <span id="tip_taskrequire" for="taskrequire" class="help-block " style=""></span>
                                    </div>
								</div>
								<div class="form-group" id="con_score">
									<label class="control-label col-md-3">通过分数<span class="required">*</span></label>
									<div class="col-md-6">
										<input type="text" name="score" id="score" data-required="1"
											class="form-control" value="${task.score}" />
									</div>
									<div class="col-md-3">
										<span id="tip_score" for="score" class="help-block " style=""></span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
									<input type="hidden" id="taskid" name="taskid" value="${task.id}">
									    <c:if test="${not empty edit}">
									     <button type="button" id="editinform" class="btn green">修改</button>
									    </c:if>
									    <c:if test="${empty edit}">
										<button type="button" id="subButton" class="btn green">提交</button>
										</c:if>
										<button type="button" class="btn default" >取消</button>
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
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script type="text/javascript">
        $(document).ready(function(){
            var edit="${edit}";
            if(edit=="edit"){
             var begintime="<d:formatDate currentTime='${task.begintime }' format='yyyy-MM-dd HH:mm'/>"
             var endtime="<d:formatDate currentTime='${task.endtime }' format='yyyy-MM-dd HH:mm'/>";
             $("#begintime").val(begintime);
             $("#endtime").val(endtime);
             var informstatus="${task.informtask}";
             if(informstatus==0){
                 $("#inform_no").attr("checked","checked");
                 }else{
                     $("#inform_yes").attr("checked","checked");
                 }
			 var isopened = "${task.isopen}";
			 if(isopened==0){
				 $("#open_no").attr("checked","checked");
				 }else{
					 $("#open_yes").attr("checked","checked");
					 }
             $("title").html("修改作业");
             $("#addinfo").html("修改信息");
            }

            
            //上传封面
            $('#file_upload').uploadify({
				'formData'     : {
				'token'     : token,
				},
				'fileObjName'  : 'file',
				'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
				'buttonClass' : 'upload_access',
				'swf'      : basepath+'/static/ixin/css/uploadify.swf',
				//'uploader' : 'http://up.qiniu.com/',
				'uploader' : uploadurl,
				'onUploadSuccess' : function(file,data,response){
					var result = eval("("+data+")");
					$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
					$("#small_prev").show();
				    //文件长传完成之后，在本地保存一份文件信息的数据
					$('#coverPath').val(result.hash);
					saveFile(file,result);
				}
			});
            //提交信息
              $("#subButton").click(function(){
                  var title=$.trim($("#title").val());
                  var begintime=$("#begintime").val();
                  var endtime=$("#endtime").val();
                  var informstatus=$("input[name='informstatus']:checked").val();
                  var isopen = $("input[name='isopen']:checked").val();
                  var taskrequire=$("#taskrequire").val();
                  var score=$.trim($("#score").val());
                  var coverPath = $("#coverPath").val();
                  if(begintime==null || begintime==""){
                	  addError("begintime");  
                	  $("#tip_begintime").attr("class","help-block");
                	  return; 
                      }
                  if(endtime==null || endtime==""){
                      addError("endtime");
                      $("#tip_endtime").attr("class","help-block");
                      return;
                      }
                  if(begintime>=endtime){
                      alert("结束时间要大于开始时间");
                      addError("begintime");
                      return;
                      }
                  if(title==null || title==""){
                      addError("title");
                      $("#tip_name").html("作业名称不能为空");
                      return;
                      }
                  if(taskrequire==null || taskrequire==""){
                      addError("taskrequire");
                      $("#tip_taskrequire").html("作业要求不能为空");
                      return;
                  } 
                  if(taskrequire.length >120) {
                	  addError("taskrequire");
                      $("#tip_taskrequire").html("作业要求不超过120字");
                      return;
                  }
                  var isnumber=zeroFloatCheck(score);
                  if(!isnumber){
                	  addError("score");
                      $("#tip_score").html("通过分数不能为空且必须为至多保留一位小数的正数");
                      return;
                      }
                  
                  
                  var params="title="+title+"&begintime="+begintime+"&endtime="+endtime+"&informstatus="+informstatus+"&taskrequire="+taskrequire+"&score="+score+"&coverPath="+coverPath+"&isopen="+isopen;

  					
                  $.ajax({
                	   type:"POST",
                	   url: "${basepath}/mgr/task/addtask.json",
                	   data: params,
                	   success: function(msg){
                    	   if(msg){
                        	   window.location.href="${basepath}/mgr/task/taskindex.xhtml";
                        	   }else{
                                    alert("信息添加失败!");
                            	   }
                	   }
                	});
                  });
              $("#editinform").click(function(){
                  var taskid=$("#taskid").val();
            	  var title=$.trim($("#title").val());
                  var begintime=$("#begintime").val();
                  var endtime=$("#endtime").val();
                  var informstatus=$("input[name='informstatus']:checked").val();
                  var isopen = $("input[name='isopen']:checked").val();
                  var taskrequire=$("#taskrequire").val();
                  var score=$.trim($("#score").val());
                  var coverPath = $("#coverPath").val();

                  if(begintime==null || begintime==""){
                	  addError("begintime");  
                	  $("#tip_begintime").show();
                	  return; 
                      }
                  if(endtime==null || endtime==""){
                      addErrot("endtime");
                      $("#tip_endtime").show();
                      return;
                      }
                  if(begintime>endtime){
                      alert("开始时间不能大于结束时间");
                      addError("begintime");
                      return;
                      }
                  if(title==null || title==""){
                      addError("title");
                      $("#tip_name").html("作业名称不能为空");
                      return;
                      }
                  if(taskrequire==null || taskrequire==""){
                      addError("taskrequire");
                      $("#tip_taskrequire").html("作业要求不能为空");
                      return;
                  }
                  if(taskrequire.length >120) {
                	  addError("taskrequire");
                      $("#tip_taskrequire").html("作业要求不超过120字");
                      return;
                  }
                  var isnumber=zeroFloatCheck(score);
                  if(!isnumber){
                	  addError("score");
                      $("#tip_score").html("通过分数不能为空且必须为至多保留一位小数的正数");
                      return;
                      }
                  
                  var params="title="+title+"&begintime="+begintime+"&endtime="+endtime+"&informstatus="+informstatus+"&taskrequire="+taskrequire+"&score="+score+"&taskid="+taskid+"&coverPath="+coverPath+"&isopen="+isopen;
                  $.ajax({
                	   type:"POST",
                	   url: "${basepath}/mgr/task/edittask.json",
                	   data: params,
                	   success: function(msg){
                    	   if(msg){
                        	   window.location.href="${basepath}/mgr/task/taskindex.xhtml";
                        	   }else{
                                    alert("信息修改失败!");
                            	   }
                	   }
                	});
                  });

              $(".default").click(function(){
                  window.location.href="${basepath}/mgr/task/taskindex.xhtml";
                  });
            });
		/** 添加错误信息 */
		function addError(id){
			$("#con_"+id).addClass("has-error").focus();
		}
		function removeError(id){
			$("#con_"+id).removeClass("has-error");
		}

		function deleteCover(){
			$.ajax({
				type: "GET",
				url:  basepath+"/mgr/fodder/delsourcefile.xhtml?fileId="+$('#fileId').val(),
				contentType: "application/json; charset=utf-8",
				success:function(data){
					$("#small_prev").hide();
					$('#fileId').val("");
					$('#coverPath').val("");
				},
				error: function(data){
					alert("删除失败");
				}
			});
		}

		function saveFile(file,result){
			var requestBody = new Object();
			requestBody.size = result.size;
			requestBody.mimeType = result.mimeType;
			requestBody.filePath = result.url;
			//requestBody.name = result.name;
			//console.debug(JSON.stringify(requestBody));
			
			$.ajax({
				type: "POST",
				url:  basepath+"/mgr/fodder/savesourcefile.xhtml",
				data: JSON.stringify(requestBody),
				contentType: "application/json; charset=utf-8",
				success:function(data){
					$('#fileId').val(data);
				},
				error: function(data){
					alert('保存失败');
				}
			});
			
		}
	</script>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
<script src='${basepath }/static/public/javascripts/easydialog-static-params.js' type='text/javascript' ></script> 
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script> 
</content>
<content tag="pageInit">
<script type="text/javascript">


function zeroFloatCheck(value){
	
	var value = $.trim(value);
	var reg = /^\d+\.\d$/;
	if(reg.test(value) && value != 0.0){
		return true;
	}
	return false;
	
}


var basepath = "${basepath}";
var token = "${result.uploadToken}";
//var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var qiniuImageBasePath = "<%=Constants.IMG_SERVER_DOWNLOAD%>";
var coverSuffix = "${result.coverSuffix}";
<c:if test="${ not empty task.coverPath}">
$('#coverPath').val("${task.coverPath}");
$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${task.coverPath}"+coverSuffix+"'>");
$("#small_prev").show();	
</c:if>
</script>
</content>	
