<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>组织管理</title>
	<meta name="menu_path" content="system.role"/>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/role.css">
</head>
<body>
	<ul class="page-breadcrumb breadcrumb">
		<li><i class="icon-home"></i> <a href="javascript:void(0);">首页</a>
			<i class="icon-angle-right"></i></li>
		<li><a href="#">用户角色列表</a><i class="icon-angle-right"></i></li>
		<li>
			<a href="#">权限详情</a>
		</li>
        <!--          <li class="pull-right">
                     <div id="dashboard-report-range" class="dashboard-date-range tooltips" data-placement="top" data-original-title="Change dashboard date range">
                        <i class="icon-calendar"></i>
                        <span></span>
                        <i class="icon-angle-down"></i>
                     </div>
                  </li>-->
	</ul>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box purple">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-foursquare"></i>角色成员
					</div>
				</div>
				<div class="portlet-body">
					
					<div class="row">
						<div class="col-md-12 role_detail add_box role_detail_text">
							<h4><strong>角色名称：</strong></h4>
								<div class="text">${role.name }</div>
							<h4><strong>角色备注：</strong></h4>
								<div class="text">${role.remark }</div>
								<!-- 添加用户的按钮 -->
							
							<span class="btn btn-success add_role" onclick="openAdd()"><i class="icon-plus"></i>添加用户</span>
							<span class="btn btn-danger add_role" onclick="remove_users()"><i class="icon-remove"></i>移除用户</span>
						</div>
						<div class="col-md-12">
							<table class="table table-striped table-bordered table-advance table-hover">
								<thead>
									<tr>
										<th>
											<input type="checkbox" onclick="checked_A()">
										</th>
										<th>序号</th>
										<th>用户名称</th>
										<th>用户账号</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								 <c:forEach items="${list }" var="entity" varStatus="state">
								 	<tr>
										<td>
											<input type="checkbox" name="uids" value="${entity.id }">
										</td>
										<td>${state.count }</td>
										<td>${entity.userId.nickName }</td>
										<td>${entity.userId.username }</td>
										<td>
											<span class="anniu" onclick="user_role_delete('${entity.id }')">
												<i class="icon-remove"></i>移除
											</span>
										</td>
									</tr>
								 
								 </c:forEach>
									
								</tbody>
							</table>
							<ul class="pagination" id="list_pages">
				  				<!-- 分页显示的位置 -->
				  			</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 选择用户弹出层 开始 -->
	<div id="add_member_dialog" style="display: none;">
		<h4 class="easyDialog_title" id="easyDialogTitle">&nbsp;&nbsp;选择用户
			<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
				id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text">
			<span>姓名:</span> <input type="text" value=""><br>
			<span>部门:</span> <input	type="text"> 
			<span class="btn yellow"><i	class="icon-search"></i>检索</span>
			<table class="table table-striped table-bordered table-advance table-hover">
				<thead>
				
				
					<tr>
						<th>
							<input type="checkbox" onclick="checked_all()">
						</th>
						<th>序号</th>
						<th>账号</th>
						<th>名称</th>
						<th>部门</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${userlist }" var="user" varStatus="state">
					<tr>
						<td>
						
							<c:if test="${fn:containsIgnoreCase(userIds, user.id)}">
								<input type="checkbox" name="ids" value="${user.id }" checked="checked">
							</c:if>
							<c:if test="${!fn:containsIgnoreCase(userIds, user.id)}">
								<input type="checkbox" name="ids" value="${user.id }">
							</c:if>
						</td>
						<td>
							<span>${state.count }</span>
						</td>
						<td>
							<span>${user.username }</span>
						</td>
						<td>
							<span>${user.nickName }</span>
						</td>
						<td>
							<span>${user.organization.name }</span>
						</td>
					</tr>
				
				</c:forEach>
				</tbody>
			</table>
			<ul class="pagination" id="list_pages">
		  		<!-- 分页显示的位置 -->
		  	</ul>
		  	<div class="easyDialog_footer">
		      <button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
		      <button class="btn btn-success dialog-btn" onclick="user_role_add('${role.id}')">确定添加</button>
		    </div>
		</div>
		<!-- 选择用户弹出层 结束 -->
			
	</div>
</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
<script src="${basepath }/static/public/javascripts/role.js" type="text/javascript"></script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script type="text/javascript">
function openAdd(){
	easyDialog.open({
		  container : 'add_member_dialog',
		  fixed : false
		});

}
</script>
</content>	
