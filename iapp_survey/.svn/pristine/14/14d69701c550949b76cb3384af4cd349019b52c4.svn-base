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
<title>编辑规则</title>
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
				<li><a href="${basepath }/mgr/ixin/power/index.xhtml">关键词回复</a></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box yellow">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>编辑规则
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<form id="updateForm" onsubmit="return validateUpdate()" class="form-horizontal" role="form" action="${basepath }/mgr/ixin/power/doupdate.xhtml">
						<div class="form-body">
							<div class="form-group" id="con_ruleName">
								<label class="col-md-4 control-label">规则名称<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="ruleName" id="ruleName" onchange="v_ruleName()" value="${entity.name }">
								</div>
                                <div class="col-md-4">
                                  <span id="tip_ruleName" for="ruleName" class="help-block " style="">必填，最多<span id="maxlength">60</span>个字</span>
                                </div>
							</div>
							<div class="form-group" id="con_keywords">
								<label class="col-md-4 control-label">关键字<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="keywords" id="keywords" onchange="v_keywords()" value="${entity.keywords }">
									<input type="hidden"  id="key"  value="${entity.keywords }">
								</div>
                                <div class="col-md-4">
                                  <span id="tip_keywords" for="keywords" class="help-block " style="">必填，多个请以”,“分隔</span>
                                </div>
							</div>
							<div class="form-group" id="con_matchAll">
								<label class="col-md-4 control-label">完全匹配</label>
								<div class="col-md-4">
									<div class="radio-list" id="judge" >
										<label class="radio-inline">
											<input type="checkbox" name="matchAll" id="matchAll" value="1" <c:out value='${entity.matchAll==1?"checked=checked":"" }' />  >是
										</label>
									</div>
								</div>
                                <div class="col-md-4">
                                  <span id="tip_matchAll" for="matchAll" class="help-block hidden" style="">必填</span>
                                </div>
							</div>
                            <div class="form-group" id="con_type">
                                <label class="control-label col-md-4">消息类型</label>
                                <div class="col-md-4">
                                    <div class="radio-list" id="judge" >
                                        <label class="radio-inline">
                                            <input type="radio" name="type" id="type0" value="0" <c:out value='${entity.type eq "0"? "checked=checked":"" }' /> onclick="toggle_type(0);">图文素材
                                        </label> 
                                        <label  class="radio-inline">
                                            <input type="radio" name="type" id="type1" value="1" <c:out value='${entity.type eq "1"? "checked=checked":"" }' /> onclick="toggle_type(1);">文本消息
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <span id="tip_type" for="type" class="help-block hidden" style="">必填</span>
                                </div>
                            </div>
                            <div class="form-group <c:out value='${entity.type eq "1"? "hidden":"" }' />" id="con_matterIds">
                                <label class="control-label col-md-4">图文素材<span class="required">*</span></label>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <%-- <input type="text" class="form-control" onclick="page(1)" placeholder="请选择图文素材" readonly="readonly" name="" id=""> --%>
                                            <span class="input-group-addon choose_btn" onclick="page(1)">
                                            <i class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择</span>
                                    </div>
                                </div>
                                
                           </div>
                                <div class="form-group " id="con_matters">
                               <label class="control-label col-md-4">已选择图文素材</label>
                               <div class="col-md-4">
                                   <div id="append_div" >
                                        <jsp:include page="/WEB-INF/jsp/mgr/ixin/power/appendmatters.jsp"></jsp:include>
                                   </div>
                               </div>
                               <div class="col-md-4" style="display: block;" id="matters_err">
	                                <span id="tip_matterIds" for="matterIds" class="help-block " style="">必填,最多8个素材</span>
								</div>
                               </div>
                               <div class="form-group has-error" style="display: none;" id="matters_error">
                           <div class="col-md-4"></div>
                           <div class="col-md-4">
	                                <span id="tip_matterIds" for="matterIds" class="help-block " style="">必填,最多8个素材</span>
								</div>
							</div>
							   	
                           <div class="form-group <c:out value='${entity.type eq "0"? "hidden":"" }' />" id="con_content">
                               <label class="control-label col-md-4">文字消息<span class="required">*</span></label>
                               <div class="col-md-4">
                                   <textarea rows="2" cols="" name="content" id="content" class="form-control mytextarea" onchange="v_content();">${entity.content }</textarea>
                               </div>
                               <div class="col-md-4">
                                   <span id="tip_content" for="content" class="help-block " style=""><span id="max_content">500</span>字(包括数字，字母)以内</span>
                               </div>
                           </div>
						</div>
						<div class="btn_group_center">
                            <input type="hidden" name="id" id="id" value="${entity.id }" >
                            <input type="hidden" name="matterIds" id="matterIds" value="${entity.matterIds }" >
                            <button type="submit" class="btn btn-warning" >提交</button>
                            <span class="btn default" onclick="cancelInsert()">取消</span>
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

        <div class="col-md-4" style="padding:20px 20px 5px;">
            <div class="input-group">
                <input type="text" placeholder="" id="search_title" class="form-control">
                          <span class="input-group-btn">
                           <button type="button" class="btn btn-danger btn-success" onclick="page(1)">
                               <i class="icon-search"></i>
                           </button>
                          </span>
            </div>
        </div>
		<div class="easyDialog_text" style="background-color: #fff; display:block;overflow:auto;width:770px;height: 500px;" id="easyDialogText">
            <!-- 表格 -->
            <div id="table_list" style=" width: 100%;"></div>
			
		  	
		</div>
		<div class="easyDialog_footer" style="margin-bottom: 20px;">
              <button class="btn default dialog-btn" onclick="clear_matters();">清空</button>
              <button class="btn btn-success dialog-btn" onclick="easyDialog.close()">确定</button>
          </div>
	</div>
	<!-- 选择用户弹出层 结束 -->
</body>
</html>
<content tag="pageCore"> 
<!-- 引用核心js包 -->
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
<script type="text/javascript" src="${basepath }/static/ixin/js/power/add.js?v=20150901"></script>
</content>
<content tag="pageInit">
</content>
