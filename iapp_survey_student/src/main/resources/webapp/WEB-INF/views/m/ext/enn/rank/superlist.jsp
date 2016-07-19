<%@page import="com.longtime.ajy.model.User"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

            	<c:if test="${empty rs.data}">
					<div class="no-data-img margin-top-100" ></div>
				</c:if>
			
                <c:forEach items="${rs.data }" var="item" varStatus="i">
                <li <c:if test="${item.id eq rank.id }">class="me"</c:if>>
                        <label  <c:if test="${i.count + rs.pageable.offset gt 99 }"> style="width:30px;"</c:if> >${i.count + rs.pageable.offset }</label>
                        <div class="image" onclick="toUserDetail('${item.id}');"><img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></div>
                        <div class="name-box">
                            <span>${item.name }</span>
                            <span>${item.level }</span>
                        </div>
                       <div class="section-box">
                       ${not empty item.acronym ? item.acronym : item.orgname }
                        </div>
                        <div class="score-box">
                            <span>
              <c:if test="${model eq 'coachtotal' or model eq  'ctotal' or model eq  'daren' }">财富值</c:if>
              <c:if test="${model eq 'smonthtotal' or model eq  'stotal' }">经验值</c:if>      
                            </span>
                            <span>
              <c:if test="${model eq 'coachtotal' or model eq  'ctotal' or model eq  'daren'  }">${item.credit }</c:if>
              <c:if test="${model eq 'smonthtotal' or model eq 'stotal' }">${item.experience }</c:if>   
                            </span>
                        </div>
                    </li>
                    </c:forEach>
                    
                    
                 
       

<script type="text/javascript">
	var total = parseInt('${rs.pageable.totalPages}');
	var current = parseInt('${rs.pageable.pageNumber}');
</script>