<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "No-cache");
	response.setDateHeader("Expires", -1);
	response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>消息发送</title>
<meta name="menu_path" content="system.innermessage" />
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/course.css">
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css">

<style type="text/css">
.form-horizontal .control-label,.form-horizontal .radio,.form-horizontal .checkbox,.form-horizontal .radio-inline,.form-horizontal .checkbox-inline
	{
	padding-top: 0px;
}
</style>
</head>
<body>

	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i
					class="icon-angle-right"></i></li>
				<li><span href="#">消息发送</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-reorder"></i><span id="addinfo">新增信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						<div class="form-body">
							<!-- BEGIN FORM-->
							<form id="form_sample_2" class="form-horizontal">
								<div class="form-group" id="con_title">
									<label class="control-label col-md-3">标题<span
										class="required">*</span></label>
									<div class="col-md-6">
										<input type="text" name="title" id="title" data-required="1"
											class="form-control" />
									</div>
									<div class="col-md-3">
										<span id="tip_title" for="title" class="help-block" style="">必填</span>
									</div>
								</div>

								<div class="form-group" id="con_content">
									<label class="control-label col-md-3">内容<span
										class="required">*</span></label>
									<div class="col-md-6">
										<textarea rows="4" cols="" name="content" id="content"
											data-required="1" class="form-control mytextarea"> </textarea>
									</div>
									<div class="col-md-3">
										<span id="tip_content" for="content" class="help-block"
											style="">必填</span>
									</div>
								</div>

								<div class="form-group" id="con_url">
									<label class="control-label col-md-3">原文地址 </label>
									<div class="col-md-6">
										<input type="text" name="url" id="url" data-required="1"
											class="form-control" />
									</div>
								</div>

								<div class="form-group" id="con_platform">
									<label class="control-label col-md-3" style="margin-top: 5px;">范围</label>
									<div class="col-md-6">
										<label style="height: 22px; line-height: 22px;"> <span
											class="checked"
											style="margin-left: 0px; position: relative; top: 3px;">
												<input type="checkbox" name="inner" value="0" id="inner">
										</span> 站内信&nbsp;&nbsp;&nbsp;
										</label> <label style="height: 22px; line-height: 22px;"> <span>
												<input type="checkbox" style="margin-left: 0px;" name="ios"
												value="1" id="ios">
										</span> ios&nbsp;&nbsp;&nbsp;
										</label> <label style="height: 22px; line-height: 22px;"> <span>
												<input type="checkbox" style="margin-left: 0px;"
												name="android" value="2" id="android">
										</span> android&nbsp;&nbsp;&nbsp;
										</label>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-md-3">是否公开</label>
									<div class="col-md-6">
										<div class="switch">
											<input type="checkbox" checked id="myswitch3" value="1" />
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-md-3">是否全站公开</label>
									<div class="col-md-6">
										<label>
											<div class="radio">
												<span><input type="radio" style="margin-left: 0px;"
													checked="checked" value="0" name="isopen"></span>
											</div>公开&nbsp;&nbsp;&nbsp;
										</label> <label>
											<div class="radio">
												<span><input type="radio" style="margin-left: 0px;"
													value="1" name="isopen"></span>
											</div>不公开&nbsp;&nbsp;&nbsp;
										</label>
									</div>
								</div>
								<div class="form-group" id="selectuser" style="display: none;">
									<label class="control-label col-md-5"> </label>
									<div class="col-md-5">
										<div class="tab-pane" id="panel1">
											<div class="row" style="margin: 10px;">
												<div class="col-md-12">
													<!-- 添加用户的按钮 -->
													<span class="btn btn-success add_role" onclick="openAdd()"><i
														class="icon-plus"></i>添加用户</span> <span
														class="btn btn-danger add_role" onclick="deleteGroup()"><i
														class="icon-remove"></i>移除用户</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group" style="margin: 10px 50px;">
									<div class="col-md-10">

										<input type="hidden" name="userids" id="userids"
											value="${userids }" />
										<!-- 表格内容 -->
										<div id="table_list"></div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-offset-3 col-md-9" style="margin-left: 80%;">
										<button type="button" id="subButton" class="btn green"
											onclick="send();">发送</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>

	<!-- 选择用户弹出层 开始 -->
	<div id="add_member_dialog"
		style="display: none; width: 800px; height: 700px; overflow-x: hidden; overflow-y: auto;">
		<h4 class="easyDialog_title" id="easyDialogTitle">
			&nbsp;&nbsp;选择用户 <a href="javascript:void(0)"
				onclick="easyDialog.close();" title="关闭窗口" class="close_btn"
				id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text">
			<table>
				<tr>
					<td><span>用户名:</span> <input type="text" name="susername"
						id="susername"><br></td>
					<td><span class="btn yellow" onclick="pageUser(1)"
						style="margin: 10px;"><i class="icon-search"></i>检索</span></td>
				</tr>
			</table>
			<!-- 表格 -->
			<div id="table_list2" style="overflow: auto; width: 100%;"></div>

			<div class="easyDialog_footer">
				<button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
				<button class="btn btn-success dialog-btn"
					onclick="user_exam_add(1)">确定添加</button>
			</div>
		</div>
	</div>


	<script type="text/javascript"
		src="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js"></script>

	<script type="text/javascript">
		$(function() {
			$("#myswitch3").bootstrapSwitch({
				onText : "是",
				offText : "否"
			});

			$("#myswitch3").on('switchChange.bootstrapSwitch',
					function(event, state) {
						if (state.value) {
							$("#selectuser").css('display', 'none');
							$(this).val('1');
						} else {
							$("#selectuser").css('display', 'block');
							$(this).val('0');
						}
					});
		});

		function getBytesCount(str) {
			var bytesCount = 0;
			if (str != null) {
				for ( var i = 0; i < str.length; i++) {
					var c = str.charAt(i);
					if (c.match(/[^\x00-\xff]/ig) != null) //全角
					{
						bytesCount += 2;
					} else {
						bytesCount += 1;
					}
				}
			}
			return bytesCount;
		}

		/**
		 *发送消息
		 */
		function send() {
			var title = $.trim($("#title").val());
			var content = $.trim($("#content").val());

			if (title == null || title == "") {
				$("#con_title").addClass("has-error");
				return;
			} else {
				$("#con_title").removeClass("has-error");
			}
			if (getBytesCount(title) >= 255) {
				$("#con_title").addClass("has-error");
				$("#tip_title").html("消息标题过长！");
				return;
			} else {
				$("#tip_title").html("必填");
				$("#con_title").removeClass("has-error");
			}

			if (content == null || content == "") {
				$("#con_content").addClass("has-error");
				return;
			} else {
				$("#con_content").removeClass("has-error");
			}
			if (getBytesCount(content) >= 255) {
				$("#con_content").addClass("has-error");
				$("#tip_content").html("消息内容过长！");
				return;
			} else {
				$("#tip_content").html("必填");
				$("#tip_content").removeClass("has-error");
			}

			var url = $.trim($("#url").val());
			var type = $("#myswitch3").val();
			var platform = "";

			var inner = $("#inner").is(':checked');
			var ios = $("#ios").is(':checked');
			var android = $("#android").is(':checked');
			if (inner) {
				platform += $("#inner").val();
			}
			if (ios) {
				platform += $("#ios").val();
				if (url == null || url == "") {
					myAutoHideDialog("请填写原文地址！", "warn");
					return;
				}
			}
			if (android) {
				platform += $("#android").val();
				if (url == null || url == "") {
					myAutoHideDialog("请填写原文地址！", "warn");
					return;
				}
			}
			if (!inner && !ios && !android) {
				myAutoHideDialog("请选择发送范围！", "warn");
				return;
			}

			if ($("#myswitch3").val() == 0) {//不公开
				var num = 0;
				var ids = $.trim($("#userids").val());
				var arr = new Array();
				arr = ids.split(',');//注split可以用字符或字符串分割
				for ( var i = 0; i < arr.length; i++) {
					if ($.trim(arr[i]) != null && $.trim(arr[i]) != "") {
						num++;
					}
				}
				if (num == 0) {
					myAutoHideDialog("没有接收用户！", "warn");
					return;
				}
			}
			var userids = $("#userids").val();
			var isopen = $('input[name="isopen"]:checked').val();
			$.ajax({
				type : "POST",
				url : "${basepath}/base/admin/message/send.json",
				data : {
					title : title,
					content : content,
					platform : platform,
					isopen : isopen,
					url : url,
					type : type,
					userids : userids,
				},
				success : function(data) {
					if (data.status) {
						myAutoHideDialog("发送成功！");
						location.reload();
					}
				}
			});
		}

		/**
		 * 全部选中
		 */
		function checked_all(obj) {
			if ($(obj).attr("checked") == "checked") {
				$("input[name='ids']").each(function() {
					$(this).attr("checked", "checked");
					//	$(this).parent().addClass("checked");
				});
			} else {
				$("input[name='ids']").each(function() {
					$(this).removeAttr("checked");
					//	$(this).parent().removeClass("checked");
				});
			}
		}

		/** 添加用户弹出框 */
		function openAdd() {
			pageUser(1);
			easyDialog.open({
				container : 'add_member_dialog',
				fixed : false
			});
		}

		/**
		 * 未选择的用户：分页
		 */
		function pageUser(i, fieldId) {
			var divId = "table_list2";
			var max = $("#" + divId + " #page_max").val()
			var data = {
				"page" : i,
				"max" : max,
				"r" : Math.random(),
				"username" : $("#susername").val(),
				"userids" : $("#userids").val()
			};
			var url = basepath + "/base/admin/message/chooseuser.list";
			$("#" + divId).load(encodeURI(url), data, function() {
			});
		}

		//var tempIds = "";
		/**
		 * 全部选中
		 */
		function itemSelectAll() {
			var itemSelectAll = document.getElementById("itemSelectAll");
			var items = document.getElementsByName("uids");
			var userids = $("#userids").val();
			if (itemSelectAll.checked == true) {
				var ids = "";
				for ( var i = 0; i < items.length; i++) {
					items[i].checked = true;
					ids += items[i].value + ",";
				}
				userids += "," + ids;
			} else {
				for ( var i = 0; i < items.length; i++) {
					items[i].checked = false;
					userids = userids.replace(new RegExp(items[i].value, "g"),
							"");
				}
			}
			$("#userids").val(userids);
		}

		/*选中单个
		 */
		function selectUser(thi) {
			var userids = $("#userids").val();
			if ($(thi).attr('checked')) {
				userids += "," + $(thi).val();
			} else {
				userids = userids.replace(new RegExp($(thi).val(), "g"), "");
			}
			$("#userids").val(userids);
		}

		function saveCheck(insertValue) {
			var userids = $("#userids").val();
			var data = userids.split(",");
			for ( var i = 0; i < data.length; i++) {
				if (data[i] == insertValue) {
					return true;
				}
			}
			return false;
		}

		function user_exam_add(num) {
			var result = $("#userids").val();
			if (isBlank(result)) {
				mySureDialog("您没有选择任何用户！");
				return;
			}
			page(num);
		}

		/**
		 *已选用户
		 */
		function page(i) {
			var divId = "table_list";
			var url = basepath + "/base/admin/message/user.xhtml";
			var max = $("#" + divId + " #page_max").val()
			var data = {
				"page" : i,
				"max" : max,
				"r" : Math.random(),
				"userids" : $("#userids").val()
			};
			$("#" + divId).load(encodeURI(url), data, function() {
				easyDialog.close();
			});
		}

		/**
		 * 单个删除
		 * @param id
		 */
		function deleteSingle(id) {
			var matterIds = $("#userids").val();
			var data = matterIds.split(",");

			var tempFn = function() {
				for ( var i = 0; i < data.length; i++) {
					if (data[i] == id) {
						matterIds = matterIds.replace(data[i] + ",", "");
					}
				}
				$("#userids").val(matterIds);
				//$("#tr_" + id).remove();
				page(1);
			}
			var html = "<div style='width:300px;height:50px;text-align:center;'>确定要移除吗？</div>";
			easyDialog.open({
				container : {
					header : '提示',
					content : html,
					yesFn : tempFn,
					noFn : true
				}
			});
		}

		/**
		 * 批量删除
		 */
		function deleteGroup() {
			var matterIds = $("#userids").val();
			var data = matterIds.split(",");
			var iditems = $("input[name='ids']:checked");

			var tempFn = function() {
				for ( var i = 0; i < data.length; i++) {
					for ( var j = 0; j < iditems.length; j++) {
						if (data[i] == iditems[j].id) {
							matterIds = matterIds.replace(data[i] + ",", "");
							//$("#tr_" + data[i]).remove();
						}
					}
				}
				$("#userids").val(matterIds);
				page(1);
			}

			if (iditems.length == 0) {
				myAutoHideDialog("没有选中任何记录！", "warn");
			} else {
				var html = "<div style='width:300px;height:50px;text-align:center;'>确定要移除"
						+ iditems.length + "条记录吗？</div>";
				easyDialog.open({
					container : {
						header : '提示',
						content : html,
						yesFn : tempFn,
						noFn : true
					}
				});
			}
		}
	</script>
</body>
</html>
<content tag="pageCore"> </content>
<content tag="pageInit"> <!-- 初始化窗口 --> </content>
