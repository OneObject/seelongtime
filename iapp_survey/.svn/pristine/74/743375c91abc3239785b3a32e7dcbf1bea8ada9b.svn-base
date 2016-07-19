<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>栏目管理</title>
	<meta name="menu_path" content="ixin.menu_channel"/>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	<link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css">
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
                  <li><span href="javascript:void(0)">栏目管理</span></li>
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
                     <div class="caption" ><i class="icon-globe"></i><span id="channeltitle">栏目列表</span></div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                     <div class="row">
                       <span class="btn btn-success table_add" onclick="addChannel()" >
                               <i class="glyphicon glyphicon-plus"></i>
                                                                               新增栏目                    
                       </span>
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
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.zclip.js"></script>
<script type="text/javascript">
page(1);
function page(i){
	var param="currentpage="+i;
	var url="${basepath}/mgr/channel/list.list?"+param;
	$("#table_list").load(url,function(){
		});
}
/**
 * 添加栏目
 */
function addChannel(){
	location.href="${basepath}/mgr/channel/toadd.xhtml";
}

var m = "";
var btnFn = function(){
	var url="${basepath}/mgr/channel/delchannel.json";
    $.ajax({
          type:"post",
          url:url,
          data:{"id":m},
          success:function(data){
              if(data){
            	  showDialogMessage("删除成功");
            	  setTimeout(function(){
                 		 page(1);
                	},1000);
                  }else{
                	  showDialogMessage("删除失败");
                  }
              }
         
        });
};
function del(id){
	m = id;
	var html = '<div style="width:280px;height:40px;text-align:center;">是否确定删除？</div>';
	easyDialog.open({
   	 	container : {
    	header : '提示',
    	content : html,
    	yesFn : btnFn,
    	noFn : true
   		}
   		
	});
  
}
function showDialogMessage(text){
	var html = '<div style="width:280px;height:40px;text-align:center;">'+text+'</div>';
	easyDialog.open({
   	 	container : {
    	header : '提示',
    	content : html
   		},
   		autoClose : 2000
	});
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
<content tag="pageInit">
</content>  
