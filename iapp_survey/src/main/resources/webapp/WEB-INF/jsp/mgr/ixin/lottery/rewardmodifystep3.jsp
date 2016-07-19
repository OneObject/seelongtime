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
				<div class="portlet-body main_bd box" data-sss="sss">
					<!--  =====================strart======================== -->
					<c:forEach items="${containers }" var="container" varStatus="ids">
										 	
						<div class=" form table-responsive newcss">
						<span class="btn blue newbtncss " onclick = "modifyContainer('${container.id}')"><i class="glyphicon glyphicon-floppy-save"></i>修改</span>
										 	<span class="btn red newbtncss" onclick = "deleteContainer('${container.id}')"><i class="glyphicon glyphicon-floppy-save"></i>删除</span>
						<c:forEach items="${container.items }" var="award">
								<input type="hidden" id="awardId${award.weight }" value="${award.id }">
							</c:forEach>
							<table class="table table-condensed table-hover">
							<thead>
								<tr>
									<td></td>
									<td>奖品名称<br><span class=""></span></td>
									<td>奖品<i data-id="${ids.count }" class="fa fa-info-circle awardicon" style="position:relative;color:#999;left:4px;font-size:14px;"><div id="awardiconShow_${ids.count }" style="display:none;padding:10px;width:200px;background:#eee;border:1px solid #ddd;font-size:12px;line-height:20px;position:absolute;left:18px;top:-4px;border-radius:10px;">奖品为积分时，格式为数字加积分，如"100积分"</div></i></td>
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
									<input type="text" class="form-control" id="awardTitle${award.weight }" value="${award.title }" disabled="disabled">
									</td>
									<td>
									<input type="text" class="form-control" id="awardContent${award.weight }" value="${award.content }" disabled="disabled">
									</td>
									<td>
									<input type="text" class="form-control" id="awardNum${award.weight }"  value="${award.num }" disabled="disabled">
									</td>
								</tr>
							</c:forEach>
							<c:forEach items="${container.items }" var="award" begin="3">
								<tr class="arow">
									<td>
										<label>追加奖</label>
									<td>
									<input type="text" class="form-control" id="awardTitle${award.weight }" value="${award.title }"  disabled="disabled">
									</td>
									<td>
									<input type="text" class="form-control" id="awardContent${award.weight }" value="${award.content }" disabled="disabled">
									</td>
									<td>
									<input type="text" class="form-control" id="awardNum${award.weight }"  value="${award.num }" disabled="disabled">
									</td>
								</tr>
							</c:forEach>
								
							</tbody>
								<tfoot>
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
														<div class="form-group" id="con_maxAttendNum">
															<label class="col-md-2 control-label">开始时间</label>
															<div class="col-md-3">
																<span><input type="text" id="startDate" class="form-control" name="startDate" value="${container.startTimeStr }"  disabled="disabled" class="form-control Wdate"/></span>
															</div>
															<label class="col-md-6">
															*必填
															</label>
														</div>
														<div class="form-group" id="con_maxAttendNum">
															<label class="col-md-2 control-label">结束时间</label>
															<div class="col-md-3">
																<span><input type="text" id="endDate" class="form-control" name="endDate" value="${container.endTimeStr }"  disabled="disabled" class="form-control Wdate"/></span>
															</div>
															<label class="col-md-6">
															*必填
															</label>
														</div>
														<div class="form-group" id="con_rewardRate">
															<label class="col-md-2 control-label">每次中奖概率</label>
															<div class="col-md-3">
																	<input type="text"  class="form-control minw" id="rewardRate"  value="${container.rewardRate }"  disabled="disabled">
															</div>
															<label class="col-md-6">
															%*必填，百分比，在0~100之间，支持小数点
															</label>
														</div>
														<div class="form-group" id="con_maxAttendNum">
															<label class="col-md-2 control-label">每人参加总次数</label>
															<div class="col-md-3">
																	<input type="text"  class="form-control minw" id="maxAttendNum" value="${container.maxAttendNum }"  disabled="disabled">
															</div>
															<label class="col-md-6">
															*必填，0表示不限次数
															</label>
														</div>
													</div>
													
											</div>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</c:forEach>
					<input type="hidden" id="rewardId" value="${reward.id }">
					<div class = "newcss">
					<span class="btn green newbtncss" onclick = "returnIndex()"><i class="glyphicon glyphicon-floppy-save"></i>完成</span>
					<span class="btn blue newbtncss" onclick = "toAddContainer('${reward.id}')"><i class="glyphicon glyphicon-floppy-save"></i>添加</span>
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
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
/* var count = 5;
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
				i = i+1;
			} else {
				if(tmpid) {
					opt.id = tmpid;
					options[i] = opt;
					i=i+1;
				}
			}
		}
		obj.rewardRate = $("#rewardRate").val();
		obj.maxAttendNum = $("#maxAttendNum").val();
		obj.items = options;
		obj.id = $("#rewardId").val();
		$.ajax({
			type: "POST",
			url:  "${basepath}/mgr/scratchcard/modifyrewardthirdstep.xhtml",
			data: JSON.stringify(obj),
			contentType: "application/json; charset=utf-8",
			success:function(data){
				window.location.href = "${basepath }/mgr/scratchcard/scratchcardindex.xhtml"
			},
			error: function(data){
				alert('保存失败');
			}
		});
	}
	function validateAll(){
		var flag1,flag2;
		flag1 = validate('rewardRate');
		flag2 = validate('maxAttendNum');
		if(flag1 & flag2){
			submit();
		}
	}*/
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
	function returnIndex(){
		window.location.href = "${basepath }/mgr/scratchcard/scratchcardindex.xhtml";
	}
	function modifyContainer(id){
		window.location.href = "${basepath}/mgr/scratchcard/modifyContainer.xhtml?id="+id;
	}
	
	function toAddContainer(id){
		window.location.href = "${basepath}/mgr/scratchcard/toAddContainer.xhtml?id="+id;
	}
	function toDeleteContainer(id){
		window.location.href = "${basepath}/mgr/scratchcard/deleteContainer.xhtml?id="+id;
	}
	
	function deleteContainer(id) {
		if(!id){
			alert("id不能为空！");
			return;
		}
		var rewardId = $("#rewardId").val();
		if(confirm("您确定要删除该轮奖项设置吗？")){
			$.ajax({
				type: "POST",
				url:  "${basepath}/mgr/scratchcard/deleteContainer.xhtml",
				data: {"id":id},
				success:function(data){
					window.location.href = "${basepath }/mgr/scratchcard/toModifyContainers.xhtml?id="+rewardId;
				},
				error: function(data){
					alert('保存失败');
				}
			});
		}
		
	}
	$(".awardicon").mouseover(function(){
		var id = $(this).data("id");
		  $("#awardiconShow_"+id).show();
	});
	$(".awardicon").mouseout(function(){
		var id = $(this).data("id");
		  $("#awardiconShow_"+id).hide();
	});
</script>
</content>

