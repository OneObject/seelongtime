<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
   <thead>
      <tr>
         <th>序号</th>
         <c:if test="${model ne 'cpthreeamonth'}"><th>编号</th></c:if>
         <th>名称</th>
         <th>处理状态</th>
         <!-- 
         <th>报表数据条数</th>
          -->
         <th>创建时间</th>
         <th>备注</th>
         <th>操作</th>
      </tr>
   </thead>
   <tbody id="tbody" style="text-align: left;">
   
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="8"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
	      <c:forEach var="item" items="${list }" varStatus="st">
	          <tr>
	             <td>${st.count }</td>
	             <c:if test="${model ne 'cpthreeamonth'}"><td>${item.no }</td></c:if>
	             <td title="${item.reportname }">${ltfun:html2Text(item.reportname, 18)}</td>
	             <td title="开始时间：${ltfun:dateLongToStringFormat(item.starttime, 'yyyy-MM-dd HH:mm')}，结束时间：${ltfun:dateLongToStringFormat(item.endtime, 'yyyy-MM-dd HH:mm')}，耗时：${(item.endtime-item.starttime)/1000}秒">
	             	<c:if test="${item.status == -1 }">失败</c:if>
	             	<c:if test="${item.status == 0 }">未处理</c:if>
	             	<c:if test="${item.status == 1 }">成功</c:if>
	             </td>
	             <!--
	             <td>${item.processnum}</td>
	             -->
	             <td>${ltfun:dateLongToStringFormat(item.createtime, 'yyyy-MM-dd HH:mm')  }</td>
	             <td title="${item.remark }">${item.remark}</td>
	             <td>
		             <c:if test="${model ne 'cpthreeamonth'}">
		                  <a href="javascript:void(0);" onclick="del('${item.id}');">
		                      <span>
		                         <i class="glyphicon glyphicon-trash"></i>删除
		                     </span>
		                  </a>
	                  </c:if>
	                  <c:if test="${item.status == 1 }">
		                  &nbsp;&nbsp;
		                   <a href="${basepath }/${item.path}">
		                      <span>
		                         <i class="glyphicon glyphicon-download-alt"></i>下载
		                     </span>
		                  </a>
	                  </c:if>
	             </td>
	          </tr>
	       </c:forEach>
        </c:otherwise>
    </c:choose>
   </tbody>
</table>

<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
