<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>微信墙管理</title>
	<meta name="menu_path" content="active.menu_topic"/>
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
                  <li><span href="javascript:void(0)">评论列表</span></li>
               </ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	<div class="row">
            <div class="col-md-12">
               <!--search box
              <div class="col-md-12 search_box">
                  <div class="col-md-12">
                   <div class="col-md-6 search_container">
                       <div class="input-group">
                            <input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="输入评论内容"> <span
                                class="input-group-btn" >
                                <button class="btn btn-danger" type="button" onclick="page(1)">
                                    <i class="icon-search"></i>
                                </button>
                            </span>
                        </div>
                        </div>                  
                  </div>
              </div>-->
            </div>
         </div>
	
	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>评论列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                  <div class="row">
                  			<span class="btn btn-success table_add" onclick="reload();">
                               	刷新 
                            </span>
                            
                            <span class="btn "><label><input type="checkbox" id="autoReload">启动10s自动刷新</label></span>
                            
                            <span class="btn btn-success table_add" onclick="updateStatus(0);">
                               	通过审核 
                            </span>
                            <span class="btn btn-success table_add" onclick="updateStatus(1);">
                               	取消审核 
                            </span>
                            
                            
                      </div>
                      <%-- 表格内容 --%>
                      <div id="table_list" style="margin-top:10px;"></div>
                      <input name="shield" type="hidden" id="status" />
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
</body>
</html>
<content tag="pageCore">
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript">

var temp;
$("#autoReload").click(function(){
	if($(this).is(":checked")){
		temp = setInterval(func,10000);
	}else{
		window.clearInterval(temp)
	}
});
function func(){
	//alert(1);
	reload();
}



function reload(){
	page(1);
}

page(1);
function page(i){
	$('#table_list').load("${basepath}/mgr/include/topiccommentlist.xhtml?topicId=${topicId}&currPage="+i,function(){
		
	});
}
function shieldComment(id,shield){
	var html = '<div style="width:350px;height:70px;text-align:center;"><h3>您确定要取消审核该条记录？</h3></div>';
	if(shield == 0 ){
		 html = '<div style="width:350px;height:70px;text-align:center;"><h3>您确定通过审核该条记录？</h3></div>';
	}
	easyDialog.open({
	    container : {
	    	header : '提示',
	    	content : html,
	    	yesFn : function(){
	    		$.ajax({
	    			type: "POST",
	    			url:  basepath+"/mgr/topiccomment/shield.xhtml",
	    			data: {"id":id,"shield":shield},
	    			success:function(data){
	    				page(1);
	    			},
	    			error: function(data){
	    				alert('操作失败');
	    			}
	    		});  
	    	},
	    	noFn : true
	    }
	});
}

var submitId = "";
var btnFn = function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/topiccomment/del.xhtml",
		data: {"id":submitId},
		success:function(data){
			page(1);
		},
		error: function(data){
			alert('删除失败');
		}
	});  
}

function del(id){
	submitId = id;
	var html = '<div style="width:350px;height:70px;text-align:center;"><h3>您确定要删除么？</h3></div>';
	easyDialog.open({
	    container : {
	    	header : '提示',
	    	content : html,
	    	yesFn : btnFn,
	    	noFn : true
	    }
	});

}

/**
 * 全部选中
 */
//var flag = true;//没有选中的情况下是true
function checked_all(_this){
	if(_this.checked){
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

/**
 * 批量通过审核 /取消审核 
 */
function updateStatus(status){
	var msg = "";
	var ids = $("input[name='ids']:checked")
	if(status == 1){
		msg = "确定要取消审核"+ids.length+"条评论吗";
	} else{
		msg = "确定要通过审核"+ids.length+"条评论吗";
	}
	if(ids.length < 1){
		easyDialog.open({
			container : {
			    header : '提示',
				content : '<div style="width:300px;text-align:center;">请选择要操作的评论</div>'
			},
			autoClose : success_time
		});
		return;
	}

	var html = '<div style="width:350px;height:70px;text-align:center;"><h3>' + msg + '</h3></div>';
	easyDialog.open({
	    container : {
	    	header : '提示',
	    	content : html,
	    	yesFn :function (){
	    		 $("#status").val(status);
	    			var items = $("input[name='ids']:checked, #status");
	    		$.post(basepath+"/mgr/topiccomment/batchshield.xhtml", $.param(items), function (ret){
					var resultHtml = "";
	    			if(ret){
	    				resultHtml = "<div style='width:300px;text-align:center;'>操作成功</div>";
	    			}
	    			else{ 
	    				resultHtml = "<div style='width:300px;text-align:center;'>操作失败</div>";
	    			}
	    			easyDialog.open({
    					container : {
    					    header : '提示',
    						content : resultHtml
    					},
    					autoClose : success_time
    				});
	    			//document.location.reload();//当前页面
	    			page(1);
	    		});
	    	},
	    	noFn : true
	    }
	}); 
}
</script>
</content>
<content tag="pageInit">
</content>  
