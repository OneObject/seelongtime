<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="course.studyProgress"/>
<title>学习进度管理</title>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
   <!-- END PAGE LEVEL STYLES --><%-- 
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"> --%>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	<style type="text/css">
	.condition_item > .check_item{margin-bottom:10px;}
	</style>
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">学习进度管理</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	<!-- 搜索 -->
         <div class="row">
            <div class="col-md-12">
               <!--search box-->
              <div class="col-md-12 search_box">
                  <div class="col-md-12">
                   <!--全局搜索框-->
                   <div class="col-md-6 search_container">
                       <div class="input-group">
                          <!-- <input type="text" class="form-control">
                          <span class="input-group-btn">
                           <button class="btn btn-danger" type="button">
                              <i class="icon-search"></i>
                           </button>
                          </span> -->
                            <input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="输入课程名/用户名进行搜索"> <span
                                class="input-group-btn" >
                                <button class="btn btn-danger" type="button" onclick="page(1,true)">
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
         <!--条件选择-->

	         <div class="row">
              <div class="col-md-12">
                <div class="search_condition">
               <!--  
                     <div class="row">
                       
                        <span class="condition_title">职称</span>

                        <input type="hidden" name="jobLevelId" id="JobLevelId" value="${JobLevelrootId}" >
                        <div class="eve_checked " >
                            <ul class="condition_item" id="clear_JobLevel">
	                            <li  class="check_item item_checked" id="JobLevel_org" onclick="clearJobLevel(this,'${JobLevelrootId}')">
	                                <span >不限</span>
	                            </li>
                            </ul>
                        </div>
                        <ul class="condition_item bumen" id="JobLevel_con">
                            <c:forEach var="JobLevel" items="${JobLevelIdList}" varStatus="JobLevelIndex">
		                           <li class="check_item">
		                               <span>${JobLevel.name }</span>
		                           </li>
                            </c:forEach>
                        </ul>
                    </div>
                   --> 
                    <div class="row">
                        <!-- 部门 -->
                        <span class="condition_title">部门</span>
						<input type="hidden"  id="orgRootId" value="${rootId }">
                        <input type="hidden" name="orgId" id="orgId" value="${rootId }" >
                        
                        <div class="eve_checked " style="display: block;">
                            <ul class="condition_item" id="clear_org_con">
	                            <li  class="check_item item_checked" id="clear_org" onclick="clearOrg(this,'${rootId}')">
	                                <span >不限</span>
	                            </li>
                            </ul>
                             <span id="my_showMore" style="display:inline-block;float:right;height:31px;line-height:31px;padding:5pxpx;border: none;color:#529bea;cursor:pointer;display:none;">展开<i class='i icon-sort-down' style="position:relative;left:2px;top:-4px;"></i></span>
                        </div>
                        <ul class="condition_item bumen" id="li_con"  style="clear:left;height:40px;overflow:hidden">
                            <c:forEach var="org" items="${orgList }" varStatus="orgIndex">
		                           <li class="check_item" onclick="check_obj(this, '${rootId }', '${org.id }', '${org.name }', ${org.isLeaf })">
		                               <span>${org.name }</span>
		                           </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="row" style="margin-top: 5px " >包含子部门 <input type="checkbox"  checked="checked" id = "isall"></div>
                </div>
              </div>
         </div>
	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>学习进度列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      
                      <%-- 表格内容 --%>
                      <div id="table_list" class="mt10"></div>
                    
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
         
         <!-- 弹出下载界面 -->
		<div class="easyDialog_wrapper" id="easyDialogWrapperww">
			<div class="easyDialog_content">
				<h4 class="easyDialog_title" id="easyDialogTitle">
					<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						 onclick="easyDialog.close()">&times;</a><span id="content">下载</span>
				</h4>
				<div class="easyDialog_text" style="width:360px;height:120px;display:block;overflow-x:hidden;overflow-y:scroll;">
					<!-- Tab panes -->
					<div class="tab-content" id="errorMsg">
						<p style="margin-left: 88px">课程学习进度已导出，请下载</p>
					  	 <a href="" target="new_blank" class="btn btn-success table_add" id="exportUrl" style="width: 128px;margin-right: 100px; margin-top: 15px;" onclick="easyDialog.close()" >
                              <i class="glyphicon glyphicon-plus"></i>点击下载
                         </a>
					</div>
				</div>
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
	<script type="text/javascript" src="${basepath }/static/public/javascripts/studyprogress.js" charset="UTF-8"></script>
	<script src="${basepath}/static/public/easydialog-v2.0/easydialog.js"></script>
	<script type="text/javascript">
	$(function (){
		$("#my_showMore").show();
		$("#my_showMore").click(function(){
			var v=$(this).text(); 
			if(v=="展开"){
				$("#my_showMore").html("收缩<i class='i icon-sort-up' style='position:relative;left:2px;top:5px;'></i>");
				$("#li_con").css({"height":"100%","overflow":"auto"});				
			}else if(v=="收缩"){
				$("#my_showMore").html("展开<i class='i icon-sort-down' style='position:relative;left:2px;top:-4px;'></i>");
				$("#li_con").css({"height":"40px","overflow":"hidden"});				
			}	
		});	
		
		$("#searchContent").keydown(function(e){
		        var curKey = e.which;
		           if(curKey == 13){
		        	   page(1,true);
		                return false;
		           }
		   });
		});
	function handling(){
		easyDialog.open({
			  container :'loading_img',
			  fixed : false,
			  overlay:true
			});
	}
	function exportStudyDetail(type){
		
		var isAll = $("#isall").attr("checked"); //导出是否包含子节点
		var orgname = $('.item_checked > span').html();
		handling();
		setTimeout(function(){$.ajax({
			type:"POST",
			url:basepath+"/base/admin/coursetrace/export.json",
			data:{"cname":$("#searchContent").val(),"orgId":$("#orgId").val(),"isAll":isAll,"orgName":orgname,"type":type},
			success:function(data){
				if(data.flag)
				{	
				    //easyDialog.close();
					$("#exportUrl").attr("href",basepath+"/"+data.relativepath);
					$("#content").html("提示");
				
					easyDialog.open({
				    	container :"easyDialogWrapperww"
				    });
				}
				else
				{
					showMsgDialog(data.message);
				}	
			},
			error:function(data){
				showMsgDialog("系统异常，请刷新后重新尝试。");
			}
		});},1000);
		
	}
	
	function showMsgDialog(content){
		easyDialog.open({
	        container : {
	            header : '提示',
	            content : '<div style="background-color: #ffffff;width:320px;height:60px;text-align:center;">'+content+'</div>'
	        },
	        autoClose:2000
	    });
	}

	</script> 
</content>
<content tag="pageInit">
</content>  
