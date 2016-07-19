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
<c:if test="${not empty logId }">
	<title>导入试题管理</title>
</c:if>
<c:if test="${empty logId }">
	<title>试题管理</title>
</c:if>
<meta name="menu_path" content="test.questionManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }">首页</a>
					<i class="icon-angle-right"></i></li>
				<!-- <li><span>考试管理</span><i class="icon-angle-right"></i></li> -->
				<li><span>
				<c:if test="${not empty logId }">
				    导入试题管理
				</c:if>
				<c:if test="${empty logId }">
				    试题管理
				</c:if>
				</span></li>
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
							<input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="输入试题名进行搜索"> <span
								class="input-group-btn" >
								<button class="btn btn-danger" type="button" onclick="page(1)">
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
			    <c:if test="${not empty logId }">
			        <input type="hidden" value="${logId }" id="logId" name="logId" >
	                <div class="row mt10">
	                    <div class="left_lable">
	                        <span class="condition_title">题库</span>
	                    </div>
	                    <div class="left_condition">
	                        <div class="col-md-4">
                                 <label class="control-label"><span>${im.itemblank.name }</span></label>
	                        </div>
	                    </div>
	                </div>
			    </c:if>
			    <c:if test="${empty logId }">
				<div class="row mt10">
					<div class="left_lable">
						<span class="condition_title">&nbsp;&nbsp;&nbsp;&nbsp;题库&nbsp;&nbsp;&nbsp;</span>
					</div>
					<div class="left_condition">
						<div class="col-md-4">
							<select class="form-control select2me" data-placeholder="选择" id="itemId" name="itemId" onchange="page(1)">
                                <option value="">---请选择---</option>
                                <c:forEach var="item" items="${itemblanks }">
                                    <option id="item_${item.id }" value="${item.id }" >${item.name }</option>
                                </c:forEach>
							</select>
						</div>
					</div>
				</div>
				</c:if>
				<div class="row" style="margin-top: 10px;">
					<div class="left_lable">
						<span class="condition_title">试题类型</span>
					</div>
					<div class="left_condition">
						<div class="col-md-4">
							<select class="form-control select2me" data-placeholder="选择" name="type" id="type" onchange="page(1)" >
                                <option value="">---请选择---</option>
		                        <c:forEach items="${questionTypeMap }" var="qt" varStatus="st">
		                            <option value="${qt.value }" id="type_${qt.value }" >${qt.key }</option>
		                        </c:forEach>
							</select>
						</div>
					</div>	
				</div>
				<div class="row" style="margin-top: 10px;">
					<div class="left_lable">
						<span class="condition_title">试题难度</span>
					</div>
					<div class="left_condition">
						<div class="col-md-4">
							<select class="form-control select2me" data-placeholder="选择" id="q_difficulty" name="difficulty" onchange="page(1)" >
                                <option value="">---请选择---</option>
                                <option value="1">简单</option>
                                <option value="2">一般</option>
                                <option value="3">困难</option>
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
						<i class="icon-globe"></i>试题列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<div class="row">
			                <c:if test="${not empty logId }">
                                <span class="btn btn-success table_add" onclick="insertEntityItem('${im.itemblank.id}');"><i class="icon-plus"></i>&nbsp;添加题目</span>
			                </c:if>
			                <c:if test="${empty logId }">
                                <span class="btn btn-success table_add" onclick="insertEntity();"><i class="icon-plus"></i>&nbsp;添加题目</span>
			                </c:if>
                            <span class="btn btn-danger table_add" onclick="deleteGroup();"><i class="icon-remove"></i>&nbsp;删除题目</span>
							<!-- <span class="btn btn-success" onclick="importQuestion();"><i class="glyphicon glyphicon-log-in"></i>&nbsp;导入题目</span> -->
					</div>
                    
                    <%-- 表格内容 --%>
                    <div id="table_list" class="mt10"></div>
					
					<!-- 导入题库打卡文件管理器 -->
					<input type="file" style="display: none;" id="openfile" name="file">
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<content tag="pageCore"> 
<!-- 引用核心js包 -->
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script src="${basepath }/static/public/javascripts/testquestion.js"></script>  
</content>
<content tag="pageInit"> <!-- 初始化窗口 -->
	<script type="text/javascript"> 	
	$(document).ready(function(){
$("#searchContent").keydown(function(e){
        var curKey = e.which;
           if(curKey == 13){
           page(1);
                return false;
           }
   });
});
	</script>
 </content>
