<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th width="5%">序号</th>
            <th width="34%">标题</th>
            <c:choose>
             <c:when test="${domain eq 'ennapp'  }">
            	<th width="8%">班级</th>
             </c:when>
             <c:otherwise>
            	<th width="24%">问题补充</th>
             </c:otherwise>
            </c:choose>
            <th width="8%">作者</th>
            <th width="7%">回答数</th>
            <th width="12%">创建时间</th>
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
		            	${ item.title}
		            </label>
	            </td>
	            <td>
		            
		              <c:choose>
           				  <c:when test="${domain eq 'ennapp' }">
            					<label>${item.classname }</label>
            			 </c:when>
            			 <c:otherwise>
            					<label>
		            				${ltfun:html2Text(item.supplement,32) }
		            			</label>
             			</c:otherwise>
            </c:choose>
	            </td>
	            <td>
	            	<label>
	            		${item.author_name }
	            	</label>
	            </td>
	            <td>
		            <label>
		            	${item.answer_num}
		            </label>
	            </td>
	            <td>
	            	<label>
	            		${ltfun:dateLongToStringFormat(item.dateCreated,'yyyy-MM-dd HH:mm') }
	            	</label>
	            </td>
	            <td>
					<%-- <a href="${basepath }/mgr/credit/log/detail.xhtml?uid=${item.id}" >回答列表</a>
					&nbsp;&nbsp; --%>
					<a href="javascript:deleteQuestion('${item.id }',${page.current_page})" >删除</a>
					<a href="javascript:answerList('${item.id}')">回答管理</a>
				</td>
	        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
