<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
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
<title>调研问卷管理</title>
	<meta name="menu_path" content="active.menu_survey"/>
	<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">	

	<script type="text/javascript">
		//调研
		function saveSurveyQuestion(){
			var questionType = $("input[name='questionType']:checked").val();
			//非填空题题目必填
			if(questionType!=6 && !v_questionTitle()){
				return;
			}
			var requestOptions = getRequestOptions();
			//问答
			if(questionType==4 ){
				if(!v_minscore() || !v_maxscore() || !v_content()){
					return;
				}
			}else if(questionType == 1 || questionType == 2){
				if(!v_options(requestOptions)){
					return;
				}else if(!checkOption()){
					return;
				}
			}
			if(questionType==2){
				
				if(!v_minChooseNum() || !v_maxChooseNum()){
					return;
				}
				
				//最大选择数不能大于选项数判断
				if($.trim($("#maxChooseNum").val())>requestOptions.length){
					easyDialog.open({
				        container : {
				            header : '提示',
				            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">最大选择数不能大于该题的选项数</div>'
				        },
				        autoClose:1950
				    });
					return;
				}
			}
			
			var title = $('#questionTitle').val();
			if(questionType==6){
				if(!v_completion_items()){
					return;
				}
				title = getCompletionTitle();
			}
			
			var requestQuestion = new Object();
			
			requestQuestion.id = $('#questionId').val();
			requestQuestion.title = title;
			requestQuestion.type = $("input[name='questionType']:checked").val();
			requestQuestion.voteId = voteId;
			var must = $("input[name='must']:checked").val();
			if(isBlank(must)){
				must = "1";
			}
			requestQuestion.must = must;
			requestQuestion.minScore = $("#minScore").val();
			requestQuestion.maxScore = $("#maxScore").val();
			requestQuestion.content = $("#content").val();
			requestQuestion.maxChooseNum = $.trim($("#maxChooseNum").val());
			requestQuestion.minChooseNum = $.trim($("#minChooseNum").val());
			requestQuestion.options = requestOptions;
			easyDialog.open({
				  container :'loading_img',
				  fixed : false,
				  overlay:true
			});
			$.ajax({
				type: "POST",
				url:  basepath+"/mgr/vote/savequestions.xhtml",
				data: JSON.stringify(requestQuestion),
				async: false,
				contentType: "application/json; charset=utf-8",
				success:function(data){
					resetForm();
					$('#voteQuestionList').load(basepath+"/mgr/include/votequestionlist.xhtml?voteId="+voteId);
					easyDialog.close();
				},
				error: function(data){
					easyDialog.open({
				        container : {
				            header : '提示',
				            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">保存失败！</div>'
				        },
				        autoClose:1200
				    });
				}
			});
		}
	</script>

</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<%-- <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				 --%><li><a href="${basepath }/mgr/vote/index.xhtml">调研问卷管理</a></li>
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
						<i class="fa fa-bar-chart-o"></i><span>添加题目</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!-- 添加 start -->
					<div class="mauto">
					<div class="col-md-12">
						<!-- 创建 start-->
						<div class="form" >
							<form role="form" id="questionForm" enctype="multipart/form-data" action="${basepath }/mgr/vote/addquestion.xhtml" method="post">
								<div class="form-body">
									<div class="form-group" >
									<!-- 暂时无用 start-->
										<label>选择题目类型</label>
										<div class="radio-list">
											<label class="radio-inline">
											<input type="radio" name="questionType" value="1" checked="checked"> 单选题</label>
											<label class="radio-inline">
											<input type="radio" name="questionType" value="2"> 多选题</label>
											<label class="radio-inline">
											<input type="radio" name="questionType" value="3">问答题</label>
											<label class="radio-inline">
											<input type="radio" name="questionType" value="4">打分题</label>
											<label class="radio-inline">
											<input type="radio" name="questionType" value="5">段落说明</label>
											<label class="radio-inline">
											<input type="radio" name="questionType" value="6">填空题</label>
										</div>
										<!-- 暂时无用 end-->
									</div>
									<div id="voteContent">
										<div class="form-group" id="con_questionTitle">
											<label>题目名称</label>
											<input type="hidden" id="questionId" value=""/>
											<input type="text" class="form-control" name="voteQuestionTitle" id="questionTitle" placeholder="题目名称" onchange="v_questionTitle();">
											<span class="help-block hidden" id="tip_questionTitle">题目名称不能为空</span>
										</div>
										<div class="row">
											<div class="col-md-6 form-group "  id="con_maxChooseNum" style="display: none;">
												<label>最多选择个数</label>
												<input type="text" class="form-control" name="maxChooseNum" id="maxChooseNum" placeholder="设置最多选择数，默认为0，代表无限制" onchange="v_maxChooseNum();">
											</div>
											<div class="col-md-6 form-group"  id="con_minChooseNum" style="display: none;">
												<label>最少选择个数</label>
												<input type="text" class="form-control" name="minChooseNum" id="minChooseNum" placeholder="设置最少选择数，默认为0，代表无限制" onchange="v_minChooseNum();">
											</div>											
										</div>
										
										<!-- 填空题开始 -->
										<div class="row" id="vote_completion" style="display: none;">
											<div id="con_completion_item_1" class="con_completion_item" data-num="1">
												<div class="col-md-8 form-group "  id="con_title1">
													<label>题干</label>
													<input type="text" class="form-control" name="title1" id="title1" placeholder="请输入题干">
												</div>
												<div class="col-md-4 form-group"  id="con_inputBoxSize1">
													<label>填空输入框长度(字符数5-15)</label>
													<input type="text" class="form-control" name="inputBoxSize1" id="inputBoxSize1" placeholder="15">
												</div>		
											</div>									
										</div>

										<!-- 填空题介绍 -->
										<!-- 问答题属性 start-->
										<div class="form-group" id="vote_must" style="display: none;">
											<input type="checkbox" value="0" name="must" id="must">
											<label for="must">该题可跳过不回答</label>
										</div>
										<!-- 问答题属性 start-->
										
										<!-- 单选多选题选项 start-->
										<div class="form-group " id="vote_options">
											<label>选项</label>
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
										</div>
										<!-- 单选多选题选项 end-->
										
										<!-- 打分题选项 start-->
										<div class="form-group " id="vote_score" style="display: none;">
											<div class="form-group" id="con_minScore">
												<label>最低分</label>
												<input type="text" class="form-control" placeholder="1" value="1" disabled="disabled">
												<input type="hidden" class="form-control" name="minScore" id="minScore" value="1">
												<span class="help-block hidden" id="tip_minScore">1</span>
											</div>
											<div class="form-group" id="con_maxScore">
												<label>最高分</label>
												<input type="text" class="form-control" name="maxScore" id="maxScore" placeholder="5" onchange="v_maxscore();">
												<span class="help-block hidden" id="tip_maxScore">2-10</span>
											</div>
											<div class="form-group" id="con_content">
												<label>备注</label>
												<input type="text" class="form-control" name="content" id="content">
												<span class="help-block hidden" id="tip_content">20字以内</span>
											</div>
										</div>
										<!-- 打分题选项 end-->
										
										<div class="form-group" style="text-align: center;">
											<div class = "btn btn-success" style="width:45%" onclick="saveSurveyQuestion()"><i class="fa fa-plus" ></i>&nbsp;保存该题</div>
											<div class = "btn btn-success" onclick="addOption()" id="addoptions" style="width:45%"><i class="fa fa-plus"></i>&nbsp;添加选项</div>
										</div>
									</div>
								</div>
							</form>
							<div class="table-responsive" id="voteQuestionList">
									
							</div>
		                    <div class="btngroup">
	                            <div class="btn btn-block btn-success" onclick="backToList('${surveyOrvote}')">保存${surveyOrvote}</div>
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
var voteId = "${voteId}";
var token = "${result.uploadToken}";
var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var coverSuffix = "${result.coverSuffix}";
var id = $("#vote_options").find("input:last").attr("id");
var count = parseInt(id.substring(13,14));//记录动态产生选项的个数
var count_last =  parseInt(id.substring(13,14));//记录最后一个动态产生选项的编号
$(document).ready(function(){
	var type=$("input[name='questionType']:checked").val();
	if(type==3){ //问答
		$("#vote_options").hide();//隐藏选项
		$("#addoptions").hide();//隐藏添加选项按钮
		$("#vote_score").hide();//隐藏打分题选项设置
		$("#vote_must").show();//显示是否允许跳过按钮
		$("#con_maxChooseNum").hide();
		$("#con_minChooseNum").hide();
		$("#vote_completion").hide();//隐藏填空题选项
		$("#con_questionTitle").show();//显示题目标题
	} else if(type == 4){ //打分
		$("#vote_options").hide();
		$("#addoptions").hide();
		$("#vote_score").show();
		$("#vote_must").hide();
		$("#con_maxChooseNum").hide();
		$("#con_minChooseNum").hide();
		$("#vote_completion").hide();//隐藏填空题选项
		$("#con_questionTitle").show();//显示题目标题
	} else if(type == 5){//段落说明
		$("#vote_options").hide();
		$("#addoptions").hide();
		$("#vote_score").hide();
		$("#vote_must").hide();
		$("#con_maxChooseNum").hide();
		$("#con_minChooseNum").hide();
		$("#vote_completion").hide();//隐藏填空题选项
		$("#con_questionTitle").show();//显示题目标题
	}else if(type==2){//多选
		$("#vote_options").show();
		$("#addoptions").show();
		$("#vote_score").hide();
		$("#vote_must").hide();
		$("#con_maxChooseNum").show();
		$("#con_minChooseNum").show();
		$("#vote_completion").hide();//隐藏填空题选项
		$("#con_questionTitle").show();//显示题目标题
	}else if(type==6){
		$("#vote_options").hide();//隐藏选项
		$("#addoptions").hide();//隐藏添加选项按钮
		$("#vote_score").hide();//隐藏打分题选项设置
		$("#vote_must").hide();//显示是否允许跳过按钮
		$("#con_maxChooseNum").hide();
		$("#con_minChooseNum").hide();
		$("#vote_completion").show();//显示填空题选项
		$("#con_questionTitle").hide();//隐藏题目标题
	} else {
		$("#vote_options").show();
		$("#addoptions").show();
		$("#vote_score").hide();
		$("#vote_must").hide();
		$("#con_maxChooseNum").hide();
		$("#con_minChooseNum").hide();
		$("#vote_completion").hide();//隐藏填空题选项
		$("#con_questionTitle").show();//显示题目标题
	}
	resetbind();
});
function resetbind(){
	$("input[name='questionType']").parents(".radio-inline").click(function(){
		var type=$("input[name='questionType']:checked").val();
		if(type==3){
			$("#vote_options").hide();//隐藏选项
			$("#addoptions").hide();//隐藏添加选项按钮
			$("#vote_score").hide();//隐藏打分题选项设置
			$("#vote_must").show();//显示是否允许跳过按钮
			$("#con_maxChooseNum").hide();
			$("#con_minChooseNum").hide();
			$("#vote_completion").hide();//隐藏填空题选项
			$("#con_questionTitle").show();//显示题目标题
		} else if(type == 4){
			$("#vote_options").hide();
			$("#addoptions").hide();
			$("#vote_score").show();
			$("#vote_must").hide();
			$("#con_maxChooseNum").hide();
			$("#con_minChooseNum").hide();
			$("#vote_completion").hide();//隐藏填空题选项
			$("#con_questionTitle").show();//显示题目标题
		} else if(type == 5){
			$("#vote_options").hide();
			$("#addoptions").hide();
			$("#vote_score").hide();
			$("#vote_must").hide();
			$("#con_maxChooseNum").hide();
			$("#con_minChooseNum").hide();
			$("#vote_completion").hide();//隐藏填空题选项
			$("#con_questionTitle").show();//显示题目标题
		} else if(type==2){
			$("#vote_options").show();
			$("#addoptions").show();
			$("#vote_score").hide();
			$("#vote_must").hide();
			$("#con_maxChooseNum").show();
			$("#con_minChooseNum").show();
			$("#vote_completion").hide();//隐藏填空题选项
			$("#con_questionTitle").show();//显示题目标题
		}else if(type == 6){
			$("#vote_options").hide();//隐藏选项
			$("#addoptions").show();//显示添加选项按钮
			$("#vote_score").hide();//隐藏打分题选项设置
			$("#vote_must").hide();//显示是否允许跳过按钮
			$("#con_maxChooseNum").hide();
			$("#con_minChooseNum").hide();
			$("#vote_completion").show();//显示填空题选项
			$("#con_questionTitle").hide();//隐藏题目标题
		}else{
			$("#vote_options").show();
			$("#addoptions").show();
			$("#vote_score").hide();
			$("#vote_must").hide();
			$("#con_maxChooseNum").hide();
			$("#con_minChooseNum").hide();
			$("#vote_completion").hide();//隐藏填空题选项
			$("#con_questionTitle").show();//显示题目标题
		}
	});
	
}






</script>
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${basepath }/static/ixin/js/addQuestions.js"></script>
<script type="text/javascript">
initUploadify(2);
</script>

 </content>

