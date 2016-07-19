<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.longtime.common.utils.Page" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table
							class="table table-striped table-bordered table-hover table-full-width"
							id="sample_2">
							<thead>
								<tr>
								<%--
									<th>时间段</th>
								 --%>
									<th>姓名</th>
									<th>签到时间</th>
									<th>是否导入</th>

								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<tr>
										<td colspan="3">暂时没有人签到</td>
									</tr>
								</c:if>

								<c:forEach var="item" items="${ list }">
									<tr>
									<%--
										<td><d:formatDate currentTime="${item.startTime }"
												format="yyyy-MM-dd HH:mm" /> ~ <d:formatDate
												currentTime="${item.endTime }" format="yyyy-MM-dd HH:mm" />
										</td>
									 --%>
										<td>${item.uname }</td>
										<td><d:formatDate currentTime="${item.signinDate }"
												format="yyyy-MM-dd HH:mm" /></td>
										<td>${empty item.apid ?"":"指定人员"}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
