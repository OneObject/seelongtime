<%@page import="com.longtime.app.config.Constants"%>
<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th width="10%"></th>
            <th>功能名称</th>
        </tr>
    </thead>
    <tbody id="tbody">
    	<!-- 系统功能菜单开始 -->
    	<c:if test="${type eq 1 }">
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="key" value="activity" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>活动列表（消息回复）</span>
	            </td>
	        </tr>
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>m/h5/activity/page.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>活动列表（链接跳转）</span>
	            </td>
	        </tr>
	         <!-- <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="key" value="sign_activity" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>活动签到列表（消息回复）</span>
	            </td>
	        </tr> -->
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="key" value="vote" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>投票列表（消息回复）</span>
	            </td>
	        </tr>
	          <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/ixin/vote/votelist.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>投票列表（链接跳转）</span>
	            </td>
	        </tr>
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/ixin/vote/surveylist.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>调研列表（链接跳转）</span>
	            </td>
	        </tr>
	        
	        
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="key" value="card" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>抽奖列表（消息回复）</span>
	            </td>
	        </tr>
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="key" value="notice" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>通知公告列表（消息回复）</span>
	            </td>
	        </tr>
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/ixin/rank/ranklist.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>排行榜列表（链接跳转）</span>
	            </td>
	        </tr>
	        <!-- 
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="key" value="study" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>学习列表（消息回复）</span>
	            </td>
	        </tr>
	         -->
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>m/h5/study/courses.xhtml?model=me&fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>课程列表（链接跳转）</span>
	            </td>
	        </tr>
	       <%--  <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/study/course_cata_tree.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>课程分类列表（链接跳转）</span>
	            </td>
	        </tr> --%>
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/nstudy/category.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>课程分类列表（链接跳转）</span>
	            </td>
	        </tr>
	        
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/task/index.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>作业列表（链接跳转）</span>
	            </td>
	        </tr>
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>m/h5/exam/index.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>考试列表（链接跳转）</span>
	            </td>
	        </tr>
	        
	      <%--  <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/exam/list.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>考试列表（带搜索，链接跳转）</span>
	            </td>
	        </tr>
	         <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/nstudy/portal.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>课程首页App Store方式（链接跳转）</span>
	            </td>
	        </tr> --%>
	         <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>m/h5/ask/page.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>在线问答（链接跳转）</span>
	            </td>
	        </tr>
	         <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/feed/list.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>动态列表（链接跳转）</span>
	            </td>
	        </tr>
	         <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/ixin/activity/authorize_list.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>授权活动列表（链接跳转）</span>
	            </td>
	        </tr>
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/ixin/user/creditscore.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>用户积分（链接跳转）</span>
	            </td>
	        </tr>
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/dailysign/index.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>每日签到（链接跳转）</span>
	            </td>
	        </tr>
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/h5/rank/realtime.xhtml?type=history&fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>积分排行（链接跳转）</span>
	            </td>
	        </tr>
	        
	        <tr>
	            <td>
		            <label>
		            	<input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/ixin/ntopic/index.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>" name='identifier' />
		            </label>
	            </td>
	            <td>
	                <span>话题讨论区（链接跳转）</span>
	            </td>
	        </tr>
        </c:if>
        <!-- 系统功能菜单结束 -->
        
        <!-- 活动列表（关键字不为空）开始 -->
        <c:if test="${type eq 2 }">
        	<c:if test="${empty list }">
        		<tr>
        			<td colspan="2">暂无数据。</td>
        		</tr>
        	</c:if>
        	<c:forEach items="${list }" var="item" varStatus="st">
        		<tr>
		            <td>
			            <label>
			            	<input type="radio" rel="key" value="${item.findKeys }" name='identifier' />
			            </label>
		            </td>
		            <td>
		                <span>${item.name }</span>
		            </td>
		        </tr>
        	</c:forEach>
        </c:if>
        <!-- 活动列表（关键字不为空）结束 -->
        
        <!-- 投票列表（关键字不为空）开始 -->
        <c:if test="${type eq 3 }">
        	<c:if test="${empty list }">
        		<tr>
        			<td colspan="2">暂无数据。</td>
        		</tr>
        	</c:if>
        	<c:forEach items="${list }" var="item" varStatus="st">
        		<tr>
		            <td>
			            <label>
			            	<input type="radio" rel="key" value="${item.keywords }" name='identifier' />
			            </label>
		            </td>
		            <td>
		                <span>${item.title }</span>
		            </td>
		        </tr>
        	</c:forEach>
        </c:if>
        <!-- 投票列表（关键字不为空）结束 -->
        
        <!-- 抽奖列表（关键字不为空）开始 -->
        <c:if test="${type eq 4 }">
        	<c:if test="${empty list }">
        		<tr>
        			<td colspan="2">暂无数据。</td>
        		</tr>
        	</c:if>
        	<c:forEach items="${list }" var="item" varStatus="st">
        		<tr>
		            <td>
			            <label>
			            	<input type="radio" rel="key" value="${item.key }" name='identifier' />
			            </label>
		            </td>
		            <td>
		                <span>${item.explain2.title }</span>
		            </td>
		        </tr>
        	</c:forEach>
        </c:if>
        <!-- 抽奖列表（关键字不为空）结束 -->
        
        <!-- 自定义关键字列表开始 -->
        <c:if test="${type eq 5 }">
        	<c:if test="${empty list }">
        		<tr>
        			<td colspan="2">暂无数据。</td>
        		</tr>
        	</c:if>
        	<c:forEach items="${list }" var="item" varStatus="st">
        		<tr>
		            <td>
			            <label>
			            	<input type="radio" rel="key" value="${item.keywords }" name='identifier' />
			            </label>
		            </td>
		            <td>
		                <span>${item.name }</span>
		            </td>
		        </tr>
        	</c:forEach>
        </c:if>
        <!--  自定义关键字列表结束 -->
        <!-- 栏目列表开始 -->
                <c:if test="${type eq 6 }">
        	<c:if test="${empty list }">
        		<tr>
        			<td colspan="2">暂无数据。</td>
        		</tr>
        	</c:if>
        	<c:forEach items="${list }" var="item" varStatus="st">
        		<tr>
		            <td>
			            <label>
			            <input type="radio" rel="url" value="<%=Constants.STUDENT_WEB_ROOT %>/m/ixin/channelresource/index.xhtml?fdomain=<%=LoginSessionHelper.getCurrentDomain(request) %>&channelid=${item.id}" name='identifier' />
			            </label>
		            </td>
		            <td>
		                <span>${item.title}</span>
		            </td>
		        </tr>
        	</c:forEach>
        </c:if>
        <!-- 栏目列表结束 -->
    </tbody>
</table>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />