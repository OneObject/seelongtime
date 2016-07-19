<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
	<head>
		<title>回答详情</title>
	</head>
	<body>
        <header>
            <div class="title title1">回答详情</div>
            <span class="btn btn-back" id="btn-back"><i class="fa fa-angle-left"></i></span>
        </header>
        <section class="block-fixed">
            <div class="image">
  					<c:choose>
							<c:when test="${entity.anonymous eq 0}">
							
								<img src="${basepath}/user/avatar/${entity.author_id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" />
							
							</c:when>
							
							<c:otherwise>
							
								<img src="${basepath}/static/m_h5/nask/img/niming.png" />
							
							</c:otherwise>
						
						</c:choose>           
						
			 </div>
			 
            <div class="block-func">
            	<c:choose>
            	<c:when test="${entity.is_best_answer eq 1}">
               	 	<span class="accept checked"  id="accept"><i class="fa fa-star yellow"></i>采用</span>
            	</c:when>
            	<c:otherwise>
            		<c:if test="${uid eq question.author_id and question.is_set_best_answer eq 0 }">
               	 		<span class="accept"  id="accept"><i class="fa fa-star-o"></i>采用</span>
            		</c:if>
            	</c:otherwise>
            	</c:choose>
                <span class="up ${zanstatus eq 0? 'checked':'' }" id="up"><i class="fa ${zanstatus eq 0 ? 'fa-thumbs-up':'fa-thumbs-o-up' }"></i><label>${ajy:praiseTotal(entity.id,3)}</label></span>
            </div>
            <div class="from">
                <label class="set-color">${entity.anonymous eq 0 ? entity.author_name :'匿名' }</label>的回答
            </div>
        </section>
        <section class="block-fixed-comment">
            <div><input type="text" id="input-comment" placeholder="输入您的评论" /></div>
            <span class="set-color" id="btn-comment">评论</span>
        </section>
        <section class="wrapper-static margin-top-109 margin-bottom-51">
            <!--<div class="holder-loading">-->
            <!--<i class="fa fa-spinner fa-pulse"></i>正在加载...-->
            <!--</div>-->
            <div class="module-answer-detail">
                <div class="answer-content weixin-imgs-show">
                    ${entity.content}
                </div>
                <div class="answer-time">
                    编辑于<label>${ltfun:dateLongToStringFormat(entity.dateCreated,'yyyy-MM-dd HH:mm')}</label>
                </div>
            </div>
            <div class="module-comment-list">
                <div class="comment-list-header" >评论（<label id="comment-count" class="set-color">${ajy:commentTotal(entity.id,3)}</label>）</div>
               	<div id="content">
               	<div class="holder-loading3" id="loading">
						<i class="fa fa-spinner fa-pulse"></i>正在加载...
				</div>
               	</div>
             
            </div>
        </section>
        <script type="text/javascript" src="${basepath}/static/m_h5/nask/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m_h5/nask/js/ask_answer_base.js"></script>
        <script type="text/javascript" src="${basepath}/static/m_h5/js/weixin_img.js"></script>
        <script type="text/javascript">

        var page = 0;
        
            $(function () {
            	var btnBack = document.getElementById('btn-back');
            	var $btnAccept = $('#accept');
            	var $btnUp = $('#up');
            	var $inputComment = $('#input-comment');
            	var $btnComment = $('#btn-comment');
            	var $commentCount = $('#comment-count');
            	var $loading;
            	
                
                btnBack.onclick = function () {//回到首页
                	//window.location.href = '${basepath}/m/h5/nask/detail.xhtml?id=${entity.question_id}';
                	window.history.go(-1);
                };
                
                $btnAccept.bind('click', function () {//点击采用按钮
                	var temp = $(this);
                	if (temp.is('.checked')) {
                	//	lightDialog.show('该用户会被取消悬赏奖励，确认取消？', function () {//确认操作时的回调函数
	                //		temp.removeClass('checked');
	                //		temp.find('i').replaceWith('<i class="fa fa-star-o"></i>');
	                //		lightDialog.remove();
                	//	}, function () {//取消操作时的回调函数
                	//		lightDialog.remove();
                	//	});
                    	            		
                	} else {
                		lightDialog.show('该用户会获得悬赏奖励，确认采用？', function () {//确认操作时的回调函数
	                		temp.addClass('checked');
	                		temp.find('i').replaceWith('<i class="fa fa-star yellow"></i>');   
	                		lightDialog.remove();

							accept();
	                		
                		}, function () {//取消操作时的回调函数
                			lightDialog.remove();
                		});                  		

                	}
                });
                
                $btnUp.bind('click', function () {//点击赞同按钮
                	var temp = $(this);
                	var num = parseInt(temp.find('label').html());
                	if (temp.is('.checked')) {
                		temp.removeClass('checked');
                		temp.find('i').replaceWith('<i class="fa fa-thumbs-o-up"></i>');
                		temp.find('label').html(--num);
                		zan();
                		
                	} else {
                		temp.addClass('checked');
                		temp.find('i').replaceWith('<i class="fa fa-thumbs-up"></i>');
                		temp.find('label').html(++num);
                		zan();
                	}
                });
                
                $btnComment.bind('click', function () {//点击评论
                	var text = $.trim($inputComment.val());
                	var commentNum = parseInt($commentCount.html());
                	if (text === '') {
                		lightBlock.show('评论内容不能为空！');
                		return;
                	}

					var url = '${basepath}/m/h5/nask/comment.json'
						
                	$.ajax({
                		type : "GET",
	    				url : url,
	    				cache : false,
	    				data : {content : text,id : "${entity.id}"},
	    				success : function(data) {
	    					if(data){
	    						$commentCount.html(++commentNum);
	    						$("#input-comment").val("");
	    						list(1);
		    				}else{
		    					lightBlock.show('评论失败！');
			    			}
	    					
	    				},
	    				error : function() {
	    				}
					});
                
                });
                
                swipeAjax.bindTapEvent(document, function () {//模拟上滑加载
                    
                	$loading = $('.module-comment-list .loading');

                	if (!$loading.length) {
    					swipeAjax.setAjaxCount(0);
    					return;
    				}

    				if(total<= current ){
            			swipeAjax.setAjaxCount(0);  //这一行必须加 
    					return;
                	}	
                    $loading.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');

        			

        			page = page + 1;

    				list(page);
        			
                
                    
                });
            });

            $(function() {

    			list(1);

    		});

    		function list(i) {

    			page = i ;
    			
    			var url = "${basepath}/m/h5/nask/commentlist.list";

    			$.ajax({
    				type : "GET",
    				url : url,
    				cache : false,
    				data : {
    					page : i ,
    					size : 5,
    					rid : "${entity.id}"
    				},
    				success : function(response) {

						var tLoading = $('.module-comment-list .loading');
						
    					if(i == 1){
    						$("#content").html(response);
    						if(total > current ){
    							$("#content").append('<div class="loading">上滑加载更多</div>');
    						}else{
    							
    						}
    						swipeAjax.setAjaxCount(0); 
    					}else{
    						tLoading.before(response);
    						if(total > current ){
    							tLoading.html('上滑加载更多');
    						}else{
    							tLoading.html('已无更多');
    						}
    						swipeAjax.setAjaxCount(0); 
    					}

    				},
    				error : function() {
    				}
    			});
    		}

			function zan(){
            	$.ajax({
            		type : "GET",
    				url : '${basepath}/m/h5/nask/praise.json',
    				cache : false,
    				data:{resid:'${entity.id}'},
    				success : function(data) {
    				},
    				error : function() {
    				}
				});
				
			}
			function accept(){
            	$.ajax({
            		type : "GET",
    				url : '${basepath}/m/h5/nask/accept.json',
    				cache : false,
    				data:{aid:'${entity.id}'},
    				success : function(data) {
    				},
    				error : function() {
    				}
				});
				
			}
        </script>
	</body>
</html>
