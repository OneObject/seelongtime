<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>阅卷操作</title>
<meta name="menu_path" content="test.testManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/base/admin/itest/examination/examination.xhtml">考试管理</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/base/admin/itest/examination/markpaperlistcon.xhtml?id=${examid }">阅卷</a><i class="icon-angle-right"></i></li>
				<li><span href="#">阅卷操作</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>${entity.examName }的阅卷
					</div>
				</div>
				<%-- <form id="addForm" onsubmit="return validateAdd()" class="form-horizontal" role="form" action="${basepath }/base/admin/itest/examination/saveMarking.xhtml"> --%>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;" id="addForm">
                    <!-- 表格内容 -->
                    <div id="table_list" >
                    <c:forEach items="${list }" var="question" varStatus="state">
                        <c:if test="${state.count gt 1 }">
                            <hr>
                        </c:if>
                    	<!-- 表格我只放基本的样式， -->
                    	<table class="table table-striped table-bordered table-hover table-full-width datatable yuejuan">
                    		<thead>
	                    		<tr>
	                    			<th>
	                    				<span>${state.count }</span>
	                    			</th>
	                    			<th colspan="2">
	                    				<span>
	                    					${question.testQuestionModel.title }
	                    				</span>
	                    			</th>
    	                		</tr>
                    		</thead>
                    		<tbody>
                    			<tr>
                    				<td colspan="2">
                    					<span class="btn default btn-xs green-stripe">参考答案</span>
                    				</td>
                    				<td>
                    					<span>${question.testQuestionModel.answer }</span>
                    				</td>
                    			</tr>
                    			<tr>
                    				<td colspan="2">
                    					<span class="btn default btn-xs red-stripe">学员答案</span>
                    				</td>
                    				<td>
                    					<span>${question.answer }</span>
                    				</td>
                    			</tr>
                    			<tr>
                    				<td colspan="3" class="" id="con_score_${question.testQuestionModel.id }">
                    					<span>总分:</span><span id="total_score_${question.testQuestionModel.id }">${question.score }</span>
                    					<span>得分：</span>
                    					<input type="text" class="defen" name="score_${question.testQuestionModel.id }" id="score_${question.testQuestionModel.id }" value="${question.score }" onchange="validateScore('${question.testQuestionModel.id }')">
                    					<span class="error hidden" id="tip_score_${question.testQuestionModel.id }">分数必须为整数或一位小数且不能超过总分！</span>
                    					<input type="hidden" value="${question.testQuestionModel.id }" name="questionIds">
                    					<input type="hidden" value="${examid }" name="examid" id="examid">
                    				</td>
                    			</tr>
                    		</tbody>
                    	</table>
                    	</c:forEach>
                    	<div class="btn_group_center">
				            <input type="hidden" value="${testee_paper_id }" name="testee_paper_id">
				            <input type="hidden" value="${entity.paperId }" name="paperId">
                            <button type="button" class="btn btn-success" onclick="validateAdd()" >提交阅卷结果</button>
                            <span class="btn default" onclick="cancelInsert()">取消</span>
                    	</div>
                    </div>
				</div>
				<!-- </form> -->
			</div>
		</div>
	</div>
	
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script>
<script src='${basepath }/static/public/javascripts/markpaperdetail.js' type='text/javascript' ></script>
<!-- 引用核心js包 -->
  
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
</content>
