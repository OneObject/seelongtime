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
<title>签到新增</title>
<meta name="menu_path" content="active.menu_signin" />
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">签到新增</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row" style="display: none;">
		<div class="col-md-12  stepbox">
			<img src="${basepath }/static/ixin/img/step.png">
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="glyphicon glyphicon-plus"></i><span >创建签到</span>
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!--  =====================strart======================== -->
					<div class="row">
						<div class="mauto">
							<div class="col-md-12">
								<div class="edit">
									<div class="form">
											<form role="form" id="form1" action="${basepath }/mgr/signin/addstep1.xhtml">
												<div class="form-body">
													<div class="form-group" id="con_name">
														<label  class="control-label">签到标题<span class="required">*</span></label>
														<input type="text" class="form-control" data-required="1" id="name" name="name" placeholder="请输入标题">
														<span class="help-block">
														</span>
													</div>
													
													<div class="form-group" id="con_remark">
														<label class="control-label">签到简介</label>
														<input type="text" class="form-control" data-required="1" id="remark" name="remark" placeholder="请输入简介">
														<span class="help-block">
														</span>
													</div>
													
													<div class="form-group" id="con_code">
														<label  class="control-label">签到码&nbsp;<span style="color: gray">可以为空</span></label>
														<input type="text" class="form-control" data-required="1" id="code" name="code" placeholder="请输入签到码">
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
						<a  onclick="validateAll()"><span class="btn green btn-block"><i class="glyphicon glyphicon-arrow-right"></i>&nbsp;下一步</span></a>
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
		var flag = true;
        function submit() {
            if(flag){
                flag=false;
        		$("#form1").submit();
             }else{
				
             }
        }
        
        function validateAll(){
			var flag1,flag2,flag3;
			flag1 = validate('name');
			flag2 = true;//validate('code');
			if(flag1 & flag2 ){
				submit();
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
		}
		function removeError(id){
			$("#con_"+id).removeClass("has-error");
		}
    </script> 
</content>

