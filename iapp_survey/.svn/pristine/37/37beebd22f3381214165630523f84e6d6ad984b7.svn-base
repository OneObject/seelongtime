<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>角色成员</title>
	<meta name="menu_path" content="system.role"/>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/role.css">
</head>
<body>
      <div class="row" >
         <div class="col-md-12">
		    <ul class="page-breadcrumb breadcrumb">
		        <li><i class="icon-home"></i> <a href="javascript:void(0);">首页</a><i class="icon-angle-right"></i></li>
		        <li><a href="${basepath }/base/admin/role/role.xhtml">角色管理</a><i class="icon-angle-right"></i></li>
		        <li><span href="#">角色成员</span></li>
		    </ul>
         </div>
      </div>
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
								<div class="text" id="rolename">${role.name }</div>
								<input type="hidden" name="roleId" id="roleId" value="${role.id }"/>
							<h4><strong>角色备注：</strong></h4>
								<div class="text">${ltfun:html2Text(role.remark, 15)}</div>
								<!-- 添加用户的按钮 -->
							
							<span class="btn btn-success add_role" onclick="pageForChooseUser(1)"><i class="icon-plus"></i>添加用户</span>
							<span class="btn btn-danger add_role" onclick="remove_users()"><i class="icon-remove"></i>移除用户</span>
						</div>
						<div class="col-md-12">
						
	                        <%-- 分页内容 --%>
	                        <div id="table_list" style="margin-top:10px;"></div>

                            <input type="hidden" name="userCheckIds" id="userCheckIds" value="${userIds}"/>
	                        
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 选择用户弹出层 开始 -->
	<div id="add_member_dialog" style="display: none;width:800px;height: 650px">
		<h4 class="easyDialog_title" id="easyDialogTitle">&nbsp;&nbsp;选择用户
			<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
				id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text">
            <div class="row">
                <table style="margin-left:20px;">
                    <tr>
                        <td><label class="control-label">姓名：</label></td>
                        <td><input type="text" value="" name="searchName" id="searchName">&nbsp;&nbsp;</td>
                        <td><label class="control-label">部门：</label></td>
                        <td><input  type="text" name="searchOrg" id="searchOrg">&nbsp;&nbsp;</td>
                        <td><span class="btn yellow" onclick="pageForChooseUser(1)" style="margin-top: 0px;"><i  class="icon-search"></i>检索</span></td>
                    </tr>
                </table>
            </div>
			<!-- <span>姓名:</span> <input type="text" value="" name="searchName" id="searchName"><br>
			<span>部门:</span> <input	type="text" name="searchOrg" id="searchOrg">  
			<span class="btn yellow" onclick="pageForChooseUser(1)"><i	class="icon-search"></i>检索</span> -->
			
            <%-- 分页内容 --%>
            <div id="table_list2" style="overflow: auto;"></div>
            
	        <div class="easyDialog_footer">
	          <button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
	          <button class="btn btn-success dialog-btn" onclick="user_role_add('${role.id}')">确定添加</button>
	        </div>
		</div>
			
	</div>
   <!-- 选择用户弹出层 结束 -->
</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
<script src="${basepath }/static/public/javascripts/roleuser.js" type="text/javascript"></script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script type="text/javascript">

</script>
</content>	
