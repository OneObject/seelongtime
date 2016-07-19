<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.longtime.common.utils.Page" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table
							class="table table-striped table-bordered table-hover table-full-width"
							id="sample_2">
							<thead>
								<tr>
									<th width="10%"><input type="checkbox" value="1" onclick="checked_all(this)"></th>
									<th width="30%"width="10%">姓名</th>
									<th width="30%">用户名</th>
									<th width="30%">签到时间</th>

								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<tr>
										<td colspan="4">暂时没有人签到</td>
									</tr>
								</c:if>

								<c:forEach var="item" items="${ list }">
									<tr>
										<td><input name="ids" id="${item.id }" type="checkbox" value="${item.id }"  data-uid="${item.userid }"></td>
										<td>${item.uname }</td>
										<td>${item.username }</td>
										<td><d:formatDate currentTime="${item.signinDate }"
												format="yyyy-MM-dd HH:mm" /></td>

									</tr>
								</c:forEach>

							</tbody>
						</table>
						<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
