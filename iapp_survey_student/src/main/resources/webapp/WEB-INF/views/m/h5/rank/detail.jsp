<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.common.utils.HtmlUtils"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
String currentUid = MwebHelper.getCurrentUid();
pageContext.setAttribute("currentUid", currentUid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="${basepath}/static/css/rank.css?v=1" />
<title>排行详情</title>
</head>
<body>
 <section class="banner">
 		<c:if test="${empty rank.cover }">
 		<img src="${basepath}/static/m/img/rank_banner.png" />
 		</c:if>
        <c:if test="${not empty rank.cover }">
 		<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${rank.cover}-320x120" />
 		</c:if>
        <div class="rank-info"  id="rank-info">
            <dl>
                <dt>${rank.title }</dt>
                <c:if test="${not empty realtime }">
                <dd>数据截止自 ${ltfun:dateLongToStringFormat(realtime,'yyyy-MM-dd HH:mm') }</dd>
                </c:if>
            </dl>
        </div>
    </section>
    <section class="rank">
    	<c:if test="${not empty rank.remark }">
        <div class="rank-intro">
            <dl>
                <dt>说明</dt>
                <dd>${rank.remark}</dd>
            </dl>
        </div>
        </c:if>
        <div class="rank-list">
        <c:if test="${ empty rank.itemList }">
        	<img style="margin: 40px auto 0 auto;display:block;width:100px;" src="${basepath}/static/m/img/wsj.png" />
        
        </c:if>
        <c:if test="${not empty rank.itemList }">
            <ul>
            
            <c:forEach var="item" items="${rank.itemList }" varStatus="index">
            	<li <c:if test="${rank.model==1 and currentUid==item.img}">class="me"</c:if> >
                    <label>${index.count }</label>
                    <c:choose>
                    	 <c:when test="${empty item.img}">
      						<a href="#">${item.title }</a>
      					 </c:when>
      					 <c:otherwise>
      					 	 <div class="con-tel" style="height:auto; line-height:20px;">
      					 	 <%--积分 显示用户图片 --%>
      					 	 <c:if test="${rank.model==1}"><img src="${basepath}/user/avatar/${item.img}.xhtml?style=80x80&color=gray" /></c:if>
      					 	 <%--非积分 显示七牛图片 --%>
      					 	 <c:if test="${rank.model!=1}"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.img}-80x80" /></c:if>
      					 	 <c:if test="${showphone eq 1 }">
      					 	 <p>${item.title }</p>
      					 	 <p class="tel" style="font-size:12px;">${item.phone }</p>
      					 	 </c:if>
      					 	 <c:if test="${showphone ne 1 }">
      					 	 ${item.title }
      					 	 </c:if>
      					 	 <ul>
      					 	 <li></li>
      					 	 <li>  </li>
      					 	 </ul>
      					 	
      					 	 </div>
      					 </c:otherwise>
                    </c:choose>
                    <span>${item.remark }</span>
                </li>
                
            </c:forEach>
            
                
            </ul>
       </c:if>
        </div>
    </section>
    <script type="text/javascript">
    	$(function (){
    		if($('.tel').text() == ''){
    			$('.con-tel').css({
    				height:34,
    				lineHeight:34 + 'px'
    			})
    		} else {
    			$('.con-tel').css({
    				height:'auto',
    				lineHeight:20 + 'px'
    			})
    		}
    	})
    </script>
    <script type="text/javascript">
        window.addEventListener('load', onLoaded, false);
        function onLoaded(e) {
            var onScroll;
            var rankInfo = document.getElementById('rank-info');
            var offsetTopTemp = rankInfo.offsetTop;
            onScroll = function () {
                var rankInfoTemp = rankInfo;
                if (document.body.scrollTop >= offsetTopTemp) {
                    rankInfoTemp.style.position = 'fixed';
                    rankInfoTemp.style.background = '#fff';
                    rankInfoTemp.style.bottom = '';
                    rankInfoTemp.style.top = '0px';
                    rankInfoTemp.style.left = '0px';
                } else {
                    rankInfoTemp.style.position = 'absolute';
                    rankInfoTemp.style.background = 'rgba(255,255,255,0.5)';
                    rankInfoTemp.style.top = '';
                    rankInfoTemp.style.bottom = '0px';
                    rankInfoTemp.style.left = '0px';
                }
            };
            window.addEventListener('scroll', onScroll, false);
//            setInterval(onScroll, 20);
        }
    </script>
</body>
</html>