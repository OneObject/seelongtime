<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>
		<c:if test="${model eq 'q_invite' }">被邀请的问题</c:if>
        <c:if test="${model eq 'q_at' }">被@的问题</c:if>
        <c:if test="${model eq 'new' }">最新的提问</c:if>
        <c:if test="${model eq 'fun' }">感兴趣的问题</c:if>
        <c:if test="${model eq 'credit' }">高悬赏的问题</c:if>
        <c:if test="${model eq 'me' }">我的提问</c:if>
		<c:if test="${model eq 'meAnswer' }">我的回答</c:if>
		<c:if test="${model eq 'meInvite' }">我的邀请</c:if>
        </title>
		<style type="text/css">
			body{
				background: #eee;
			}
		</style>
	</head>
	<body>
        <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title ">
            <c:if test="${model eq 'q_invite' }">被邀请的问题</c:if>
            <c:if test="${model eq 'q_at' }">被@的问题</c:if>
            <c:if test="${model eq 'new' }">最新的提问</c:if>
        	<c:if test="${model eq 'fun' }">感兴趣的问题</c:if>
        	<c:if test="${model eq 'me' }">我提问的问题</c:if>
			<c:if test="${model eq 'meAnswer' }">我的回答</c:if>
			<c:if test="${model eq 'meInvite' }">我的邀请</c:if>
        	<c:if test="${model eq 'tag' }">
        	感兴趣的问题<c:if test="${not empty tagEntity }"> / ${tagEntity.name}</c:if>
        	</c:if>
        	<c:if test="${model eq 'credit' }">高悬赏的问题</c:if>
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="module-ask-answer-list">

                <div class="loading"><i class="fa fa-spinner fa-pulse"></i>正在加载...</div>

            </div>
        </section>

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/swiper.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.index.js"></script>
        <script type="text/javascript">
        var page =1;
            $(function () {
                var $btnBack = $('#btn-back');
                var $loading;
                getlist(1);
                
                
                
                $btnBack.bind('click', function () {
                    window.history.go(-1);
                });

                swipeAjax.bindTapEvent(document, function () {//上滑回调
                	$loading = $('.module-ask-answer-list .loading');
                    if (!$loading.length) {
                        return;
                    }
                    if (total <= current) {
						swipeAjax.setAjaxCount(0); //这一行必须加 
						return;
					}
                    page = page + 1;
                    getlist(page);
                }, function () {//下滑回调
                });
            });
            
            
            function getlist(i){
            	var  $loading1 = $('.module-ask-answer-list .loading');
            	$loading1.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
            	$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/ask/list.list?model=${model}&tagid=${tagEntity.id}",
					data:{page : i,size : 20,coachid:"${param.coachid}"},
					success:function(html){
						
						$loading1.before(html);
						if(total>current){
							$loading1.html('上滑加载更多');
						}else if(total!=1&&current!=1){
							$loading1.html('已无更多');
						}else {
							$loading1.html("");
						}
						
						swipeAjax.setAjaxCount(0);  //这一行必须加
					}
				});
            }

            function todetail(id){
            	//window.location.href="${basepath}/m/ext/enn/ask/detail.xhtml?id="+id;
            	if (typeof(api) == "undefined"){
					window.open("${basepath}/m/ext/enn/ask/detail.xhtml?id="+id);
				}
				
				api.openWin({
					animation:{
					    type:"none"               //动画类型（详见动画类型常量）
					},
					delay:400,
					slidBackEnabled:false,
				    name: 'question_detail',
				    url: "${basepath}/m/ext/enn/ask/detail.xhtml?id="+id+"&openwin=true"
				});
            }
            
            function todetail(id,inviteid){
            	var url = "${basepath}/m/ext/enn/ask/detail.xhtml?id="+id;
            	if(inviteid !== ''){
            		url=url +"&inviteid="+inviteid;
            	}
            	//window.location.href=url;
            	if (typeof(api) == "undefined"){
            		window.location.href=url;
				}
				
				api.openWin({
					animation:{
					    type:"none"               //动画类型（详见动画类型常量）
					},
					delay:400,
					slidBackEnabled:false,
				    name: 'question_detail',
				    url: url+"&openwin=true"
				});
				
            }
            
            function toTagQuesetionList(tagid){
            	window.location.href = "${basepath}/m/ext/enn/ask/questions.xhtml?model=tag&tagid="+tagid;

            }
        </script>
	</body>
</html>

