<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
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
<title>关键词回复</title>
<meta name="menu_path" content="ixin.menu_keywrods" />
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/base.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
    <link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
    <link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
    <link rel="stylesheet"  href="${basepath}/static/ixin/css/media.css" type="text/css">
    <link rel="stylesheet" href="${basepath}/static/ixin/css/media_list.css" type="text/css">
<link href="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css" rel="stylesheet">
<script	src="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js"></script>
 <script type="text/javascript">

$(function() {
	 $("#isShowIsReply").bootstrapSwitch({
			onText : "是",
			offText : "否",
			onColor : "success",
			offColor : "default"
		});

 	$("#isShowIsReply").on('switchChange.bootstrapSwitch',
			function(event, state) {
				if (state.value) {
					$("#isShowIsReply").val(1);
					$("#replyInfo").show(); 
				} else {
					$("#isShowIsReply").val(0);
					$("#replyInfo").hide(); 
				}
			});
 });		
 </script>   
    
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><span href="javascript:void(0)">关键词回复</span></li>
            </ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<!-- 全局搜索组建开始 -->
	<ul class="nav nav-tabs">
         <li class="active tabLi" > <a href="#keywordsCreate" data-toggle="tab">关键字回复</a></li>
         
<%
	boolean isSuperMgr = LoginSessionHelper.getCurrentUserIsSuperManager(request);
	if(isSuperMgr){
%>         
         <li class="tabLi" > <a href="#attCreate" onclick="attResp();" id="tabAttFodder" data-toggle="tab">自定义关注回复</a></li>
         <li class="tabLi"><a href="#replybasic" data-toggle="tab">默认回复配置</a></li>
         <li class="tabLi"><a href="#reportbasic" data-toggle="tab">关键字使用统计</a></li>
<%
	}
%>         
         
    </ul>
    <div class="tab-content">
      <!-- Tab panes -->
      <div class="tab-pane  active" id="keywordsCreate">
      	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>规则列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<div class="row">
							<span class="btn btn-success table_add" onclick="insertEntity()"><i class="icon-plus"></i>&nbsp;创建规则</span>
							<%-- <span class="btn btn-danger table_add" onclick="deleteGroup()"><i class="icon-remove"></i>&nbsp;删除规则</span> --%>
					</div>
                    
                    <!-- 表格内容 -->
                    <div id="table_list"  class="mt10">
                        <jsp:include page="/WEB-INF/jsp/mgr/ixin/power/list.jsp"></jsp:include>
                    </div>
					
				</div>
			</div>
		</div>
	</div>
      </div>
      
      <!-- ////////////////////////////////////// -->
      
      <div class="tab-pane" id="attCreate">
      	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>关注回复消息
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<span><label style="color:red;">注意：</label>消息只能是一个，若要创建新的消息，请删除原消息！</span>                    
					<div id="attRespCreateBotton" class="row">
							<span class="btn btn-success" style="margin:10px;" onclick="insertTextNews()"><i class="icon-plus"></i>&nbsp;创建文本消息</span>
							<span class="btn btn-success" style="margin:10px;" onclick="insertFodder()"><i class="icon-plus"></i>&nbsp;创建图文消息</span>
					</div>
					
					<div class="row">
						<span style="padding-left:20px;">消息内容：</span>
						<div id="AttMsgBody" style="padding:20px;">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
      </div>
      
      
		<!-- 以下是回复消息的配置页面 -->
		<div class="tab-pane" id="replybasic">
			<div class="row">
				<div class="col-md-12">
					<div class="portlet box yellow">
						<div class="portlet-title">
							<div class="caption">
								<i class="icon-globe"></i>回复信息
							</div>
						</div>
						<div class="portlet-body"
							style="overflow: hidden; padding-bottom: 100px;">
							<div class="mauto">
								<div class="col-md-12">
									<!-- 创建 start-->
									<div class="form"> 
										<form  >
											<div style="padding-top: 0px;" id="con_address"
												class="form-group">
												<label class="control-label col-md-5">没有匹配的关键字时是否回复：</label>
												<div class="col-md-6">
													<div class="switch ">
														<input type="checkbox"
															${(tenantConfig.isreply == true) ? 'checked' : '' }
															value="${tenantConfig.isreply==true?1:0 }"
															id="isShowIsReply" />
													</div>
												</div>
											</div> 
											<div id="replyInfo" class="form-group" 
												<c:if test="${tenantConfig.isreply ne true }"> style="display: none;" </c:if> >
												<label class="control-label col-md-5">消息回复内容：<span
													class="required">*</span></label>
												<div class="col-md-6">
													<textarea class="form-control mytextarea" id="replyContent"
														cols="" rows="2">${tenantConfig.replycontent} </textarea>
												</div>
												<label class="control-label col-md-5"></label>
												<div class="col-md-6">
													<span class="help-block" style="display: none; color: red;"
														id="replyInfoMsg"> 消息回复内容不能为空 </span>
												</div>
											</div>
											<div class="row">
												<div class="btngroup" style="text-align: center;">
													<div class="btn btn-warning" onclick="saveReplyInfo();">保存</div>
												</div>
											</div>
										</form>

									</div>
									<!-- 创建 end-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		 <div class="tab-pane" id="reportbasic">
	      	<div class="row">
				<div class="col-md-12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="icon-globe"></i>关键字使用统计
							</div>
						</div>
						<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
								
						
							<div style="padding-top: 0px;" id="con_address" class="form-group">
								<div class="col-md-2">
									<input type="text" class="form-control" style="width: 226px;" name="keywordSearch" id="keywordSearch" placeholder="请输入要搜索的关键字">
								</div>
								<div class="col-md-3" style="margin-left: 45px;">
									<span class="btn yellow" style="width: 62px;padding-left: 0px;padding-right: 0px;height: 34px;" onclick="keywordSearch();"><i class="icon-search"></i>检索</span>
								</div>
							</div> 
							
							<div id="reportResult" style="margin-top:40px;display:none;">
								<div style="padding-top: 0px;padding-left:15px;font-size:18px;" id="con_address" class="form-group">
									关键字使用总次数：<label id="totalTimes">0</label>次
								</div> 
								
								<div style="padding-top: 0px;padding-left:15px;font-size:18px;" id="con_address" class="form-group">
									关键字使用总人数：<label id="totalUsers">0</label>人
								</div> 
							</div>
							
						</div>
					</div>
				</div>
			</div>
      	</div>
      
      
       </div>
	<!-- 条件选择结束 -->
	
	
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript">
var qiniuImageBasePath = "${map.qiniuImageBasePath}";
var coverSuffix = "${map.coverSuffix}";
</script>
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<!-- 引用核心js包 -->
<script type="text/javascript" src="${basepath }/static/ixin/js/power/setkeywords.js"></script>
<script type="text/javascript" src="${basepath }/static/public/javascripts/report.js"></script>
  
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
<c:if test="${a eq 'fodder'}">
$('#tabAttFodder').click();
</c:if>
//保存回复信息
function saveReplyInfo() {
	var replycontent = $.trim($("#replyContent").val()); 
	if ($("#isShowIsReply").val() == "1") {//设置回复
		if (replycontent == null || replycontent == "") {//回复消息为空
			$("#replyInfoMsg").show();
			return;
		} else {
			$("#replyInfoMsg").hide();
		}
	}
	updateTenantSiteInfo();
}

	var isopen = "${tenantConfig.isopen}";
	var isregister = "${tenantConfig.openregister}";
	if(isopen == null || isopen == ""){
		isopen = "0";
	}
	if(isregister == null || isregister == ""){
		isregister = "0";
	}
	function updateTenantSiteInfo() {
	var replycontent = $.trim($("#replyContent").val());
	var isreply = $("#isShowIsReply").val();
	$.ajax({
		type : "POST",
		url : basepath + "/base/admin/tenantconfig/updatetenantsite.json",
		data : {
			"isreply" : isreply,
			"replycontent" : replycontent,
			"action":"updateReply"
		},
		success : function(data) {
			if (data == null) {
				showMsgDialog("修改失败");
			} else {
				showMsgDialog("修改成功");
			}
		}
	});
}
	
function keywordSearch(){
	var keywordSearch = $("#keywordSearch").val();
	if(keywordSearch == null || keywordSearch == ""){
		$("#totalTimes").html(0);
		$("#totalUsers").html(0);
		$("#reportResult").hide();
		return;
	} else {
		keywordReport(keywordSearch,showKeywordReport);
	}
}

function showKeywordReport(result){
	if(result == null){
		showMsgDialog("系统繁忙，请刷新后尝试。",1000);
	} else {
		$("#totalTimes").html(result.totalTimes);
		$("#totalUsers").html(result.totalUsers);
		$("#reportResult").show();
	}
}


function showMsgDialog(content) {
	easyDialog
			.open({
				container : {
					header : '提示',
					content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'
							+ content + '</div>'
				},
				autoClose : 1200
			});
}


</script>
</content>
