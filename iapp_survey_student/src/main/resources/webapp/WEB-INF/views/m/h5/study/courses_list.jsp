<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
		<c:if test="${rs.pageable.total == 0 }">
			<article class="scroll">
			    <section class="noData">
			        <img src="${basepath }/static/img/noData.png" />
			    </section>
		    </article>
		</c:if>
 		<c:forEach  var="item" items="${rs.data}">
 		  <a id="${item.id}" href="javascript:toDetail('${item.id}');" class="flag">
                    <div class="block-course">
                        <span class="image">
                       	        		 <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'">

                        </span>
                        <ul>
                            <li>${item.name }</li>
                            <li>
                            <c:if test="${ not empty item.length }">
	                        <fmt:formatNumber value="${item.length}" pattern="#.#" type="number"/>分钟
	                    	</c:if>
	                    	<study:studyInfo var="entity"   rid="${item.id}"  uid="<%=MwebHelper.getCurrentUid() %>"  hasexam="${not empty item.tid }"/>
                            <span>
                            			${entity.finalStatus}
                            </span>
                            
                            </li>
                            
                            <li>发布时间：${ltfun:dateLongToStringFormat(item.releasetime,'yyyy-MM-dd') }  <span><i class="fa fa-thumbs-up"></i>${ajy:praiseTotal(item.id,1)}</span></li>
                        </ul>
                    </div>
           </a>
 			<%--
 			<a id="${item.id}" href="javascript:toDetail('${item.id}');" class="flag">
	        	<div>
	        		 <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'">
	        	</div>
	            <ul class="changeW">
	                <li class="ttl">${item.name }</li>
	                <li class="date">发布时间：${ltfun:dateLongToStringFormat(item.releasetime,'yyyy-MM-dd HH-mm') }   </li>
	            </ul>
	            <div class="prompt">
	            	<c:if test="${item.restype == 1 }">
	            		scorm<i class="fa fa-tablet"></i>
	            	</c:if>
	            	<c:if test="${item.restype == 2 }">
	            		微课<i class="fa fa-file-archive-o"></i>
	            	</c:if>
	            	<c:if test="${item.restype == 3 }">
	            		视频<i class="fa fa-file-video-o"></i>
	            	</c:if>
	            	<c:if test="${item.restype == 4 }">
	            		文档<i class="fa fa-file-text-o"></i>
	            	</c:if>
	            	<c:if test="${item.restype == 5 }">
	            		素材<i class="fa fa-folder-o"></i>
	            	</c:if>
	            </div>
	        </a>
	        --%>
         </c:forEach>
         
         <script type="text/javascript">
         
         
			$(function(){	
				
				var w=$(window).width()-154;
				$("ul.changeW").width(w);
				
				var orientationEvent;				
				var supportsOrientationChange = "onorientationchange" in window;				  
				orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
				window.addEventListener(orientationEvent, function() {
					var w=$(window).width()-154;
					$("ul.changeW").width(w);
					 
				}, false); 
				
				
				
			});         
         
         </script>