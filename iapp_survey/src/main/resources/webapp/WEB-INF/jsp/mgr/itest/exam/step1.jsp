<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title><c:if test="${isAddOrUpdate eq 'add' }">新建考试</c:if><c:if test="${isAddOrUpdate eq 'update' }">修改考试</c:if></title>
<meta name="menu_path" content="test.testManage" />
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
  	<link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
  	<link rel="stylesheet" href="${basepath}/static/css/active.css">
  	<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
 	<script src="${basepath}/static/itest/admin/exam.js"></script>
  	<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
  	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
  	<link href="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css" rel="stylesheet">
	<script src="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js"></script>
	<style type="text/css">
		div.checker, div.checker span, div.checker input {
			width: auto;height: auto;
		}
	</style>
  	<script type="text/javascript">
		function resizeheightforedite(o){
		    $(".edite-img").height($(o).height());
		    $(".edite-img").attr("style","margin-top:-"+$(o).height()+"px;height:"+$(o).height()+"px;line-height:"+$(o).height()+"px;");
		}
		function showother(){
		    $(".othermsg").slideToggle("fast");
		    $(".moremsg").slideToggle("fast");
		    $(".moremsg-up").slideToggle("fast");
		}	
		
		$(function(){
			$("#isShowScore").bootstrapSwitch({
				onText:"是",
				offText:"否",
				onColor: "success",
		        offColor: "default"
			});
			
			$("#isShowScore").on('switchChange.bootstrapSwitch', function(event, state) {
				if(state.value){
					$("input[name='isShowScore']").val('1');
				} else {
					$("input[name='isShowScore']").val('0');
				}
			});
			$("#isShowScore").bootstrapSwitch({
				onText:"是",
				offText:"否",
				onColor: "success",
		        offColor: "default"
			});
			
			$("#isShowScore").on('switchChange.bootstrapSwitch', function(event, state) {
				if(state.value){
					$("input[name='isShowScore']").val('1');
				} else {
					$("input[name='isShowScore']").val('0');
				}
			});
			$("#isAgain").bootstrapSwitch({
				onText:"是",
				offText:"否",
				onColor: "success",
		        offColor: "default"
			});
			
			$("#isAgain").on('switchChange.bootstrapSwitch', function(event, state) {
				if(state.value){
					$("input[name='isAgain']").val('1');
				} else {
					$("input[name='isAgain']").val('0');
				}
			});
			
			$("#isShowAnswer").bootstrapSwitch({
				onText:"是",
				offText:"否",
				onColor: "success",
		        offColor: "default"
			});
			
			$("#isShowAnswer").on('switchChange.bootstrapSwitch', function(event, state) {
				if(state.value){
					$("input[name='isShowAnswer']").val('1');
					$("#con_isAgain").show();
				} else {
					$("input[name='isShowAnswer']").val('0');
					$("#con_isAgain").hide();
				}
			});
		});
	</script>
</head>
<body>
	  <!-- 创建考试基本信息 -->
       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }/base/admin/itest/examination/examination.xhtml">考试管理</a><i class="icon-angle-right"></i></li>
				<li><span href="#"><c:if test="${isAddOrUpdate eq 'add' }">新建考试</c:if><c:if test="${isAddOrUpdate eq 'update' }">修改考试</c:if></span></li>
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
						<i class="fa fa-bookmark-o"></i><span>基本信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
					      <ul class="stemp-box" style="width: 590px;">
			                <li class="tep-left">
			                    <img src="${basepath}/static/img/step-left.png">
			                </li>
			                <li class="current-step" onclick="next1('${tid}','${isAddOrUpdate }');">
			                    1
			                </li>
			                <li class="step-xian${stepStatus['2'] ?'-lv':'' }"></li>
			                <li class="${stepStatus['2'] ?'over':'nor' }-step" onclick="next2('${tid}','${isAddOrUpdate }');">
			                    2
			                </li>
			                <li class="step-xian${stepStatus['3'] ?'-lv':'' }"></li>
			                <li class="${stepStatus['3'] ?'over':'nor' }-step" onclick="next3('${tid}','${isAddOrUpdate }');">
			                    3
			                </li>
			                <li class="step-xian${stepStatus['4'] ?'-lv':'' }"></li>
			                <li class="${stepStatus['4'] ?'over':'nor' }-step" onclick="next4('${tid}','${isAddOrUpdate }');">
			                    4
			                </li>
			                <li class="tep-right">
			                    <img src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
			                </li>
			            </ul>
			            <div class="preview-style">
			                <div class="portlet-body form" style="overflow: hidden;">
								<form id="addForm" method="post" class="form-horizontal" role="form" action="${basepath }/mgr/itest/exam/doadd.xhtml">
									<div class="form-body">
										<div class="form-group" id="con_examName">
											<label class="col-md-2 control-label">考试名称<span class="required">*</span></label>
											<div class="col-md-10">
												<input type="text" class="form-control" name="examName" id="examName" value="${exam.examName }" placeholder="不能为空" onchange="validateExamName()">
											</div>
										</div>
										<div class="form-group" id="con_time">
											<label class="col-md-2 control-label">考试时间<span class="required">*</span></label>
											<div class="col-md-10">
												<div class="col-md-5">
													<input type="text" id="startTime" name="startTime" value="${nowtime }" 
													 onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', maxDate:'#F{$dp.$D(\'endTime\')}'})" class="form-control Wdate"/>
												</div>
												<div class="col-md-1">
													<span class="time_zhi">至</span>
												</div>
												<div class="col-md-5">
													<input type="text" id="endTime" name="endTime" value="${nexttime }" 
													 onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'#F{$dp.$D(\'startTime\')}'})" class="form-control Wdate"/>
												</div>
											</div>
										</div>
						                <div class="form-group" id="con_examDate">
						                     <label class="col-md-2 control-label">考试时长</label>
						                     <div class="col-md-10">
						                         <input type="text" class="form-control" name="examDate" value="${exam.examDate }" id="examDate" placeholder="60" onchange="validateexamDate()">
						                         <span style="color:gray;font-size:10px;">正整数，单位分钟</span>
						                     </div>
						                </div>
						                 <div class="form-group">
											   <label class="col-sm-2 control-label" >考试图片：</label>
											   <div class="col-sm-10">
											   <c:if test="${not empty exam.cover }">
											     <img src="<%=Constants.IMG_SERVER_DOWNLOAD%>${exam.cover}-320x180" id="exam-poster" class="img-responsive" style="width:320px;height:180px;"  >
											   </c:if>
											   <c:if test="${empty exam.cover}">
											     <img src="" id="exam-poster" class="img-responsive" style="width:320px;height:180px;display:none;"  >
											   </c:if>
											    <input id="file_upload" class="form-control" name="file_upload"  type="file" >
											    <input type="hidden" id="cover" name="cover" value="">
											    <input id="path" type="hidden" name="path" value="<%=Constants.IMG_SERVER_DOWNLOAD%>">
											    </div>
										 </div>
						                <div class="form-group" id="con_totalScore">
						                     <label class="col-md-2 control-label">总分数</label>
						                     <div class="col-md-10">
						                         <input type="text" class="form-control" name="totalScore" value="${testPager.total_score }" id="totalScore" placeholder="100" onchange="validateTotalScore">
						                     </div>
						                 </div>
						                 <div class="form-group" id="con_passScore">
						                     <label class="col-md-2 control-label">通过分数</label>
						                     <div class="col-md-10">
						                         <input type="text" class="form-control" name="passScore" value="${testPager.pass_mark }" id="passScore" placeholder="60" onchange="validatePassScore">
						                         <span style="color:gray;font-size:10px;">不能大于总分</span>
						                     </div>
						                 </div>
						                 <div class="form-group" id="con_examTimes">
						                     <label class="col-md-2 control-label">考试次数</label>
						                     <div class="col-md-10">
						                         <input type="text" class="form-control" name="examTimes" value="${exam.examTimes }" onchange="validateexamTimes()" id="examTimes" placeholder="0">
						                         <span style="color:gray;font-size:10px;">0 表示不限次数</span>
						                     </div>
						                 </div>
						                 <div class="form-group" id="con_isShowScore">
											<label class="col-md-2 control-label">立即显示分数</label>
											<div class="col-md-10">
										        <div class="switch " >
							                     	<input type="checkbox"  ${(empty exam || exam.isShowScore == true) ? 'checked' : '' } id="isShowScore" />
							                     </div>
											</div>
										 </div>
						                 <div class="form-group" id="con_isShowAnswer">
											<label class="col-md-2 control-label">允许查看答案</label>
											<div class="col-md-10">
										        <div class="switch " >
							                     	<input type="checkbox"  ${(exam.isShowAnswer == true) ? 'checked' : '' } id="isShowAnswer" />
							                     	<input type="hidden"  name="isShowAnswer" value="${exam.isShowAnswer == true? '1':'0'}"/>
							                     	<span  style="display:block;color:gray;font-size:10px;">仅PC端考试有效</span>
							                     </div>
											</div>
										 </div>
						                 <div class="form-group" id="con_isAgain" style="display: ${exam.isShowAnswer == true?'block':'none'}">
											<label class="col-md-2 control-label">允许再次参加</label>
											<div class="col-md-10">
										        <div class="switch " >
							                     	<input type="checkbox"  ${(exam.isAgain == true) ? 'checked' : '' } id="isAgain" />
							                     	<input type="hidden"  name="isAgain" value="${exam.isAgain == true? '1':'0'}"/>
							                     	<span  style="display:block;color:gray;font-size:10px;">该选项在允许查看试卷答案后才有效(仅PC端考试有效)</span>
							                     </div>
											</div>
										 </div>
										 <div class="form-group" id="con_keyword">
						                     <label class="col-md-2 control-label">关键字</label>
						                     <div class="col-md-10">
						                     	<input type="hidden" id="old_keyword" value="${exam.keyword }">
						                         <input type="text" class="form-control" name="keyword" value="${exam.keyword }" id="keyword" placeholder="可通过关键字以消息形式获取该考试">
						                         <span id="tip_keyword" for="keyword" class="help-block " style=""></span>
						                     </div>
						                 </div>
										 <div class="form-group">
					                        <label class="col-md-2 control-label">考试简介</label>
					                        <div class="col-md-10">
					                        <input type="hidden" id="hid_content" name="hid_content" value="">
					                        <textarea name="content" id="exam-content"  style="border: #f8f8f8;background-color: #f8f8f8;">${exam.content}</textarea>
					                        </div>
						                  </div>
										  <div class="form-group" style="text-align: right">
										  	   <input type="hidden" name="id" value="${exam.id }"/>
										  	   <input type="hidden" name="pid" value="${testPager.id }"/>
										  	   <input type="hidden" name="isAddOrUpdate" value="${isAddOrUpdate }" />
										  	   <input type="hidden" name="isShowScore"  value="${empty exam ? '1' : (exam.isShowScore ? '1' : '0') }">
							                   <span class="btn btn-success" onclick="add();"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;下一步</span>
							              </div>
									</div>
								</form>
							</div>
			            </div>
					</div>
				</div>
			</div>
		</div>
	<!-- 弹出层显示树状结构的部门 -->
	<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
	  <script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
  <script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.all.min.js"></script>
	<script type="text/javascript">
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
			$("#exam-poster").attr("src",path+"-320x180");
			$("#exam-poster").show();
			$("#cover").val(result.hash);
		}
	});
	var editor = UE.getEditor('exam-content');
	</script>
</body>
</html>
