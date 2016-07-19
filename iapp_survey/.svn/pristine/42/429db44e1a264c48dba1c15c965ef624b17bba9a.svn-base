<%@page import="com.longtime.app.config.Constants"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title><decorator:title default="管理员界面" /></title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta name="MobileOptimized" content="320">
    <%@include file="/WEB-INF/jsp/include/admin_metro/js_css_core.jsp"%>
    <decorator:head/>
    <style type="text/css">
    .imgtozi span,.imgtozi:HOVER span{
    		color:#fff;
    }
    	.loading{
		height:40px;
		width:100%;
		margin: 30px 0;
		line-height:40px;
		text-align:center;
	}
	.loading i{
		font-size:28px;
		color:#999;
	}
    </style>
</head>
<body class="page-header-fixed" >
<!-- BEGIN HEADER -->   
   <div class="header navbar navbar-inverse navbar-fixed-top">
      <!-- BEGIN TOP NAVIGATION BAR -->
      <div class="header-inner">
         <!-- BEGIN LOGO -->  
         <a class="navbar-brand imgtozi" href="javascript:void(0);">
         <%
         	if(StringUtils.isNotBlank(LoginSessionHelper.getCurrentDomainLogo(request)))
         	{
         		%>
         		 <img src="<%=Constants.IMG_SERVER_DOWNLOAD %>/<%=LoginSessionHelper.getCurrentDomainLogo(request)%><%=Constants.QINIU_COURSE_IMG_STYLE_180_180%>" alt="logo" id="logo" class="img-responsive" style="height: 24px;float:left" />
         		<%
         	}
         %>
         <span style="display:block;padding-left:10px;float:left"><%=LoginSessionHelper.getCurrentDomainName(request)%></span>
         </a>
         <!-- END LOGO -->
         <!-- BEGIN RESPONSIVE MENU TOGGLER --> 
         <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
         <img src="${basepath}/static/public/metronic.bootstrap/assets/img/menu-toggler.png" alt="" />
         </a> 
         <!-- END RESPONSIVE MENU TOGGLER -->
         <!-- BEGIN TOP NAVIGATION MENU -->
         <ul class="nav navbar-nav pull-right" >
            <!-- BEGIN NOTIFICATION DROPDOWN -->
             
            <!-- END TODO DROPDOWN -->
            <!-- BEGIN USER LOGIN DROPDOWN -->
            <li class="dropdown user">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
               <!--<img alt="" src="${basepath}/static/public/metronic.bootstrap/assets/img/avatar1_small.jpg"/>-->
               <span class="username">${sessionScope.session_user.username }</span>
               <i class="icon-angle-down"></i>
               </a>
               <ul class="dropdown-menu">
               	  <li><a href="${basepath}/mgr/tomodify.xhtml"><i class="icon-key"></i>修改密码</a> 
                  </li>
                  <li><a href="${basepath}/mgr/logout.xhtml"><i class="icon-signout"></i>注销</a>
                  </li>
               </ul>
            </li>
            <!-- END USER LOGIN DROPDOWN -->
         </ul>
         <!-- END TOP NAVIGATION MENU -->
      </div>
      <!-- END TOP NAVIGATION BAR -->
   </div>
   <!-- END HEADER -->
   <div class="clearfix"></div>
    <div class="page-container">
   

<decorator:usePage id="sitemeshPage" />
<%
String menu_path = sitemeshPage.getProperty("meta.menu_path");
if(null!=menu_path && !"".equals(menu_path)){
	String[] paths = menu_path.split("\\.");
	for(String path :paths){
		request.setAttribute(path, "active");
		request.setAttribute(path+"_open", "open");
		request.setAttribute(path+"_select", "<span class='selected'></span>");
	}
}
%>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar navbar-collapse collapse">
    <!-- BEGIN SIDEBAR MENU -->
    <ul class="page-sidebar-menu">
        <li>
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            <div class="sidebar-toggler hidden-phone"></div>
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
        </li>
        <li>
        </li>
       
 <%
 	String domain = LoginSessionHelper.getCurrentDomain(request);
 %>
 		<c:set var="domain" value="<%=domain %>"></c:set>
 		<c:set var="isDingTalk" value="false"></c:set>
        
         <ltacl:res resourceId="100" ctl="false">
		<ltacl:checkAcl resourceId="100"> 
        <li  path="active" class=" ${active}">
            <a href="javascript:;"> <i class="glyphicon glyphicon-book"></i> <span class="title">调研管理</span> <span class="arrow ${course_open}" ></span> ${course_select}</a>
            <ul class="sub-menu">
            
            	  <ltacl:res resourceId="110" ctl="false">
				  <ltacl:checkAcl resourceId="110"> 
                 <li id="menu_survey" class="${menu_survey_activity }"><a href="${basepath }/mgr/voteactivity/index.xhtml">调研活动管理</a></li>
                  </ltacl:checkAcl>
                  </ltacl:res>
                	<ltacl:res resourceId="120" ctl="false">
					<ltacl:checkAcl resourceId="120"> 
	                <li id="menu_survey" class="${menu_survey }"><a href="${basepath }/mgr/vote/index.xhtml">调研问卷管理</a></li>
	                </ltacl:checkAcl>
	             </ltacl:res>
            </ul>

        </li>
        </ltacl:checkAcl>
        </ltacl:res>
 		
        <ltacl:res resourceId="700" ctl="false">
		<ltacl:checkAcl resourceId="700">
        <li path="system" class='${system}'>
            <a href="javascript:;"> <i class="glyphicon glyphicon-cog"></i> <span class="title">系统管理</span> <span class="arrow ${system_open}" ></span>${system_select}</a>
            <ul class="sub-menu">
            
				<ltacl:res resourceId="710" ctl="false">
				<ltacl:checkAcl resourceId="710">
                <li id="usermanage" class="${user}">
                    <a href="javascript:void(0);" id="b_user" onclick="javascript:tourl('user/usermanage');"> 用户管理</a>
                </li>
                </ltacl:checkAcl>
                </ltacl:res>
                
                <ltacl:res resourceId="720" ctl="false">
				<ltacl:checkAcl resourceId="720">
                <li id="usermanage" class="${usergroup}">
                    <a href="javascript:void(0);" id="b_user" onclick="javascript:tourl('usergroup/group');"> 用户组管理</a>
                </li>
                </ltacl:checkAcl>
                </ltacl:res>
                
                <ltacl:res resourceId="730" ctl="false">
				<ltacl:checkAcl resourceId="730">
                <li id="organization" class="${org}">
                    <a href="javascript:void(0);"  onclick="javascript:tourl('organization/organization');"> 组织管理</a>
                </li>
                </ltacl:checkAcl>
                </ltacl:res>
                
                <ltacl:res resourceId="740" ctl="false">
				<ltacl:checkAcl resourceId="740">
                <li id="joblevel" class="${joblevel}">
                    <a href="javascript:void(0);" onclick="javascript:tourl('joblevel/index')">职级管理</a>
                </li>
                </ltacl:checkAcl>
                </ltacl:res>
                
                <ltacl:res resourceId="100000" ctl="false">
				<ltacl:checkAcl resourceId="100000" adminctl="true">
                <li id="role" class="${role}">
                    <a href="javascript:void(0);" onclick="javascript:tourl('/acl/role/index')">权限管理</a>
                </li>
                </ltacl:checkAcl>
                </ltacl:res>
                
                <ltacl:res resourceId="750" ctl="false">
				<ltacl:checkAcl resourceId="750">
                <li id="tenantconfig" class="${tenantconfig}">
                   <a href="${basepath}/base/admin/tenantconfig/tenantindex.xhtml">企业配置</a>
                </li>
                </ltacl:checkAcl>
                </ltacl:res>
                
                
                <c:if test="${sessionScope.session_user.type == 2 }">
	                <li id="tenantconfig" class="${tenant}">
	                   <a href="${basepath}/base/admin/tenant/tenants.xhtml">商户列表</a>
	                </li>
                </c:if>
            </ul>
        </li>
       </ltacl:checkAcl>
       </ltacl:res>
       
    </ul>
    <!-- END SIDEBAR MENU -->
</div>
<!-- END SIDEBAR -->

<!-- BEGIN PAGE -->
    <div class="page-content">
   
   		 <decorator:body />
	</div>
</div>
<!-- END PAGE -->
 <!-- BEGIN FOOTER -->
    <div class="footer">
        <div class="footer-inner">
            2013 &copy; admin by longtimeit.  <decorator:getProperty property="meta.menu_model" />
        </div>
      	</div>
        <div class="footer-tools">
            <span class="go-top">
            <i class="icon-angle-up"></i>
            </span>
        </div>
    <!-- END FOOTER -->
<!--学习课程数量图表   end-->
<div id="loading_img" style="display:none;width:200px;height: 200px;">
  <img src="http://img04.taobaocdn.com/imgextra/i4/679214160/T2HzqzXbBdXXXXXXXX-679214160.gif" alt="" />
</div>
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<!-- END PAGE LEVEL SCRIPTS -->  
</body>
</html>
<decorator:getProperty property="page.pageCore" />
<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
<script src="${basepath}/static/public/easydialog-v2.0/easydialog.js" type="text/javascript"></script>
<script type="text/javascript">
      $(document).ready(function() {
    	  App.init();//渲染页面框架
      });
      function tourl(url){
    	  self.location.href = basepath + "/base/admin/"+url+".xhtml";
      }
      function loading(id){
    	  
    	  $("#"+id).ajaxStart(function(){
		    	  easyDialog.open({
		    		  container : 'loading_img',
		    		  fixed : false,
		    		  overlay:true
		    		});
		    });
    	  $("#"+id).ajaxStart(function(){
    		  easyDialog.close();
    	  });
      }
     
</script>
<decorator:getProperty property="page.pageInit" />
<%@include file="/WEB-INF/jsp/include/analysis.jsp" %>