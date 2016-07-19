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
							<tr>
								<td></td>
								<td >&nbsp;开始时间</td>
								<td >&nbsp;结束时间</td>
								<td >&nbsp;时间段签到码</td>
								
							</tr>
							</thead>
						<tbody id="time">
						<c:if test="${empty list }">
							<tr>
								<td>
									<label id="mark1">签到时间段</label>
								</td>
								<td>
								<input type="text" id="startTime1" class="form-control"  placeholder="开始时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" class="form-control Wdate" />
								</td>
								<td>
								<input type="text" id="endTime1" class="form-control"  placeholder="结束时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm' , minDate:'#F{$dp.$D(\'startTime1\')}'})" class="form-control Wdate"  />
								</td>
							</tr>
						</c:if>
						<c:forEach varStatus="vs" var="item" items="${list}">
							<tr>
								<td>
									<label id="mark${vs.index+1}">签到时间段</label><span class="btn btn-danger btn-xs fl" onclick="removeitem(this,'${item.id}')"><i class="glyphicon glyphicon-remove"></i>移除</span>
								</td>
								<td>
								<input type="text" id="startTime${vs.index+1}" class="form-control"  placeholder="开始时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" class="form-control Wdate" value='<d:formatDate format="yyyy-MM-dd HH:mm" currentTime="${item.startTime}"/>'/>
								</td>
								<td>
								<input type="text" id="endTime${vs.index+1}" class="form-control"  placeholder="结束时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'#F{$dp.$D(\'startTime${vs.index+1}\')}'})" class="form-control Wdate"  value='<d:formatDate format="yyyy-MM-dd HH:mm" currentTime="${item.endTime}"/>'/>
								</td>
								<td>
								<input type="text" id="sign_time_code${vs.index+1}" class="form-control"  placeholder="默认值为签到本身设置"  value="${ item.sign_time_code}"/>
								</td>
								<td>
								<input type="hidden" id="tid${vs.index+1}" class="form-control" value="${item.id }"/>
								</td>
								<td>
								<input  type="hidden" id="status${vs.index+1}" value="${item.status }">
								</td>
								
							</tr>
						</c:forEach>
						</tbody>
						<tfoot>
								<tr>
									<td colspan="4">
										<span class="btn green newbtncss" onclick = "plus_time()"><i class="glyphicon glyphicon-plus"></i>增加时间段</span>
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
					<!--  =====================end========================= -->
				</div>
			</div>
		</div>
	<input type="hidden" id="id" value="${id }">
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

var count = parseInt("${count}");


	function plus_time(){
		var html = [];
		count = count+1;
		var titleId = "startTime" + count;
		var contentId = "endTime" + count;
		var sign_time_codeId = "sign_time_code" + count;
		var mark = "mark"+count;
		html.push('<tr class="arow">');
		html.push('<td><label id="'+mark+'">签到时间段</label><span class="btn btn-danger btn-xs fl" onclick="removeitem(this)"><i class="glyphicon glyphicon-remove"></i>移除</span></td>');				
		html.push('<td><input type="text" id="'+titleId+'" class="form-control"  placeholder="开始时间" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm\'})" class="form-control Wdate"/></td>');
		html.push('<td><input type="text" id="'+contentId+'" class="form-control"  placeholder="结束时间" onfocus="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm\', minDate:\'#F{$dp.$D('+titleId+')}\'})" class="form-control Wdate"/></td>');
		html.push('<td><input type="text" id="'+sign_time_codeId+'" class="form-control"  placeholder="默认值为签到本身设置" /></td>');

		$("#time").append(html.join(""));
	}

var thi ="";
var tid="";
var remove = function remove(){
	$.ajax({
		type: "post",
		url:  basepath+"/mgr/signin/deletetime.xhtml",
		data: {tid:tid},
		success:function(data){
			$(thi).parent().parent().remove();
		},
		error: function(data){
			alert('删除失败');
		}
	});
	}

	function removeitem(o,id){
		thi = o;
		tid = id;
		var html = '<div style="width:280px;height:40px;text-align:center;"><h3>您确定要删除吗？</h3></div>';
		easyDialog.open({
		    container : {
		    	header : 'ajy温馨提示',
		    	content : html,
		    	yesFn : remove,
		    	noFn : true
		    }
		});
	}
	
	function submit() {
		var i=0;
		var obj = new Object();
		var options = new Array();
		for(j = 1; j<=count; j++){
			var tmp = $("#mark" + j).html();
			if(tmp) {
				var opt = new Object();
				opt.startTimeStr = $("#startTime" + j).val();
				opt.endTimeStr = $("#endTime" + j).val();
				opt.sid = $("#id").val();
				opt.status = $("#status" + j).val();
				opt.id = $("#tid"+j).val();
				opt.sign_time_code = $("#sign_time_code"+j).val();
				options[i] = opt;
				i=i+1;
			}
		}
		obj.id = $("#id").val();
		obj.num = $("#num").val();
		obj.items = options;
		$.ajax({
			type: "POST",
			url:  "${basepath}/mgr/signin/update.xhtml",
			data: JSON.stringify(obj),
			contentType: "application/json; charset=utf-8",
			success:function(data){
						if(data){
							window.location.href = "${basepath }/mgr/signin/index.xhtml";
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
		for(j = 1; j<=count; j++){
			var tmp = $("#mark" + j).html();
			if(tmp) {
				if(!validate("startTime" + j)||!validate("endTime" + j)){
					return;
				}
			}
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

