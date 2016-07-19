<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th>序号</th>
            <th width="20%">规则名</th>
            <th>奖惩类型</th>
            <th>积分值</th>
            <th>是否去重</th>
            <th>周期类型</th>
            <th>间隔时间</th>
            <th>奖励次数</th>
            <th>同一资源奖励次数</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="10"> 没有相关记录！</td></tr>
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
		            	${item.ruleName }
		            </label>
	            </td>
	            <td>
	            	<label>
	            		<c:if test="${item.rewardType eq '1' }">奖励</c:if>
	            		<c:if test="${item.rewardType eq '0' }">惩罚</c:if>
	            	</label>
	            </td>
	            <!-- 惩罚的过滤条件都不起作用 -->
	            <c:if test="${item.rewardType eq '0' }">
	            	<td>
			            <label>${item.credit }</label>
		            </td>
		            <td>
		            	<label>--</label>
		            </td>
		            <td>
			            <label>--</label>
		            </td>
		            <td>
		            	<label>--</label>
		            </td>
		            <td>
			            <label>--</label>
		            </td>
		            <td>
			            <label>--</label>
		            </td>
	            </c:if>
	            
	            <c:if test="${item.rewardType eq '1' }">
		            <td>
			            <label>
			            	${item.credit }
			            </label>
		            </td>
		            <td>
		            	<label>
		            		<c:if test="${item.norepeat eq '1' }">是</c:if>
		            		<c:if test="${item.norepeat eq '0' }">否</c:if>
		            	</label>
		            </td>
		            <td>
			            <label>
			            	<c:if test="${item.cycleType eq '0' }">一次性</c:if>
		            		<c:if test="${item.cycleType eq '1' }">每天</c:if>
		            		<c:if test="${item.cycleType eq '2' }">整点</c:if>
		            		<c:if test="${item.cycleType eq '3' }">间隔分钟</c:if>
		            		<c:if test="${item.cycleType eq '4' }">不限周期</c:if>
		            		<c:if test="${item.cycleType eq '5' }">每月</c:if>
			            </label>
		            </td>
		            <td>
		            	<label>
		            		${item.cycleTime }
		            	</label>
		            </td>
		            <td>
			            <label>
			            	${item.rewardNum }
			            </label>
		            </td>
		            <td>
			            <label>
			            	${item.resourceRewardNum }
			            </label>
		            </td>
	            </c:if>
	            <td>
					<a href="javascript:updateEntity('${item.id }','${item.ruleName }')">修改</a>
				</td>
	        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
