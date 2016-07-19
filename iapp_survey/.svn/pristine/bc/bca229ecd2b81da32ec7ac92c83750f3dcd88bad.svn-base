<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>积分管理</title>
<meta name="menu_path" content="system.creditManage" />
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath}">首页</a><i class="icon-angle-right"></i></li>
                <li><span>积分管理</span></li>
			</ul>
		</div>
	</div>
	
	<!--tab 开始  -->
	<ul class="nav nav-tabs">
         <li class="active tabLi" > <a href="#creditRule" onclick="creditRule();"  data-toggle="tab">积分规则</a></li>
         <li class="tabLi" > <a href="#creditLog"  onclick="creditLog();" data-toggle="tab">积分日志</a></li>
    </ul>
	<!--tab 结束 -->
    <div class="tab-content">
    <!-- 积分规则 -->
      <div class="tab-pane  active" id="creditRule">
	
         </div>
         <!-- 积分规则结束 -->
         
         
         <!--积分日志开始 -->
          <div class="tab-pane" id="creditLog">
          </div>
         <!-- 积分日志结束 -->
        
   </div>
</body>
</html>
<content tag="pageCore">
<script type="text/javascript">
 $(document).ready(function(){
	 $("#creditRule").load("${basepath}/mgr/credit/rules.list",function(){
		 });
	 });
  function creditRule()
  {
	  $("#creditLog").html("");
	 $("#creditRule").load("${basepath}/mgr/credit/rules.list",function(){
		  });
	  }

  function creditLog()
  {
	  $("#creditRule").html("");
	 $("#creditLog").load("${basepath}/mgr/credit/log/logs.list",function(){
		 });
	  }
</script>
</content>
