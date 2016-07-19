<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>用户详情</title>
<meta name="menu_path" content="system.user"/>
<link rel="stylesheet" media="screen" href="${basepath}/static/public/stylesheets/index.css">
    <!-- Important Owl stylesheet -->
    <link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.carousel.css">
    <!-- Default Theme -->
    <link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.theme.css">
    <link rel="stylesheet" media="screen" href="${basepath}/static/public/stylesheets/usermanage.css">
</head>
<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                 <%--  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                   --%><li><a href="${basepath }/base/admin/user/usermanage.xhtml">用户管理</a><i class="icon-angle-right"></i></li>
                  <li><span>用户详情</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <div class="row">
        <div class="col-md-12">
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box purple">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-reorder"></i><span>用户详情</span></div>
                     <!--<div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                        <a href="javascript:;" class="reload"></a>
                        <a href="javascript:;" class="remove"></a>
                     </div>-->
                  </div>
                  <div class="portlet-body form">
                     <div class="form-body">
                        <!-- BEGIN FORM-->
                        <form action="#" id="form_sample_2" class="form-horizontal">
                          
                          <div class="form-group">
                              <label class="control-label col-md-4 gray">
                              	<i class="icon-user"></i>&nbsp;&nbsp;
                              	用户名</label>
                              <div class="col-md-4">
                              <label class="control-label">
                              	<span>${entity.username }</span>
                              	</label>
                              </div>
                           </div>
                            
                              <div class="form-group">
                              <label class="control-label col-md-4 gray"><i class="glyphicon glyphicon-earphone"></i>&nbsp;&nbsp;手机</label>
                              <div class="col-md-4">
                                <label class="control-label">
                              	<span>${entity.mobile }</span>
                              	</label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="control-label col-md-4 gray"><i class="icon-envelope"></i>&nbsp;&nbsp;邮箱</label>
                              <div class="col-md-4">
                                <label class="control-label">
                                    <span>${entity.email }</span>
                                </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="control-label col-md-4 gray"><i class="glyphicon glyphicon-tower"></i>&nbsp;&nbsp;部门名称</label>
                              <div class="col-md-4">
                                 <label class="control-label">
                                    <span>${entity.organization.name }</span>
                                </label>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="control-label col-md-4 gray">职级</label>
                              <div class="col-md-4">
                                 <label class="control-label">
                                    <span>${jobLevelEntity.name}</span>
                                </label>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="control-label col-md-4 gray">
                                <i class="icon-user"></i>&nbsp;&nbsp;
                                                                                        昵称</label>
                              <div class="col-md-4">
                              <label class="control-label">
                                <span>${entity.nickName }</span>
                                </label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="control-label col-md-4 gray">
                                <i class="icon-user"></i>&nbsp;&nbsp;
                                                                                        真实姓名</label>
                              <div class="col-md-4">
                              <label class="control-label">
                                <span>${entity.name }</span>
                                </label>
                              </div>
                           </div>
                           <%-- <div class="form-group">
                              <label class="control-label col-md-4 gray">
                              <i class="icon-credit-card"></i>&nbsp;&nbsp;
                                    ${certTypeMap[entity.certificateType] }
                              </label>
                              <div class="col-md-4">
                                <label class="control-label">
                                <span>${entity.certificateCode }</span>
                                </label>
                              </div>
                           </div> --%>
                           <div class="form-group">
                              <label class="control-label col-md-4  gray">性别</label>
                              <div class="col-md-4">
                              	<label class="control-label">
                              	<span>
                              	     ${genderMap[entity.gender] }
                              	</span>
                              	</label>
                              </div>
                           </div>
                           <%-- <div class="form-group">
                              <label class="control-label col-md-4  gray">生日</label>
                              <div class="col-md-4">
                              	<label class="control-label">
                              	<span>
                              	     ${ltfun:dateLongToStringFormat(entity.birthday, 'yyyy-MM-dd')  }
                              	</span>
                              	</label>
                              </div>
                           </div>
                          <div class="form-group">
                              <label class="control-label col-md-4 gray"><i class="glyphicon glyphicon-earphone"></i>&nbsp;&nbsp;工作电话</label>
                              <div class="col-md-4">
                                <label class="control-label">
                              	<span>${entity.phone }</span>
                              	</label>
                              </div>
                           </div> --%>
                           
                           <div class="form-group">
                              <label class="control-label col-md-4  gray">有效期</label>
                              <div class="col-md-4">
                              	<label class="control-label">
                              	<span>
                              		<c:if test="${empty entity.effictivestart || entity.effictivestart==0 }">不限</c:if>
                              		<c:if test="${not empty entity.effictivestart && entity.effictivestart !=0}">${ltfun:dateLongToStringFormat(entity.effictivestart, 'yyyy-MM-dd')  }</c:if>
                              	     &nbsp;&nbsp;至&nbsp;&nbsp;
                              	    <c:if test="${empty entity.effictiveend  || entity.effictiveend==0 }">不限</c:if>
                              		<c:if test="${not empty entity.effictiveend || entity.effictiveend!=0  }">${ltfun:dateLongToStringFormat(entity.effictiveend, 'yyyy-MM-dd')  }</c:if>
                              	</span>
                              	</label>
                              </div>
                           </div>
                        
                       	  <div class="form-group" id="nickName_con">
                              <label class="control-label col-md-4">标签</label>
                              <div class="col-md-4">
                              	<label class="control-label">
                                	<span>${entity.labels }</span>
                                </label>
                              </div>
                           </div>
                           <%-- <div class="form-group">
                              <label class="control-label col-md-4 gray"><i class="glyphicon glyphicon-subtitles"></i>&nbsp;&nbsp;工号</label>
                              <div class="col-md-4">
                                 <label class="control-label">
                              		<span>NO.0001</span>
                              	</label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="control-label col-md-4 gray">邮编</label>
                              <div class="col-md-4">
                                <label class="control-label">
                              	<span>200000</span>
                              	</label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="control-label col-md-4 gray">通讯地址</label>
                              <div class="col-md-4">
                                <label class="control-label">
                              	<span>上海市郭守敬路498号3号楼3302室</span>
                              	</label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="control-label col-md-4 gray">所在单位</label>
                              <div class="col-md-4">
                                 <label class="control-label">
                              	<span>上海市龙泰信息技术有限公司</span>
                              	</label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="control-label col-md-4 gray">所在城市</label>
                              <div class="col-md-4">
                                 <label class="control-label">
                              	<span>上海市浦东新区</span>
                              	</label>
                              </div>
                           </div> --%>
                           <div class="form-actions fluid">
                              <div class="col-md-offset-3 col-md-9">
                              <ltacl:checkAcl resourceId="111">
                                 <button type="button" class="btn btn-warning" onclick="updateUser('${entity.id }')">修改</button>
                              </ltacl:checkAcl>
                              <ltacl:checkAcl resourceId="112">
                                 <button type="button" class="btn red" onclick="deleteSingleInDetail('${entity.id }')">删除</button>  
                              </ltacl:checkAcl>
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
</body>
</html>
<content tag="pageCore">
<script src="${basepath }/static/public/javascripts/usermanage.js" type="text/javascript"></script>
<script src="${basepath }/static/public/javascripts/adduser.js" type="text/javascript"></script> 
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
</content>	
 