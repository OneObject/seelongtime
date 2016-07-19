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
<title>投票管理</title>
<meta name="menu_path" content="active.menu_vote"/>
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
				 --%><li><a href="${basepath }/mgr/vote/index.xhtml">投票管理</a></li>
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
						<i class="fa fa-bar-chart-o"></i><span>编辑题目</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!-- 添加 start -->
					<div class="mauto">
					<div class="col-md-12">
						<!-- 创建 start-->
						<div class="form" >
							<form role="form" id="questionForm" enctype="multipart/form-data" method="post">
								<div class="form-body">
									<div class="form-group" >
									<!-- 暂时无用 start-->
										<label>选择题目类型</label>
										<div class="radio-list">
											<label class="radio-inline">
												<input type="radio" name="questionType" value="1"  <c:if test="${empty question || question.type == 1 }">checked="checked"</c:if> > 单选题</label>
												<label class="radio-inline">
												<input type="radio" name="questionType" value="2" <c:if test="${question.type == 2 }">checked="checked"</c:if>> 多选题</label>
										</div>
										<!-- 暂时无用 end-->
									</div>
									<div id="voteContent">
										<div class="form-group" id="con_questionTitle">
											<label>题目名称</label>
											<input type="hidden" id="questionId" value="${question.id}"/>
											<input type="text" class="form-control" name="voteQuestionTitle" id="questionTitle" placeholder="题目名称" value="${question.title }" onchange="v_questionTitle();">
											<span class="help-block hidden" id="tip_questionTitle">题目名称不能为空</span>
										</div>
										<div class="row">
											<div class="col-md-6 form-group "  id="con_maxChooseNum" <c:if test="${question.type ne 2 }">style="display: none;"</c:if>>
												<label>最多选择个数</label>
												<input type="text" class="form-control" name="maxChooseNum" id="maxChooseNum" placeholder="设置最多选择数，默认为0，代表无限制" value="${question.maxChooseNum }" onchange="v_maxChooseNum();">
											</div>
											<div class="col-md-6 form-group"  id="con_minChooseNum" <c:if test="${question.type ne 2 }">style="display: none;"</c:if>>
												<label>最少选择个数</label>
												<input type="text" class="form-control" name="minChooseNum" id="minChooseNum" placeholder="设置最少选择数，默认为0，代表无限制，但最少要选一项" value="${question.minChooseNum }"  onchange="v_minChooseNum();">
											</div>											
										</div>
										<div class="form-group " id="vote_options">
											<label>选项</label>
											
											<c:if test="${empty question.options  }">
												<div class="input-group mt5" id="option_1">
													<input type="hidden" id="optionId_1" value=""/>
													<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; margin-bottom:6px; padding-bottom:-5px;padding-left:10px;">
														<div class="upload_box">
															<div class="upload_area">
																<input type="file" id="file_upload_1" />
																<ul class="upload_file_box" style="display: none;" id="queue"></ul>
															</div>
														</div>
														<div style="display: none;margin-bottom:20px;" id="small_prev_1">
															<span id="image_cover_1"></span>
															<a class="js_removeCover" href="javascript:void(0);" onclick="deleteCover('1');">删除</a>
															<input type="hidden" id="fileId_1"  value=""/>
															<input type="hidden" id="coverPath_1" value=""/>
														</div>
													</div>
													<input type="text" class="form-control" id="option_title_1">
													<span class="input-group-btn">
														<button class="btn red" type="button"  onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>
													</span>
												</div>
												<div class="input-group mt5" id="option_2">
													<input type="hidden" id="optionId_2" value=""/>
													<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; margin-bottom:6px; padding-bottom:-5px;padding-left:10px;">
														<div class="upload_box">
															<div class="upload_area">
																<input type="file" id="file_upload_2" />
																<ul class="upload_file_box" style="display: none;" id="queue"></ul>
															</div>
														</div>
														<div style="display: none;margin-bottom:20px;" id="small_prev_2">
															<span id="image_cover_2"></span>
															<a class="js_removeCover" href="javascript:void(0);" onclick="deleteCover('2');">删除</a>
															<input type="hidden" id="fileId_2"  value=""/>
															<input type="hidden" id="coverPath_2" value=""/>
														</div>
													</div>
													<input type="text" class="form-control" id="option_title_2">
													<span class="input-group-btn">
														<button class="btn red" type="button"  onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>
													</span>
												</div>
											
											</c:if>
											<c:if test="${not empty question.options  }">
											<c:forEach items="${question.options }" var="option" varStatus="vs">
												<div class="input-group mt5" id="option_${vs.index+1 }">
													<input type="hidden" id="optionId_${vs.index+1 }" value="${option.id }"/>
													<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; margin-bottom:6px; padding-bottom:-5px;padding-left:10px;">
														<div class="upload_box">
															<div class="upload_area">
																<input type="file" id="file_upload_${vs.index+1 }" />
																<ul class="upload_file_box" style="display: none;" id="queue"></ul>
															</div>
														</div>
														<div style="display: none;margin-bottom:20px;" id="small_prev_${vs.index+1 }">
															<span id="image_cover_${vs.index+1 }"></span>
															<a class="js_removeCover" href="javascript:void(0);" onclick="deleteCover('${vs.index+1 }');">删除</a>
															<input type="hidden" id="fileId_${vs.index+1 }"  value="${option.fileId }"/>
															<input type="hidden" id="coverPath_${vs.index+1 }" value="${option.coverPath }"/>
														</div>
													</div>
													
													<input type="text" class="form-control" id="option_title_${vs.index+1 }" value="${option.title }">
														<span class="input-group-btn">
															
															<button class="btn red" type="button"  onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>
														</span>
													
												</div>
											</c:forEach>
											
											</c:if>
										</div>
										<div class="form-group" style="text-align: center;">
											<!--  <div class = "btn btn-success" style="width:45%" onclick="savequestion()"><i class="fa fa-plus" ></i>&nbsp;保存该题</div>-->
											<div class = "btn btn-success" onclick="addOption()" id="addoptions" style="width:45%"><i class="fa fa-plus"></i>&nbsp;添加选项</div>
										</div>
									</div>
								</div>
							</form>
		                    <div class="btngroup">
	                            <div class="btn btn-block btn-success" onclick="savevotequestion()">保存编辑</div>
	                        </div>
						</div>
						
						<!-- 创建 end-->
					</div>
						
					</div>
					
					<!-- 添加 end -->
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<content tag="pageCore"> 
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
var voteId = "${vote.id}";
var token = "${result.uploadToken}";
//var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var qiniuImageBasePath = "<%=Constants.IMG_SERVER_DOWNLOAD%>";
var coverSuffix = "${result.coverSuffix}";
var id = $("#questionForm").find("input:last").attr("id");
var lenth = id.length;
var count = parseInt(id.substring(13,lenth));//记录动态产生选项的个数
var count_last = parseInt(id.substring(13,lenth));//记录最后的选项编号
</script>
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${basepath }/static/ixin/js/votestep_1.js"></script>

<script type="text/javascript">
initUploadify(2);
<c:forEach items="${question.options }" var="option" varStatus="vs">
initUploadify(${vs.index+1 });
<c:if test="${ not empty option.coverPath}">
$("#image_cover_${vs.index+1 }").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${option.coverPath}"+coverSuffix+"'>");
$("#small_prev_${vs.index+1 }").show();	
</c:if>
$(document).ready(function(){
	$("input[name='questionType']").click(function(){
		if(questionType==1){		
			$("#con_maxChooseNum").hide();
			$("#con_minChooseNum").hide();
		}else if(questionType==2){
			$("#con_maxChooseNum").show();
			$("#con_minChooseNum").show();
		}
	});
});
</c:forEach>

</script>

</content>

