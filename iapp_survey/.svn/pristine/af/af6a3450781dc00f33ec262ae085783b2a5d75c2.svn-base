<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
	<thead>
	    <tr>
	        <th>
	            <span>序号</span>
	        </th>
	        <th>
	            <span>考试名称</span>
	        </th>
	        <th>
	            <span>用户名称</span>
	        </th>
	        <th>
	            <span>基本操作</span>
	        </th>
	    </tr>
	</thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="4"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
              <tr>
                  <td>
                      <span>${num.count }</span>
                  </td>
                  <td>
                      <span>${entity.examName }</span>
                  </td>
                  <td>
                      <span>${item.name }</span>
                  </td>
                  <td>
                      <span><a href="${basepath }/base/admin/itest/examination/markpaperdetail.xhtml?id=${item.id}&examid=${entity.id}" target="blank" >进行阅卷</a></span>
                  </td>
              </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
