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
                    <dl class="block-at-me">
                        <dt>
                        
                        ${entity.title } <c:if test="${entity.credit ne 0 }">
							<label class="coin">${entity.credit }分</label>
						</c:if>
                        
                        </dt>
                        <dd>
                            <div class="info-show">
                                <span><i class="fa fa-comment"></i>${entity.answer_num }</span>
                            </div>
                            <label>${entity.userCreated }</label>
                        </dd>
                        <dd class="dd-at-me">
                           	${entity.supplement }
                        </dd>
                    </dl>
        </a>

</c:forEach>
<script type="text/javascript">
var total = parseInt('${rs.pageable.totalPages}');
var current = parseInt('${rs.pageable.pageNumber}');
</script>
