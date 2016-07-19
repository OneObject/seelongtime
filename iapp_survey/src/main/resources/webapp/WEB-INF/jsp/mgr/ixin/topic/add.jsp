<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="com.longtime.app.config.Constants"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
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
<title>微信墙管理</title>
<meta name="menu_path" content="active.menu_topic" />
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
		<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">微信墙管理</span></li>
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
						<i class="fa fa-bar-chart-o"></i><span>新建微信墙</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<div class="mauto">
					<div class="col-md-12">
						<!-- 创建 start-->
						<div class="form">
							<form role="form" id="topicForm" action="${basepath }/mgr/topic/save.xhtml" method="post">
								<div class="form-body">
									<div class="form-group">
										<label for="biaoti">标题</label>
										<input type="text" class="form-control" id="topicTitle" name="title" placeholder="">
										<input type="hidden" name="id" value="${entity.id }">
										<span class="help-block" style="display:none;color:red;" id="titleInfo">
											标题不能为空
										</span>
										<span class="help-block" style="display:none;color:red;" id="title2Long">
											标题长度太长了
										</span>
									</div>
									<div class="appmsg_edit_item" style="margin-bottom:10px;">
										<label for="">封面</label>
										<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; padding-bottom:-5px;padding-left:10px;">
											<div class="upload_box">
												<div class="upload_area">
													<input type="file" name="file_upload"  id="file_upload" />
													<ul class="upload_file_box" style="display: none;" id="queue"></ul>
												</div>
											</div>
												<div style="display: none;margin-bottom:20px;" id="small_prev">
													<span id="image_cover"></span><a class="js_removeCover" href="javascript:void(0);"
													onclick="deleteCover();">删除</a>
													<input type="hidden" name="fileId" id="fileId" value="${entity.fileId }"/>
													<input type="hidden" name="coverPath" id="coverPath" value="${entity.coverPath }"/>
												</div>
										</div>
										<span class="help-block" style="display:none;color:red;" id="coverInfo">
											封面不能为空
										</span>
									</div>
									<div class="form-group">
										<label>关键字</label>
										<input type="text" class="form-control" id="topicKeyWords" value="${entity.keywords }" name="keywords" placeholder="">
										<span class="help-block" style="display:none;color:red;" id="keywordsInfo">
											关键字不能为空
										</span>
									</div>
									<div class="form-group">
										<label>是否支持图片</label>
										<div>
										<label >
										<input type="radio" name="supportimage" value="1"     /> 支持&nbsp;&nbsp;&nbsp;
										</label>
										<label >
										<input type="radio" name="supportimage" value="0"  checked="checked"  /> 不支持&nbsp;&nbsp;&nbsp;
										</label>
										</div>
									</div>
									<div class="form-group">
										<label>是否开启审核</label>
										<div>
										<label >
										<input type="radio" name="isaudit" value="0" checked="checked"  /> 关闭审核&nbsp;&nbsp;&nbsp;
										</label>
										<label >
										<input type="radio" name="isaudit" value="1"   /> 开启审核&nbsp;&nbsp;&nbsp;
										</label>
										</div>
									</div>
									<div id="js_ueditor" class="appmsg_edit_item content_edit">
										<label for="" class="frm_label">简介</label>
										<input type="hidden" name="summary" value="" id="topicSummary"/>
										<div id="loading">
											<img alt="正在初始化编辑器，请稍候···" src="${basepath }/static/ixin/img/loading.gif">正在初始化编辑器，请稍候···
										</div>
										<textarea name="后台取值的key" id="myEditor" style="border: #f8f8f8;background-color: #f8f8f8;"></textarea>
										<span class="help-block" style="display:none;color:red;" id="summaryInfo">
											简介不能为空
										</span>
										<span class="help-block" style="display:none;color:red;" id="summary2Long">
											简介长度太长了
										</span>
									</div>
								</div>
							</form>
						</div>
						
						<!-- 创建 end-->
					</div>
						
					</div>
					
					<!-- 添加 end -->
					<div class="btngroup" style="text-align:center;">
							<div class="btn btn-success" onclick="saveTopicInfo();">保存</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript">
var token = "${result.uploadToken}";
//var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var qiniuImageBasePath = "<%=Constants.IMG_SERVER_DOWNLOAD%>";
var coverSuffix = "${result.coverSuffix}";
var summary = "${entity.summary}";
/** 验证关键字 */
function validateFindKey(id){
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	$.ajax({
		type:"post",
		url:basepath+"/mgr/ixinrule/validateaddfindkey.json",
		data:{"skey":value},
		success:function(data){
			var skeyIsExist = data;
			if(skeyIsExist){
				$("#keywordsInfo").html("关键字已存在");
				$("#keywordsInfo").css({"display":"block"});
			}
			if(!skeyIsExist){
				$("#tip_findKeys").html("");
				$("#keywordsInfo").css({"display":"none"});
				$('#topicForm').submit();
			}
		}
	});
}
</script>
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
	<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.all.min.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript" src="${basepath }/static/ixin/js/topic.js"></script>
<script type="text/javascript">
<c:if test="${not empty entity}">
$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${entity.coverPath}"+coverSuffix+"'>");
$("#small_prev").show();
</c:if>
</script>
 </content>