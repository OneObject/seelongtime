<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>编辑用户</title>
<meta name="menu_path" content="system.user"/>
<!-- Important Owl stylesheet -->
   <!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath}/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <!-- END PAGE LEVEL STYLES -->
   <!-- BEGIN THEME STYLES --> 
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/custom.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.carousel.css">
    <!-- Default Theme -->
    <link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.theme.css">
    <link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" media="screen" href="${basepath}/static/public/stylesheets/usermanage.css">
    <style type="text/css">
    
	    <c:if test="${domain ne 'ennapp' and domain ne 'ajy' }">
	    .ennapp_hidden{display: none}
	    </c:if>
    
    </style>
</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                 <%--  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                   --%><li><a href="${basepath }/base/admin/user/usermanage.xhtml">用户管理</a><i class="icon-angle-right"></i></li>
                  <li><span>编辑用户</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <div class="row">
        <div class="col-md-12">
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box yellow">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-reorder"></i><span>编辑用户</span></div>
                  </div>
                  <div class="portlet-body form">
                     <div class="form-body">
                        <!-- BEGIN FORM-->
                        <form action="${basepath }/base/admin/user/doupdate.xhtml" id="form_sample_2" class="form-horizontal" method="post" onsubmit="return updateUserValidate();">
                          <input type="hidden" name="id" id="id" value="${entity.id }">
                           <div class="form-group" id="userName_con">
                              <label class="control-label col-md-3">用户名<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <!--<input type="text" name="name" data-required="1" class="form-control"/>-->
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-user"></i></span>
                                  <input name="userName" id="userName" onchange="checkUpdateUserName('${entity.id }')" type="name" class="form-control" placeholder="用户名" value="${entity.username }" >
                                 </div>
                              </div>
                              <div class="col-md-4">
                                <span id="userName_tip" for="userName" class="help-block" style="">用户名不能为空,您可以选择使用手机号或邮箱、或者以英文、数字、下划线的组合</span>
                              </div>
                              <div class="col-md-4">
                                <span id="userName_tip2" for="userName" class="help-block hidden" style="">用户名已经被注册或者用户名包含空格、特殊符号、中文</span>
                              </div>
                              <div class="col-md-4">
                                <span id="userName_tip3" for="userName" class="help-block hidden" style="">用户名长度不超过63个英文字符</span>
                              </div>
                           </div>
                                      
                           <div class="form-group" id="password_con">
                              <label class="control-label col-md-3">密码<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-user"></i></span>
                                    <input name="password" id="password" class="form-control" value="${password }" onchange="checkPassword()"  placeholder="密码">
                                 </div>
                              </div>
                              <div class="col-md-4">
                                <span id="password_tip" for="password" class="help-block " style="">请输入长度不小于6位的密码</span>
                              </div> 
                           </div>
                           
                           <div class="form-group" id="name_con">
                              <label class="control-label col-md-3">真实姓名<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-user"></i></span>
                                    <input name="name" id="name" type="name" class="form-control" onchange="checkTrueName()" placeholder="真实姓名" value="${entity.name }">
                                 </div>
                              </div>
                              <div class="col-md-4">
                                <span id="name_tip" for="name" class="help-block " style="">必填</span>
                              </div>
                              <div class="col-md-4">
                                <span id="name_tip2" for="name" class="help-block hidden" style="">姓名长度超过32位字符</span>
                              </div>
                           </div>
                           
                           <div class="form-group" id="orgId_con">
                              <label class="control-label col-md-3">部门<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tower"></i></span>
                                        <div class="input-group" onclick="open_dialog('${entity.organization.id }','1')">
                                            <input name="orgName" id="orgName" readonly="readonly" type="text" class="form-control" placeholder="部门名称" value="${entity.organization.name }">
                                            <input name="orgId" id="orgId" type="hidden" value="${entity.organization.id }">
                                            <div class="spinner-buttons input-group-btn">
                                                <button class="btn default" type="button">
                                                    <span>选择部门</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                              </div>
                              <div class="col-md-4">
                                <span id="orgId_tip" for="orgId" class="help-block " style="">请务必选择部门</span>
                              </div>
                           </div>
                           
                           
                            <div class="form-group" id="jobLevelId_con">
                              <label class="control-label col-md-3">职级</label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tower"></i></span>
                                        <div class="input-group" onclick="jobLevel_dialog('${jobLevelEntity.id}')">
                                            <input name="jobLevelName" id="jobLevelName" readonly="readonly" type="text" class="form-control" value="${jobLevelEntity.name}" >
                                            <input name="jobLevelId" id="jobLevelId" type="hidden" value="${jobLevelEntity.id}" >
                                            <div class="spinner-buttons input-group-btn">
                                                <button class="btn default" type="button">
                                                    <span id="choose_org">选择职级</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                              </div>
                           </div>
                           
                           <div class="form-group" id="mobile_con">
                              <label class="control-label col-md-3">手机</label>
                              <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                    <input name="mobile" id="mobile" onchange="mobileValidate('${entity.id  }' , true)" type="text" class="form-control" placeholder="手机" value="${entity.mobile }">
                                 </div>
                              </div>
                              <div class="col-md-4">
                                <span id="mobile_tip" for="mobile" class="help-block " style="">请输入11位长度的手机号码</span>
                              </div>
                              <div class="col-md-4">
                                <span id="mobile_tip2" for="mobile" class="help-block  hidden" style="">手机号码已经被注册!</span>
                              </div>
                            
                           </div>
                           <div class="form-group" id="email_con">
                              <label class="control-label col-md-3">邮箱</label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-envelope"></i></span>
                                    <input name="email" id="email" type="email" onchange="emailValidate('${entity.id }'  , true)" class="form-control" placeholder="Email Address" value="${entity.email }">
                                 </div>
                              </div>
                              <div class="col-md-4">
                                <span id="email_tip" for="email" class="help-block" style="">请填写正确、未被注册的邮箱</span>
                              </div>
                              <div class="col-md-4">
                                <span id="email_tip2" for="email" class="help-block hidden" style="">邮箱已经被注册！</span>
                              </div>
                              
                           </div>
                           
                           <div class="form-group" id="nickName_con">
                              <label class="control-label col-md-3">昵称</label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-user"></i></span>
                                    <input name="nickName" id="nickName" type="name" class="form-control" placeholder="昵称" value="${entity.nickName }">
                                 </div>
                              </div>
                           </div>
                            
                           <%-- <div class="form-group">
                              <label class="control-label col-md-3">证件类型</label>
                              <div class="col-md-4">
                                 <select name="certificateType" id="certificateType" class="form-control select2me" data-placeholder="请选择">
                                    <c:forEach var="cert_item" items="${certTypeMap }">
                                         <option value="${cert_item.key }" ${entity.certificateType == cert_item.key ? 'selected="selected"':'' } >${cert_item.value }</option>
                                    </c:forEach>
                                 </select>
                              </div>
                           </div>
                           
                           <div class="form-group" id="certificateCode_con">
                              <label class="control-label col-md-3">证件号码</label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-credit-card"></i></span>
                                    <input name="certificateCode" id="certificateCode" onchange="certificateCodeValidate()" type="text" class="form-control" placeholder="证件号码" value="${entity.certificateCode }">
                                 </div>
                              </div>
                              <div class="col-md-4">
                                <span id="certificateCode_tip" for="certificateCode" class="help-block " style="">请输入正确格式的证件号码，如15或18位的身份证号码</span>
                              </div>
                           </div> --%>
                           
                           <div class="form-group">
                              <label class="control-label col-md-3 ">性别</label>
                              <div class="col-md-4">
                                 <div class="radio-list">
                                    <c:forEach var="gender_item" items="${genderMap }">
                                        <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender${gender_item.key }" value="${gender_item.key }"
                                          <c:out value='${gender_item.key eq entity.gender ? "checked=checked":"" }' />  />
                                            ${gender_item.value }
                                        </label>
                                    </c:forEach>
                                 </div>
                              </div>
                           </div>
                           
                           <div class="form-group" id="email_con">
                              <label class="control-label col-md-3">生日</label>
								<div class="col-md-4">
                                    <input type="text" id="birthday" name="birthday" value="${ltfun:dateLongToStringFormat(entity.birthday, 'yyyy-MM-dd')  }" 
                                     onfocus="WdatePicker({dateFmt:'yyyy-MM-dd' })" class="form-control Wdate" readonly="readonly"/>
									<!--  <input type="text" name="name" data-required="1" class="form-control"/>-->
									<%-- <div class="input-group">
										<span class="input-group-addon"><i class="icon-gift"></i></span>
										<div class="input-group input-medium date date-picker"
											data-date="${ltfun:dateLongToStringFormat(entity.birthday, 'yyyy-MM-dd')  }" data-date-format="yyyy-mm-dd" 
											data-date-viewmode="years">
											<input name="birthday" id="birthday" type="text" class="form-control" readonly value="${ltfun:dateLongToStringFormat(entity.birthday, 'yyyy-MM-dd')  }"> <span
												class="input-group-btn">
												<button class="btn default" type="button">
													<i class="icon-calendar"></i>
												</button>
											</span>
										</div>
									</div> --%>
								</div>
							</div>
                           
                        
                           
                         <%--  <div class="form-group" id="phone_con">
                              <label class="control-label col-md-3">工作电话</label>
                              <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                    <input name="phone" id="phone" type="text" class="form-control" placeholder="工作电话" value="${entity.phone }">
                                 </div>
                              </div>
                           </div> --%>
                           
                           <div class="form-group" id="effictiveend_con">
                              <label class="control-label col-md-3">有效期</label>
                              <div class="col-md-2">
                                  <input type="text" id="effictivestart" name="effictivestart" value="${ltfun:dateLongToStringFormat(entity.effictivestart, 'yyyy-MM-dd')  }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd', maxDate:'#F{$dp.$D(\'effictiveend\')}' })" class="form-control Wdate" readonly="readonly"/>
                              </div>
                               <label class="control-label col-md-1" style="width:28px;text-align:center;padding-left:2px;padding-right:2px;">至</label>
                               <div class="col-md-2">
                                  <input type="text" id="effictiveend" name="effictiveend"  value="${ltfun:dateLongToStringFormat(entity.effictiveend, 'yyyy-MM-dd')  }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd' , minDate:'#F{$dp.$D(\'effictivestart\')}'})" class="form-control Wdate" readonly="readonly"/>
                              </div>
                               <div class="col-md-4">
                                <span id="effictiveend_tip" for="effictiveend" class="help-block" style="">空表示不限制，有效期至截止日期的次日零点</span>
                              </div>
                           </div>
                           
                           <div class="form-group" id="nickName_con">
                              <label class="control-label col-md-3">标签</label>
                              <div class="col-md-4">
                                    <input name="labels" id="labels" type="text" class="form-control" placeholder="标签" value="${entity.labels }">
                              </div>
                              <div class="col-md-4">
                                <span id="labels_tip" for="labels" class="help-block" style="">多个标签用逗号隔开</span>
                              </div>
                           </div>
                     
                     
                     
                       	<div class="form-group ennapp_hidden" id="nickName_area">
                               <label class="control-label col-md-3">区域</label>
                              <div class="left_condition">
								<div class="col-md-4">
									<select class="form-control select2me" data-placeholder="选择" id="area" name="area">
									    <option value="">---请选择---</option>
									    <c:forEach items="${areaMap}" var="item">
										 <option value="${item.key}" <c:if test="${item.key eq entity.area }"> selected="selected"</c:if>   >${item.value}</option>
										</c:forEach>
									</select>
								</div>
                           </div>
                       </div> 
                       
                       <div class="form-group ennapp_hidden" id="nickName_category">
                               <label class="control-label col-md-3">角色</label>
                              <div class="left_condition">
								<div class="col-md-4">
									<select class="form-control select2me" data-placeholder="选择" id="category" name="category">
										 <option value="0" <c:if test="${'0' eq entity.category }"> selected="selected"</c:if>   >学员</option>
										 <option value="1" <c:if test="${'1' eq entity.category }"> selected="selected"</c:if>   >指导人</option>
										 <option value="3" <c:if test="${'3' eq entity.category }"> selected="selected"</c:if>   >达人</option>
									</select>
								</div>
                           </div>
                       </div> 
                       <input type="hidden" name="oldCategory" id="oldCategory" value="${entity.category }"/>
                           
                           
                           <%-- <div class="form-group">
                              <label class="control-label col-md-3">工号<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-subtitles"></i></span>
                                    <input type="text" class="form-control" placeholder="工号">
                                 </div>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="control-label col-md-3">邮编<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <input type="text" name="name" data-required="1" class="form-control"/>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="control-label col-md-3">通讯地址<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <input type="text" name="name" data-required="1" class="form-control"/>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="control-label col-md-3">所在单位<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <input type="text" name="name" data-required="1" class="form-control"/>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="control-label col-md-3">所在城市<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <input type="text" name="name" data-required="1" class="form-control"/>
                              </div>
                           </div> --%>
                           
                           <div class="form-actions fluid">
                              <div class="col-md-offset-3 col-md-9">
                               <input type="hidden" name="domain" id="domain" value="${domain }"> 
                                 <button type="submit" class="btn btn-warning">提交</button>
                                 <button type="button" class="btn default" onclick="backToList();">返回</button>                              
                              </div>
                           </div>
                        </form>
                        <!-- END FORM-->
                     </div>
                  </div>
                  <!-- END VALIDATION STATES-->
               </div>
            </div>
    </div>
    <!-- 弹出层显示树状结构的部门 -->
</body>
</html>
<content tag="pageCore">
<!-- BEGIN PAGE LEVEL PLUGINS -->
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/fuelux/js/spinner.min.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/ckeditor/ckeditor.js"></script>  
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> 
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script><%-- 
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/clockface/js/clockface.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-daterangepicker/moment.min.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script> 
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>  
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.js"></script> --%>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>   
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery.input-ip-address-control-1.0.min.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-multi-select/js/jquery.quicksearch.js"></script>   
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery.pwstrength.bootstrap/src/pwstrength.js" type="text/javascript" ></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-switch/static/js/bootstrap-switch.min.js" type="text/javascript" ></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-tags-input/jquery.tagsinput.min.js" type="text/javascript" ></script>
   <!-- END PAGE LEVEL PLUGINS -->
     <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/form-validation.js"></script> 
   <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/form-components.js"></script>
   <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
     <%-- dwr --%>
    <script type='text/javascript' src='${basepath }/dwr/engine.js'></script>
    <script type='text/javascript' src='${basepath }/dwr/util.js'></script>
    <script type='text/javascript' src='${basepath }/dwr/interface/DWRService.js'></script>
     <!-- 添加用户 -->
     <script src="${basepath }/static/public/javascripts/usermanage.js?v=20150612" type="text/javascript"></script>
     <script src="${basepath }/static/public/javascripts/adduser.js?v=20150612" type="text/javascript"></script> 
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script>

/** 添加验证的姓名长度不超过32位字符*/
function checkTrueName() {
	var name = $('#name');
	var nameVal = $.trim(name.val());
	var con = document.getElementById('name_con');
	var tip = document.getElementById('name_tip');
	var tip2 = document.getElementById('name_tip2');
	if (nameVal.length == 0) {
		con.className = 'form-group has-error';
		tip.className = 'help-block';
		tip2.className = 'help-block hidden';
		return false;
	}
	if (nameVal.length > 32) {
		con.className = 'form-group has-error';
		tip.className = 'help-block hidden';
		tip2.className = 'help-block';
		return false;
	}
	con.className = 'form-group';
	tip.className = 'help-block hidden';
	tip2.className = 'help-block hidden';
	removeError(id);
}

		/** 添加用户时的用户名验证 */
		function checkUpdateUserName(uid){
			  var userName = $.trim($("#userName").val());
			  var id = "userName";
			  var reg = /[^0-9A-Za-z@\-_.]+|[\u4e00-\u9fa5]+|\s+/;
			  if (userName.length==0){
				  show1Hide2(id);
				  addError(id);
				  myShowError('err1')
				  userNameIsRepart = false;
			  }else{
				  if (reg.test(userName)) {
					  userNameIsRepart = false; 
					  myShowError('err2');
					  return false;
				  } 
				  if (userName.length > 63) {
					  userNameIsRepart = false; 
					  myShowError('err3');
					  return false;
				  }
				  $.ajax({
					  type:"POST",
					  url:basepath+"/base/admin/user/uniqueValidate2.json",
					  data:{"username":userName,"uid":uid},
					  success:function(data){
						  if (data.type == 1 || data.type ==2){
							  userNameIsRepart = false;
							  myShowError('err2');
							  //addError(id);
						  }else if (data.type == 3){
							  userNameIsRepart = false;
							  myShowError('err3');
							  //addError(id);
						  }else{
							  userNameIsRepart = true;
							  myShowError('ok');
							  removeError(id);
						  }
					  }
				  });
				  
			  }
		}
		function myShowError(type) {
			var con = document.getElementById('userName_con');
			var tip = document.getElementById('userName_tip');
			var tip2 = document.getElementById('userName_tip2');
			var tip3 = document.getElementById('userName_tip3');
			switch (type) {
				case 'err1':  //空
						con.className = 'form-group has-error';
						tip.className = 'help-block';
						tip2.className = 'help-block hidden';
						tip3.className = 'help-block hidden';
					break;
				case 'err2':  //特殊符号，中文字符，含有空格
						con.className = 'form-group has-error';
						tip.className = 'help-block hidden';
						tip2.className = 'help-block';
						tip3.className = 'help-block hidden';
					break;
				case 'err3':  //字符长度超过63
						con.className = 'form-group has-error';
						tip.className = 'help-block hidden';
						tip2.className = 'help-block hidden';
						tip3.className = 'help-block';
					break;
				case 'ok':  //成功
						con.className = 'form-group';
						tip.className = 'help-block hidden';
						tip2.className = 'help-block hidden';
						tip3.className = 'help-block  hidden';
					break;
				default:
						throw {
							name: '',
							message: ''
							};
					break;
			};
			
		};

</script>
</content>	
