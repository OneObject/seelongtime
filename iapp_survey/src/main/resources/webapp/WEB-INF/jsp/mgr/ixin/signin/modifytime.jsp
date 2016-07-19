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
<title>签到管理</title>
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
				<li><span href="#">签到管理</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box yellow">
				<div class="portlet-title">
					<div class="caption">
						<i class="glyphicon glyphicon-asterisk"></i><span>签到时间设置</span>
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!--  =====================strart======================== -->
					<div class=" form table-responsive newcss">
						<table class="table table-condensed table-hover">
						<thead>
								<tr id="morecontrol" >
									<td colspan="4">
										<div class="form">
											<form class="form-horizontal" >
												<div class="form-body">
													<div class="form-group" id="con_maxAttendNum">
														<label class="col-md-3 control-label">当前天数：第${entity.status}天</label>
														
													</div>
												</div>
											</form>
										</div>
									</td>
								</tr>
							<tr>
								<td></td>
								<td >&nbsp;开始时间</td>
								<td >&nbsp;结束时间</td>
							</tr>
							</thead>
						<tbody id="time">
						
							<tr>
								<td>
									<label id="mark1">签到时间段</label>
								</td>
								<td>
								<input type="text" id="startTime1" class="form-control"  placeholder="开始时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" class="form-control Wdate" value='<d:formatDate format="yyyy-MM-dd HH:mm" currentTime="${entity.startTime}"/>'/>
								</td>
								<td>
								<input type="text" id="endTime1" class="form-control"  placeholder="结束时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm' , minDate:'#F{$dp.$D(\'startTime1\')}'})" class="form-control Wdate"  value='<d:formatDate format="yyyy-MM-dd HH:mm" currentTime="${entity.endTime}"/>'/>
								</td>
							</tr>
							
						</tbody>
						<tfoot>
							
								<tr>
									<td colspan="4">
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
	<input type="hidden" id="tid" value="${entity.id }">
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





	
	function submit() {
		var startTime = $("#startTime1").val();
		var endTime = $("#endTime1").val();
		var tid = $("#tid").val();
		$.ajax({
			type: "POST",
			url:  "${basepath}/mgr/signin/update.xhtml",
			data: {startTime:startTime,endTime:endTime,tid:tid},
			success:function(data){
						if(data){
							window.location.href = "${basepath }/mgr/signin/detail.xhtml?id=${id }";
						}else{
							alert('保存失败');
						}
			},
			error: function(data){
				alert('保存失败');
			}
		});
	}

	

	
	function validateAll(){
	
		
		if(!validate("startTime1")||!validate("endTime1")){
				return;
		}
		
	
		submit();
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
		$("#"+id).addClass("has-error").focus();
//		myShow("tip_"+id);
//		obj.focus();
	}
	function removeError(id){
		$("#"+id).removeClass("has-error");
//		myHide("tip_"+id);
	}
</script>
</content>

