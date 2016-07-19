<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@page import="com.longtime.ajy.model.User"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>


<c:if test="${empty list    }">
	<ul class="no-answer-img-ul" style="padding-top:50px;">
        <li>敬请期待</li>
        <li></li>
    </ul>
</c:if>

<ul>
                
<c:forEach items="${list }" var="item" varStatus="i" >
                
                    <li  class="<c:if test="${not empty ranklist }">
	                        <c:forEach items="${ranklist }" var="it" varStatus="n" >
	                        	<c:if test="${it.classid eq item.classid }">
	                        	me
	                        	</c:if>
	                        </c:forEach>
                        </c:if>">
                        <label>${i.count }</label>
                        <div class="product-box">
                            ${item.classname }
                        </div>
                        <div class="num-box">
                            <span>学员总数</span>
                            <span>${item.total }</span>
                        </div>
                        <div class="score-box">
                            <span>平均经验值</span>
                            <span>${item.experience }</span>
                        </div>
                        
                        <c:if test="${not empty ranklist }">
	                        <c:forEach items="${ranklist }" var="it" varStatus="n" >
	                        	<c:if test="${it.classid eq item.classid }">
		                        <div class="people-box">
		                        	<c:if test="${n.count eq 1 }"><label class="arrow"></label></c:if>
		                            <div class="people-line <c:if test="${n.count eq 1 }">people-line-1</c:if>">
		                                <div class="line-image">
		                                   <img src="${basepath}/user/avatar/${it.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" />
		                                </div>
		                                <div class="line-name">
		                                    ${it.name }
		                                </div>
		                                <div class="line-score <c:if test="${it.experience lt item.experience }">down</c:if>">
		                                    ${it.experience }
		                                </div>
		                            </div>
		                        </div>
		                        </c:if>
	                        </c:forEach>
                        </c:if>
                        
                        
                        
                    </li>
            </c:forEach>                    
</ul>