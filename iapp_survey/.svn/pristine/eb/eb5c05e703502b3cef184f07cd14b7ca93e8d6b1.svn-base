<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>

<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th width="5%">序号</th>
            <th width="24%">内容</th>
            <th width="8%">作者</th>
            <th width="7%">赞数</th>
            <th width="7%">踩数</th>
            <th width="7%">评论数</th>
            <th width="15%">创建时间</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="8"> 没有相关记录！</td></tr>
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
		            	${ltfun:html2Text(item.content,3000) }
		            </label>
	            </td>
	            <td>
		            <label>
		            ${item.author_name }
		            </label>
	            </td>
	            <td>
	            	<label>
	            		${item.agree_num}
	            	</label>
	            </td>
	            <td>
		            <label>
		            	${item.disagree_num}
		            </label>
	            </td>
	            <td>
	                <label>
	                    ${item.comment_num}
	                </label>
	            </td>
	            <td>
	            	<label>
	            		${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateCreated,'yyyy-MM-dd HH:mm') }
	            	</label>
	            </td>
	            <td>
					<a href="javascript:deleteAnswer('${item.id }')" >删除</a>
					<a href="javascript:commentList('${item.id}',3)">评论管理</a>
				</td>
	        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
