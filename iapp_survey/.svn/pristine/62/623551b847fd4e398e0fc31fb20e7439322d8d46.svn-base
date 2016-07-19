<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>
<%
	String domain = LoginSessionHelper.getCurrentDomain(request);
	pageContext.setAttribute("domain", domain);
%>


<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
           
            <th>序号</th>
            <th>用户姓名</th>
            <th>内容</th>
            <th>类型</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="9"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
        <tr>
           
          	
            <td>${num.index+1 }</td>
            <td>
                <span>${item.name}</span>
            </td>
            <td>
                <span>${ltfun:html2Text(item.context, 30)}</span>
            </td>
            <td>
                <span>
                <c:if test="${domain ne 'muyang' }">
				${item.type eq 0 ?"建议":"投诉"}
				</c:if>
				<c:if test="${domain eq 'muyang'}">
				${item.type eq 0 ?"新产品开发":item.type eq 1 ?"技术创新":item.type eq 2?"产品问题":"其他"}
				</c:if></span>
            </td>
           <td>
                <span>${ltfun:dateLongToStringFormat(item.createTime,'yyyy-MM-dd HH:mm') }</span>
            </td>
            
            <td>
                
                  
          <a href="javascript:void(0);" onclick='detail("${item.id}")'><span class="mytable_btn">&nbsp;详情</span></a>
                  
              
            </td>
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>


