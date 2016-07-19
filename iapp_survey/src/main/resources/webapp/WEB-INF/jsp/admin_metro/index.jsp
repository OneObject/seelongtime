<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>后台管理</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta name="MobileOptimized" content="320">
    <%@include file="/WEB-INF/jsp/include/admin_metro/js_css_core.jsp"%>
</head>
<body class="page-header-fixed" onselectstart="return false;">
<div class="page-container">
<jsp:include page="include/head.jsp"></jsp:include>
<jsp:include page="include/sidebar.jsp"></jsp:include>
<!-- BEGIN PAGE -->
    <div class="page-content">
    <jsp:include page="include/customer_control.jsp"></jsp:include>
    <div id="include_inner_page">
   		
    </div>
	</div>
</div>
<!-- END PAGE -->
<jsp:include page="include/footer.jsp"></jsp:include>
<!--学习课程数量图表   end-->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<!-- END PAGE LEVEL SCRIPTS -->  
<script type="text/javascript">
      $(document).ready(function() {
         var pra="${block}";
         if(pra == "" || pra == null){
        	 $("#include_inner_page").load("../base/admin/index.xhtml"); 
         }
         else{
        	 $(".page-sidebar-menu").find("#"+pra).click();
         }
         
      });
      /*页面跳转方法  */
       function tourl(url){
    	   $("#include_inner_page").empty();
    	   $("#include_inner_page").load("../base/admin/"+url+".xhtml");
       }  
</script>
</body>
</html>