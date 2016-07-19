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
<title>活动内容关联设置</title>
<meta name="menu_path" content="active.menu_activity" />
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/base.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
    <link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
    <link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
    <link rel="stylesheet"  href="${basepath}/static/ixin/css/media.css" type="text/css">
    <link rel="stylesheet" href="${basepath}/static/ixin/css/media_list.css" type="text/css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                 <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><a href="${basepath }/mgr/activity/index.xhtml">活动管理</a><i class="icon-angle-right"></i></li>
                  <li><span href="javascript:void(0)">活动内容关联</span></li>
            </ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->

	<div class="row">
        <div class="col-md-12">
            <div class="note note-success">
			<table class="searchContent" style="padding-top: 8px; width:100%;">
				<tr>
					<td>
					<span>活动名称：${activity.name}</span>
					</td>
				</tr>
			</table>
		</div>
        </div>
    </div>	
	
	
	<!-- 全局搜索组建开始 -->
	<ul class="nav nav-tabs">
         <li class="tabLi"> <a href="#vote" data-toggle="tab" id="tab_vote" onclick="changeTab('vote');">投票</a></li>
         <li class="tabLi"> <a href="#survey" data-toggle="tab" id="tab_survey" onclick="changeTab('survey');">调查</a></li>
         <li class="tabLi" > <a href="#lottery" onclick="changeTab('lottery');" id="tab_lottery" data-toggle="tab">抽奖</a></li>
         <li class="tabLi" > <a href="#rank" onclick="changeTab('rank');" id="tab_rank" data-toggle="tab">排行榜</a></li>
    </ul>
    <div class="tab-content">
    
    
      <!-- Tab panes -->
      
 <!-- ////////////////////////////////////// -->
      <div class="tab-pane  active" id="vote">
      	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>已关联
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 10px;">
                    <!-- 表格内容 -->
                    <div  class="mt10" id="list_vote">
                    </div>
				</div>
			</div>
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
                            <input type="text" class="form-control" id="name_vote" name="name_vote" placeholder="输入名称进行搜索"> <span
                                class="input-group-btn" >
                                <button class="btn btn-danger" type="button" onclick="doSelectPage(1)">
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
         
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>选择列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 10px;">
				<div class="row">
                            <span class="btn btn-success table_add"  onclick="submitAdd();">
                               <i class="glyphicon glyphicon-plus"></i>确认添加</span>
                      </div>
                      
                    <!-- 表格内容 -->
                    <div id="select_list_vote"  class="mt10">
                    </div>
				</div>
			</div>
		</div>
	</div>
    </div>
<!-- ////////////////////////////////////// -->
    
    <!-- ////////////////////////////////////// -->
      <div class="tab-pane  active" id="survey">
      	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>已关联
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 10px;">
                    <!-- 表格内容 -->
                    <div  class="mt10" id="list_survey">
                    </div>
				</div>
			</div>
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
                            <input type="text" class="form-control" id="name_survey" name="name_survey" placeholder="输入名称进行搜索"> <span
                                class="input-group-btn" >
                                <button class="btn btn-danger" type="button" onclick="doSelectPage(1)">
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
         
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>选择列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 10px;">
				<div class="row">
                            <span class="btn btn-success table_add"  onclick="submitAdd();">
                               <i class="glyphicon glyphicon-plus"></i>确认添加</span>
                      </div>
                      
                    <!-- 表格内容 -->
                    <div id="select_list_survey"  class="mt10">
                    </div>
				</div>
			</div>
		</div>
	</div>
    </div>
<!-- ////////////////////////////////////// -->
        
   
   
   
    <!-- ////////////////////////////////////// -->
      <div class="tab-pane  active" id="lottery">
      	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>已关联
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 10px;">
                    <!-- 表格内容 -->
                    <div  class="mt10" id="list_lottery">
                    </div>
				</div>
			</div>
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
                            <input type="text" class="form-control" id="name_lottery" name="name_lottery" placeholder="输入名称进行搜索"> <span
                                class="input-group-btn" >
                                <button class="btn btn-danger" type="button" onclick="doSelectPage(1)">
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
         
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>选择列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 10px;">
				<div class="row">
                            <span class="btn btn-success table_add"  onclick="submitAdd();">
                               <i class="glyphicon glyphicon-plus"></i>确认添加</span>
                      </div>
                      
                    <!-- 表格内容 -->
                    <div id="select_list_lottery"  class="mt10">
                    </div>
				</div>
			</div>
		</div>
	</div>
    </div>
<!-- ////////////////////////////////////// -->

    <!-- ////////////////////////////////////// -->
      <div class="tab-pane  active" id="rank">
      	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>已关联
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 10px;">
                    <!-- 表格内容 -->
                    <div  class="mt10" id="list_rank">
                    </div>
				</div>
			</div>
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
                            <input type="text" class="form-control" id="name_rank" name="name_rank" placeholder="输入名称进行搜索"> <span
                                class="input-group-btn" >
                                <button class="btn btn-danger" type="button" onclick="doSelectPage(1)">
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
         
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>选择列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 10px;">
				<div class="row">
                            <span class="btn btn-success table_add"  onclick="submitAdd();">
                               <i class="glyphicon glyphicon-plus"></i>确认添加</span>
                      </div>
                      
                    <!-- 表格内容 -->
                    <div id="select_list_rank"  class="mt10">
                    </div>
				</div>
			</div>
		</div>
	</div>
    </div>
<!-- ////////////////////////////////////// -->


       </div>
	
	
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript">
var qiniuImageBasePath = "${map.qiniuImageBasePath}";
var coverSuffix = "${map.coverSuffix}";
</script>
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
  
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
var type = "${type}";
var i=0;
var pageindx = 1;
function loadItems(){
	$("#list_"+type).load("${basepath}/mgr/activity/relation/items.list?aid=${activity.id}&type="+type);
}
function doSelectPage(i){
	pageindx = i;
	var name = $("#name_"+type).val();
	$("#select_list_"+type).load("${basepath}/mgr/activity/relation/select.list?page="+i+"&type="+type+"&name="+name);
}

function changeTab(newtype){
	type =  newtype;
	$.ajaxSetup({async: false});
	loadItems();
	doSelectPage(1);
	$.ajaxSetup({async: true});
}

$("#tab_"+type).click();

//提交删除
function submitDel(id){
	
	if(!confirm("确定删除吗？")){
		return ;
	}
	$.ajax({
		   type: "POST",
		   url: "${basepath}/mgr/activity/relation/delete.xhtml",
		   data: {"id":id},
		   success: function(msg){
 		   if(msg){
				 	$.ajaxSetup({async: false});
				 	loadItems();
				 	doSelectPage(pageindx);
				 	$.ajaxSetup({async: true});
				 	alert("删除成功");
     		}
		   }
		});
}


//提交新增
function submitAdd(){
	i=i+1;
	if(i>1){
		return;
		}
    var ids="";
    var names = "";
	$("input:checked").each(function(){
      if($(this).attr("disabled")!="disabled"){
    	  var id = $(this).val();
      	ids=ids+id+",";
      	names=names+$("#name_"+id).val() +",";
      }        	
    	});
    if(ids==""){
		/*var html="<div style='width:300px;text-align:center;'>"+未选中任何信息+"</div>";
		easyDialog.open({
			container : {
			    header : '提示',
				content : html
			},
			autoClose : success_time,
			callback : function(){}
		});*/
		alert("未选中任何信息");
		return;
        }
    $.ajax({
		   type: "POST",
		   url: "${basepath}/mgr/activity/relation/add.xhtml",
		   data: {"ids":ids,"aid":"${activity.id}","type":type,"names":names},//"ids="+ids+"&aid=+${activity.id}&type="+type,
		   success: function(msg){
			   i=0;
    		   if(msg){
   				  	alert("添加成功");
   				 	$.ajaxSetup({async: false});
   				 	loadItems();
   				 	doSelectPage(pageindx);
   				 	$.ajaxSetup({async: true});
        		}
		   }
		});
	

    }
    


</script>
</content>
