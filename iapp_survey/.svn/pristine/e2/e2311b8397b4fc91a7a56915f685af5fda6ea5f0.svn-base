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
						<i class="glyphicon glyphicon-asterisk"></i><span>奖项设置</span>
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!--  =====================strart======================== -->
					<div class=" form table-responsive newcss">
						<table class="table table-condensed table-hover">
						<thead>
							<tr>
								<td></td>
								<td>奖品名称<br><span class=""></span></td>
								<td>奖品<i id="awardicon" class="fa fa-info-circle" style="position:relative;color:#999;left:4px;font-size:14px;"><div id="awardiconShow" style="display:none;padding:10px;width:200px;background:#eee;border:1px solid #ddd;font-size:12px;line-height:20px;position:absolute;left:18px;top:-4px;border-radius:10px;">奖品为积分时，格式为数字加积分，如"100积分"</div></i></td>
								<td>奖品数量</td>
							</tr>
						</thead>
						<tbody id="awards">
							<tr>
								<td>
									<label>奖项一</label>
								</td>
								<td>
								<input type="text" class="form-control" id="awardTitle1" value="一等奖"  placeholder="一等奖">
								</td>
								<td>
								<input type="text" class="form-control" id="awardContent1"  placeholder="笔记本">
								</td>
								<td>
								<input type="text" class="form-control" id="awardNum1"  placeholder="0">
								</td>
							</tr>
							<tr>
								<td>
									<label>奖项二</label>
								</td>
								<td>
								<input type="text" class="form-control" id="awardTitle2" value="二等奖"  placeholder="二等奖">
								</td>
								<td>
								<input type="text" class="form-control" id="awardContent2"  placeholder="手机">
								</td>
								<td>
								<input type="text" class="form-control" id="awardNum2"  placeholder="0">
								</td>
							</tr>
							<tr>
								<td>
									<label>奖项三</label>
								</td>
								<td>
								<input type="text" class="form-control" id="awardTitle3" value="三等奖"  placeholder="三等奖">
								</td>
								<td>
								<input type="text" class="form-control" id="awardContent3"  placeholder="优盘">
								</td>
								<td>
								<input type="text" class="form-control" id="awardNum3"  placeholder="0">
								</td>
							</tr>
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
											<form class="form-horizontal" role="form">
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
													<div class="form-group" id="con_maxAttendNum">
														<label class="col-md-3 control-label">开始时间</label>
														<div class="col-md-2">
															<span><input type="text" id="startDate" class="form-control" name="starspanate"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/></span>
														</div>
														<label class="col-md-6">
														*必填
														</label>
													</div>
													<div class="form-group" id="con_maxAttendNum">
														<label class="col-md-3 control-label">结束时间</label>
														<div class="col-md-2">
															<span><input type="text" id="endDate" class="form-control" name="starspanate"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/></span>
														</div>
														<label class="col-md-6">
														*必填
														</label>
													</div>
													<div class="form-group" id="con_rewardRate">
														<label class="col-md-3 control-label">每次中奖概率</label>
														<div class="col-md-2">
																<input type="text"  class="form-control minw" id="rewardRate" value="0"  placeholder="0">
														</div>
														<label class="col-md-6">
														%*必填，百分比，在0~100之间，支持小数点
														</label>
													</div>
													<div class="form-group" id="con_maxAttendNum">
														<label class="col-md-3 control-label">每人参加总次数</label>
														<div class="col-md-2">
																<input type="text"  class="form-control minw" id="maxAttendNum" value="1"  placeholder="1">
														</div>
														<label class="col-md-6">
														*必填，0无次数限制
														</label>
													</div>
													<input type="hidden" id="rewardId" value="${id }">
													<input type="hidden" id="next" value="0">
													<input type="hidden" id="title1" value="${title1}">
												</div>
											</form>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="4">
									 	<span class="btn blue newbtncss" onclick = "next()"><i class="glyphicon glyphicon-asterisk"></i>继续设置</span>
									 	<span class="btn blue newbtncss" onclick = "validateAll()"><i class="glyphicon glyphicon-floppy-save"></i>保存</span>
									</td>
								</tr>
							</tfoot>
						</table>
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
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
var count = 3;
	function plus_awards(){
		var html = [];
		count = count+1;
		var titleId = "awardTitle" + count;
		var contentId = "awardContent" + count;
		var numId = "awardNum" + count;
		html.push('<tr class="arow">');
		html.push('<td><label>追加奖</label><span class="btn btn-danger btn-xs fl" onclick="removeitem(this)"><i class="glyphicon glyphicon-remove"></i>移除</span></td>');				
		html.push('<td><input type="text" class="form-control" id="'+titleId+'" value="追加奖"  placeholder="追加奖"></td>');
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
		var title1 = $("#title1").val();
		for(j = 1; j<=count; j++){
			var opt = new Object();
			var tmp = $("#awardTitle" + j).val();
			if(tmp) {
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
		obj.rewardId = $("#rewardId").val();
		obj.startTimeStr = $("#startDate").val();
		obj.endTimeStr = $("#endDate").val();
		obj.toNext = $("#next").val();
		
		$.ajax({
			type: "POST",
			url:  "${basepath}/mgr/scratchcard/addRewardThirdStep.xhtml",
			data: JSON.stringify(obj),
			contentType: "application/json; charset=utf-8",
			success:function(data){
					if(title1==null||title1==""){
						window.location.href = "${basepath }/mgr/scratchcard/toModifyContainers.xhtml?id="+obj.rewardId;
					}else{
						window.location.href = "${basepath }/mgr/scratchcard/scratchcardindex.xhtml";
					}
			},
			error: function(data){
				alert('保存失败');
			}
		});
	}
	function submit1() {
		var i=0;
		var obj = new Object();
		var options = new Array();
		for(j = 1; j<=count; j++){
			var opt = new Object();
			var tmp = $("#awardTitle" + j).val();
			if(tmp) {
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
		obj.rewardId = $("#rewardId").val();
		obj.startTimeStr = $("#startDate").val();
		obj.endTimeStr = $("#endDate").val();
		obj.toNext = $("#next").val();
		var r = window.confirm("确定要继续设置吗？");
		if(r){
		$.ajax({
			type: "POST",
			url:  "${basepath}/mgr/scratchcard/addRewardThirdStep.xhtml",
			data: JSON.stringify(obj),
			contentType: "application/json; charset=utf-8",
			success:function(data){
				if(data == "success"){
					window.location.href = "${basepath }/mgr/scratchcard/toModifyContainers.xhtml?id="+obj.rewardId;
				} else {
					window.location.href = "${basepath }/mgr/scratchcard/addNewContainer.xhtml?rewardId="+data;
					
				}
				
			},
			error: function(data){
				alert('保存失败');
			}
		});
		}else{
			return;
		}
	}
	
	function next(){
		$("#next").val("1");
		validateAll1();
	}
	
	function validateAll(){
		var flag1,flag2,startdate,enddate,num;
		flag1 = validate('rewardRate');
		flag2 = validate('maxAttendNum');
		startdate = validate('startDate');
		enddate = validate('endDate');
		num = validateNum3();
		if(flag1 & flag2 & startdate & enddate & num){
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
	
	function validateAll1(){
		var flag1,flag2,startdate,enddate;
		flag1 = validate('rewardRate');
		flag2 = validate('maxAttendNum');
		startdate = validate('startDate');
		enddate = validate('endDate');
		
		if(flag1 & flag2 & startdate & enddate){
			submit1();
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
//		myShow("tip_"+id);
//		obj.focus();
	}
	function removeError(id){
		$("#con_"+id).removeClass("has-error");
//		myHide("tip_"+id);
	}
	$("#awardicon").mouseover(function(){
		  $("#awardiconShow").show();
	});
	$("#awardicon").mouseout(function(){
		  $("#awardiconShow").hide();
	});
</script>
</content>

