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
<title>登录IP</title>
<meta name="menu_path" content="ext.login_ip" />
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a>
                    <i class="icon-angle-right"></i></li>
                <li><span href="#">登录IP</span></li>
            </ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	
	<input type="hidden" id="num" value="${num }">

	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>登录IP列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
				
					
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
    <%-- <script src="${basepath }/static/public/javascripts/cutPage.1.0.js" type="text/javascript"></script> --%>
    <script src="${basepath }/static/public/javascripts/login_ip.js"></script>
     <%-- dwr --%>
    <script type='text/javascript' src='${basepath }/dwr/engine.js'></script>
    <script type='text/javascript' src='${basepath }/dwr/util.js'></script>
    <script type='text/javascript' src='${basepath }/dwr/interface/DWRService.js'></script>
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