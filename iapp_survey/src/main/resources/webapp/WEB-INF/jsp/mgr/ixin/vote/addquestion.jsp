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
<title>${surveyOrvote }管理</title>
	<c:choose>
		<c:when test="${surveyOrvote=='投票' }">
			<meta name="menu_path" content="active.menu_vote"/>
		</c:when>
		<c:otherwise>
			<meta name="menu_path" content="active.menu_survey"/>
		</c:otherwise>
	</c:choose>
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<%-- <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				 --%><li><span href="#">${surveyOrvote }管理</span></li>
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
							<input name="checkedQuestionType" id ="checkedQuestionType" value="" type="hidden"/>
								<div class="form-body">
									<div class="form-group" >
									<!-- 暂时无用 start-->
										<label>选择题目类型</label>
										<div class="radio-list">
											<label class="radio-inline">
											<input type="radio" name="questionType"  pd="swz" checked="checked"> 单选题（文字）</label>
											<label class="radio-inline">
											<input type="radio" name="questionType" pd="stw"> 单选题（图文）</label>
											<label class="radio-inline">
											<input type="radio" name="questionType" pd="mwz"> 多选题（文字）</label>
											<label class="radio-inline">
											<input type="radio" name="questionType" pd="mtw"> 多选题（图文）</label>
										</div>
										<!-- 暂时无用 end-->
									</div>
									<div id="voteContent">
										<div class="form-group">
											<label>${surveyOrvote }主题名称</label>
											<input type="text" class="form-control" name="voteQuestionTitle"  placeholder="题目名称">
										</div>
										<div class="form-group " id="vote_options">
											<label>选项</label>
											<div class="input-group mt5">
												<input type="text" class="form-control" name="voteQuestionOption">
												<span class="input-group-btn">
													<button class="btn red" type="button"  onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>
												</span>
											</div>
										</div>
										<div class="form-group" style="text-align: center;">
											<div class = "btn btn-success" style="width:45%" onclick="addquestion()"><i class="fa fa-plus" ></i>&nbsp;再添加一题</div>
											<div class = "btn btn-success" onclick="addOption()" style="width:45%"><i class="fa fa-plus"></i>&nbsp;添加选项</div>
										</div>
									</div>
								</div>
							</form>
							<div class="table-responsive">
									<table
										class="table table-striped table-bordered table-advance table-hover">
										<thead>
											<tr>
												<th style="min-width: 130px;">题目类型</th>
												<th class="hidden-xs">题目名称</th>
												<th style="min-width: 130px;">操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="highlight">
													<div class="success"></div> <a href="#">单选题（文字）</a>
												</td>
												<td class="hidden-xs">只有文字的单选题。</td>
												<td><a href="#" class="btn default btn-xs purple"><i
														class="fa fa-edit"></i> 编辑</a>&nbsp; <a href="#"
													class="btn default btn-xs black"><i
														class="fa fa-trash-o"></i> 删除</a></td>
											</tr>
											<tr>
												<td class="highlight">
													<div class="info"></div> <a href="#">单选题（图文）</a>
												</td>
												<td class="hidden-xs">
													只有文字的单选题。只有文字的单选题。只有文字的单选题。只有文字的单选题。</td>
												<td><a href="#" class="btn default btn-xs purple"><i
														class="fa fa-edit"></i> 编辑</a>&nbsp; <a href="#"
													class="btn default btn-xs black"><i
														class="fa fa-trash-o"></i> 删除</a></td>
											</tr>
											<tr>
												<td class="highlight">
													<div class="important"></div> <a href="#">多选题（文字）</a>
												</td>
												<td class="hidden-xs">
													只有文字的单选题。只有文字的单选题。只有文字的单选题。只有文字的单选题。只有文字的单选题。只有文字的单选题。只有文字的单选题。
												</td>
												<td><a href="#" class="btn default btn-xs purple"><i
														class="fa fa-edit"></i> 编辑</a>&nbsp; <a href="#"
													class="btn default btn-xs black"><i
														class="fa fa-trash-o"></i> 删除</a></td>
											</tr>
											<tr>
												<td class="highlight">
													<div class="warning"></div> <a href="#">多选题（图文）</a>
												</td>
												<td class="hidden-xs">只有文字的单选题。只有文字的单选题。只有文字的单选题。</td>
												<td><a href="#" class="btn default btn-xs purple"><i
														class="fa fa-edit"></i> 编辑</a>&nbsp; <a href="#"
													class="btn default btn-xs black"><i
														class="fa fa-trash-o"></i> 删除</a></td>
											</tr>
										</tbody>
									</table>
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
<script type="text/javascript" src="${basepath }/static/ixin/js/jquery.form.js"></script>
<script type="text/javascript" src="${basepath }/static/ixin/js/votestep2.js"></script>
<script type="text/javascript">

</script>
 </content>

