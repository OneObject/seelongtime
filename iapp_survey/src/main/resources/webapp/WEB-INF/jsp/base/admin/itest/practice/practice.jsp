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
<title>练习管理</title>
<meta name="menu_path" content="test.practiceManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><span href="#">练习管理</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<!-- 全局搜索组建开始 -->
	<div class="row">
		<div class="col-md-12">
			<!--search box-->
			<div class="col-md-12 search_box">
				<div class="col-md-12">
					<!--全局搜索框-->
					<div class="col-md-6 search_container">
						<div class="input-group">
							<input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="输入练习名进行搜索"> <span
								class="input-group-btn" onclick="page(1)">
								<button class="btn btn-danger" type="button">
									<i class="icon-search"></i>
								</button>
							</span>
						</div>
						<!-- /input-group -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 全局搜索组建结束-->
	<!-- 条件选择开始 -->
	<div class="row">
		<div class="col-md-12">
			<div class="search_condition">
				<div class="row mt10">
					<div class="left_lable">
						<span class="condition_title">状态</span>
					</div>
					<div class="left_condition">
						<div class="col-md-4">
							<select class="form-control select2me" data-placeholder="选择" id="status" name="status" onchange="page(1)">
							    <option value="">---请选择---</option>
	                            <c:forEach items="${practiceStatusMap }" var="status">
                                    <option value="${status.value }">${status.key }</option>
	                            </c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 条件选择结束 -->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>练习列表
					</div>
				</div>
				<div class="portlet-body" style="padding-bottom: 100px;">
					<div class="row">
							<span class="btn btn-success table_add" onclick="insertEntity()"><i class="icon-plus"></i>&nbsp;添加练习</span>
							<span class="btn btn-danger table_add" onclick="deleteGroup()"><i class="icon-remove"></i>&nbsp;删除练习</span>
					</div>
                    
                    <!-- 表格内容 -->
                    <div id="table_list"  class="mt10"></div>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<!-- 引用核心js包 -->
<script type="text/javascript" src="${basepath }/static/public/javascripts/practice.js"></script>
  
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
</content>
