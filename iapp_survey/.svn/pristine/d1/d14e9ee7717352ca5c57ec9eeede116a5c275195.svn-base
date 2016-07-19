<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>

<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr> 
		     
               <th>序号</th>
			   <th>姓名</th>
               <th>签到时间</th>
               <th>签到内容</th>
               <th>奖励积分</th>
               
		</tr>
	</thead>
	<tbody id="signlist">
	<c:if test="${empty list}">
		<tr>
			<td colspan="8"style="text-align:center">
			暂无数据记录
			</td>
		</tr>
	</c:if>
	<c:forEach var="v" items="${list}" varStatus="vs">
		<tr>
			<td>${vs.index+1 }</td>
			<td>${v.uname }</td>
			<td>
				<d:formatDate currentTime="${v.timestamp}" format="yyyy-MM-dd HH:mm"/>
			</td>
			<td>${v.context}</td>
			<td>${v.credit }</td>
			
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
