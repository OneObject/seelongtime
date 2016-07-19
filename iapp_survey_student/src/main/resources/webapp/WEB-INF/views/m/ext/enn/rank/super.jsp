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

<!DOCTYPE html>
<html>
	<head>
		<title>
			<c:if test="${model eq 'ctotal' }">产业内指导人财富榜</c:if>
          	<c:if test="${model eq 'coachtotal' }">指导人财富总榜</c:if>
          	<c:if test="${model eq 'smonthtotal' }">学员经验排行月榜</c:if>
          	<c:if test="${model eq 'stotal' }">学员经验排行总榜</c:if>
          	<c:if test="${model eq 'daren' }">达人财富总榜</c:if>
		</title>
		<style type="text/css">
			body {
				background: #eee;
			}
		</style>
	</head>
	<body class="bg-color-gray">
        <header id="header">
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
	            <c:if test="${model eq 'ctotal' }">产业内指导人财富榜</c:if>
	          	<c:if test="${model eq 'coachtotal' }">指导人财富总榜</c:if>
	          	<c:if test="${model eq 'smonthtotal' }">学员经验排行月榜</c:if>
	          	<c:if test="${model eq 'stotal' }">学员经验排行总榜</c:if>
	          	<c:if test="${model eq 'daren' }">达人财富总榜</c:if>
            </div>
        </header>
            <section class="wrapper-static margin-top-50  ${not empty rank ? 'margin-bottom-110':'' }" id="wrapper-static">
            	<div class="new-rank-list">
            		<ul id="super-rank"></ul>
                	<div class="loading"></div>
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
              <c:if test="${model eq 'coachtotal' or model eq  'ctotal' or model eq  'daren' }">财富值</c:if><c:if test="${model eq 'smonthtotal' or model eq  'stotal' }">经验值</c:if>     
              <label>
               <c:if test="${model eq 'coachtotal' or model eq  'ctotal' or model eq  'daren'  }">${rank.credit }</c:if>
              <c:if test="${model eq 'smonthtotal' or model eq 'stotal' }">${rank.experience }</c:if>   
              </label>
            </div>
        </div>
        </c:if>
        
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
        	var page = 1;
            $(function () {
	                var $btnBack = $('#btn-back');
	                var $tempPercent = $('#progress-box .percent');
	                var tempPercentWidth;
	                tempPercentWidth = $tempPercent.data('percent');
	                +(function ($tempPercent, tempPercentWidth) {
	                    setTimeout(function () {
	                        $tempPercent.css('width', tempPercentWidth + '%');
	                    }, 300);
	                }($tempPercent, tempPercentWidth));
	                
	                $btnBack.bind('click', function () {
	                    window.history.go(-1);
	                });
	                
            		getRank(page);
            		
            		swipeAjax.bindTapEvent(document, function () {//上滑回调
                        $loading = $('.new-rank-list .loading');
                        if (!$loading.length) {
                            return;
                        }
                        
                        if(current >= total){
    						swipeAjax.setAjaxCount(0);  //这一行必须加
                        	return;
                        }
                      	page = page + 1;
                      	getRank(page);
                    });
            });
            
            function getRank(page){
                	var  $load = $('.new-rank-list .loading');
                	$load.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
                	var $superank = $("#super-rank");
                	$.ajax({
    					type:"GET",
    					url:"${basepath}/m/ext/enn/rank/superlist.list",
    					data:{model:"${param.model}",id:'${id}',page : page,size :50},
    					success:function(html){
    						
    						if (html.indexOf('no-data-img') > -1) {
    							$load.closest('.new-rank-list').replaceWith(html);
    						}else{
	    						$superank.append(html);
    						}
    						
    						if(total>current){
    							$load.html('上滑加载更多');
    						}else {
    							$load.html("");
    						}
    						/**已无更多  提示
    						if(total!=1&&current!=1){
							$load.html("已无更多");
						}else 
    						*/
    						
    		                swipeAjax.setAjaxCount(0);  //这一行必须加
    					}
    				});
            	
            }
        </script>
	</body>
</html>
