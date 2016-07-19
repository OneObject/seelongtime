<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>话题管理</title>
	<meta name="menu_path" content="active.menu_activity"/>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	<link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css">
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><a href="${basepath }/mgr/activity/index.xhtml">活动管理</a><i class="icon-angle-right"></i></li>
                  <li><span href="javascript:void(0)">话题管理</span></li>
               </ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	  <!-- 页头-->
         <div class="row">
            <div class="col-md-12">
               <!--search box-->
              <div class="col-md-12 search_box">
                  <div class="col-md-12">
                   <!--全局搜索框-->
                   <div class="col-md-6 search_container">
                       <div class="input-group">
                          <input type="text" class="form-control" id="searchContent" placeholder="话题名称">
                          <span class="input-group-btn">
                           <button onclick="page(1)" class="btn btn-danger" type="button">
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
                     <div class="caption"><i class="icon-globe"></i>话题列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      <%-- 表格内容 --%>
                      <div id="table_list" style="margin-top:10px;"></div>
                    
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
</body>
</html>
<content tag="pageCore">
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath}/static/qqface/jquery.qqFace-huati.js"></script>
<script type="text/javascript">
function insertEntity(){
	location = "${basepath}/mgr/topic/add.xhtml";
}
page(1);
function page(i){
    var params="currPage="+i+"&activityid=${activityid}";

    var searchval=$.trim($("#searchContent").val());

    if(searchval==null || searchval==""){
           
        }else{
               params=params+"&searchval="+searchval;
            }
	
	$('#table_list').load("${basepath}/mgr/include/topicstudentlist.xhtml?"+params,function(){
		replace_one();
	});
}

function del(id){
	if(confirm("确定要删除吗？")){
		$.ajax({
	           type:"post",
	           url:basepath+"/mgr/topic/delstudenttopic.json",
	           data:"id="+id,           
	           success:function(data){
	                 if(data){
	                	 showMsgDialog("删除成功");
	                     page(1);
	                     }else{
	                    	 showMsgDialog("删除失败");
	                         }
	              }
			});
		}
}

function totop(id){
	var types=$("#search2").find(".item_checked").attr("t");
    var t=$("#top_"+id).attr("t");
       if(t==0){//置顶
    	   $.ajax({
               type:"POST",
               url:basepath+"/mgr/topic/topstudenttopic.json",
               data:{"id":id},
               success:function(data){
                      if(data){
                        var i=$(".pagination").find(".active").find("a").text();
                           page(i);
                          }else{
                       	   showMsgDialog("无法置顶");
                              }
                   }
 			  });
           }else if(t==1){//取消置顶
        	   $.ajax({
                   type:"POST",
                   url:basepath+"/mgr/topic/canceltoptopic.json",
                   data:{"id":id},
                   success:function(data){
                          if(data){
                        	  var i=$(".pagination").find(".active").find("a").text();
                              page(i);
                              }else{
                           	   showMsgDialog("取消置顶失败");
                                  }
                       }
     			  });
               }
}

/*将表情符转意过来*/
function replace_em(str){
    //str = str.replace(/\</g,'<；');
   // str = str.replace(/\>/g,'>；');
   // str = str.replace(/\n/g,'<；br/>；');
    str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${basepath}/static/qqface/face/$1.gif" border="0"  style="width:24px;height:24px"/>');
    return str;
}
//逐个转意的方法
function replace_one(){
	$("#topiclist").find(".contanttext").each(function(){
		var html = replace_em($(this).html().toString());
		$(this).html(html);
	});
}

function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
        },
        autoClose:1200
    });
}

</script>
</content>
<content tag="pageInit">
</content>  
