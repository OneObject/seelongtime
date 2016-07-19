<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<input type="hidden" id="pagenum1" value="${rs.pageable.totalPages }">
	<c:if test="${rs.pageable.total == 0 }">
			<article class="scroll">
			    <section class="noData">
			        <img src="${basepath }/static/img/noData.png" />
			    </section>
		    </article>
	</c:if>
	<c:forEach  var="item" items="${rs.data}">
		<a onclick="linkdetail('${item.id}');">
        	<div>
        	<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.coverPath}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'">
        	</div>
            <ul class="newsWidth">
                <li class="ttl">${item.title }</li>
                <li class="date">${ltfun:dateLongToStringFormat(item.createtime,'yyyy-MM-dd HH:mm') }</li>
            </ul>
        </a>
      
  </c:forEach>
  
  <script type="text/javascript">
  $(function(){
		var w=$(window).width()-104;
		var orientationEvent;
		var supportsOrientationChange = "onorientationchange" in window;
				
		$("section.learnOnline ul.newsWidth").width(w);
						  
		orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
		window.addEventListener(orientationEvent, function() {
		    var w=$(window).width()-104;
			$("section.learnOnline ul.newsWidth").width(w);			
		}, false); 

		});


  </script>
   