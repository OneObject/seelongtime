<%@page import="com.alibaba.druid.sql.dialect.oracle.ast.stmt.OracleIfStatement.ElseIf"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.longtime.ajy.model.Tenant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@page import="com.longtime.ajy.session.SessionHelper"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page language="java" pageEncoding="UTF-8" %>

<% 
	Tenant tenant = MwebHelper.getTenant(request);
	
%>

<script type="text/javascript">
	function doSearch(){
		var content = $("#searchContent").val();
		if(content==""){
			return;
		}
		window.location.href="${basepath}/survey/index.xhtml?title="+content;
	}
</script>
<header class="head">
<% if(tenant==null){ %>
    <div class="col-xs-3">
        <img src="${basepath}/static/img/frame/logo.png" class="logo">
    </div>
<% }else if(StringUtils.isBlank(tenant.getLogo())){%>
	<div class="col-xs-3">
        <span style="color:white;display:block;padding-left:10px;float:left;float:left;font-size: 18px;line-height: 40px;"><%=tenant.getName()%></span>
      
    </div>
<% }else{%>
    <div class="col-xs-3">
      	<img src="<%=Constant.IMG_SERVER_DOWNLOAD %><%=tenant.getLogo() %>" alt="logo" id="logo" style="height:30px;margin-top:4px;float:left;"/>
      	<%-- 
        <span style="color:white;display:block;padding-left:10px;float:left;font-size: 18px;line-height: 40px;"><%=tenant.getName()%></span>
        --%>
    </div>
<% }%>

<div class="col-xs-3">
        
   </div>
    <div class="col-xs-8 msg-box">
        <div class="search-box">
            <input class="search" placeholder="<fmt:message key="menu.search" bundle="${bundle}"/>···" id="searchContent">
            <img src="${basepath}/static/img/frame/search.png" class="search-btn" onclick="javascript:doSearch();">
        </div>
        <div class="dropdown setting-box">
            <span class="dropdown-toggle" data-toggle="dropdown">
               <i class="fa fa-cog"></i>
            </span>
            <ul class="dropdown-menu" role="menu">
                <!-- <li><a href="#">安全设置</a></li> -->
               	<li><a href="${basepath}/user/center.xhtml"><fmt:message key="menu.usercenter" bundle="${bundle}"/></a></li> 
                 <li><a href="${basepath}/user/passindex.xhtml"><fmt:message key="menu.changepwd" bundle="${bundle}"/></a></li>
                <li><a href="${basepath}/logout.xhtml"><fmt:message key="menu.logout" bundle="${bundle}"/></a></li>
            </ul>
        </div>
       <!--  <div class="dropdown warning">
            <span class="dropdown-toggle" data-toggle="dropdown">
                12
            </span>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">您的说说有新的评论了！</a></li>
                <li><a href="#">有一门考试马上进行</a></li>
                <li><a href="#">系统发布新课程了</a></li>
                <li><a href="#">该考试了</a></li>
            </ul>
        </div> -->
        
        <div class="header-user-name-000">
        	<span  onclick="location.href='${basepath}/user/center.xhtml'"><i class="fa fa-user" style="font-size: 18px;"></i>&nbsp;&nbsp;<%=SessionHelper.getCurrentUname(request) %></span>
        </div>
    </div>
</header>