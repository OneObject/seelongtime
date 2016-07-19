<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<script type="text/javascript">
	var total = parseInt('${rs.pageable.totalPages}');
	var current = parseInt('${rs.pageable.pageNumber}');
</script>
<c:forEach var="item" items="${rs.data }">
 	<sns:imTimeLine timestamp="${item.createtime  }">
							<div class="system-info">${ltfun:dateLongToStringFormat(item.createtime,'yyyy-MM-dd')}</div>
	</sns:imTimeLine>
			<c:choose>
			<c:when test="${item.uid ne uid }">
            <div class="other">
                <div class="chat-box">
                  <c:choose>
                	<c:when test="${item.model eq 'text' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="name">${item.uname }</div>
                     	<div class="content-line-1"><c:out value="${item.content}"/></div>
                    	<label class="arrow"></label>
                	</c:when>
                	<c:when test="${item.model eq 'fudao' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="name">${item.uname }</div>
                    	<div class="content-line-3">
                        	<div><c:out value="${item.title }"/></div>
                        	<div><c:out value="${item.content }"/></div>
                        	<div><a href="${basepath }/m/ext/enn/coach/guidancedetail.xhtml${item.url}">点击查看</a> </div>
                    	</div>
                    	<label class="arrow"></label>
                	</c:when>
                	<c:when test="${item.model eq 'practice' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                   		<div class="name">${item.uname }</div>
                    	<div class="content-line-3">
                      		<div>提交了今日的实习记录</div>
                        	<div>我刚刚提交了一份实习记录，感谢老师今天的帮助。谢谢</div>
                       		<div><a href="${basepath }/m/ext/enn/coach/practicedetail.xhtml${item.url}">点击查看</a></div>
                    	</div>
                    	<label class="arrow"></label>
                	</c:when>
                		<c:when test="${item.model eq 'feedback' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                   		<div class="name">${item.uname }</div>
                    	<div class="content-line-1">
                        	<ul>
                            	<li><c:out value="${item.content }"/></li>
                            	<li><a href="${basepath }/m/ext/enn/coach/practicedetail.xhtml${item.url}">点击查看</a> </li>
                        	</ul>
                    	</div>
                    	<label class="arrow"></label>
                	</c:when>
                	<c:when test="${item.model eq 'question' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="name">${item.uname }</div>
                    	<div class="content-line-3">
                           	<div>提问了一个问题</div>
                       		<div>我提问了一个问题，期待解答。谢谢</div>
                           	<div><a href="${basepath }/m/ext/enn/ask/detail.xhtml${item.url}">点击查看</a></div>
                    	</div>
                    	<label class="arrow"></label>
                	</c:when>
                	<c:when test="${item.model eq 'studentsurvey' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="name">${item.uname }</div>
                    	<div class="content-line-3">
                        	<div><c:out value="${item.title }"/></div>
                        	<div><c:out value="${item.content }"/></div>
                        	<div><a href="${basepath }/m/ext/enn/coach/surveydetail.xhtml${item.url}">点击查看</a> </div>
                    	</div>
                    	<label class="arrow"></label>
                	</c:when>
                	<c:when test="${item.model eq 'coach_plan' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="name">${item.uname }</div>
                    	<div class="content-line-3">
                        	<div><c:out value="${item.title }"/></div>
                        	<div><c:out value="${item.content }"/></div>
                        	<div><a href="${basepath }/m/ext/enn/coach/plandetail.xhtml${item.url}">点击查看</a> </div>
                    	</div>
                    	<label class="arrow"></label>
                	</c:when>
                </c:choose>
                </div>
            </div>
			</c:when>
			<c:otherwise>
            <div class="me">
                <div class="chat-box">
                <c:choose>
                	<c:when test="${item.model eq 'text' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="content-line-1">
                    	<c:out value="${item.content}"/>
                    	</div>
                    	<label class="arrow"></label>
                	</c:when>
                	<c:when test="${item.model eq 'fudao' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="content-line-3">
                        	<div><c:out value="${item.title}"/></div>
                        	<div><c:out value="${item.content}"/></div>
                        	<div><a href="${basepath }/m/ext/enn/coach/guidancedetail.xhtml${item.url}">点击查看</a> </div>
                    	</div>
                    	<label class="arrow set-bg-color"></label>
                	</c:when>
                	<c:when test="${item.model eq 'practice' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="content-line-3">
                      		<div>提交了今日的实习记录</div>
                        	<div>我刚刚提交了一份实习记录，感谢老师今天的帮助。谢谢</div>
                       		<div><a href="${basepath }/m/ext/enn/coach/practicedetail.xhtml${item.url}">点击查看</a> </div>
                    	</div>
                    	<label class="arrow"></label>
                	</c:when>
                	<c:when test="${item.model eq 'feedback' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="content-line-1">
                        	<ul>
                            	<li><c:out value="${item.content }"/></li>
                            	<li><a href="${basepath }/m/ext/enn/coach/practicedetail.xhtml${item.url}">点击查看</a> </li>
                        	</ul>
                    	</div>
                    	<label class="arrow"></label>
                	</c:when>
                	<c:when test="${item.model eq 'question' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="content-line-3">
                        	<ul>
                            	<div>提问了一个问题</div>
                        		<div>我提问了一个问题，期待解答。谢谢</div>
                            	<div><a href="${basepath }/m/ext/enn/ask/detail.xhtml${item.url}">点击查看</a></div>
                        	</ul>
                    	</div>
                    	<label class="arrow"></label>
                	</c:when>
                	<c:when test="${item.model eq 'studentsurvey' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="content-line-3">
                        	<div><c:out value="${item.title}"/></div>
                        	<div><c:out value="${item.content}"/></div>
                        	<div><a href="${basepath }/m/ext/enn/coach/surveydetail.xhtml${item.url}">点击查看</a> </div>
                    	</div>
                    	<label class="arrow set-bg-color"></label>
                	</c:when>
                	<c:when test="${item.model eq 'coach_plan' }">
                    	<span class="image"><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<div class="content-line-3">
                        	<div><c:out value="${item.title}"/></div>
                        	<div><c:out value="${item.content}"/></div>
                        	<div><a href="${basepath }/m/ext/enn/coach/plandetail.xhtml${item.url}">点击查看</a> </div>
                    	</div>
                    	<label class="arrow set-bg-color"></label>
                	</c:when>
                </c:choose>
                </div>
            </div>
			</c:otherwise>
			</c:choose>
</c:forEach>




