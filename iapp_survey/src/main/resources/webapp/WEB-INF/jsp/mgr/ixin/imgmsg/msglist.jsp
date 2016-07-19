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
				<a href="${basepath }/mgr/ixinnofilter/msgdetail.xhtml?baseId=${info.baseId }&msgtype=${info.materialType }" target="_blank">${info.title }</a>
			</h4>
			<div class="appmsg_info">
				<em class="appmsg_date">
				<d:formatDate currentTime="${info.lastModifiDateline }" format="yyyy/MM/dd"/>
				</em>
			</div>
			<div class="appmsg_thumb_wrp">
				<img
					src="${info.filePath }"
					alt="" class="appmsg_thumb">
			</div>
			<p class="appmsg_desc">${info.desc }</p>

		</div>

		<div class="appmsg_opr">
			<ul>
				<li class="appmsg_opr_item with2"><a class="js_edit"
					href="/cgi-bin/appmsg?t=media/appmsg_edit&amp;action=edit&amp;lang=zh_CN&amp;token=1747431657&amp;type=10&amp;appmsgid=10001081&amp;isMul=0"><i
						class="icon18_common edit_gray">编辑</i></a></li>
				<li class="appmsg_opr_item with2 no_extra"><a
					class="js_del no_extra" data-id="10001081"
					href="javascript:void(0);"><i class="icon18_common del_gray">删除</i></a>
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
