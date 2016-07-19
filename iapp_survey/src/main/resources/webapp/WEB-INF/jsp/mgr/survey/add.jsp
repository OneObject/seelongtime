<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<title>创建调研</title>
			<meta name="menu_path" content="active.menu_survey"/>
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/mgr/vote/index.xhtml?surveyOrvote=1">调研管理</a></li>
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
						<i class="fa fa-bar-chart-o"></i><span>创建调研</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!-- 添加 start -->
					<div class="mauto">
					<div class="col-md-12">
						<!-- 创建 start-->
						<div class="form">
							<form role="form" id="voteStep1Form" action="${basepath }/mgr/survey/savebasicinfo.xhtml" method="post">
								<div class="form-body">
									<div class="form-group"  id="con_title">
										<label for="biaoti">调研标题</label>
										<input type="text" class="form-control" value="" name="title" id="title" placeholder="调研标题" onchange="v_title();">
										<span class="help-block hidden" id="tip_title">
											调研标题不能为空
										</span>
										<input type="hidden" id="voteId" name="id" value=""/>
									</div>
									<div class="appmsg_edit_item" style="margin-bottom:10px;">
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
													<input type="hidden" id="fileId" name="fileId" value=""/>
													<input type="hidden" id="coverPath" name="cover" value=""/>
												</div>
										</div>
									</div>
									
									<div class="form-group">
										<label>调研说明信息</label>
										<textarea class="form-control" id="voteSummary" name="remark" placeholder="调研说明"></textarea>
									</div>
								</div>
							</form>
						</div>
						
						<!-- 创建 end-->
					</div>
						
					</div>
					
					<!-- 添加 end -->
					<div class="btngroup">
							<div class="btn btn-block btn-success" onclick="saveStep1()">下一步</div>
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
var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var coverSuffix = "${result.coverSuffix}";
</script>
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript"
		src="${basepath }/static/survey/js/survey.js">
</script>
</content>

