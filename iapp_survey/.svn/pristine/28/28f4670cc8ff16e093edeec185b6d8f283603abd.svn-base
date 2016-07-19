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
<title>试卷预览</title>
<meta name="menu_path" content="test.testManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
<style type="text/css">
.tyf-sb{float:right;}
.tyf-sb span{margin-right:10px;}
.tyf-sb .right{color:green;}
.tyf-sb .error{color:red;}
.tyf-sb .normal{color:#529bea;}
.tyf-sb label{color:blue;float:none;margin-bottom:0;}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/base/admin/itest/examination/examination.xhtml">考试管理</a><i class="icon-angle-right"></i></li>
				<li><span href="#">试卷预览</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="note note-success">
				<table>
					<tr>
						<td style="width:100px;">试卷名称：</td>
						<td>${testPaper.name}</td>
					</tr>
					<tr>
						<td>试卷难易度：</td>
						<td>
                             <c:if test="${testPaper.difficulty_level==1 }">简单</c:if>
                            <c:if test="${testPaper.difficulty_level==2 }">一般</c:if>
                             <c:if test="${testPaper.difficulty_level==3 }">困难</c:if>
                        </td>
					</tr>
					<tr>
						<td>试卷总分：</td>
						<td>${testPaper.total_score}</td>
					</tr>
					<tr>
						<td>及格分：</td>
						<td>${testPaper.pass_mark}</td>
					</tr>
					<tr>
						<td>试卷描述：</td>
						<td>${testPaper.descript}</td>
					</tr>
					<tr>
						<td>组卷方式：</td>
						<td>
                             <c:if test="${testPaper.generate_type==1 }">自动组卷</c:if>
                             <c:if test="${testPaper.generate_type==2 }">手动组卷</c:if>
                        </td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>试卷预览
						<input type="hidden" name="id" id="id" value=${exam.id } >
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
				<!-- 循环多份试卷 -->
	                <ul class="nav nav-tabs">
	                    <c:forEach var="item2" items="${numlist }" varStatus="no2">
		                      <li <c:out value="${no2.count eq 1?'class=active':'' }" /> ><a href="#paper${no2.count }" onclick="loadPaper(${no2.count})" data-toggle="tab">试卷${no2.count }</a></li>
		                </c:forEach>
	                </ul>
	                <div class="tab-content">
	                    <c:forEach var="item2" items="${numlist }" varStatus="no2">
			                <!-- Tab panes -->
			                <div class="tab-pane  <c:out value="${no2.count eq 1?'active':'' }" />" id="paper${no2.count }"></div>
	                    </c:forEach>
                    </div>
                    <!-- 表格内容 -->
                    <div id="table_list" >
                    </div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<!-- 引用核心js包 -->
</script>
  
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
	<script type="text/javascript">
	$(function() {
		loadPaper(1);
        /* var paperNum = 1;
        var id = $("#id").val();
        $("#table_list").load("${basepath }/base/admin/itest/examination/testpaperpreview.list?paperNum="+paperNum+"&id="+id); */
	});
	
	function loadPaper(paperNum){
        var id = $("#id").val();
        $("#table_list").load("${basepath }/base/admin/itest/examination/testpaperpreview.list?paperNum="+paperNum+"&id="+id, function (){
            App.initUniform();
        });
	}
	</script>
</content>
