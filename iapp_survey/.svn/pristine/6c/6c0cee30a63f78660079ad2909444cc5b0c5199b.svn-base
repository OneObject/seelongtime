<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="course.courseManage"/>
<title>系列课程</title>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
   <!-- END PAGE LEVEL STYLES -->
   <link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/video.css">
	
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				  <li><a href="${basepath }/base/admin/course/course/coursemanage.xhtml">课程管理</a><i class="icon-angle-right"></i></li>
				<li><span href="#">关联课程列表</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	
	  <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>已关联课程列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                     
                      
                      <%-- 表格内容 --%>
                      <div id="table_listu1" style="margin-top:10px;"></div>
                      
                      </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
	
	
	
	
	
	<!-- 搜索 -->
         <div class="row">
            <div class="col-md-12">
               <!--search box-->
              <div class="col-md-12 search_box">
                  <div class="col-md-12">
                   <!--全局搜索框-->
                   <div class="col-md-6 search_container">
                       <div class="input-group">
                            <input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="输入名称进行搜索"> <span
                                class="input-group-btn" >
                                <button class="btn btn-danger" type="button" onclick="listcourse(1)">
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

	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>课程列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      <div class="row">
                            <span class="btn btn-success table_add"  onclick="tijiao();">
                               <i class="glyphicon glyphicon-plus"></i>确认添加</span>
                      </div>
                      
                      <%-- 表格内容 --%>
                      <div id="table_listu" style="margin-top:10px;"></div>
                      
                      </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
</body>
</html>
<content tag="pageCore">
 <!-- END PAGE LEVEL PLUGINS -->
 <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/jquery.dataTables.min.js"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
   <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
   <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.js"></script>
 <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script><%-- 
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script> --%>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit">
   
   <script type="text/javascript">
   var packageid="${packageid}";
   $(document).ready(function(){
	   listpackage(1);
	   });
   
    function deleteSingle(id){
       if(id=="" || id==null){
           return;
           }
        $.ajax({
 		   type: "POST",
 		   url: "${basepath}/base/admin/course/package/deletelink.xhtml",
 		   data: "id="+id,
 		   success: function(msg){
 	 		   if(msg){
 	 			 listpackage(1);
 	 	 		   }
 		   }
        });
    }
   
   //提交信息
    function tijiao(){
        var ids="";
    	$("input:checked").each(function(){
          if($(this).attr("disabled")!="disabled"){
          ids=ids+$(this).val()+",";
          }        	
        	});
        if(ids==""){
			var html="<div style='width:300px;text-align:center;'>未选中任何信息</div>";
			easyDialog.open({
				container : {
				    header : '提示',
					content : html
				},
				autoClose : success_time,
				callback : function(){}
			});
			return;
            }
    	$.ajax({
    		   type: "POST",
    		   url: "${basepath}/base/admin/course/package/courselink.xhtml",
    		   data: "ids="+ids+"&packageid="+packageid,
    		   success: function(msg){
        		   if(msg){
        			  var html="<div style='width:300px;text-align:center;'>添加成功</div>";
        				easyDialog.open({
        					container : {
        					    header : '提示',
        						content : html
        					},
        					autoClose : success_time,
        					callback : function(){page(1,"all");}
        				});
       				listpackage(1);
            		   }
    		   }
    		});
        }
   function listpackage(i){
	   var max = $("#table_listu1 #page_max").val();
        loading("table_listu1");
	   var data = {"page":i, "max":max, "r":Math.random(),"packageid":packageid};
	   var url=basepath+"/base/admin/course/package/listcoursepackage.list";
	   $("#table_listu1").load(encodeURI(url), data, function(){
			listcourse(i);
		});
	   }
   function listcourse(i){
	   var max = $("#table_listu  #page_max").val();
		loading("table_listu");
       var querycondition=$.trim($("#searchContent").val());
	   var data = {"page":i, "max":max, "r":Math.random(),"packageid":packageid,"querycondition":querycondition};
	   var url=basepath+"/base/admin/course/package/listcourse.list";
	   $("#table_listu").load(encodeURI(url), data, function(){
		    var chooseids=new Array();
		    var ids=new Array();
		    var sames=new Array();
			$("input[name='chooseids']").each(function(){
				   chooseids.push($(this).val());
				});
			$("input[name='ids']").each(function(){
				   ids.push($(this).val());
				  
				});
            for(var i=0;i<ids.length;i++){
                 for(var j=0;j<chooseids.length;j++){
                       if(ids[i]==chooseids[j]){
                           sames.push(ids[i]);
                           }
                     }
                }
           if(sames.length>0){
               for(var k=0;k<sames.length;k++){
                   $("#name_"+sames[k]).attr("checked","checked");
                   $("#name_"+sames[k]).attr("disabled","disabled");
                   }
               }	
		});
	   }
   
	   /**
	    * 全部选中
	    */
	   function checked_all(obj){
	   	if($(obj).attr("checked") == "checked"){
	   		$("input[name='ids']").each(function(){
	   			$(this).attr("checked","checked");
	   			$(this).parent().addClass("checked");
	   		});
	   	}else{
	   		$("input[name='ids']").each(function(){
	   			$(this).removeAttr("checked");
	   			$(this).parent().removeClass("checked");
	   		});
	   	}
	   }
   </script>
   
   
   
   
</content>  
