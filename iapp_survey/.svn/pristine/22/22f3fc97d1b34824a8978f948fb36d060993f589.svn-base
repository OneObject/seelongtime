<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>学习情况管理</title>
	<meta name="menu_path" content="bigdata.studysituation"/>
	<!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <!-- END PAGE LEVEL STYLES -->
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/usermanage.css">
	<style type="text/css">
	.condition_item > .check_item{margin-bottom:10px;}
	</style>
</head>  
<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><span>学习情况管理</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
   
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>学习情况列表</div>
                  </div>
                  
                  <div class="portlet-body" style="overflow: hidden;">
                  
                  
                    <%-- 分页内容 --%>
                    <div id="table_list" class="mt10"></div>
                    	<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
   <thead>
      <tr>
         <th width="5%">序号</th>
         <th width="65%">模块名称</th>
         <th>操作</th>
      </tr>
   </thead>
   <tbody id="tbody">
   
	          <tr>
	             <td>1</td>
	             <td >课程学习情况</td>
	             <td>
	                  <a href="${basepath }/base/admin/report/appoint/appointindex.xhtml?model=coursestudy&from=4">
	                      <span>
	                         		进入
	                     </span>
	                  </a>
	             </td>
	          </tr>
	          <tr>
	             <td>2</td>
	             <td >组织学习情况</td>
	             <td>
	                  <a href="${basepath }/base/admin/report/appoint/appointindex.xhtml?model=organizationstudy&from=4">
	                      <span>
	                         		进入
	                     </span>
	                  </a>
	             </td>
	          </tr>
   </tbody>
</table>
                    	
                    
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
</body>
</html>
<content tag="pageCore">
 <!-- END PAGE LEVEL PLUGINS -->
 <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/jquery.dataTables.js"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
    <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.js"></script>
	<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
	<script src="${basepath }/static/public/javascripts/cutPage.1.0.js" type="text/javascript"></script>
	<script src="${basepath }/static/public/javascripts/dateUtil.js" type="text/javascript"></script>
	
	<script>
		function toAddAppoint(){
			var param = new Object();
			param.id="2";
			param.name="tt";
			addAppoint("module","1","测试报表测试报表测试报表测试报表",param,"测试报表测试报表测试报表测试报表测试报表测试报表");
		}
	</script>

</content>
<content tag="pageInit">
</content>  

  
