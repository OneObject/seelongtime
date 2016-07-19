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
<title>考试管理</title>
<meta name="menu_path" content="test.testManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
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
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><span href="#">考试管理</span></li>
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
							<input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="输入考试名进行搜索"> <span
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
	<!-- 条件选择开始 -->
	<div class="row">
		<div class="col-md-12">
			<div class="search_condition">
				<div class="row mt10">
					<div class="left_lable">
						<span class="condition_title">状态</span>
					</div>
					<div class="left_condition">
						<div class="col-md-4">
							<select class="form-control select2me" data-placeholder="选择" id="status" name="status" onchange="page(1)">
							    <option value="">---请选择---</option>
	                            <c:forEach items="${examinationStatusMap }" var="status">
                                    <option value="${status.value }">${status.key }</option>
	                            </c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 条件选择结束 -->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>考试列表
					</div>
				</div>
				<div class="portlet-body" style="padding-bottom: 100px;">
					<div class="row">
							<span class="btn btn-success table_add" onclick="insertEntity()"><i class="icon-plus"></i>&nbsp;添加考试</span>
							<span class="btn btn-danger table_add" onclick="deleteGroup()"><i class="icon-remove"></i>&nbsp;删除考试</span>
							<span class="btn btn-success table_add "  onclick="authorizeGroup();"><i class="glyphicon "></i>批量授权</span>
					</div>
                    
                    <!-- 表格内容 -->
                    <div id="table_list"  class="mt10"></div>
					
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
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.zclip.js"></script>
<!-- 引用核心js包 -->
<script type="text/javascript" src="${basepath }/static/public/javascripts/examination.js?v=20150409"></script>
  
</content>
<content tag="pageInit"> <!-- 初始化窗口 -->
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
