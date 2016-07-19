<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>调研活动管理</title>
	<meta name="menu_path" content="active.menu_survey_activity"/>
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
			<ul class="page-breadcrumb breadcrumb">
                 <%--  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                   --%><li><span href="javascript:void(0)">调研活动列表</span></li>
               </ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
    <div class="row">
           <div class="col-md-12">
              <!--search box-->
             <div class="col-md-12 search_box">
                 <div class="col-md-12">
                  <!--全局搜索框-->
                  <div class="col-md-6 search_container">
                      <div class="input-group">
                          <input type="hidden" id="status" name="status" value="" >
                           <input type="text" class="form-control" value="${name}" id="searchContent" name="searchContent" placeholder="输入标题/标签进行搜索"> <span
                               class="input-group-btn" >
                               <button class="btn btn-danger" type="button" onclick="page(1)">
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
                     <div class="caption"><i class="icon-globe"></i>调研活动列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      <div class="row">
                            <span class="btn btn-success table_add"  onclick="insertEntity();">
                               <i class="glyphicon glyphicon-plus"></i>添加调研活动</span>
                               
                            <span class="btn btn-success table_add"  onclick="page(1);">刷新</span>
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
<content tag="pageCore"></content>
<content tag="pageInit">
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.zclip.js"></script>
<script type="text/javascript" src="${basepath }/static/ixin/js/voteactivityindex.js?v=1"></script>
<script>
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
