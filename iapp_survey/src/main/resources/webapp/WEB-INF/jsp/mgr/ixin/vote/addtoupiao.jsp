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
						<i class="fa fa-bar-chart-o"></i><span>创建${surveyOrvote }</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!-- 添加 start -->
					<div class="col-md-4 half-left">
						<div class="tp_head">
							<!-- 投票标题 -->
							<span class="tp_title">${surveyOrvote }标题</span>
							<!-- 创建时间 -->
							<span class="tp_time">2014-02-08</span>
							<!-- 发起人 -->
							<span class="tp_time">发起人：</span>
							<span class="tp_initiator">上海龙泰信息科技有限公司</span>
							<!-- 投票说明 -->
							<span class="tp_explain">
								本次${surveyOrvote }总共有四个选项，但是每个人只限一个一票，请慎重操作。
							</span>
						</div>
						<div class="tp_body">
							<i class="fa fa-bar-chart-o"></i>
							<!-- 单选题，题目 -->
							<span class="tm_title">请选出你认为最合理的解释。（单选）</span>
							<div class="tm_block">
								<div class="tm_wz_dx">
									<input type="radio" name="danxuan">
									<span >我就是不想写了。</span>
								</div>
								<div class="tm_wz_dx">
									<input type="radio" name="danxuan">
									<span >我就是不想写了。</span>
								</div>
								<div class="tm_wz_dx">
									<input type="radio" name="danxuan">
									<span >我就是不想写了。</span>
								</div>
								<div class="tm_wz_dx">
									<input type="radio" name="danxuan">
									<span >我就是不想写了。</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-8 half-right">
						<!-- 创建 start-->
						<div class="form">
							<form role="form">
								<div class="form-body">
									<div class="form-group">
										<label for="biaoti">${surveyOrvote }活动标题</label>
										<input type="text" class="form-control" placeholder="活动标题">
										<span class="help-block">
											警告信息
										</span>
									</div>
									<div class="form-group">
										<label for="biaoti">开始时间</label>
										<input type="text" class="form-control"  onClick="WdatePicker()">
									</div>
									<div class="form-group">
										<label for="biaoti">结束时间</label>
										<input type="text" class="form-control" onClick="WdatePicker()">
									</div>
									<div class="form-group">
										<label for="biaoti">发起人/单位</label>
										<input type="text" class="form-control" placeholder="${surveyOrvote }发起者">
									</div>
									<div class="form-group">
										<label>${surveyOrvote }说明信息</label>
										<textarea class="form-control" placeholder="${surveyOrvote }说明"></textarea>
									</div>
									<div class="form-group" style="display: none;">
									<!-- 暂时无用 start-->
										<label>选择题目类型</label>
										<div class="radio-list">
											<label class="radio-inline">
											<input type="radio" name="leixing"  checked=""> 单选题（文字）</label>
											<label class="radio-inline">
											<input type="radio" name="leixing" > 单选题（图文）</label>
											<label class="radio-inline">
											<input type="radio" name="leixing" > 多选题（文字）</label>
											<label class="radio-inline">
											<input type="radio" name="leixing" > 多选题（图文）</label>
										</div>
										<!-- 暂时无用 end-->
									</div>
									<div class="form-group">
										<label>${surveyOrvote }主题名称</label>
										<input type="text" class="form-control" placeholder="题目名称">
									</div>
									<div class="form-group " id="xuanxiang">
										<label>选项</label>
										<div class="input-group mt5">
										<input type="text" class="form-control">
											<span class="input-group-btn">
												<button class="btn red" type="button"  onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>
											</span>
										</div>
									</div>
									<div class="form-group">
										<div class = "btn btn-block btn-success" onclick="addxuanxiang()"><i class="fa fa-plus"></i>&nbsp;添加选项</div>
									</div>
								</div>
							</form>
						</div>
						
						<!-- 创建 end-->
					</div>
					<!-- 添加 end -->
					<div class="btngroup">
							<div class="btn btn-block btn-success">保存</div>
						</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<content tag="pageCore"> 
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
	<script type="text/javascript">
	function addxuanxiang(){
		var html ='<div class="input-group mt5">'+
				'<input type="text" class="form-control">'+
				'<span class="input-group-btn">'+
					'<button class="btn red" type="button" onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>'+
				'</span>'+
			'</div>';
		$("#xuanxiang").append(html);
	}
	function removethis(o){
		$(o).parents(".input-group").remove();
	}
		
	</script>
 </content>

