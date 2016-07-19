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
<title>自定义站点</title>
<meta name="menu_path" content="ext.ext_index" />
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
<style type="text/css">
		.qrcodeTable table{
			position:relative;
			left: 47px;
		}
	</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a>
                    <i class="icon-angle-right"></i></li>
                <li><span href="#">自定义站点</span></li>
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
							<input id="searchContent" name="searchContent" type="text" class="form-control" placeholder="输入自定义首页名"> <span
								class="input-group-btn">
								<button onclick="page(1);" class="btn btn-danger" type="button">
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
						<i class="icon-globe"></i>自定义站点列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<div class="row">
						<span class="btn btn-success table_add" onclick="addDiyIndex();"><i class="icon-plus"></i>&nbsp;添加自定义首页</span>
					</div>
					
					<%-- 表格内容 --%>
                    <div id="table_list" class="mt10"></div>
                 
	
				</div>
			</div>
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
<!-- 引用核心js包 -->
    <%-- <script src="${basepath }/static/public/javascripts/cutPage.1.0.js" type="text/javascript"></script> --%>
    <script src="${basepath }/static/public/javascripts/diyindexlist.js"></script>
    
     <%-- dwr --%>
</content>
<content tag="pageInit"> 
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.zclip.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
$("#searchContent").keydown(function(e){
        var curKey = e.which;
           if(curKey == 13){
           page(1);
                return false;
           }
   });
});

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