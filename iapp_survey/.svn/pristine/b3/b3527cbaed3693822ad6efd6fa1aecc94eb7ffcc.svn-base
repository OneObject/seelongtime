<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<%
	String domain = LoginSessionHelper.getCurrentDomain(request);
	pageContext.setAttribute("domain", domain);
%>
<!DOCTYPE html>

<html lang="en" class="no-js">

<head>
<title>用户反馈</title>
<meta name="menu_path" content="system.feedback" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
<script type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><span href="#">用户反馈</span></li>
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
					<div class="col-md-6" style="margin-left: 20%;margin-top: 20px;margin-bottom: 20px;">
					<div class="col-md-4">
						<label for="startTime" style="float: left">开始时间</label>
						<input type="text"
							class="form-control" id="startTime"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})">
					</div>
					<div class="col-md-4">
						<label for="endTime">结束时间 </label>
						<input type="text"
							class="form-control" id="endTime"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})">
						
					</div>
					<div class="col-md-4">
						<button onclick="page(1)" class="btn btn-danger" type="button" style="margin-top: 25px;height: 34px;">
							<i class="icon-search"></i>
						</button>
					</div>
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
			<!--  
				<div class="row mt10">
					<div class="left_lable">
						<span class="condition_title">状态</span>
					</div>
					<div class="left_condition">
						<div class="col-md-4">
							<select class="form-control select2me" data-placeholder="选择" id="status" name="status" onchange="page(1)">
							    <option value="-1">---请选择---</option>
	                            
                                    <option value="0">dd</option>
	                            
							</select>
						</div>
					</div>
				</div>
			-->
				<div class="row mt10">
					<div class="left_lable">
						<span class="condition_title">类型</span>
					</div>
					<div class="left_condition">
						<div class="col-md-4">
							<select class="form-control select2me" data-placeholder="选择" id="type" name="type" onchange="page(1)">
							    <option value="-1">---请选择---</option>
                                    <c:if test="${domain ne 'muyang' }">
                                    <option value="0">建议</option>
                                    <option value="1">投诉</option>
                                    </c:if>
                                    <c:if test="${domain eq 'muyang' }">
                                    <option value="0">新产品开发</option>
                                    <option value="1">技术创新</option>
                                    <option value="2">产品问题</option>
                                    <option value="3">其他</option>
                                    </c:if>
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
						<i class="icon-globe"></i>反馈列表
					</div>
				</div>
				<div class="portlet-body" style="padding-bottom: 100px;">
					<div class="row">
					<!--  
							<span class="btn btn-success table_add" onclick="insertEntity()"><i class="icon-plus"></i>&nbsp;添加考试</span>
							<span class="btn btn-danger table_add" onclick="deleteGroup()"><i class="icon-remove"></i>&nbsp;删除考试</span>
					-->
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
  
</content>
<content tag="pageInit"> <!-- 初始化窗口 -->
<script type="text/javascript"> 	
$(document).ready(function(){
	page(1);
});

function page(i){
	var type = $("#type").val();
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var url = "${basepath}/base/admin/feedback/list.list";
    var data = {"currPage":i,"startTime":startTime,"endTime":endTime,"type":type};
	$('#table_list').load(encodeURI(url),data,function(){
	});
}

function detail(id){
	window.location.href="${basepath}/base/admin/feedback/detail.xhtml?id="+id;
	
}
</script> 
</content>
