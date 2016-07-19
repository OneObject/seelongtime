<%@page import="com.longtime.app.config.Constants"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!-- 素材管理内容 start -->
<div class="portlet-body box">
	<c:if test="${empty list }">
		<div>没有找到相关的素材，你可以创建素材</div>
	</c:if>

	<c:if test="${not empty list }">
		<c:forEach items="${list }" var="info">
			<div class="clo-lg-4 ixin_item ">

				<div class="appmsg ">
					<div class="appmsg_content">
						<h4 class="appmsg_title">
							<a href="<%=Constants.STUDENT_WEB_ROOT %>m/ixin/fodder/detail.xhtml?id=${info.id }&fdomain=${info.domain}"
								target="other">${info.title }</a>
						</h4>
						<div class="appmsg_info">
							<em class="appmsg_date"> <d:formatDate
									currentTime="${info.modifyTime }" format="yyyy/MM/dd" />
							</em>
						</div>
						<div class="appmsg_thumb_wrp">
							<img src="${info.coverPath }" alt="" class="appmsg_thumb">
						</div>
						<p class="appmsg_desc">
							<c:if test="${not empty info.summary }">${ltfun:html2Text(info.summary, 20)}</c:if>
						</p>
						<p class="appmsg_readNum">
						阅读数：${info.visitnum }
						</p>

					</div>

					<div class="appmsg_opr">
						<ul>
						
							<ltacl:datactl creatoruid="${info.createUid }">
							<li class="appmsg_opr_item with3" title="编辑" ><a class="js_edit"
								href="javascript:void(0);"
								onclick="detail('${info.id}');"><i
									class="icon18_common edit_gray">编辑</i></a></li>
							</ltacl:datactl>	
							<li class="appmsg_opr_item with3 no_extra" title="生成二维码"><a 
								class="js_del no_extra" data-id="10001081"
								href="javascript:void(0);"
								onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT %>m/ixin/fodder/detail.xhtml?id=${info.id }&fdomain=${info.domain}')"><i
									class="fa fa-qrcode" style="color: #999; font-size: 20px;"></i></a>
							</li>
							<ltacl:datactl creatoruid="${info.createUid }">
							<li class="appmsg_opr_item with3 no_extra" title="删除"><a 
								class="js_del no_extra" data-id="10001081"
								href="javascript:void(0);" onclick="del('${info.id }')"><i
									class="icon18_common del_gray">删除</i></a></li>
							</ltacl:datactl>
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
