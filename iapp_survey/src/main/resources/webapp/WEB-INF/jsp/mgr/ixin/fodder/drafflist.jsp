<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!-- 素材管理内容 start -->
<div class="portlet-body box" >
<c:if test="${empty list }">
	<div>暂无素材，你可以创建素材</div>
</c:if>

<c:if test="${not empty list }">
<c:forEach items="${list }" var="info">
<div class="clo-lg-4 ixin_item ">

	<div class="appmsg ">
		<div class="appmsg_content">
			<h4 class="appmsg_title">
				<a href="#" target="other">${info.title }</a>
			</h4>
			<div class="appmsg_info">
				<em class="appmsg_date">
				<d:formatDate currentTime="${info.modifyTime }" format="yyyy/MM/dd"/>
				</em>
			</div>
			<div class="appmsg_thumb_wrp">
				<img
					src="${info.coverPath }"
					alt="" class="appmsg_thumb">
			</div>
			<p class="appmsg_desc">
				<c:if test="${not empty info.summary }">${info.summary }</c:if>
				<c:if test="${empty info.summary }">${info.content }</c:if>
			</p>

		</div>

		<div class="appmsg_opr">
			<ul>
				<li class="appmsg_opr_item with2"><a class="js_edit"
					href="javascript:void(0);" onclick="editDraff('${info.id}')"><i
						class="icon18_common edit_gray">编辑</i></a></li>
				<li class="appmsg_opr_item with2 no_extra"><a
					class="js_del no_extra" data-id="10001081"
					href="javascript:void(0);" onclick="deldraff('${info.id}')"><i class="icon18_common del_gray">删除</i></a>
				</li>
			</ul>
		</div>


	</div>

</div>
</c:forEach>	
</c:if>
<!-- 素材管理内容 end -->
</div>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
</div>
