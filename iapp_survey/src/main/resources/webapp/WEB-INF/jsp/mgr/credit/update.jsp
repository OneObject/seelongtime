<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>修改积分规则</title>
<meta name="menu_path" content="system.creditManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/mgr/credit/creditmanage.xhtml">积分管理</a><i class="icon-angle-right"></i></li>
				<li><span>修改积分规则</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-12 portlet box yellow">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>修改积分规则
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">      
					<form id="updateForm"  class="form-horizontal" role="form" action="${basepath }/mgr/credit/doupdate.xhtml" >
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-4 control-label">规则名称：</label>
								<c:if test="${isruleid eq 1 }">
									<input type="hidden" name="ruleId" value="${entity.id }"/>
								</c:if>
								<c:if test="${isruleid eq 0}">
									<input type="hidden" name="ruleId" value="${entity.ruleid }"/>
								</c:if>
								<div class="col-md-4" style="margin-top: 10px;">${ruleName}</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-4 control-label">奖惩类型：</label>
								<div class="col-md-4">
									<select id="rewardType" name="rewardType" style="width: 200px;height: 28px;">
										<c:if test="${entity.rewardType eq '1' }">
											<option value="1" selected="selected">奖励</option>
											<option value="0">惩罚</option>
										</c:if>										
										<c:if test="${entity.rewardType eq '0' }">
											<option value="1">奖励</option>
											<option value="0" selected="selected">惩罚</option>
										</c:if>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-4 control-label">积分：</label>
								<div class="col-md-4">
									<input type="text" name="credit" id="credit" style="width: 200px;"
						class="required" value="${entity.credit }" />
								</div>
								<span  class="col-md-4" style="color:#737373;" id="errorcredit">请输入一个大于等于0的整数</span>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">经验值：</label>
								<div class="col-md-4">
									<input type="text" name="experience" id="experience" style="width: 200px;"
						class="required" value="${entity.experience }" />
								</div>
								<span  class="col-md-4" style="color:#737373;" id="errorcredit">请输入一个大于等于0的整数</span>
							</div>
							
							<div class="form-group">
								<label class="col-md-4 control-label">周期类型：</label>
								<div class="col-md-4">
									<select id="cycleType" name="cycleType" style="width: 200px;height: 28px;">
										<c:if test="${entity.cycleType eq 0 }">
											<option value="0">一次性</option>
											<option value="1">每天</option>
											<option value="2">整点</option>
											<option value="3">间隔分钟</option>
											<option value="4">不限周期</option>
											<option value="5">每月</option>
										</c:if>
										<c:if test="${entity.cycleType eq 1 }">
											<option value="0" selected="selected">一次性</option>
											<option value="1" selected="selected">每天</option>
											<option value="2">整点</option>
											<option value="3">间隔分钟</option>
											<option value="4">不限周期</option>
											<option value="5">每月</option>
										</c:if>
										<c:if test="${entity.cycleType eq '2' }">
											<option value="0" selected="selected">一次性</option>
											<option value="1">每天</option>
											<option value="2" selected="selected">整点</option>
											<option value="3">间隔分钟</option>
											<option value="4">不限周期</option>
											<option value="5">每月</option>
										</c:if>
										<c:if test="${entity.cycleType eq '3' }">
											<option value="0" selected="selected">一次性</option>
											<option value="1">每天</option>
											<option value="2">整点</option>
											<option value="3" selected="selected">间隔分钟</option>
											<option value="4">不限周期</option>
											<option value="5">每月</option>
										</c:if>
										<c:if test="${entity.cycleType eq '4' }">
											<option value="0" selected="selected">一次性</option>
											<option value="1">每天</option>
											<option value="2">整点</option>
											<option value="3">间隔分钟</option>
											<option value="4" selected="selected">不限周期</option>
											<option value="5">每月</option>
										</c:if>
										<c:if test="${entity.cycleType eq '5' }">
											<option value="0" selected="selected">一次性</option>
											<option value="1">每天</option>
											<option value="2">整点</option>
											<option value="3">间隔分钟</option>
											<option value="4">不限周期</option>
											<option value="5" selected="selected">每月</option>
										</c:if>
									</select>
								</div>
							</div>
							
							<div class="form-group" id="con_replaceAll" style="display:${entity.cycleType eq '2' || entity.cycleType eq '3' ? 'block':'none'};">
                                <label class="col-md-4 control-label">间隔时间：</label>
								<div class="col-md-4">
									<input type="text" name="cycleTime" id="cycleTime" style="width: 200px;" 
									value="${entity.cycleTime  }" alt="" />
								</div>
								<span style="margin-left: -130px;color:#737373;" id="errorcycleTime">请输入一个大于等于0的整数</span>
							</div>
							
							<div class="form-group" id="con_rewardNum" style="display:${entity.cycleType ne '0'  ? 'block':'none'};">
								<label class="col-md-4 control-label">奖励次数(周期内)：</label>
								<div class="col-md-4">
									<input type="text" name="rewardNum" id="rewardNum" style="width: 200px;" class="required digits"
									value="${entity.rewardNum }" alt="" />
								</div>
								<span class="col-md-4" style="color:#737373;" id="errorrewardNum">请输入一个大于等于0的整数；不限周期时，为奖励总次数</span>
							</div>
							<div class="form-group" id="con_norepeat" style="display:${entity.cycleType ne '0'  ? 'block':'none'};">
								<label class="col-md-4 control-label">是否去重：</label>
								<div class="col-md-4">
									<select id="norepeat" name="norepeat"
										style="width: 200px; height: 28px;">
										<c:if test="${entity.norepeat eq '1' }">
											<option value="1" selected="selected">是</option>
											<option value="0">否</option>
										</c:if>

										<c:if test="${entity.norepeat eq '0' }">
											<option value="1">是</option>
											<option value="0" selected="selected">否</option>
										</c:if>
									</select>
								</div>
							</div>
							<div class="form-group" id="con_resourceRewardNum" style="display:${entity.cycleType eq '0' ?'none':entity.norepeat eq '0'?'none':'block'};">
								<label class="col-md-4 control-label">同一资源奖励次数：</label>
								<div class="col-md-4">
									<input type="text" name="resourceRewardNum" id="resourceRewardNum" style="width:200px;" 
									class="required" value="${entity.resourceRewardNum }" alt=""/>
								</div>
								<span style="margin-left: -130px;color:#737373;" id="errorresourceRewardNum">请输入一个大于等于0的整数</span>
							</div>
							
							</div>
						<div class="btn_group_center">
							<button type="submit" class="btn btn-warning">提交</button>
							<span class="btn default" onclick="cancelBtn()">取消</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 --> 
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
<!-- 输入的验证 -->
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript'></script>
<!-- 积分的js -->
<script type="text/javascript" src="${basepath }/static/credit/creditrule.js"></script>
<script type="text/javascript">
$(function(){
	//是否去重
    $("#norepeat").change(function(){
		var val = $("#norepeat").val();
		if(val==0){
			$("#con_resourceRewardNum").hide();
			//$("#resourceRewardNum").val(0);
		}
		if(val==1){
			$("#con_resourceRewardNum").show();
		}
	});

	
	//周期类型
    $("#cycleType").change(function(){
    	var val = $("#norepeat").val();
		var val2 = $("#cycleType").val();
		if(val2==0){
			//间隔时间
			$("#con_replaceAll").hide();
			//奖励次数
			$("#con_rewardNum").hide();
			//是否去重
			$("#con_norepeat").hide();
			//同一资源奖励次数
			$("#con_resourceRewardNum").hide();
		}else if(val2==2 || val2==3){
			$("#con_replaceAll").show();
			$("#con_norepeat").show();
			$("#con_rewardNum").show();
			if(val==0){
				$("#con_resourceRewardNum").hide();
				//$("#resourceRewardNum").val(0);
			}
			if(val==1){
				$("#con_resourceRewardNum").show();
			}
		}else{
			$("#con_replaceAll").hide();
			//$("#cycleTime").val(0);
			$("#con_norepeat").show();
			$("#con_rewardNum").show();
			if(val==0){
				$("#con_resourceRewardNum").hide();
				//$("#resourceRewardNum").val(0);
			}
			if(val==1){
				$("#con_resourceRewardNum").show();
			}
		}
		
	});
	
});
</script>
</content>