<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

        <table class="table table-striped table-bordered table-advance table-hover" id="" width="100%">
            <tr class="">
                <td width="30%" class="border_1">导入文件名：<input type="hidden" name="id" value="${logModel.id }"/></td>
                <td width="60%" class="border_1">${logModel.fileName}</td>
            </tr>
            <tr>
                <td>题库名：</td>
                <td>${logModel.itemblank.name}</td>
            </tr>
            <tr>
                <td>导入人：</td>
                <td>${logModel.entityMetaInfo.userCreated}</td>
            </tr>
            <tr>
                <td>导入时间：</td>
                <td>${ltfun:dateLongToStringFormat(logModel.entityMetaInfo.dateCreated, 'yyyy-MM-dd HH:mm')}</td>
            </tr>
            <c:if test="${logModel.status eq 3 }">
	            <tr>
	                <td>撤消人：</td>
	                <td>${logModel.entityMetaInfo.userLastModified}</td>
	            </tr>
	            <tr>
	                <td>撤消时间：</td>
	                <td>${ltfun:dateLongToStringFormat(logModel.entityMetaInfo.dateLastModified, 'yyyy-MM-dd HH:mm')}</td>
	            </tr>
            </c:if>
            <tr>
                <td>试题总数：</td>
                <td>${logModel.totalNum}</td>
            </tr>
            <c:if test="${logModel.totalNum ne 0 }">
                <c:forEach var="t" items="${tnMap }" varStatus="i">
                    <tr>
                        <td>${t.key }:</td>
                        <td>${t.value }</td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>

<div>
</div>

