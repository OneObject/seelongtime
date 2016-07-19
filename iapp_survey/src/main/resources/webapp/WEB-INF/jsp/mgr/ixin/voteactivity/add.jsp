<%@page contentType="text/html; charset=utf-8"%>
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
<title>创建调研活动</title>
<meta name="menu_path" content="active.menu_survey_activity"/>
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" type="text/css"
	href="${basepath}/static/css/active.css">
<link rel="stylesheet"
	href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
<script
	src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/role.css">
<script type="text/javascript"
	src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<%-- <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                 --%><li><a href="${basepath }/mgr/voteactivity/index.xhtml">调研活动管理</a></li>
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
						<i class="fa fa-bar-chart-o"></i><span>创建调研活动</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!-- 添加 start -->
					<div class="mauto">
					<div class="col-md-12">
						<!-- 创建 start-->
						<div class="form">
							<form role="form" id="voteActivityForm" action="${basepath }/mgr/voteactivity/save.xhtml" method="post">
								<div class="form-body">
									<div class="form-group"  id="con_title">
										<label for="biaoti">标题<span class="required">*</span></label>
										<input type="text" class="form-control" value="" name="title" id="title" placeholder="调研活动标题" onchange="v_title();">
										<span class="help-block hidden" id="tip_title">
											标题不能为空
										</span>
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
													<input type="hidden" id="coverPath" name="coverPath" value=""/>
												</div>
										</div>
									</div>
									
									<div class="form-group">
										<label for="biaoti">开始时间</label>
										<input type="text" class="form-control" id="voteStartTime" name="startTimeStr" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', maxDate:'#F{$dp.$D(\'voteEndTime\')}'})">
									</div>
									<div class="form-group">
										<label for="biaoti">结束时间</label>
										<input type="text" class="form-control" id="voteEndTime" name="endTimeStr" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'#F{$dp.$D(\'voteStartTime\')}'})">
									</div>
									
									<div class="form-group">
										<label for="biaoti">发起人/单位</label>
										<input type="text" class="form-control" id="voteAuthor" name="author" placeholder="发起者">
									</div>
									<div class="form-group" id="con_voteSummary">
										<label>简介</label>
										<textarea rows="10" class="form-control" id="voteSummary" name="summary" placeholder="简介"></textarea>
										<div class="col-md-3">
											<span id="tip_voteSummary" class="help-block  hidden" style="">字数不能超过1000字</span>
										</div>
									</div>
									
									<div class="form-group" id="con_voteId">
										<div class="form-group">
											<label>选择调研问卷<span class="required">*</span></label>
											<div class="input-group" onclick="chooseVote();">
			                                    <input name="voteName" id="voteName" readonly="readonly" type="text" class="form-control" value="" placeholder="请选择">
			                                    <input name="voteId" id="voteId" type="hidden" value="" >
			                                    <div class="spinner-buttons input-group-btn">
				                                    <button class="btn default" type="button">
				                                          <span id="choose_vote">选择调研问卷</span>
				                                    </button>
			                                    </div>
			                                 </div>
										</div>
										<div class="col-md-3">
											<span id="tip_voteId" for="voteId" class="help-block " style=""></span>
										</div>
									</div>
									
									<div class="form-group">
										<label for="biaoti">标签(多个标签用逗号隔开)</label>
										<input type="text" class="form-control" id="voteLabels" name="labels" placeholder="标签">
									</div>
									
									<div style="margin-top:15px;margin-bottom:10px;">
										<input id="isOpen" type="checkbox" name="isOpen" value="1">
										<label for="isOpen">公开</label>
										&nbsp;&nbsp;
										<input id="isNotify" type="checkbox"  checked="checked" name="isNotify" value="1">
										<label for="isNotify">通知参与人员</label>
										&nbsp;&nbsp;
										<input id="showresult" type="checkbox"  checked="checked" name="showresult" value="1">
										<label for="showresult">展示结果</label>
										&nbsp;&nbsp;
										<input id="allowAnonymous" type="checkbox"  name="allowAnonymous" value="1">
										<label for="allowAnonymous">允许匿名</label>
										&nbsp;&nbsp;
										<input id="allowUnLogin" type="checkbox"  name="allowUnLogin" value="1">
										<label for="allowUnLogin" title="选中则用户无需登录即可参与调研">开放</label>
									</div>
                           		  </div>
							</form>
						</div>
						<!-- 创建 end-->
					</div>
						
					</div>
					
					<!-- 添加 end -->
					<div class="btngroup">
							<div class="btn btn-block btn-success" onclick="save();">保存</div>
						</div>
				</div>
			</div>
		</div>

	</div>
	
	<!-- 选择用户弹出层 开始 -->
	<div id="add_member_dialog"
		style="display: none; width: 800px; height: 700px; overflow-x: hidden; overflow-y: auto;">
		<h4 class="easyDialog_title" id="easyDialogTitle">
			&nbsp;&nbsp;选择调研问卷 <a href="javascript:void(0)"
				onclick="easyDialog.close();" title="关闭窗口" class="close_btn"
				id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text">
			<table>
				<tr>
					<td>
						<span>问卷标题:</span> 
						<input type="text" name="search" id="search">
						<br>
					</td>
					<td>
					<td>
						<span class="btn yellow" onclick="page(1)"style="margin: 10px;">
						<i class="icon-search"></i>检索
						</span>
					</td>
				</tr>
			</table>

			<!-- 表格 -->
			<div id="table_list2" style="overflow: auto; width: 100%;"></div>

			<div class="easyDialog_footer">
				<button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
				<button class="btn btn-success dialog-btn" onclick="select_vote()">确定添加</button>
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

var voteSummary = $("#voteSummary").val();




</script>
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript" src="${basepath }/static/ixin/js/voteactivityadd.js"></script>
 </content>

