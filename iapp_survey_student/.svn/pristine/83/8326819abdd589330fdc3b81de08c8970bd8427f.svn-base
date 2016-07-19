<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<c:forEach var="topicvo" items="${list}" varStatus="vs">
	<li class="topic-item">
		<div class="tpoicitem">
			<a href="#topic-detail" data-target="article"
				call-back="showDetail('${topicvo.topic.id }')"> <%-- 
		<a href="${basepath}/m/ixin/ntopic/detail.list?activityid=${activityid}&topicid=${topicvo.topic.id }&ltdebug=${ltdebug}" >--%>
				<div class="topic-item-top">
					<img
						src="${basepath}/user/avatar/${topicvo.topic.uid}.xhtml?style=80x80&color=blue&r=<%=System.currentTimeMillis()%>">
					<div class="topic-item-top-right">
						<h2>${topicvo.topic.uname}</h2>
						<span>${ltfun:dataLongToSNS(topicvo.topic.createtime,"MM-dd
							HH:mm")}</span>

						<!-- 推荐 -->
						<c:if test="${topicvo.topic.recommend eq 1 }">
							<img src="${basepath}/static/m/new/img/jian.png"
								class="tuijian <c:if test='${topicvo.topic.top==-200}'>two</c:if>">
						</c:if>
						<c:if test="${topicvo.topic.top==-200}">
							<img src="${basepath}/static/m/new/img/ding.png" class="zhiding">
						</c:if>
					</div>
				</div>
				<p class="topic-content">${topicvo.topic.content}</p>
			</a>
			<p>
				<c:if test="${not empty topicvo.topicCovers}">
					<c:forEach var="cover" items="${topicvo.topicCovers}">
						<c:if test="${not empty cover }">
							<img style="width: 80px; height: 80px; margin-right: 10px;"
								src="<%=Constant.IMG_SERVER_DOWNLOAD%>${cover}-80x80"
								data-src="<%=Constant.IMG_SERVER_DOWNLOAD%>${cover}"
								data-gid="g_${topicvo.topic.id }"
								onload="preViewImg(this, event);">
						</c:if>
					</c:forEach>
				</c:if>
			</p>
			<p style="padding-top: 5px">
				<c:if test="${not empty topicvo.topic.audiourl}">
					<audio controls="controls">
						<source
							src="<%=Constant.IMG_SERVER_DOWNLOAD%>/${topicvo.topic.audiourl }" type="audio/mp3" ></source>
							 您的浏览器不支持audio标签，请升级
					</audio>
				</c:if>
			</p>
			<c:set var="zanNum" value="${ajy:praiseTotal(topicvo.topic.id,2)}" />
			<c:if test="${zanNum<1 }">
				<c:set var="zanstatus" value="1" />
			</c:if>
			<c:if test="${zanNum>0 }">
				<c:set var="zanstatus"
					value="${ajy:zanStatus(topicvo.topic.id,2,uid)}" />
			</c:if>
			<span class="topic-control"> <label
				id="list_zan_${topicvo.topic.id}"
				call-back="<c:if test='${zanstatus eq 1 }'>dianzan(this)</c:if><c:if test='${zanstatus eq 0}'>removezan(this)</c:if>"
				data-topicid="${topicvo.topic.id}" data-zannum="${zanNum}">
					<i id="list_zan_icon_${topicvo.topic.id}"
					class="fa <c:if test='${zanstatus eq 1}'>fa-thumbs-o-up</c:if><c:if test='${zanstatus eq 0}'>fa-thumbs-up</c:if>"></i>
					<em id="list_zan_lb_${topicvo.topic.id}"><c:if
							test="${zanNum>0}">${zanNum}</c:if>
						<c:if test="${zanNum<=0}">赞 </c:if></em>
			</label>&nbsp;&nbsp; <label call-back="openreplay(this)"
				c="${topicvo.topic.id}"><i class="fa fa-comment-o"></i> <em
					id="list_lb_commentnum_${topicvo.topic.id }"
					data-num="${topicvo.commentSet.pageable.total}"><c:if
							test="${empty topicvo.commentSet.pageable.total}">评</c:if> <c:if
							test="${not empty topicvo.commentSet.pageable.total}">${topicvo.commentSet.pageable.total }</c:if></em>
			</label>
			</span>

		</div> <a href="#topic-detail" data-target="article"
		call-back="showDetail('${topicvo.topic.id }')"
		id="p_comment_${topicvo.topic.id}"
		<c:if  test ="${ empty topicvo.commentSet.data }">style="display:none"</c:if>>
			<%-- 
		<a href="${basepath}/m/ixin/ntopic/detail.list?activityid=${activityid}&topicid=${topicvo.topic.id }&ltdebug=${ltdebug}"  id="p_comment_${topicvo.topic.id}" 	<c:if  test ="${ empty topicvo.commentSet.data }">style="display:none"</c:if> >
		--%>
			<div class="top-replay-list">
				<ul id="comment_${topicvo.topic.id}">
					<c:forEach var="comment" items="${topicvo.commentSet.data}">
						<li><span class="replay-container">${comment.uname}:
								${comment.body}</span> <span class="replay-time">${ltfun:dataLongToSNS(comment.createtime,"MM-dd
								HH:mm")}</span></li>
					</c:forEach>
					<c:if test="${topicvo.commentSet.pageable.total >4 }">
						<li><span class="more-replay">查看更多(${topicvo.commentSet.pageable.total})</span></li>
					</c:if>
				</ul>
			</div>
	</a>

	</li>
	<c:if test="${vs.last}">
		<script>
				setLastTimestamp(${topicvo.topic.createtime});
			</script>
	</c:if>
</c:forEach>
<script type="text/javascript">
	  $("label").unbind("tap");
	  $("label").tap(function(){
		  var callback = $(this).attr("call-back");
		  if(callback){
	        	eval(callback);	
	        }
		});  		
 	</script>
