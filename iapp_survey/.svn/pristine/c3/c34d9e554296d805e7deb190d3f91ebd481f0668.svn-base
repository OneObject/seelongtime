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
<title>本地视频管理</title>
<meta name="menu_path" content="video.localvideo" />
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a>
                    <i class="icon-angle-right"></i></li>
                <li><span href="#">本地视频管理</span></li>
            </ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<!-- 全局搜索组建开始 -->
	<%--
	 
	<div class="row">
		<div class="col-md-12">
			<!--search box-->
			<div class="col-md-12 search_box">
				<div class="col-md-12">
					<!--全局搜索框-->
					<div class="col-md-6 search_container">
						<div class="input-group">
							<input id="searchContent" name="searchContent" type="text" class="form-control" placeholder="输入资料库名"> <span
								class="input-group-btn">
								<button onclick="page(1);" class="btn btn-danger" type="button">
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
	--%>
	<!-- 全局搜索组建结束-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>本地视频列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<div class="row">
						<span class="btn btn-success table_add" onclick="addvideo();"><i class="icon-plus"></i>&nbsp;添加视频</span>
					</div>
					
					<%-- 表格内容 --%>
                    <div id="table_list" class="mt10"></div>
                 
	
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<content tag="pageCore"> 
<!-- 引用核心js包 -->
    <script src="${basepath }/static/public/javascripts/localvideolist.js"></script>
    
     <%-- dwr --%>
</content>
<content tag="pageInit"> 
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