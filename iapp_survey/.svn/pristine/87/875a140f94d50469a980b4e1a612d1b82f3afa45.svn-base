<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>话题管理</title>
     <meta name="menu_path" content="system.topic"/>
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
                          <input type="text" class="form-control" id="searchContent" placeholder="话题标题/话题名称">
                          <span class="input-group-btn">
                           <button  onclick="search1();" class="btn btn-danger" type="button">
                              <i class="icon-search"></i>
                           </button>
                          </span>
                        </div>
                        </div>                  
                  </div>
              </div>
            </div>
         </div>
        <div class="row" id="search2">
              <div class="col-md-12">
                <div class="search_condition">
                    <div class="row">
                        <span class="condition_title">类别</span>
                        <ul class="condition_item ">
                            <li class="check_item item_checked" id="commontopic" onclick="itemselect1(this);" t="0">
                                <span >未关联活动的话题</span>
                            </li>
                             <li class="check_item" id="activetopic" t="1" onclick="itemselect2(this);">
                                <span>关联活动的话题</span>
                            </li>
                        </ul>
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
                     <div class="caption" ><i class="icon-globe"></i><span id="topictitle">话题列表</span></div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                  <div class="row">
                            <span class="btn btn-success table_add" onclick="batchdel()">
                               <i class="glyphicon glyphicon-remove"></i>批量删除
                            </span>
                      </div>
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
var type=0;
page(1);
function page(i){
	 var params="currPage="+i;

	 var searchval=$.trim($("#searchContent").val());

	 if(searchval==null || searchval==""){
	           
	        }else{
	               params=params+"&searchval="+searchval;
	            }
	 params=params+"&type="+type;
	 if(type==0){//一般话题
		$('#table_list').load("${basepath}/mgr/topic/topicstudentlists.list?"+params,function(){
			replace_one();
		});
		}else if(type==1){//活动话题

		$('#table_list').load("${basepath}/mgr/topic/topicstudentlist.list?"+params,function(){
			replace_one();
		});
			} 
}


/*将表情符转意过来*/
function replace_em(str){
    //str = str.replace(/\</g,'<；');
    //str = str.replace(/\>/g,'>；');
   // str = str.replace(/\n/g,'<；br/>；');
    str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${basepath}/static/qqface/face/$1.gif" border="0"  style="width:24px;height:24px"/>');
    return str;
}
//逐个转意的方法
function replace_one(){
	$("#praiselist").find(".contanttext").each(function(){
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
function batchdel(){
	var items=$("input[name='ids']:checked");
    var ids="";
    $("input[name='ids']:checked").each(function(){
    	ids=ids+$(this).val()+",";
        });
	if(items.length==0){
		showMsgDialog("您还没有选中任何选项");
		return;
		}else{
            if(confirm("您确定要删除这"+items.length+"条记录吗？")){
               var url=basepath+"/mgr/topic/batchtopicstudentdel.json";
                  $.ajax({
                         type:"POST",
                         url:url,
                         data:{"ids":ids},
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
}

function itemselect1(thi){
	type=$(thi).attr("t");
	$(thi).removeClass("item_checked");
	$(thi).addClass("item_checked");
	$("#activetopic").removeClass("item_checked");
	page(1);
}
function itemselect2(thi){
	type=$(thi).attr("t");
	$(thi).removeClass("item_checked");
	$(thi).addClass("item_checked");
	$("#commontopic").removeClass("item_checked");
	page(1);
}
function search1(){
	page(1);
	}



var btnFn2=function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/topic/delstudenttopic.json",
		data: {"id":submitId},
		success:function(data){
			showMsgDialog("删除成功");
			page(1);
		},
		error: function(data){
			showMsgDialog("删除失败");
		}
	});  
}

function  delstudent(id){
	submitId = id;
	var html = '<div style="width:350px;height:70px;text-align:center;"><br/><h4>您确定要删除该素材吗?</h4></div>';
	easyDialog.open({
	    container : {
	    	header : '提示',
	    	content : html,
	    	yesFn : btnFn2,
	    	noFn : true
	    }
	});
}



function recommend(id){
	var types=$("#search2").find(".item_checked").attr("t");
	var r=$("#recommend_"+id).attr("r");
	if(r==0){//推荐
		$.ajax({
            type:"POST",
            url:basepath+"/mgr/topic/recommendtopicstudent.json",
            data:{"id":id},
            success:function(data){
                   if(data){
                	   var i=$(".pagination").find(".active").find("a").text();
                       page(i);
                       }else{
                    	   showMsgDialog("无法推荐");
                           }
                }
		  });
		}else if(r==1){//取消推荐
			$.ajax({
	            type:"POST",
	            url:basepath+"/mgr/topic/cancelrecommendtopic.json",
	            data:{"id":id},
	            success:function(data){
	                   if(data){
	                	   var i=$(".pagination").find(".active").find("a").text();
                           page(i);
	                       }else{
	                    	   showMsgDialog("取消推荐失败");
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


function shield(id,status){
	if(status==0){//屏蔽操作 

		$.ajax({
            type:"POST",
            url:basepath+"/mgr/topic/shield.json",
            data:{"id":id,"status":status},
            success:function(data){
                   if(data){
                	   var i=$(".pagination").find(".active").find("a").text();
                       page(i);
                       }else{
                    	   showMsgDialog("操作失败");
                           }
                }
			  });
		
	}else if(status==1){//取消屏蔽 
		$.ajax({
            type:"POST",
            url:basepath+"/mgr/topic/shield.json",
            data:{"id":id,"status":status},
            success:function(data){
                   if(data){
                	   var i=$(".pagination").find(".active").find("a").text();
                       page(i);
                       }else{
                    	   showMsgDialog("操作失败");
                           }
                }
			  });
		  
	}
}

</script>
</content>
<content tag="pageInit">
</content>  
