<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
<title>组织批量导入</title>
<meta name="menu_path" content="system.org"/>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
<script type="text/javascript">
   $(document).ready(function(){
	      $("#fileDragArea").click(function(){
		        $("#openfile").click();
		      });
	      $("#openfile").change(function (){
	    	  $("#importForm")[0].submit();
	      });
	      var success="${success}";
	      if(success=="true"){
               alert("导入成功，谢谢使用!");
		      }else if(success=="false"){
                  alert("导入失败，请查看错误信息");
			      }
		      
	   });
</script>
</head>
<body>
 <!-- BEGIN PAGE HEADER-->
         <div class="row">
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                <%--   <li>
                     <i class="icon-home"></i><a href="${basepath }">首页</a> 
                     <i class="icon-angle-right"></i>
                  </li> --%>
                  <li>
                  <a href="${basepath }/base/admin/organization/organization.xhtml" >组织管理</a>
                  <i class="icon-angle-right"></i>
                  </li>
                  <li><span href="#">组织批量导入</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
          <div class="row">
          	<div class="col-md-12" style="display: block;overflow: hidden;margin-bottom: 20px;">
          		<span class="btn btn-success table_add " style="float: left;" onclick="javascript:location.href='${basepath}/modelfile/部门信息导入模板.xls'" >
	               <i class="glyphicon glyphicon-download-alt"></i>
	                                            导入组织模板下载                                                                                                 
	            </span>
          	</div>
           
          </div>
          <div class="row">
          <form id="importForm" action="${basepath }/base/admin/organization/batchorg.xhtml" enctype="multipart/form-data" method="post">
				<input type="file" style="display: none;" id="openfile" name="file" >
		  </form>
         	<!-- 上传文件 -->
         	<div class="col-md-12">
               <!-- BEGIN SAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-film"></i>上传组织excel</div>
                  </div>
                  <div class="portlet-body">
                     <div class=" portlet-tabs">
                        <ul class="nav nav-tabs">
                           <!-- <li><a href="#portlet_tab2" data-toggle="tab" id="make_sure">上传队列</a></li> -->
                           <li class="active"><a href="#portlet_tab1" data-toggle="tab" id="search_file">选择文件</a></li>
                        </ul>
                        <div class="tab-content">
                           <div class="tab-pane active" id="portlet_tab1">
                           		<div name="image" id="fileDragArea" class="drag_upload">
                           			<div class="jiahao">
                           				<i class="glyphicon glyphicon-plus"></i>
                           			</div>
                           		</div>
                                <div class="drag_upload" id="preview_con"></div>
                           </div>
                           <div class="tab-pane" id="portlet_tab2">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- END SAMPLE TABLE PORTLET-->
            </div>
         </div>
       
         <div class="row">
         	<div class="col-md-12">
         	 <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>错误信息列表</div>
                     <div class="actions">
                        <!-- <div class="btn-group">
                           <a href="#" data-toggle="dropdown">
                               <i class="glyphicon glyphicon-align-justify" style="color:#fff;"></i>
                           </a>
                        </div> -->
                     </div>
                  </div>
         	</div>
         </div>
         </div> 
        <div id="table_list" class="mt10">
        <table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
   <thead>
      <tr>
         <th>序号</th>
         <th>错误信息</th>
      </tr>
   </thead>
   <tbody id="tbody">
   <c:forEach var="errorinfo" items="${errorlist}" varStatus="num">
      <tr>
         <td>${num.index+1}</td>
         <td>${errorinfo}</td>
      </tr>
   </c:forEach>
   </tbody>
</table>
 </div>
</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
<script src="${basepath }/static/public/javascripts/course/zxxFile.js" type="text/javascript"></script>
<%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->

</content>	