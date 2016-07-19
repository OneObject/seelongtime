<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>新建练习</title>
<meta name="menu_path" content="test.practiceManage" />
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet"
	href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
<link rel="stylesheet" href="${basepath}/static/css/active.css">
<script
	src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script language="javascript" type="text/javascript"
	src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/testmanage.css">
<link
	href="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css"
	rel="stylesheet">
<script
	src="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js"></script>
<script src="${basepath}/static/itest/admin/practice.js"></script>
<style type="text/css">
div.checker,div.checker span,div.checker input {
	width: auto;
	height: auto;
}
</style>
<script type="text/javascript">
	function resizeheightforedite(o) {
		$(".edite-img").height($(o).height());
		$(".edite-img").attr(
				"style",
				"margin-top:-" + $(o).height() + "px;height:" + $(o).height()
						+ "px;line-height:" + $(o).height() + "px;");
	}
	function showother() {
		$(".othermsg").slideToggle("fast");
		$(".moremsg").slideToggle("fast");
		$(".moremsg-up").slideToggle("fast");
	}
</script>
</head>
<body>
	<!-- 创建练习基本信息 -->
	<!-- BEGIN PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a
					href="${basepath }/base/admin/itest/practice/practice.xhtml">练习管理</a><i
					class="icon-angle-right"></i></li>
				<li><span href="#">新建练习</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="col-md-12">
		<!-- BEGIN VALIDATION STATES-->
		<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-bookmark-o"></i><span>基本信息</span>
				</div>
			</div>
			<div class="portlet-body form box_box">
				<div class="col-md-12" id="course_info">
					<ul class="stemp-box" style="width: 590px;">
						<li class="tep-left"><img
							src="${basepath}/static/img/step-left.png"></li>
						<li class="current-step" onclick="next1('${tid}');">1</li>
						<li class="step-xian${stepStatus['2'] ?'-lv':'' }"></li>
						<li class="${stepStatus['2'] ?'over':'nor' }-step"
							onclick="next2('${tid}');">2</li>
						<li class="tep-right"><img
							src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
						</li>
					</ul>
					<div class="preview-style">
						<div class="portlet-body form" style="overflow: hidden;">
							<form id="addForm" method="post" class="form-horizontal"
								role="form" action="${basepath }/mgr/itest/practice/doadd.xhtml">
								<div class="form-body">
									<div class="form-group" id="con_Name">
										<label class="col-md-2 control-label">练习名称:<span
											class="required">*</span></label>
										<div class="col-md-10">
											<input type="text" class="form-control" name="Name"
												id="Name" value="${practice.name }"
												placeholder="不能为空" onchange="validateName();">
										</div>
									</div>
									<div class="form-group" id="con_itemblank">
										<label class="col-md-2 control-label">练习题库:</label>
										<div class="col-md-10">
											<div class="input-group" onclick="page(1)">
												<input type="text" class="form-control" placeholder="请选择题库"
													readonly="readonly" id="itemblank_name"
													name="itemblankname" value="${itemNames}"> <span
													class="input-group-addon chose_coursewear"> <i
													class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择 <input
													type="hidden" name="itemblankid" id="itemblankid"
													value="${itemIds }">
												</span>
											</div>
										</div>
									</div>
									<div class="form-group" id="con_total">
										<label class="col-md-2 control-label">题目总数<span
											class="required">*</span></label>
										<div class="col-md-10">
											<input type="text" class="form-control" name="total"
												value="${practice.total }" id="total" placeholder="10"
												onchange="validateTotal();">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">练习图片：</label>
										<div class="col-sm-10">
											<c:if test="${not empty practice.cover }">
												<img
													src="<%=Constants.IMG_SERVER_DOWNLOAD%>${practice.cover}-320x180"
													id="exam-poster" class="img-responsive"
													style="width: 320px; height: 180px;">
											</c:if>
											<c:if test="${empty practice.cover}">
												<img src="" id="exam-poster" class="img-responsive"
													style="width: 320px; height: 180px; display: none;">
											</c:if>
											<input id="file_upload" class="form-control"
												name="file_upload" type="file"> <input type="hidden"
												id="cover" name="cover" value="${practice.cover }">
											<input id="path" type="hidden" name="path"
												value="<%=Constants.IMG_SERVER_DOWNLOAD%>">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">练习简介</label>
										<div class="col-md-10">
											<input type="hidden" id="hid_content" name="hid_content"
												value="">
											<textarea name="content" id="exam-content"
												style="border: #f8f8f8; background-color: #f8f8f8;">${practice.content}</textarea>
										</div>
									</div>
									<div class="form-group" style="text-align: right">
										<input type="hidden" name="id" value="${practice.id }" /> <span
											class="btn btn-success" onclick="add();"><i
											class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;下一步</span>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 弹出题库的界面 -->
	<div id="chooseQuestion"
		style="width: 800px; height: 700px; display: none;">
		<h4 class="easyDialog_title" id="easyDialogTitle">
			&nbsp;&nbsp;<span id="edTitle">选择试题</span> <a
				href="javascript:void(0)" title="关闭窗口" class="close_btn"
				onclick="easyDialog.close()" id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text hidden form-horizontal" id="testQuestion"
			style="">
			<div class="row">
				<table style="margin-left: 20px;">
					<tr>
						<td>试题名称:</td>
						<td><input type="text" id="searchContent"
							name="searchContent" style="width: 100px;">&nbsp;&nbsp;</td>
						<td>题库:</td>
						<td><span class="btn yellow" onclick="page(1)"
							style="margin-top: 0px; margin-right: 12px;"><i
								class="icon-search"></i>检索</span></td>
					</tr>
				</table>
			</div>
			<!-- 表格 -->
			<div id="table_list" style="overflow: auto;"></div>

			<div class="easyDialog_footer">
				<button class="btn default dialog-btn" onclick="easyDialog.close()"
					style="margin-top: 0px;">关闭</button>
				<button class="btn btn-success dialog-btn" onclick="saveChoice()"
					style="margin-top: 0px;">确定选择</button>
			</div>
		</div>
		</div>


		<!-- 弹出层显示树状结构的部门 -->
		<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js"
			type="text/javascript"></script>
		<script type="text/javascript"
			src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
		<script type="text/javascript"
			src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.all.min.js"></script>
		<script type="text/javascript">
			$("#file_upload").uploadify({
				'formData' : {
					'token' : "${uptoken}",
				},
				'fileObjName' : 'file',
				'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
				'buttonClass' : 'upload_access',
				'swf' : basepath + '/static/ixin/css/uploadify.swf',
				//'uploader' : 'http://up.qiniu.com/',
				'uploader' : uploadurl,
				'fileTypeDesc' : '图片文件',
				'fileTypeExts' : '*.gif; *.jpg; *.png',
				'onUploadSuccess' : function(file, data, response) {
					var result = eval("(" + data + ")");
					var path = $("#path").val() + result.hash;
					$("#exam-poster").attr("src", path + "-320x180");
					$("#exam-poster").show();
					$("#cover").val(result.hash);
				}
			});
			//var editor = UE.getEditor('exam-content');
			var editor = UE.getEditor('exam-content',{
				wordCount:true         //是否开启字数
		        ,maximumWords:100       //允许的最大字符数    
			});
			//   ,wordCount:false          //是否开启字数统计
        //,maximumWords:10000       //允许的最大字符数
		</script>
</body>
</html>
