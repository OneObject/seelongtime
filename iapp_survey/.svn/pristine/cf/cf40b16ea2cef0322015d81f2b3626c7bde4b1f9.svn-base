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
<title>规则详情</title>
<meta name="menu_path" content="ixin.menu_keywrods" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
<link rel="stylesheet"  href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<link rel="stylesheet"  href="${basepath}/static/ixin/css/media.css" type="text/css">
<link rel="stylesheet" href="${basepath}/static/ixin/css/media_list.css" type="text/css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/mgr/ixin/power/index.xhtml">关键词回复</a><i class="icon-angle-right"></i></li>
				<li><span href="#">规则详情</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box purple">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>规则详情
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<form id="updateForm" onsubmit="return validateUpdate()" class="form-horizontal" role="form" action="${basepath }/mgr/ixin/power/doupdate.xhtml">
						<div class="form-body">
							<div class="form-group" id="con_ruleName">
								<label class="col-md-4 control-label">规则名称<span class="required">*</span></label>
								<div class="col-md-4">
                                    <div class="input-group">
                                        <label class="control-label"><span>${entity.name }</span></label>
                                    </div>
								</div>
							</div>
							<div class="form-group" id="con_keywords">
								<label class="col-md-4 control-label">关键字<span class="required">*</span></label>
								<div class="col-md-4">
                                    <div class="input-group">
                                        <label class="control-label"><span>${entity.keywords }</span></label>
                                    </div>
								</div>
							</div>
							<div class="form-group" id="con_matchAll">
								<label class="col-md-4 control-label">完全匹配</label>
								<div class="col-md-4">
                                    <div class="input-group">
                                        <label class="control-label"><span>${entity.matchAll==1?"是":"否" }</span></label>
                                    </div>
								</div>
							</div>
                            <c:if test="${entity.type eq '0' }">
	                            <%-- <div class="form-group" id="con_type">
	                                <label class="control-label col-md-4">消息类型</label>
	                                <div class="col-md-4">
	                                    <div class="input-group">
	                                        <label class="control-label"><span>图文素材</span></label>
	                                    </div>
	                                </div>
	                                <div class="col-md-4">
	                                    <span id="tip_type" for="type" class="help-block hidden" style="">必填</span>
	                                </div>
	                            </div> --%>
                               <div class="form-group" id="con_matters">
                                   <label class="control-label col-md-4">已选择图文素材</label>
                                   <div class="col-md-6">
                                       <div id="append_div" >
                                            <jsp:include page="/WEB-INF/jsp/mgr/ixin/power/appendmatters.jsp"></jsp:include>
                                       </div>
                                   </div>
                               </div>
                           </c:if>
	                       <c:if test="${entity.type eq '1' }">
	                            <%-- <div class="form-group" id="con_type">
	                                <label class="control-label col-md-4">消息类型</label>
	                                <div class="col-md-4">
	                                    <div class="input-group">
	                                        <label class="control-label"><span>文字消息</span></label>
	                                    </div>
	                                </div>
	                                <div class="col-md-4">
	                                    <span id="tip_type" for="type" class="help-block hidden" style="">必填</span>
	                                </div>
	                            </div> --%>
	                           <div class="form-group" id="con_content">
	                               <label class="control-label col-md-4">文字消息</label>
	                               <div class="col-md-4">
	                                   <textarea rows="2" cols="" name="content" id="content" class="form-control mytextarea" onchange="v_content();" readonly="readonly" disabled="disabled">${entity.content }</textarea>
	                               </div>
	                           </div>
	                       </c:if>
						</div>
						<div class="btn_group_center">
                            <button type="button" class="btn btn-warning" onclick="updateEntity('${entity.id }')">修改</button>
                            <button type="button" class="btn red" onclick="deleteSingleInDetail('${entity.id }')">删除</button>  
                            <button type="button" class="btn default" onclick="backToList();">返回</button>      
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 选择用户弹出层 开始 -->
	<div id="dialogBank" style="display: none;overflow: hidden;background-color: #fff;">
		<h4 class="easyDialog_title" id="easyDialogTitle">&nbsp;&nbsp;选择图文素材
			<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
				id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text" style="background-color: #fff; display:block;overflow:auto;width:770px;height: 500px;" id="easyDialogText">
            <!-- 表格 -->
            <div id="table_list" style=" width: 100%;"></div>
			
		  	
		</div>
		<div class="easyDialog_footer" style="margin-bottom: 20px;">
              <button class="btn default dialog-btn" onclick="clear_matters();">取消</button>
              <button class="btn btn-success dialog-btn" onclick="saveMatterIds()">确定</button>
          </div>
	</div>
	<!-- 选择用户弹出层 结束 -->
</body>
</html>
<content tag="pageCore"> 
<!-- 引用核心js包 -->
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
<script type="text/javascript" src="${basepath }/static/ixin/js/power/setkeywords.js"></script>
</content>
<content tag="pageInit">
</content>
