<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>

<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>   
		       <th>
              <label>
                <input type="checkbox" value="1" onclick="checked_all(this)"/>
               </label>
              </th>
               <th>序号</th>
			   <th>名称</th>
               <th>创建时间</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody id="praiselist">
	<c:if test="${empty list }">
		<tr>
			<td colspan="5"style="text-align:center">
			暂无数据记录
			</td>
		</tr>
	</c:if>
	<c:forEach var="v" items="${list}" varStatus="vs">
		<tr>
		    <td>
                  <label>
                    <input name="ids" id="${v.id }" type="checkbox" value="${v.id }" />
                   </label>
             </td>
			<td >${vs.index+1 }</td>
			<td>${v.name}</td>
			<td >
				<d:formatDate currentTime="${v.createtime}" format="yyyy-MM-dd HH:mm"/>
			</td>
			<td >
			<a href="#" onclick="del('${v.id}');">删除</a>
			&nbsp;&nbsp;
			<a href="${basepath}/base/admin/usergroup/usergroup.xhtml?id=${v.id}">修改</a>
			</td>
		</tr>
</c:forEach>
	</tbody>
</table>
<script type="text/javascript">
var flag=true;
/**
 * 全部选中
 */
//var flag = true;//没有选中的情况下是true
function checked_all(o){
	if(flag){
		$("input[name='ids']").each(function(){
			$(this).attr("checked","checked");
		});
		flag = false;
	}else{
		$("input[name='ids']").each(function(){
			$(this).removeAttr("checked");
		});
		flag = true;
	}
	
}
</script>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>

</div>
