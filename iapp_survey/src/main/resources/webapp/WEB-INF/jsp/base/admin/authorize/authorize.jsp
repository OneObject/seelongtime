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
<title>${className }授权</title>
<c:if test="${rcategory eq 1 }">
	<meta name="menu_path" content="test.testManage" />
</c:if>
<c:if test="${rcategory eq 2 }">
	<meta name="menu_path" content="course.courseManage" />
</c:if>
<c:if test="${rcategory eq 3 }">
	<meta name="menu_path" content="ixin.menu_activity" />
</c:if>
<c:if test="${rcategory eq 4 }">
	<meta name="menu_path" content="ixin.menu_task" />
</c:if>

<link rel="stylesheet"
	href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
<script
	src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript"
	src="${basepath }/static/public/javascripts/authorize.js" charset="gbk"></script>
<script type="text/javascript"
	src="${basepath }/static/public/javascripts/userchoicelist.js"
	charset="gbk"></script>

<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/role.css">
<link rel="stylesheet"
	href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }">首页</a><i
					class="icon-angle-right"></i></li>
				<c:if test="${rcategory eq 1 }">
					<li><a
						href="${basepath }/base/admin/itest/examination/examination.xhtml">${className
							}管理</a><i class="icon-angle-right"></i></li>
				</c:if>
				<c:if test="${rcategory eq 2 }">
					<li><a
						href="${basepath }/base/admin/course/course/course.xhtml">${className
							}管理</a><i class="icon-angle-right"></i></li>
				</c:if>
				<c:if test="${rcategory eq 3}">
					<li><a href="${basepath }/mgr/activity/index.xhtml">${className
							}管理</a><i class="icon-angle-right"></i></li>
				</c:if>
				<c:if test="${rcategory eq 4}">
					<li><a href="${basepath }/mgr/task/taskindex.xhtml">${className
							}管理</a><i class="icon-angle-right"></i></li>
				</c:if>

				<li><span href="#">${className }授权</span></li>
			</ul>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="portlet box purple">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-foursquare"></i>${className }授权：${name } <input
							type="hidden" name="rcategory" id="rcategory" value=${rcategory }>
						<input type="hidden" name="rid" id="rid" value=${rid }> <input
							type="hidden" name="scategory" id="scategory" value=${scategory }>
					</div>
				</div>
				<div class="portlet-body"
					style="overflow: hidden; padding-bottom: 100px;">
					<div class="row">
						<!-- 用户组织选择 -->
						<div class="col-md-12">
							<ul class="nav nav-tabs">
								<li class="<c:out value='${scategory==1 ? "active":"" }' />"><a
									href="#panel1" onclick="authUser()" id="authUser"
									data-toggle="tab">用户授权</a></li>
								<li class="<c:out value='${scategory==2 ? "active":"" }' />"><a
									href="#panel2" onclick="authOrg()" id="authOrg"
									data-toggle="tab">组织授权</a></li>
								<li class="<c:out value='${scategory==5 ? "active":"" }' />"><a
									href="#panel3" onclick="authGroup()" id="authGroup"
									data-toggle="tab">用户组授权</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<!-- 用户授权 -->
							<div
								class="tab-pane <c:out value='${scategory==1 ? "active":"" }' />"
								id="panel1">
								<div class="row" style="margin: 10px;">
									<div class="col-md-12">
										<!-- 添加用户的按钮 -->
										<span class="btn btn-success add_role" onclick="openAdd()"><i
											class="icon-plus"></i>添加用户</span> <span
											class="btn btn-danger add_role" onclick="deleteGroup()"><i
											class="icon-remove"></i>移除用户</span>
									</div>
								</div>
								<div class="row" style="margin: 10px 5px;">
									<div class="col-md-12">

										<input type="hidden" name="userids" id="userids"
											value="${userids }" />
										<!-- 表格内容 -->
										<div id="table_list"></div>
									</div>
								</div>
							</div>

							<!-- 组织授权 -->
							<div
								class="tab-pane  <c:out value='${scategory==2 ? "active":"" }' />"
								id="panel2">
								<div class="col-md-12">
									<!-- 表格内容 -->
									<div id="table_list3"></div>
								</div>
							</div>

							<!-- 用户组授权 -->
							<div
								class="tab-pane  <c:out value='${scategory==5 ? "active":"" }' />"
								id="panel3">
								<div class="row" style="margin: 10px;">
									<div class="col-md-12">
										<span class="btn btn-success add_role" onclick="addgroup()"><i
											class="icon-plus"></i>添加用户组</span> <span
											class="btn btn-danger add_role" onclick="deleteGroup()"><i
											class="icon-remove"></i>移除用户组</span>
									</div>
								</div>
								<div class="col-md-12">
									<div id="table_list5"></div>
								</div>
							</div>
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
			&nbsp;&nbsp;选择用户 <a href="javascript:void(0)" title="关闭窗口" onclick="easyDialog.close();"
				class="close_btn" id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text">
			<table>
				<tr>
					<td><span>用户名:</span> <input type="text" name="susername"
						id="susername"><br></td>
					<td><span>姓名:</span> <input type="text" name="name"
												 id="name"><br></td>
					<td><span>部门:</span> <input type="text" name="orgname"
						id="orgname"></td>
					<td><span class="btn yellow" onclick="pageUser(1)"
						style="margin: 10px;"><i class="icon-search"></i>检索</span></td>
				</tr>
			</table>
			<!-- <span>姓名:</span> <input type="text" name="username" id="username"><br>
            <span>部门:</span> <input type="text" name="orgname" id="orgname">
            <span class="btn yellow" onclick="pageUser(1)"><i   class="icon-search"></i>检索</span> -->

			<!-- 表格 -->
			<div id="table_list2" style="overflow: auto; width: 100%;"></div>

			<div class="easyDialog_footer">
				<button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
				<button class="btn btn-success dialog-btn" onclick="user_exam_add()">确定添加</button>
			</div>
		</div>
	</div>
	<!-- 选择用户弹出层 结束 -->

	<!-- 选择用户组弹出层 开始 -->
	<div id="add_member_dialog2"
		style="display: none; width: 800px; height: 700px; overflow-x: hidden; overflow-y: auto;">
		<h4 class="easyDialog_title" id="easyDialogTitle">
			&nbsp;&nbsp;选择用户组 <a href="javascript:void(0)" title="关闭窗口"
				class="close_btn" id="closeBtn" onclick="easyDialog.close();">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text" style="background-color: #fff;">
			<table>
				<tr>
					<td><span>名称:</span> <input type="text" name="searchcontent"
						id="searchcontent"><br></td>
					<td><span class="btn yellow" onclick="grouplist(1)"
						style="margin: 10px;"><i class="icon-search"></i>检索</span></td>
				</tr>
			</table>
			<!-- 表格 -->
			<div id="table_list6" style="overflow: auto; width: 100%;"></div>

			<div class="easyDialog_footer">
				<button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
				<button class="btn btn-success dialog-btn" onclick="groupadd()">确定添加</button>
			</div>
		</div>
	</div>
	<!-- 选择用户组弹出层 结束 -->


	<script type="text/javascript">
		function checked_all2(obj) {
			if ($(obj).attr("checked") == "checked") {
				$("input[name='groups']").each(function() {
					$(this).attr("checked", "checked");
					$(this).parent().addClass("checked");
				});
			} else {
				$("input[name='groups']").each(function() {
					$(this).removeAttr("checked");
					$(this).parent().removeClass("checked");
				});
			}
		}

		//添加授权信息
		function groupadd() {
			var groupids = new Array();

			$("#add_member_dialog2").find("input:checked").each(function() {
				groupids.push($(this).val());
			});
			if (groupids.length <= 0) {
				alert("您没有选择任何用户组");
				return;
			}
			var temp = $("#userids, #rcategory, #rid, #scategory");
			$.ajax({
				type : "GET",
				url : "${basepath}/base/admin/authorize/doadd.xhtml",
				data : {
					"groupids" : groupids.join(","),
					"rcategory" : $("#rcategory").val(),
					"rid" : $("#rid").val(),
					"scategory" : $("#scategory").val()
				},
				success : function(data) {
					if (data.flag) {
						easyDialog.close();
						group(1);
					} else {
						alert(data.message);
					}
				}
			})
		}
	</script>
</body>
</html>
<content tag="pageCore"> <script type="text/javascript"
	src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<!-- 引用核心js包 --> <script type="text/javascript"
	src="${basepath }/static/public/javascripts/authorize.js" charset="gbk"></script>
<script type="text/javascript"
	src="${basepath }/static/public/javascripts/userchoicelist.js"
	charset="gbk"></script> <script
	src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js"
	type="text/javascript"></script> <script
	src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js"
	type="text/javascript"></script> <script
	src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js"
	type="text/javascript"></script> </content>
<content tag="pageInit"> <!-- 初始化窗口 --> </content>
