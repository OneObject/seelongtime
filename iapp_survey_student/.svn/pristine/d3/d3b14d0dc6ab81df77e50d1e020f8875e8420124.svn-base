<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>


<c:if test="${rs.pageable.totalPages eq 0 }">
	<div class="holder-no-data-text">
		暂无数据!
	</div>
</c:if>

<c:forEach var="answer" items="${rs.data }" >
	
	<a href="${basepath }/m/h5/nask/answerdetail.xhtml?id=${answer.id}">
           <ul class="block-answer">
               <li>
                   <label class="image">
                   <c:choose>
							<c:when test="${answer.anonymous eq 0}">
							
								<img src="${basepath}/user/avatar/${answer.author_id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>"  />
							
							</c:when>
							
							<c:otherwise>
							
								<img src="${basepath}/static/m_h5/nask/img/niming.png" />
							
							</c:otherwise>
						
						</c:choose>
                   
                   </label>
                   <div class="from">
                       <label class="set-color">${answer.anonymous eq 0 ? answer.author_name :'匿名' }</label>的回答
                       <c:if test="${answer.is_best_answer==1 }"><i class="fa fa-star star"></i></c:if>
                   </div>

                   <span class="date">${ltfun:dateLongToStringFormat(answer.dateCreated,'yyyy-MM-dd HH:mm')}</span>
               </li>
               <li>
                   <label class="star set-bg-color">${ajy:praiseTotal(answer.id,3)}</label>
                   <div class="intro">${answer.content }</div>
                
               </li>
           </ul>
	</a>


</c:forEach>


<script type="text/javascript">
var total = parseInt('${rs.pageable.totalPages}');
var current = parseInt('${rs.pageable.pageNumber}');
</script>