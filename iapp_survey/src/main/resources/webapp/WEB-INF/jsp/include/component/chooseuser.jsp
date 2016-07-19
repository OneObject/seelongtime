<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script src="${basepath}/static/js/component/chooseuser.js"></script> 
 <!-- 选择用户弹出层 开始 -->
	<div id="choose_user_dialog"
		style="display: none; width: 800px; height: 650px;overflow-x: hidden; overflow-y: auto;background-color: #fff;">
		<h4 class="easyDialog_title" id="easyDialogTitle">
			&nbsp;&nbsp;选择用户 <a href="javascript:void(0)" title="关闭窗口" onclick="easyDialog.close();"
				class="close_btn" id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text" style="padding:0px 20px 10px 20px;">
			<input type="hidden" name="userids" id="userids" value="${userids }" />
			<input type="hidden" name="users" id="users" value="" />
			<table>
				<tr>
					<td><span>用户名:</span> <input type="text" name="susername"
						id="susername"><br></td>
					<td><span>姓名:</span> <input type="text" name="user_name"
												id="user_name"></td>
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
				<button class="btn btn-success dialog-btn" onclick="confirmChooseUser()">确定添加</button>
			</div>
		</div>
	</div>
	<!-- 选择用户弹出层 结束 -->