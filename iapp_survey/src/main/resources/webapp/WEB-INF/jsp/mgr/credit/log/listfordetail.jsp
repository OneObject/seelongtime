<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>
<%
String domain= LoginSessionHelper.getCurrentDomain(request);
%>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th>序号</th>
            <th width="50%">规则名称</th>
            <th>次数</th>
            <th>奖惩类型</th>
           
            <th>积分值</th>
            <% if("ennapp".equals(domain)){%> 
            <th>经验值</th>
            <%} %>
            <th>奖惩时间</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="6"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
	        <tr>
	            <td>
	            	<label>
	            		${num.count }
	            	</label>
	            </td>
	            <td title="${item.ruleName }">
		            <label>
		            	${ltfun:html2Text(item.ruleName,72) }
		            </label>
	            </td>
	            <td>
	            	<label>
	            		${item.total }
	            	</label>
	            </td>
	            <td>
		            <label>
		            	<c:if test="${item.rewardType eq '1' }">奖励</c:if>
	            		<c:if test="${item.rewardType eq '0' }">惩罚</c:if>
		            </label>
	            </td>
	            <td>
	            	<label>
	            		${item.total*item.credit }
	            	</label>
	            </td>
	            <% if("ennapp".equals(domain)){%> 
            <td>
	            	<label>
	            		${item.total*item.experience }
	            	</label>
	            </td>
            <%} %>
            
	             <td>
	            	<label>
	            		${ltfun:dateLongToStringFormat(item.dateLine,'yyyy-MM-dd HH:mm') }
	            	</label>
	            </td>
	        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
