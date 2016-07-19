<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>新建活动</title>
<meta name="menu_path" content="active.menu_activity" />
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">

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
				<li><span href="#">活动管理</span></li>
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
						<i class="icon-reorder"></i><span>新增信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						<div class="form-body">
							<!-- BEGIN FORM-->
							<form id="form_sample_2" class="form-horizontal" method="post" action="${basepath }/mgr/activity/saveactivity.xhtml" >
								<div class="form-group" id="con_name">
									<label class="control-label col-md-3">活动名称<span
										class="required">*</span></label>
									<div class="col-md-6">
										<input type="text" name="name" id="name" data-required="1" class="form-control" value="" />
									</div>
                                    <div class="col-md-3">
                                        <span id="tip_name" for="name" class="help-block" style="">必填</span>
                                    </div>
								</div>

								<div class="form-group" id="con_sponsor">
									<label class="control-label col-md-3">主办方<span class="required">*</span></label>
									<div class="col-md-6">
										<input type="text" name="sponsor" id="sponsor" data-required="1" 
											class="form-control" value="" />
									</div>
									<div class="col-md-3">
										<span id="tip_sponsor" for="sponsor" class="help-block " style="">不能为空</span>
									</div>
								</div>
								<div class="form-group" id="con_address">
									<label class="control-label col-md-3">活动地点<span class="required">*</span></label>
									<div class="col-md-6">
										<input type="text" name="address" id="address" data-required="1"
											class="form-control" value="" />
									</div>
									<div class="col-md-3">
										<span id="tip_address" for="address" class="help-block " style="">不能为空</span>
									</div>
								</div>
								<div class="form-group" id="con_activityStartDate">
									<label class="control-label col-md-3">活动开始时间<span class="required">*</span></label>
									<div class="col-md-6">
                                        <input type="text"  class="form-control"  id="activityStartDate" name="activityStartDate" value="${nowtime }" 
                                         onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/>
									</div>
	                                <div class="col-md-3">
	                                  <span id="tip_activityStartDate" for="activityStartDate" class="help-block hidden" style="">不能为空</span>
	                                </div>
								</div>
								<div class="form-group" id="con_activityEndDate">
									<label class="control-label col-md-3">活动结束时间<span class="required">*</span></label>
									<div class="col-md-6">
                                        <input type="text" class="form-control"  id="activityEndDate" name="activityEndDate" value="${nowtime }" 
                                         onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'#F{$dp.$D(\'activityStartDate\')}'})"  class="form-control Wdate"/>
									</div>
	                                <div class="col-md-3">
	                                  <span id="tip_activityEndDate" for="activityEndDate" class="help-block hidden" style="">不能为空</span>
	                                </div>
								</div>
								<div class="form-group" id="con_lastApplyDate">
									<label class="control-label col-md-3">报名截止时间</label>
									<div class="col-md-6">
                                        <input type="text" id="lastApplyDate" class="form-control"  name="lastApplyDate" value="${nowtime }" 
                                         onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m',maxDate:'#F{$dp.$D(\'activityStartDate\')}'})" class="form-control Wdate"/>
									</div>
	                                <div class="col-md-3">
	                                  <span id="tip_lastApplyDate" for="lastApplyDate" class="help-block hidden" style="">不能为空</span>
	                                </div>
								</div>
								<div class="form-group" id="con_activityImage">
									<label class="control-label col-md-3">活动图片<span class="required">*</span></label>
									<input type="hidden" name="activityImage" value="" id="activityImage"/>
									<div class="col-md-6">
				                        <div class="tab-content">
				                           <div class="tab-pane active" id="portlet_tab1">
												<input id="file_upload" name="file_upload" class="form-control"  type="file" multiple="true">
												<div id="showImage"></div>
												<span id="image_name" style="color:red;"></span>
				                          	<div id="queue"></div>
				                           </div>
				                        </div>
									</div>
                                    <div class="col-md-3">
                                        <span id="tip_activityImage" for="activityImage" class="help-block hidden" style="">请上传图片！</span>
                                    </div>
								</div>
								<div class="form-group" id="con_address">
									<label class="control-label col-md-3">是否需要报名</label>
									<div class="col-md-6">
										<input type="radio" name="apply"  value="1" checked="checked" />是&nbsp;&nbsp;
										<input type="radio" name="apply"  value="0" />否
									</div>
								</div>
								<div class="form-group" id="con_descript">
									<label class="control-label col-md-3">活动简介</label>
									<div class="col-md-6">
										<textarea rows="2" cols="" name="descript" id="descript" class="form-control mytextarea" onchange="v_descript();"></textarea>
									</div>
                                    <div class="col-md-3">
                                        <span id="tip_descript" for="descript" class="help-block " style=""></span>
                                    </div>
								</div>
								<div id="js_ueditor" class="appmsg_edit_item content_edit">
								<div class="form-group" id="con_myEditor">
									<label class="control-label col-md-3">活动内容</label>
									<div class="col-md-9">
									<textarea name="content" id="myEditor"  style="border: #f8f8f8;background-color: #f8f8f8;"></textarea>
                                    </div>
                                    <div class="col-md-0"><!-- 
                                        <span id="tip_myEditor" for="myEditor" class="help-block " style="">长度在3000字以内</span> -->
                                    </div>
								</div>
								</div>
								<div class="form-group" id="con_signinCode">
									<label class="control-label col-md-3">签到码<span class="required">*</span></label>
									<div class="col-md-6">
										<input type="text" name="signinCode" id="signinCode" data-required="1"
											class="form-control" value="" />
									</div>
									<div class="col-md-3">
										<span id="tip_signinCode" for="signinCode" class="help-block " style="">不能为空</span>
									</div>
								</div>
								<div class="form-group" id="con_findKeys">
									<label class="control-label col-md-3">关键字<span class="required"></span></label>
									<div class="col-md-6">
										<input type="text" name="findKeys" id="findKeys" data-required="1"
											class="form-control" value="" />
									</div>
									<div class="col-md-3">
										<span id="tip_findKeys" for="findKeys" class="help-block " style=""></span>
									</div>
								</div>
								<div class="form-group" id="con_address">
									<label class="control-label col-md-3">展示风格</label>
									<div class="col-md-6">
										<input type="radio" name="style"  value="series"  onclick="changeImg('seriesstyle')" id="series" checked="checked" /><label for="series">&nbsp;系列</label>&nbsp;&nbsp;
										<input type="radio" name="style"  value="time"  id="time" onclick="changeImg('timestyle')"/><label for="time">&nbsp;时间轴</label>
										<br/>
										<img id="styleimg" style="width:180px;height:240px;margin-top:10px;" src="${basepath }/static/ixin/img/seriesstyle.png">
									</div>
									
								</div>
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
                                        <input type="hidden" name="isChooseLogo" id="isChooseLogo" value="false" >
                                        <input type="hidden" name="coursewareId" id="coursewareId" >
                                        <input type="hidden" name="categoryId" id="categoryId" >
                                        <input type="hidden" name="path" id="path" >
										<button type="button" onclick="validateAll()" id="subButton" class="btn green">提交</button>
										<button type="button" class="btn default" onclick="backToList();">取消</button>
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
<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.all.min.js"></script>
<script type="text/javascript">
var editor = UE.getEditor('myEditor');
		$(function() {
			$('#file_upload').uploadify({
				'formData'     : {
					'token'     : '${uptoken}',
				},
				'fileObjName'  : 'file',
				'swf'      : '${basepath}/static/ixin/css/uploadify.swf',
				'uploader' : 'http://up.qiniu.com/',
				'buttonText':'<i class = "glyphicon glyphicon-open"></i>上传',
				'onUploadSuccess' : function(file,data,response){
					var result = eval("("+data+")");
					$('#activityImage').val(result.hash);
					//console.debug(JSON.stringify(file));
					$('#showImage').html('<img src="http://img0.aijiayou.com/'+result.hash+'">');
				}
			});
		});
		
		function validateAll(){
			var flag1,flag2,flag3,flag4,flag5,flag6,flag7;
			flag1 = validate('name');
			flag2 = validate('sponsor');
			flag3 = validate('address');
			flag4 = validate('activityStartDate');
			flag5 = validate('activityImage');
			flag6 = validate('activityEndDate');
			flag7 = validate('signinCode');
			
			if(flag1 & flag2 & flag3 & flag4 & flag5 & flag6 & flag7 ){
				validateFindKey('findKeys');
			}
		}
			
		
		/** 验证关键字 */
		function validateFindKey(id){
			var obj = $("#"+id);
			var value = $.trim(obj.val());
			if(isBlank(value)){
				removeError(id);
				$("#tip_findKeys").html("");
				$('#form_sample_2').submit();
			}
			$.ajax({
				type:"post",
				url:basepath+"/mgr/ixinrule/validateaddfindkey.json",
				data:{"skey":value},
				success:function(data){
					var skeyIsExist = data;
					if(skeyIsExist){
						$("#tip_findKeys").html("关键字已存在");
						obj.focus();
						addError(id);
					}
					if(!skeyIsExist){
						$("#tip_findKeys").html("");
						removeError(id);

						$('#form_sample_2').submit();
					}
				}
			});
		}
		/** 验证分类 */
		function validate(id){
			var obj = $("#"+id);
			var value = $.trim(obj.val());
			if(isBlank(value)){
				obj.focus();
				addError(id);
				return false;
			}
			removeError(id);
			return true;
		}
		/** 添加错误信息 */
		function addError(id){
			$("#con_"+id).addClass("has-error").focus();
//			myShow("tip_"+id);
//			obj.focus();
		}
		function removeError(id){
			$("#con_"+id).removeClass("has-error");
//			myHide("tip_"+id);
		}
		
		function changeImg(imgname){
			$("#styleimg").attr("src","${basepath}/static/ixin/img/"+imgname+".png"	);
		}
	</script>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
<%-- dwr --%>
<%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script> 
<script src='${basepath }/static/public/javascripts/easydialog-static-params.js' type='text/javascript' ></script> 
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
</content>	
