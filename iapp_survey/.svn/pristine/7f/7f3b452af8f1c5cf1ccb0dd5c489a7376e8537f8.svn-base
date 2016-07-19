<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>
<%
String domain = LoginSessionHelper.getCurrentDomain(request);
pageContext.setAttribute("domain", domain);

%>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th>
               <th>序号</th>
			   <th>课程名称</th>
               <th>课程分类</th>
                <th>创建状态</th>
               <th onclick="page(1, 'length')" class="sorting<c:out value='${orderField eq "length" ? orderDirection:"" }' />" id="length">课程时间(分钟)</th>
               <th onclick="page(1, 'score')" class="sorting<c:out value='${orderField eq "score" ? orderDirection:"" }' />" id="score">合格分数</th>
               <th onclick="page(1, 'createTime')" class="sorting<c:out value='${orderField eq "createTime" ? orderDirection:"" }' />" id="createTime">创建时间</th>
               <th onclick="page(1, 'releaseStatus')" class="sorting<c:out value='${orderField eq "releaseStatus" ? orderDirection:"" }' />" id="releaseStatus">发布状态</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	    <c:choose>
	          <c:when test="${empty list }">
                   <tr><td colspan="9"> 没有相关记录！</td></tr>
	          </c:when>
	          <c:otherwise>
	          </c:otherwise>
	    </c:choose>
		<c:forEach items="${list }" var="item" varStatus="num">
			<tr>
				<td><input name="ids" value="${item.id }" alt="${item.releaseStatus }"  type="checkbox"></td>
				<td>${num.count }</td>
				<td  id="name_${item.id }" title="${item.name }"><span>${ltfun:html2Text(item.name, 15)}</span></td>
				<td title="${item.courseCategory.name }">${ltfun:html2Text(item.courseCategory.name, 15)}</td>
				<td> 
				<span>
                     ${ajy:createStatus(5,item.id,2,domain) }
                </span>
                </td>
				<td><fmt:formatNumber value="${item.length}" pattern="#"/></td>
				<td>${item.score }</td>
				<td>${ltfun:dateLongToStringFormat(item.createTime,'yyyy-MM-dd HH:mm') }</td>
				<td><span>
					<c:forEach items="${statusMap }" var="type"><%-- ${type.key }|${type.value }|${item.releaseStatus } --%>
						<c:if test="${type.key eq item.releaseStatus}">
							${type.value}
						</c:if>
					</c:forEach>
					</span>
				</td>
				<td>
                   <!--  <a class="" onclick='detailEntity("${item.id }")' href="javascript:void(0)"><span><i class="glyphicon glyphicon-eye-open"></i>&nbsp;详情</span></a>-->
                    <c:if test="${item.releaseStatus eq '0' }">
	                    <a class="" onclick='updateReleaseStatusSingle("${item.id }", 1)' href="javascript:void(0)"><span><i class="icon-ok-circle"></i>&nbsp;发布</span></a>
                    </c:if>
                    <c:if test="${item.releaseStatus eq '1' }">
	                    <a class="" onclick='updateReleaseStatusSingle("${item.id }", 0)' href="javascript:void(0)"><span><i class="icon-ban-circle"></i>&nbsp;取消发布</span></a>
                    </c:if>
                    <a class="" onclick='updateEntity("${item.id }")' href="javascript:void(0)"><span><i class="glyphicon glyphicon-edit"></i>&nbsp;修改</span></a>
                    <c:if test="${item.releaseStatus eq '0' }"> 
                        <a class="" onclick='deleteSingle("${item.id }")' href="javascript:void(0)"><span><i class="glyphicon glyphicon-remove"></i>&nbsp;删除</span></a>
                    </c:if>
                    <a href="${basepath}/mgr/course/step4.xhtml?id=${item.id}">授权</a>
                    <%-- <a class="" onclick='dotop("${item.id}",${item.topindex>0?"0":"1"})' href="javascript:void(0)"><span><i class="glyphicon glyphicon-sort"></i>&nbsp;<c:out value="${item.topindex>0?'取消':''}" />置顶</span></a> --%>
                    <a class="" onclick='showResult("${item.id}")' href="javascript:void(0)"><span>&nbsp;访问量</span></a>
                    <c:if test="${domain eq 'robam'}">
                    	<a href="${basepath }/base/admin/report/appoint/appointindex.xhtml?model=coursepercent&from=9&courseid=${item.id}"><span>课程学习率</span></a>
                    </c:if>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
