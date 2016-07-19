<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
<script src="${basepath}/static/js/component/chooseorg.js"></script> 
<div id="choose_org_dialog" style="display: none;padding-bottom:10px; overflow-x: hidden; overflow-y: auto;background-color: #fff;">
	<input type="hidden" name="oids" id="oids" value="" />
	<h4 class="easyDialog_title" id="easyDialogTitle">
		&nbsp;&nbsp;选择组织 <a href="javascript:void(0)" title="关闭窗口" onclick="easyDialog.close();"
			class="close_btn" id="closeBtn">&times;&nbsp;&nbsp;</a>
	</h4>
	<div class="zTreeDemoBackground left" style="width:400px;">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div class="easyDialog_footer">
	    <button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
         <button class="btn btn-success dialog-btn" onclick="confirmChooseOrg();">确定添加</button>
	</div>
</div>