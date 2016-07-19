<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<style type="text/css">
.z{float: left;}
.pt10{padding-top: 6px;}
.m10{margin: 6px;}
.page_max{width: 50px;margin-top: 6px;}
</style>

<div class="reHeight">
	<div class="dataTables_length z">
	</div>
	
	<div class="dataTables_paginate paging_full_numbers">
		<ul class="pagination">
			<c:if test="${pager.current_page>1  }">
				<li onclick="${empty(pageFn)?'page':pageFn}(1)"><a href="javascript:void(0);">第一页</a></li>
				<li onclick="${empty(pageFn)?'page':pageFn}(${pager.current_page-1})"><a href="javascript:void(0);">前一页</a></li>
			</c:if>
			<%-- Rule 1 --%>
			<c:if test="${pager.total_page<=5 }">
				<c:forEach begin="1" end="${pager.total_page }" varStatus="st">
					<c:choose>
						<c:when test="${pager.current_page==st.index }">
							<li class="active"><a href="javascript:void(0);">${st.index }</a></li>
						</c:when>
						<c:otherwise>
							<li onclick="${empty(pageFn)?'page':pageFn}(${st.index})"><a href="javascript:void(0);">${st.index }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
			<%-- Rule 2 --%>
			<c:if test="${pager.total_page>5 }">
				<c:if test="${pager.current_page<=3 }">
					<c:forEach begin="1" end="5" varStatus="st">
						<c:choose>
							<c:when test="${pager.current_page==st.index }">
								<li class="active"><a href="javascript:void(0);">${st.index }</a></li>
							</c:when>
							<c:otherwise>
								<li onclick="${empty(pageFn)?'page':pageFn}(${st.index })"><a href="javascript:void(0);">${st.index }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
				
				<c:if test="${pager.current_page>3 && pager.current_page<pager.total_page-2 }">
					<c:forEach begin="${pager.current_page-2 }" end="${pager.current_page+2 }" varStatus="st">
						<c:choose>
							<c:when test="${pager.current_page==st.index }">
								<li class="active"><a href="javascript:void(0);">${st.index }</a></li>
							</c:when>
							<c:otherwise>
								<li onclick="${empty(pageFn)?'page':pageFn}(${st.index })"><a href="javascript:void(0);">${st.index }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
			
				<c:if test="${pager.current_page>=pager.total_page-2 }">
					<c:forEach begin="${pager.total_page-4 }" end="${pager.total_page }" varStatus="st">
						<c:choose>
							<c:when test="${pager.current_page==st.index }">
								<li class="active"><a href="javascript:void(0);">${st.index }</a></li>
							</c:when>
							<c:otherwise>
								<li onclick="${empty(pageFn)?'page':pageFn}(${st.index })"><a href="javascript:void(0);">${st.index }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
			</c:if>
			<c:if test="${pager.current_page<pager.total_page }">
				<li onclick="${empty(pageFn)?'page':pageFn}(${pager.current_page+1})"><a href="javascript:void(0);">后一页</a></li>
				<li onclick="${empty(pageFn)?'page':pageFn}(${pager.total_page })"><a href="javascript:void(0);">最后页</a></li>
			</c:if>
		</ul>
		
	</div>
</div>