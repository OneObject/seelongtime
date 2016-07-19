<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th>序号</th>
            <th>姓名</th>
            <th>用户名</th>
            <th>手机</th>
            <th>邮箱</th>
            <th>积分值</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="7"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
	        <tr>
	            <td>
	            	<label>
	            		${num.count }
	            	</label>
	            </td>
	            <td>
		            <label>
		            	${item.name}
		            </label>
	            </td>
	            <td>
		            <label>
		            	${item.username }
		            </label>
	            </td>
	            <td>
	            	<label>
	            		${item.mobile }
	            	</label>
	            </td>
	            <td>
		            <label>
		            	${item.email}
		            </label>
	            </td>
	            <td>
	            	<label>
	            		${ajy:creditTotal(item.id) }
	            	</label>
	            </td>
	            <td>
					<a href="${basepath }/mgr/credit/log/detail.xhtml?uid=${item.id}" >查看详情</a>
					&nbsp;&nbsp;
					<a href="${basepath }/mgr/credit/log/tocreatecredit.xhtml?uid=${item.id}" >积分奖惩</a>
				</td>
	        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
