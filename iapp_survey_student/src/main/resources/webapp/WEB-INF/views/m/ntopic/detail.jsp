<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
 <!--详情页面-->
      <c:if test="${empty topicvo}">
      <div  id="nothing">
           <h1 class="nothing" >话题信息不存在</h1>
       </div>
      </c:if>
     <c:if test="${not empty topicvo}">
    		 <div>
                <div class = "tpoicitem">
                    <div class="topic-item-top">
                        <img src="${basepath}/user/avatar/${topicvo.topic.uid}.xhtml?style=80x80&color=blue&r=<%=System.currentTimeMillis()%>">
                        <div class="topic-item-top-right">
                            <h2>${topicvo.topic.uname}</h2>
                            <span>${ltfun:dataLongToSNS(topicvo.topic.createtime,"MM-dd HH:mm")}</span>
                        </div>
                    </div>
                    <p class="topic-content">
                       ${topicvo.topic.content}
                    </p>
					<p>
						<c:if test="${not empty topicvo.topicCovers}">
							<c:forEach var="cover" items="${topicvo.topicCovers}">
								<img style="width:80px;height:80px; margin-right:10px;"src="<%=Constant.IMG_SERVER_DOWNLOAD%>${cover}-80x80" data-src="<%=Constant.IMG_SERVER_DOWNLOAD%>${cover}" data-gid="d_g_${topicvo.topic.id }" onload="preViewImg(this, event);">
							</c:forEach>
						</c:if>
					</p>                    
					<p style="padding-top: 5px">
						<c:if test="${not empty topicvo.topicCovers}">
							 <c:if test="${not empty topicvo.topic.audiourl}">
					<audio controls="controls">
						<source src="<%=Constant.IMG_SERVER_DOWNLOAD%>/${topicvo.topic.audiourl }" type="audio/mp3" />
						 您的浏览器不支持audio标签，请升级
					</audio>
				</c:if>
						</c:if>
					</p>                    
                   	<c:set var="zanNum" value="${ajy:praiseTotal(topicvo.topic.id,2)}"/>
					<c:if test="${zanNum<1 }">
						<c:set var="zanstatus" value="1"/>
					</c:if>
					<c:if test="${zanNum>0 }">
						<c:set var="zanstatus" value="${ajy:zanStatus(topicvo.topic.id,2,uid)}"/>
					</c:if>
                    <span class="topic-control">
                    <label id="detail_zan_${topicvo.topic.id}"  call-back="<c:if test='${zanstatus eq 1 }'>dianzan(this)</c:if><c:if test='${zanstatus eq 0}'>removezan(this)</c:if>" data-topicid="${topicvo.topic.id}" data-zannum="${zanNum}" >
                    <i id="detail_zan_icon_${topicvo.topic.id}"   class="fa <c:if test='${zanstatus eq 1}'>fa-thumbs-o-up</c:if><c:if test='${zanstatus eq 0}'>fa-thumbs-up</c:if>"></i>
                    <em id="detail_zan_lb_${topicvo.topic.id}"><c:if test="${zanNum>0}">${zanNum}</c:if><c:if test="${zanNum<=0}">赞 </c:if></em>
                    </label>&nbsp;&nbsp;
                    <label call-back="openreplay(this)" c="${topicvo.topic.id}" ><i class="fa fa-comment-o"></i>
                    <em id="lb_commentnum_${topicvo.topic.id }" data-num="${topicvo.commentSet.pageable.total}"><c:if test="${empty topicvo.commentSet.pageable.total}" >评</c:if> <c:if test="${not empty topicvo.commentSet.pageable.total}" >${topicvo.commentSet.pageable.total }</c:if></em></label>
                    </span>
                </div>
                <div class="top-replay-list-detail">
                    <ul id="detail_comment_${topicvo.topic.id}">
                     <c:if test="${empty topicvo.commentSet.data}">
                     <div  id="nothing_${topicvo.topic.id}">
                         <h1 class="nothing" >没有评论信息，快去添加一条吧</h1>
                     </div>
                     </c:if>
                    <c:forEach var="comment" items="${topicvo.commentSet.data }">
                      <c:if test="${comment.shield==0 }"> 
                        <li>
                            <div class="replay-detail-item">
                                <img src="${basepath}/user/avatar/${comment.uid}.xhtml?style=80x80&color=blue&r=<%=System.currentTimeMillis()%>">
                                <div class="replay-detail-item-right">
                                    <h2>${comment.uname}</h2>
                                    <span>${ltfun:dataLongToSNS(comment.createtime,"MM-dd HH:mm")}</span>
                                </div>
                                <p>
                                ${comment.body}
                                </p>
                            </div>
                        </li>
                      </c:if> 
                  </c:forEach>
                    </ul>
                </div>
                </div>
            </c:if>
            
<script type="text/javascript">
	  $("label").unbind("tap");
	  $("label").tap(function(){
		  var callback = $(this).attr("call-back");
		  if(callback){
	        	eval(callback);	
	        }
		});  		
</script>
            
            