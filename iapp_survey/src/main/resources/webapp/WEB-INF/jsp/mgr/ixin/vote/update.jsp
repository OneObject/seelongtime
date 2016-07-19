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
<title>修改管理</title>
	<meta name="menu_path" content="active.menu_survey"/>
	<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<%-- <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                 --%><li><a href="${basepath }/mgr/vote/index.xhtml?">调研问卷管理</a></li>
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
						<i class="fa fa-bar-chart-o"></i><span>修改调研问卷</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!-- 添加 start -->
					<div class="mauto">
					<div class="col-md-12">
						<!-- 修改 start-->
						<div class="form">
							<form role="form" id="voteForm" action="${basepath }/mgr/vote/updatesave.xhtml" method="post">
								<div class="form-body">
									<div class="form-group"  id="con_title">
										<label for="biaoti">标题</label>
										<input type="text" class="form-control" value="${entity.title }" id="title" name="title" placeholder="标题" onblur="v_title();">
										<span class="help-block" style="display:none;" id="tip_title">
											标题不能为空
										</span>
										<input type="hidden" id="voteId" name="id" value="${entity.id }"/>
									</div>
									<%-- <div class="appmsg_edit_item" style="margin-bottom:10px;">
										<label for="">封面
											<!-- <p class="js_cover_tip tips r">建议尺寸：360像素 * 200像素</p> -->
										</label>
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
													<input type="hidden" id="fileId" name="fileId" value="${entity.fileId }"/>
													<input type="hidden" id="coverPath" name="coverPath" value="${entity.coverPath }"/>
												</div>
										</div>
									</div> --%>
									
									<div class="form-group"  id="con_voteSummary">
										<label>简介</label>
										<textarea rows="6" class="form-control" id="voteSummary" name="summary" placeholder="简介">${entity.summary }</textarea>
										<div class="col-md-3">
												<span id="tip_voteSummary" class="help-block  hidden" style="">字数不能超过200字</span>
										</div>
									</div>
								</div>
							</form>
						</div>
						
						<!-- 修改 end-->
					</div>
						
					</div>
					
					<!-- 添加 end -->
					<div class="btngroup">
						<div class="btn btn-block btn-warning" onclick="saveUpdate()">下一步</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		var token = "${result.uploadToken}";
	</script>
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript">
var qiniuImageBasePath = "<%=Constants.IMG_SERVER_DOWNLOAD%>";
var coverSuffix = "${result.coverSuffix}";
/* <c:if test="${not empty entity}">
$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${entity.coverPath}"+coverSuffix+"'>");
$("#small_prev").show();
</c:if> */

</script>
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${basepath }/static/ixin/js/vote.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 

 </content>

