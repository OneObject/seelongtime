<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${parentname}</title>
 <meta charset="utf-8">
</head>
<body>
<div class="classchild">
    <ul>
    <c:if test="${empty childcategorylist }">
    <li>无分类</li>
    </c:if>
    <c:if test="${not empty childcategorylist }">
    <c:forEach var="childcategory" items="${childcategorylist}">
        <li onclick="javascript:openwindow(this,'${basepath}/m/study/index?categoryid=${childcategory.courseCategory.id}&name=${childcategory.courseCategory.name}')">
            <h3>${childcategory.courseCategory.name}<span class="num">${childcategory.coursenum}</span></h3>
        </li>
     </c:forEach>
     </c:if>
    </ul>
</div>
</body>
</html>