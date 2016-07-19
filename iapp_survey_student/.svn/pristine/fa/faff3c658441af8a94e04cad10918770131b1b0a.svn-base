<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>



<c:if test="${rs.pageable.totalPages eq 0 or empty rs }">
	<div class="holder-no-data">
		<img src="${basepath}/static/m_h5/nask/img/no_data.png" />
	</div>
</c:if>

<c:forEach var="entity" items="${rs.data }">
	   <a href="${basepath}/m/h5/nask/detail.xhtml?id=${entity.id }">
                    <ul class="block-wait-me-answer">
                        <li>
                            <label class="image">
                            
                            <img src="${basepath}/user/avatar/${item.author_id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" />
                            
                            </label>
                            <div class="from">
                                <label class="set-color">${entity.uname }</label>邀请您回答
                            </div>
                            <span class="date">${entity.userCreated }</span>
                        </li>
                        <li> ${entity.title }</li>
                    </ul>
        </a>

</c:forEach>
<script type="text/javascript">
var total = parseInt('${rs.pageable.totalPages}');
var current = parseInt('${rs.pageable.pageNumber}');
</script>
