<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>签到管理</title>
<meta name="menu_path" content="active.menu_signin" />
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	<style type="text/css">
		.qrcodeTable table{
			position:relative;
			left: 47px;
		}
	</style>
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">签到管理</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	<!-- 搜索 -->
	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>签到列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      <div class="row">
                            <span class="btn btn-success table_add"  onclick="insertEntity();">
                               <i class="glyphicon glyphicon-plus"></i>添加签到</span>
                      </div>
                      
                      <%-- 表格内容 --%>
                      <div id="table_list" style="margin-top:10px;"></div>
                    
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
         <div  id="qrcodeTablebox" style="display:none; width: 380px;">
			<div id="qrcodeTable" class="qrcodeTable" style="margin: 0px auto 15px;"></div>
			<div id="url" style="word-break:break-all;width: 380px;"></div>
			<div class="copy-btn" style="cursor: pointer;text-align:center;color:#529bea;line-height:32px;width:150px;margin:0 auto;"> 点击复制URL</div>
		</div>
</body>
</html>
<content tag="pageCore">
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.zclip.js"></script>
<script type="text/javascript">
page(1);
function page(i){
	$('#table_list').load("${basepath}/mgr/signin/list.list?currPage="+i,function(){
	});
}
function insertEntity(){
	location = "${basepath}/mgr/signin/tostep1.xhtml";
}
var m = "";
var btnFn = function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/signin/delete.xhtml",
		data: {"id":m},
		success:function(data){
			page(1);
			return true;
		},
		error: function(data){
			alert('删除失败');
		}
	});
	
};
function del(id){
	m = id;
	var html = '<div style="width:280px;height:40px;text-align:center;"><h3>您确定要删除该签到么？</h3></div>';
	easyDialog.open({
	    container : {
	    	header : 'ajy温馨提示',
	    	content : html,
	    	yesFn : btnFn,
	    	noFn : true
	    }
	});
}
function createCode(id,needBind){
	if(needBind){
		var url="${basepath}/mgr/signin/createcode.list?id="+id+"&needbind=need";
		}else{
			var url="${basepath}/mgr/signin/createcode.list?id="+id;
			}
	
	window.open(url,'_blank');
}
function todetail(id){
	location ="${basepath}/mgr/signin/detail.xhtml?id="+id;
	
}
function qrcode(url){
	$('#qrcodeTable').html("");
	jQuery('#qrcodeTable').qrcode({
		render	: "table",
		text	: url
	});	
	$("#url").html(url);
	easyDialog.open({
		  container : {
		    header : '使用微信扫描二维码',
		    content : $('#qrcodeTablebox').html()
		    //noFn : true
		  }
		});
	$(".copy-btn").zclip({
		path: "${basepath }/static/js/ZeroClipboard.swf",
		copy: function(){
			var str = $('#url').html().replace(/(&amp;)/g, '&');
			return str;
		},
 		afterCopy:function(){/* 复制成功后的操作 */
			var html="<div style='width:300px;text-align:center;'>复制成功！</div>";
			easyDialog.open({
				container : {
					header : '提示',
					content : html
				},
	
			});
	    }
	});	
	$('.qrcodeTable').find("table").removeAttr("style");
}

</script>
</content>
