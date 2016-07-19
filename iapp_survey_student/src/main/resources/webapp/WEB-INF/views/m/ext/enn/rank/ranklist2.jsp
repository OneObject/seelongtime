<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@page import="com.longtime.ajy.model.User"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<%
User user = MwebHelper.getCurrentUser(request);
pageContext.setAttribute("user", user);
boolean isSuper = MwebHelper.isSuperMan(request);
pageContext.setAttribute("isSuper", isSuper);

%>

<c:if test="${empty list    }">
	<div class="no-data-img"></div>
</c:if>

<ul>
                
<c:forEach items="${list }" var="item" varStatus="i" >
                
                    <li <c:if test="${not isSuper }"><c:if test="${item.id eq user.oid }">class="me"</c:if></c:if> >
                        <label>${i.count }</label>
                        <div class="product-box">
                            ${not empty item.acronym ? item.acronym : item.name }
                        </div>
                        <div class="num-box">
                            <span>
              <c:if test="${model eq 'cfirst' }">指导人总数</c:if>              
              <c:if test="${model eq 'sfirst' }">学员总数</c:if>              
                            </span>
                            <span>${item.total }</span>
                        </div>
                        <div class="score-box">
                         <c:if test="${model eq 'cfirst' }">
                            <span>平均财富值</span>
                            <span>${item.avgcredit }</span>
                         </c:if>
                         <c:if test="${model eq 'sfirst' }">
                            <span>平均经验值</span>
                            <span>${item.avgexperience }</span>
                         </c:if>
                        </div>
                        
                        <c:if test="${not isSuper }">
                        <c:if test="${not empty ranklist and user.oid eq item.id }">
                        <c:forEach items="${ranklist }" var="it" varStatus="n" >
                        <div class="people-box">
                        	<c:if test="${n.count eq 1 }"><label class="arrow"></label></c:if>
                            <div class="people-line <c:if test="${n.count eq 1 }">people-line-1</c:if>">
                                <div class="line-image">
                                   <img src="${basepath}/user/avatar/${it.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" />
                                </div>
                                <div class="line-name">
                                    ${it.name }
                                </div>
                                <div class="line-score <c:if test="${model eq 'cfirst' }"><c:if test="${it.credit lt item.avgcredit }">down</c:if></c:if>
                                <c:if test="${model eq 'sfirst' }"><c:if test="${it.experience lt item.avgexperience }">down</c:if></c:if>">
                                    <c:if test="${model eq 'cfirst' }">${it.credit }</c:if>
                                	<c:if test="${model eq 'sfirst' }">${it.experience }</c:if>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        </c:if>
                        </c:if>
                        
                        
                        
                    </li>
            </c:forEach>                    
</ul>