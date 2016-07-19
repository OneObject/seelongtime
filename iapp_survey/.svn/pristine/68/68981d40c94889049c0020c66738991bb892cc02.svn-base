<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>抽奖管理</title>
<meta name="menu_path" content="active.menu_ggk" />
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">抽奖管理</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="glyphicon glyphicon-plus"></i><span>创建抽奖</span>
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!--  =====================strart======================== -->
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-5">
									<div class="preview">
										<div class="title">
											<a href="#">活动一开始，进入开始您的好运</a>
										</div>
										<div class="datetime">
											2014.01.02-2014.03.06
										</div>
										<div class="img">
											<img src="${basepath }/static/ixin/img/yikaishi.png">
										</div>
										<div class="description">
											&nbsp;&nbsp;&nbsp;&nbsp;本次活动总共可以刮5次,机会如果没用完重新进入本页面可以再刮! <br>
				&nbsp;&nbsp;&nbsp;&nbsp;亲，请点击进入刮刮奖活动页面，祝您好运哦！ 
										</div>
									</div>
							</div>
							<div class="col-md-6">
								<div class="edit">
									<div class="form">
											<form role="form" id="form2" action="${basepath }/mgr/scratchcard/addRewardSecondStep.xhtml">
												<div class="form-body">
													<input type="hidden" name="id" value="${id }">
													<div class="form-group" id="con_title2">
														<label for="title" class="control-label">开始刮奖标题</label>
														<input type="email" class="form-control" id="title2" name="title2" placeholder="请输入title">
														<span class="help-block">
														</span>
													</div>
													<div class="form-group" id="con_picUrl2">
														<label for="title" class="control-label">开始抽奖消息封面图片，必须上传一张图片（350*200）</label>
														<div class="upload_box">
															<div class="upload_area">
																<input type="hidden" name="picUrl2" id="picUrl2" />
																<input type="file" name="file_upload" id="file_upload" />
																<ul class="upload_file_box" style="display: none;" id="queue"></ul>
															</div>
															<p class="js_cover upload_preview" >
																<div style="display: none;" id="small_prev">
																	<span id="image_cover"></span><a class="js_removeCover" href="javascript:void(0);"
																	onclick="delete_pic()">删除</a>
																</div>
															</p>
														</div>
														
													</div>
													<div class="form-group" id="con_content2">
														<label for="title" class="control-label">兑奖说明</label>
														<textarea class="form-control" rows="3" id="content2" name="content2"></textarea>
														<span class="help-block">
														</span>
													</div>
												</div>
											</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<a href="#" onclick="validateAll()"><span class="btn green btn-block"><i class="glyphicon glyphicon-arrow-right"></i>&nbsp;下一步</span></a>
					</div>
					<!--  =====================end========================= -->
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<content tag="pageCore"> 
<%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script> 
<script src='${basepath }/static/public/javascripts/easydialog-static-params.js' type='text/javascript' ></script>
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
		var basePathUrl = "${basepath}";
        $(document).ready(function(){
        	$('#file_upload').uploadify({
				'formData'     : {
					'token'     : '${uptoken}',
				},
				'fileObjName'  : 'file',
				'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
				'buttonClass' : 'upload_access',
				'swf'      : '${basepath}/static/ixin/css/uploadify.swf',
				'uploader' : 'http://up.qiniu.com/',
				'onUploadSuccess' : function(file,data,response){
					var result = eval("("+data+")");
					$('#picUrl2').val(result.hash);
					$('#showImage').attr("src","http://img0.aijiayou.com/"+result.hash);
					$('#showImage').show();
					$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = 'http://img0.aijiayou.com/"+result.hash+"'>");
					$("#small_prev").show();
					saveFile(file,result);
				}
			});
           
        })
        function submit() {
        	$("#form2").submit();
        }
        
        function validateAll(){
			var flag1,flag2,flag3;
			flag1 = validate('title2');
			flag2 = validate('picUrl2');
			flag3 = validate('content2');
			if(flag1 & flag2 & flag3){
				$("#form2").submit();
			}
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
    </script> 
</content>

