<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>消息群发</title>
<meta name="menu_path" content="ixin.menu_groupmessage" />
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/testmanage.css">
<link rel="stylesheet" href="${basepath}/static/ixin/css/ixin.css"
	type="text/css">
<link rel="stylesheet" href="${basepath}/static/ixin/css/media.css"
	type="text/css">
<link rel="stylesheet" href="${basepath}/static/ixin/css/media_list.css"
	type="text/css">
<style type="text/css">
.optiondialog{padding:10px;min-width:300px;text-align:left;margin-top:-20px;}
.optiondialog span{display:block;}
.optiondialog span.head{padding:10px 0px;}
.optiondialog span{margin:5px;font-size:16px;font-weight:normal;}
.optiondialog span label{margin-left:5px;}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i
					class="icon-angle-right"></i></li>
				<li><a href="#">消息群发</a></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>发送消息
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
				   <div class="row">
                            <span class="btn btn-success table_add" style="margin-right:50px;margin-top:10px" onclick="list();">
                               <i class="glyphicon "></i>历史消息列表</span>
                      </div>
					<form id="addForm" class="form-horizontal" role="form">
						<div class="form-body">
							<div class="form-group" id="con_id">
								<label class="control-label col-md-4">图文素材</label>
								<div class="col-md-1">
									<div class="input-group">
										<%-- <input type="text" class="form-control" onclick="page(1)" placeholder="请选择图文素材" readonly="readonly" name="" id=""> --%>
										<span class="input-group-addon choose_btn" onclick="page(1)">
											<i class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择
										</span>
									</div>
								</div>
								<div class="col-md-4">
									<span id="tip_id" for="id" class="help-block hidden" style="">必填</span>
								</div>
							</div>
							<div class="form-group " id="con_matters">
								<label class="control-label col-md-4">已选择图文素材</label>
								<div class="col-md-6">
									<div id="append_div"></div>
								</div>
							</div>
						</div>
						<div class="btn_group_center">
							<input type="hidden" name="matterIds" id="matterIds"
								value="${id}">
							<button type="button" class="btn btn-success"
								onclick="subbtn(this,false,'${tokenInfo.type}','${tokenInfo.authentication}')">提交</button>
							<div style="color: #ccc; font-size: 11px; margin-top: 10px;">备注：由于微信公众平台群发消息添加微信保护，所以只有已认证服务号可以直接群发消息。其他的只能上传图文素材至公众平台，在公众平台内进行消息群发。</div>
							<button type="button" class="btn btn-success"
								onclick="subbtn(this,true)" style="display: none;">验证(只创建素材)</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 选择用户弹出层 开始 -->
	<div id="dialogBank"
		style="display: none; overflow: hidden; background-color: #fff;">
		<h4 class="easyDialog_title" id="easyDialogTitle">
			&nbsp;&nbsp;选择图文素材 <a href="javascript:void(0)" title="关闭窗口"
				class="close_btn" id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
	

		<div class="easyDialog_text"
			style="background-color: #fff; display: block; overflow: auto; width: 770px; height: 500px;"
			id="easyDialogText">
			<table style="margin-bottom:20px;">
					                <tbody><tr>
					                    <td>
					                      <input type="text" name="search" id="search">
					                    </td>
					                    <td>
					                        <button class="btn btn-success dialog-btn" style="margin:0 !important;" onclick="page(1)">搜索</button>
					                    </td>

					                </tr>
					            </tbody></table>
			
			<!-- 表格 -->
			
			<div id="table_list" style="width: 100%;"></div>


		</div>
		<div class="easyDialog_footer" style="margin-bottom: 20px;">
			<button class="btn default dialog-btn" onclick="clear_matters();">清空</button>
			<button class="btn btn-success dialog-btn"
				onclick="easyDialog.close();">确定</button>
		</div>
	</div>
	<!-- 选择用户弹出层 结束 -->
</body>
</html>
<content tag="pageCore"> <!-- 引用核心js包 --> <script
	type="text/javascript"
	src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script	src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script> 
<script type="text/javascript"	src="${basepath }/static/ixin/js/groupmessage/add.js"></script> 
<script	type="text/javascript">
		appendMatters();
		function list(){
			window.location.href="${basepath}//mgr/fodder/messagelist.xhtml";
		}
</script> 
</content>
<content tag="pageInit"> </content>
