<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><decorator:title default="..."  /></title>
    
   <decorator:head/>
   
    <script type="text/javascript">
    		
    </script>
</head>

<%
String msg = "hello 你好!";
%>
<body >
<decorator:getProperty property="html_attribute" />
<br>
<decorator:getProperty property="body.template" />
<br>
<decorator:getProperty property="body.class" writeEntireProperty="true" />

<br>
<decorator:getProperty property="body.onload" writeEntireProperty="true" />

<br>
<c:set var="t">
<decorator:getProperty property="meta.menu_model" />
</c:set>

<c:if test="${t==1 }"> t==1  正确了</c:if>
</br>

${(t>0 && t<=10)? "菜单1":"菜单2" }

<br>


<decorator:usePage id="myPage" />
<%
int menu_index = myPage.getIntProperty("meta.menu_model");

String html_attribute = myPage.getProperty("html_attribute");
%>
int menu_index = myPage.getIntProperty("meta.menu_model")    ||  <%=menu_index %>

<br>
myPage.getProperty("html_attribute")  == <%=html_attribute %>
 <hr />
公共部分:<%=msg %> <br>
pageContext.request.contextPath: ${pageContext.request.contextPath} <br>
request.getContextPath() : <%=request.getContextPath() %>
    
    
    
    
    <h1>Header</h1>
    <p><b>Navigation</b></p>
    <hr />
    <decorator:body />
    <hr />
    <h1>Footer</b></h1>
</body>
</html>

<decorator:getProperty property="page.myJS" />
