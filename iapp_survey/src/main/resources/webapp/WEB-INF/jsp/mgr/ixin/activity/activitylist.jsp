<%@page import="com.longtime.app.config.Constants"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.longtime.common.utils.Page" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <%-- <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th> --%>
			   <th>活动名称</th>
               <%-- th>活动介绍</th--%>
               <th>开始时间</th>
               <th>结束时间</th>
               <th>签到码</th>
               <th>创建者</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty activityList }">
		<tr>
		<td colspan="6">没有找到更多活动信息</td>
		</tr>
	</c:if>
	<c:forEach items="${activityList }" var="item">
	<tr>
               <td title="${item.name }">${ltfun:html2Text(item.name,30)}</td>
               <%--td title="${item.desc }">${ltfun:html2Text(item.desc,20)}</td--%>
               <td>
               <d:formatDate currentTime="${item.startDate }" format="yyyy-MM-dd HH:mm"/>
               </td>
               <td>
               <d:formatDate currentTime="${item.endDate }" format="yyyy-MM-dd HH:mm"/>
               </td>
               <td>${item.signinCode }</td>
                <td>${item.creatorName }</td>
               <td>
               <ltacl:datactl creatoruid="${item.creator }">
               <a href="${basepath }/mgr/activity/recordindex.xhtml?id=${item.id}" target="1">报名册</a>
               <a href="${basepath }/mgr/activity/step1.xhtml?id=${item.id}">修改</a>
               <a href="javascript:void(0);" onclick="delActivity('${item.id }')">删除</a>
               <!-- 
               <a href="${basepath }/base/admin/authorize/authorize.xhtml?rid=${item.id}&rcategory=3&scategory=1">授权</a>
               <a href="${basepath }/protal/activity/activitypage.xhtml?activityId=${item.id}&openId=longtime" target="1">测试</a>
                -->
                <a href="${basepath }/mgr/activity/step4.xhtml?id=${item.id}">关联内容</a>
                <a href="${basepath}/base/admin/authorize/authorize.xhtml?rcategory=3&rid=${item.id}&scategory=1">授权</a>
                <a href="${basepath}/mgr/topic/topicstudentindex.xhtml?activityid=${item.id}">话题管理</a>
                </ltacl:datactl>
                <%--
                <a href="javascript:void(0);" onclick="showURl('<%=Constants.STUDENT_WEB_ROOT %>m/ixin/activity/${item.style}activity.xhtml?id=${item.id}&fdomain=${item.domain}')">访问地址</a>
                --%>
                <a href="javascript:void(0);" onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT %>m/ixin/activity/detaildispatch.xhtml?id=${item.id}&fdomain=${item.domain}')">访问地址</a>
               </td>
		</tr>
	</c:forEach>
		
	</tbody>
</table>
<script type="text/javascript">

function openWindow(url) {
	window.open(url,'_blank') 
}
</script>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
