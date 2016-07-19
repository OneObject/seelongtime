<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="" >
<input type="hidden" id="orderDirection" name="orderDirection" value="" >
<span class="btn btn-success table_add"  onclick="GotoAdd();" style="margin-right: 0px">
         <i class="glyphicon glyphicon-plus"></i> 添加
</span>
<span class="btn btn-danger table_add" onclick = "deleteGroup();">
         <i class="glyphicon glyphicon-trash"></i>  删除文档
</span>

<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
        	<th>
                <input type="checkbox" value="1" onclick="checked_all(this)"/>
            </th>
            <th>序号</th>
            <th>文档名</th>
            <th>当前状态</th>
            <th>创建时间</th>
            <th>创建者</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="7"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list}" varStatus="st">
             <tr>
             	<td> <input name="ids" id="${item.id }" type="checkbox" value="${item.id }" /> </td>
                 <td>${st.index+1}</td>
                 <td>${item.originalname}</td>
                 <td>
                     <c:if test="${item.status==1 }">未转换</c:if>
                     <c:if test="${item.status==2 }">转换中</c:if>
                     <c:if test="${item.status==3 }">已转换</c:if>
                     <c:if test="${item.status==4 }">转换失败  &nbsp;<a href="#" onclick="checkreason('${item.failmsg}')" style="font-size: 11px;">查看原因</a></c:if>
                 </td>
                 <td> <d:formatDate currentTime="${item.createtime}" format="yyyy-MM-dd HH:mm"/></td>
                 
                 <td>${item.creator}</td>
                 <td>
                 	<a href="#" onclick="deleteSingleInDetail('${item.id}')" >删除</a>   <a href="#" onclick="GotoDetail('${item.id}')">预览</a>
                 	<c:if test="${item.status==4 }">  &nbsp;<a href="#" onclick="changestatus('${item.id}')" >重新转换</a></c:if>
                 	<!-- <a>修改</a> -->
                 </td>
             </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<script src="${basepath}/static/public/javascripts/document/check_delete.js"></script>
<script>
function pagelisttestee(index){
	page(index);
}

function GotoAdd(){
	window.location.href ="${basepath}/base/admin/mgr/document/add.xhtml";
}
function GotoDetail(id){
	window.open("<%=Constants.DOC_SERVER%>/play.xhtml?id="+id);
}


</script>
<c:set var="pager" value="${page}" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
