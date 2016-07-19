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
						<i class="glyphicon glyphicon-asterisk"></i><span>修改奖项设置</span>
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!--  =====================strart======================== -->
					<div class=" form table-responsive newcss">
					<c:forEach items="${container.items }" var="award">
							<input type="hidden" id="awardId${award.weight }" value="${award.id }">
						</c:forEach>
						<table class="table table-condensed table-hover">
						<thead>
							<tr>
								<td></td>
								<td>奖品名称<br><span class=""></span></td>
								<td>奖品</td>
								<td>奖品数量</td>
							</tr>
						</thead>
						<tbody id="awards">
						<c:forEach items="${container.items }" var="award" begin="0" end="2">
							<tr>
								<td>
									<label>奖项${award.weight }</label>
								</td>
								<td>
								<input type="text" class="form-control" id="awardTitle${award.weight }" value="${award.title }" >
								</td>
								<td>
								<input type="text" class="form-control" id="awardContent${award.weight }" value="${award.content }">
								</td>
								<td>
								<input type="text" class="form-control" id="awardNum${award.weight }"  value="${award.num }">
								</td>
							</tr>
						</c:forEach>
						<c:forEach items="${container.items }" var="award" begin="3">
							<tr class="arow">
								<td>
									<label>追加奖</label><span class="btn btn-danger btn-xs fl" onclick="removeitem(this)"><i class="glyphicon glyphicon-remove"></i>移除</span>
								<td>
								<input type="text" class="form-control" id="awardTitle${award.weight }" value="${award.title }" >
								</td>
								<td>
								<input type="text" class="form-control" id="awardContent${award.weight }" value="${award.content }">
								</td>
								<td>
								<input type="text" class="form-control" id="awardNum${award.weight }"  value="${award.num }">
								</td>
							</tr>
						</c:forEach>
							
						</tbody>
							<tfoot>
								<tr>
									<td colspan="4">
										<span class="btn green newbtncss" onclick = "plus_awards()"><i class="glyphicon glyphicon-plus"></i>增加奖项</span>
									</td>
								</tr>
								<tr id="morecontrol" >
									<td colspan="4">
										<div class="form">
												<div class="form-body">
													<div class="form-group">
													<!--  	<label class="col-md-3 control-label">是否显示奖品数量</label>
														<div class="col-md-9">
															<div class="checkbox-list">
																<label class="checkbox-inline">
																<input type="checkbox" value="option1" id="showAwardNum"> *取消选择后将不在活动界面显示奖品数量
																</label>
															</div>
														</div>-->
													</div>
													<div class="form-group" id="con_startDate">
														<label class="col-md-3 control-label">开始时间</label>
														<div class="col-md-2">
															<span><input type="text" id="startDate" class="form-control" name="startDate" value="${container.startTimeStr }"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/></span>
														</div>
														<label class="col-md-6">
														*必填
														</label>
													</div>
													<div class="form-group" id="con_endDate">
														<label class="col-md-3 control-label">结束时间</label>
														<div class="col-md-2">
															<span><input type="text" id="endDate" class="form-control" name="endDate" value="${container.endTimeStr }"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/></span>
														</div>
														<label class="col-md-6">
														*必填
														</label>
													</div>
													<div class="form-group" id="con_rewardRate">
														<label class="col-md-3 control-label">每次中奖概率</label>
														<div class="col-md-2">
																<input type="text"  class="form-control minw" id="rewardRate"  value="${container.rewardRate }">
														</div>
														<label class="col-md-6">
														%*必填，百分比，在0~100之间，支持小数点
														</label>
													</div>
													<div class="form-group" id="con_maxAttendNum">
														<label class="col-md-3 control-label">每人参加总次数</label>
														<div class="col-md-2">
																<input type="text"  class="form-control minw" id="maxAttendNum" value="${container.maxAttendNum }">
														</div>
														<label class="col-md-6">
														*必填，0表示不限次数
														</label>
													</div>
												</div>
												
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="4">
									 	<span class="btn blue newbtncss" onclick = "validateAll()"><i class="glyphicon glyphicon-floppy-save"></i>保存</span>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
					<input type="hidden" id="rewardId" value="${container.rewardId }">
					<input type="hidden" id="id" value="${container.id }">
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
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
var count = parseInt("${maxWeight}");
	function plus_awards(){
		var html = [];
		count = count+1;
		var titleId = "awardTitle" + count;
		var contentId = "awardContent" + count;
		var numId = "awardNum" + count;
		html.push('<tr class="arow">');
		html.push('<td><label>追加奖</label><span class="btn btn-danger btn-xs fl" onclick="removeitem(this)"><i class="glyphicon glyphicon-remove"></i>移除</span></td>');				
		html.push('<td><input type="text" class="form-control" id="'+titleId+'" value="追加奖"></td>');
		html.push('<td><input type="text" class="form-control" id="'+contentId+'"  placeholder="小奖品"></td>');
		html.push('<td><input type="text" class="form-control" id="'+numId+'"  placeholder="0"></td></tr>');
		$("#awards").append(html.join(""));
	}
	function removeitem(o){
		$(o).parent().parent().remove();
	}
	function morecontrol(o){
		$(o).hide();
		$("#morecontrol").show();
	}
	
	function submit() {
		var i=0;
		var obj = new Object();
		var options = new Array();
		if(count < 3){
			count = 3;
		}
		for(j = 1; j<=count; j++){
			var opt = new Object();
			var tmpid = $("#awardId" +j).val();
			var tmp = $("#awardTitle" + j).val();
			if(tmp) {
				opt.id = tmpid;
				opt.title = $("#awardTitle" + j).val();
				opt.content = $("#awardContent" + j).val();
				opt.num = $("#awardNum" + j).val();
				opt.weight = j;
				options[i] = opt;
				i=i+1;
			}
		}
		obj.rewardRate = $("#rewardRate").val();
		obj.maxAttendNum = $("#maxAttendNum").val();
		obj.items = options;
		var rewardId = $("#rewardId").val();
		obj.rewardId = rewardId;
		obj.startTimeStr = $("#startDate").val();
		obj.endTimeStr = $("#endDate").val();
		obj.id=$("#id").val();
		$.ajax({
			type: "POST",
			url:  "${basepath}/mgr/scratchcard/updateContainer.json",
			data: JSON.stringify(obj),
			contentType: "application/json; charset=utf-8",
			success:function(data){
				window.location.href = "${basepath }/mgr/scratchcard/toModifyContainers.xhtml?id="+rewardId;
			},
			error: function(data){
				alert('保存失败');
			}
		});
	}
	function validateAll(){
		var flag1,flag2,startdate,enddate,num;
		flag1 = validate('rewardRate');
		flag2 = validate('maxAttendNum');
		startdate = validate('startDate');
		enddate = validate('endDate');
		num = validateNum3();
		if(flag1 & flag2 & startdate & enddate&num){
			submit();
		}
	}


	function validateNum3(){
		for(j = 1; j<=count; j++){
			var tmp = $("#awardTitle" + j).val();
			if(tmp) {
				var obj = $("#awardNum" + j);
				if( intCheck(obj.val()) || obj.val()==0){
				}else{
						obj.focus();
						addError("#awardNum" + j);
						return false;
				}
			}
		}
		return true;
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
//		myShow("tip_"+id);
//		obj.focus();
	}
	function removeError(id){
		$("#con_"+id).removeClass("has-error");
//		myHide("tip_"+id);
	}
</script>
</content>

