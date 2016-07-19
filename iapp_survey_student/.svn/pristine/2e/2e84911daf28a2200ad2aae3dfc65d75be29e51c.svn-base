<%@page import="com.longtime.ajy.model.User"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<%

User user = MwebHelper.getCurrentUser(request);
pageContext.setAttribute("user", user);
boolean isSuper = MwebHelper.isSuperMan(request);
pageContext.setAttribute("isSuper", isSuper);

%>


  <section class="wrapper-static margin-top-50  ${not empty rank ? 'margin-bottom-110':'' }" id="wrapper-static">
            <div class="new-rank-list">
            
            	<c:if test="${empty list    }">
					<div class="no-data-img"></div>
				</c:if>
			
                <ul>
                <c:forEach items="${list }" var="item" varStatus="i">
                <li <c:if test="${item.id eq rank.id }">class="me"</c:if>>
                        <label>${i.count }</label>
                        <div class="image"><img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></div>
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
                    
                    
                 
                </ul>

            </div>
        </section>
        
        <c:if test="${not empty rank }">
        <div class="fixed-my-rank">
            <div class="my-rank-header">
                <div class="image">
                    <img src="${basepath}/user/avatar/${rank.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" />
                </div>
                <div class="info-detail">
                    <div class="info-line-1">
                        <span class="name">
                            ${rank.name }
                        </span>
                        <span class="grade">
                            等级：<label>${rank.level }</label>
                        </span>
                        <div class="progress" id="progress-box">
                            <div class="percent" data-percent="${rank.percent }"></div>
                            <label>${rank.percent }%</label>
                        </div>
                    </div>
                    <div class="info-line-2">
	                    <c:choose><c:when test="${user.id eq rank.id }">我</c:when><c:otherwise>他</c:otherwise></c:choose>的当前排名是：第${ranktop }名
                    </div>
                </div>
            </div>
            <div class="my-rank-footer">
              <c:if test="${model eq 'coachtotal' or model eq 'ctotal' or model eq 'daren' }">财富值</c:if>
              <c:if test="${model eq 'smonthtotal' or model eq 'stotal' }">经验值</c:if>    
              <label>
              <c:if test="${model eq 'coachtotal' or model eq 'ctotal' or model eq 'daren'  }">${rank.credit }</c:if>
              <c:if test="${model eq 'smonthtotal' or model eq 'stotal' }">${rank.experience }</c:if>
              </label>
            </div>
        </div>
        </c:if>
