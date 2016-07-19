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
<title>问答管理</title>
<meta name="menu_path" content="system.ask" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/base/admin/iask/questions.xhtml">提问列表</a><i class="icon-angle-right"></i></li>
                <li><span>回答列表</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<!-- 全局搜索组建开始 -->
	<div class="row">
		<div class="col-md-12">
			<!--search box-->
			<div class="col-md-12 search_box">
				<div class="col-md-12">
					<!--全局搜索框-->
					<div class="col-md-6 search_container">
						<div class="input-group">
							<input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="输入内容/作者名称进行搜索"> <span
								class="input-group-btn" onclick="page(1)">
								<button class="btn btn-danger" type="button">
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
	<!-- 全局搜索组建结束-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i> 回答(${questionEntity.title})列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 60px;">
					<!-- <div class="row">
						<span class="btn btn-success table_add" onclick="openCredit('0')">&nbsp;操作</span>
					</div> -->
                    <!-- 表格内容 -->
                    <div id="table_list"  class="mt10"></div>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript">
var id="${questionEntity.id}";
$(function (){
	page(1);
});

/**
 * 分页+搜索
 */
function page(i) {
	var divId = "table_list";
	var max = $("#"+divId+" #page_max").val();
	//AJAX提示
	loading(divId);

	var data = {"searchContent":$("#searchContent").val(),
			"page":i,"id":id, "max":max, "r":Math.random()};
	var url = basepath+"/base/admin/iask/listforanswer.list";
	$("#"+divId).load(encodeURI(url), data, function(){

	});
	
}


/**
 * 删除
 * @param id
 */
function deleteAnswer(id){
	var tempFn = function (){
		$.ajax({
			type:"POST",
			url:basepath+"/base/admin/iask/answer/delete.json",
			data:{"id":id},
			success:function(data){
				if(data){
					var html="<div style='width:300px;text-align:center;'>操作成功</div>";
	    			easyDialog.open({
	    				container : {
	    				    header : '提示',
	    					content : html
	    				},
	    				autoClose : 1200,
	    				callback : function(){page(1);}
	    			});
				} else {
					showSureMsgDialog("删除失败，请刷新后重新尝试！");
				}
    			
			},
			error:function(data){
				showSureMsgDialog("系统异常，请刷新后重新尝试！");
			}
		});
	}
	
	var html="<div style='width:300px;height:40px;text-align:center;'>确定要删除吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
	});
}

function showSureMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:300px;height:50px;text-align:center;">'+content+'</div>'
        },
        yesFn : function(){return true;}
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

function commentList(resid,restype){
	window.location.href=basepath+"/mgr/comment/commentindex.xhtml?resid="+resid+"&restype="+restype;
}


</script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
</content>
