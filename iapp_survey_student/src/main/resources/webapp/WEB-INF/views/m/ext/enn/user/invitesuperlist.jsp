<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>

        <c:if test="${empty rs or empty rs.data}">
			<ul class="no-invited">
                <li></li>
                <li>您还没有邀请任何专业达人进入iCoach，</li>
               <li>快点击下面的[邀请专业达人]进行邀请吧！</li>
			   <li></li>
               </ul>
     
		</c:if>

    <c:if test="${not empty rs.data }"> 
      
	  <c:forEach var="item" items="${rs.data }">
	  <ul>
                    <li>
                        <div class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></div>
                        <div class="name-box">
                           ${item.uname}
                        </div>
                        <div class="new-score-num">
                            ${item.username}
                        </div>
                        <div class="score-box score-box-2">
                            <span>经验值</span>
                            <span>+${item.experience}</span>
                        </div>
                        <div class="score-box">
                            <span>财富值</span>
                            <span>+${item.credit}</span>
                        </div>
                    </li>
					</ul>
                    </c:forEach>
                
			</c:if>
 <script type="text/javascript">
 var invitetotal = parseInt('${rs.pageable.totalPages}');
	var invitecurrent = parseInt('${rs.pageable.pageNumber}');
</script>