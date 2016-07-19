<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>

<!DOCTYPE html>
<html>
	<head>
		<title>我的消息</title>
			<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
			<style type="text/css">
				body {
					background: #eee;
				}
			</style>
	</head>
	<body class="bg-color-gray">
        <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
                我的消息
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="tab-message-list " id="tab-message-list">
                <div class="active" id="btn-list-1" data-href="message-list-1">
                    <span><label>回答我的<i id="message1" style="display: none;"></i></label></span>
                </div>
                
                <div id="btn-list-2" data-href="message-list-2">
                    <span><label>等我答的<i id="message2" style="display: none;"></i></label></span>
                </div>
                
                <div id="btn-list-3" data-href="message-list-3">
                    <span><label>通知<i id="message3" style="display: none;"></i></label></span>
                </div>
            </div>
            <div class="module-message-list normal-message-list" id="message-list-1">
				
				
				
				
				
                <div class="loading"></div>
            </div>
            
			
            <div class="module-message-list module-ask-answer-list block-ask-answer-message margin-top-0" style="display: none;" id="message-list-2">
           		
           		
                <div class="loading"></div>
            </div>
			
            <div class="module-message-list multiline-message-list" style="display: none;" id="message-list-3">
                

                <div class="loading"></div>
            </div>
        </section>

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js?v=1"></script>
        <script type="text/javascript">
		var page1 = 1;
		var page2 = 1;
		var page3 = 1;
        
            $(function () {
                var $btnBack = $('#btn-back');
                var $loading;
                var $tabListBtns = $('#tab-message-list div');
                var $messageList1 = $('#message-list-1');
                var $messageList2 = $('#message-list-2');
                var $messageList3 = $('#message-list-3');
                var hash = getHash();
                var stateMap = {
                    wrapper1Showed: false,
                    wrapper2Showed: false,
                    wrapper3Showed: false
                };

                if (hash) {
                    switch (hash) {//页面初始加载时，流程控制
                        case 'a':
                            //window.location.hash = 'a';
                            showWrapperBox1();
                            break;
                        case 'b':
                            $('#btn-list-2').addClass('active').siblings().removeClass('active');
                            showWrapperBox2();
                            break;
                        case 'c':
                            $('#btn-list-3').addClass('active').siblings().removeClass('active');
                            showWrapperBox3();
                            break;
                        default:
                            console.log('不存在该模块！');
                    }
                } else {
                    showWrapperBox1();
                }

                function showWrapperBox1() {
                    $messageList1.show().siblings('.module-message-list').hide();
                    if (!stateMap.wrapper1Showed) {
                        stateMap.wrapper1Showed = true;
                        //ajax请求，异步加载
                   		listanswerme(1,1);

                    }
                }

                function showWrapperBox2() {
                    $messageList2.show().siblings('.module-message-list').hide();
                    if (!stateMap.wrapper2Showed) {
                        stateMap.wrapper2Showed = true;
                        //ajax请求，异步加载
                   		listanswerme(1,2);
                    }
                }

                
                function showWrapperBox3() {
                    $messageList3.show().siblings('.module-message-list').hide();
                    if (!stateMap.wrapper3Showed) {
                        stateMap.wrapper3Showed = true;
                        //ajax请求，异步加载
                   		listanswerme(1,3);
                    }
                    
                    
                }

                $tabListBtns.bind('click', function () {
                    var $temp = $(this);
                    var href = $temp.data('href');

                    $temp.addClass('active').siblings().removeClass('active');
                    switch (href) {
                        case 'message-list-1':
                            //window.location.hash = 'a';
                            setHash('a');
                            showWrapperBox1();
                            break;
                        case 'message-list-2':
                           // window.location.hash = 'b';
                            setHash('b'); 
                           showWrapperBox2();
                            break;
                        case 'message-list-3':
                            //window.location.hash = 'c';
                            setHash('c'); 
                            showWrapperBox3();
                            break;
                        default:
                            console.log('不存在该模块！');
                    }
                });

                $btnBack.bind('click', function () {
                	delCookie("messageTag");
                    window.history.go(-1);
                });

                swipeAjax.bindTapEvent(document, function () {//上滑回调
                    if ($messageList1.is(':visible')) {
                        $loading = $messageList1.find('.loading');
                        if (!$loading.length) {
                            return;
                        }
                        if (total <= current) {
    						swipeAjax.setAjaxCount(0); //这一行必须加 
    						return;
    					}
						page1 = page1+1;
						listanswerme(page1,1);
                    }

                    if ($messageList2.is(':visible')) {
                        $loading = $messageList2.find('.loading');
                        if (!$loading.length) {
                            return;
                        }
                        if (invitetotal <= invitecurrent) {
    						swipeAjax.setAjaxCount(0); //这一行必须加 
    						return;
    					}
						page2 = page2+1;
						listanswerme(page2,2);
                    }

                    if ($messageList3.is(':visible')) {
                        $loading = $messageList3.find('.loading');
                        if (!$loading.length) {
                            return;
                        } 
                        if (messagetotal <= messagecurrent) {
    						swipeAjax.setAjaxCount(0); //这一行必须加 
    						return;
    					}
						page3 = page3+1;
						listanswerme(page3,3);
                    }

                });
            });

			$(function(){
				remindGroup();
			});


			function remindGroup(){
    			$.ajax({
    				type : "GET",
    				url : "${basepath}/m/ext/enn/notice/remindgroup.json",
    				cache : false,
    				data : {
    				},
    				success : function(map) {
						if(parseInt(map.answerme)>0){
							$("#message1").show();
						}else{
							$("#message1").hide();
						}
						
						if(parseInt(map.inviteat) > 0 ){
							$("#message2").show();
						}else{
							$("#message2").hide();
						}
						
						if(parseInt(map.other) > 0 ){
							$("#message3").show();
						}else{
							$("#message3").hide();
						}
    				}
    			});

    		}
		

            function listanswerme(i,status){
                var $loading1 ;
                var t ;
                var c ;
                if(status == 1){
            		$loading1 = $('#message-list-1 .loading');
                }else if(status == 2){
                	$loading1 = $('#message-list-2 .loading');
                }else if(status == 3){
                	$loading1 = $('#message-list-3 .loading');
                }
            	$loading1.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
            	$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/ask/messagelist.list",
					data:{status:status,page : i,size :20},
					cache:false,
					success:function(html){
						$loading1.before(html);
						if(status == 1){
		            		t = total;
		            		c = current;
		                }else if(status == 2){
		                	t = invitetotal;
		            		c = invitecurrent;
		                }else if(status == 3){
		                	t = messagetotal;
		            		c = messagecurrent;
		                }
						if(t>c){
							$loading1.html('上滑加载更多');
						}else if(t!=1&&c!=1){
							$loading1.html('已无更多');
						}else if(t == 0 || t == 1 ){
							$loading1.html("");
						}
						swipeAjax.setAjaxCount(0);  //这一行必须加
					}
				});
            }

            function todetail(id,inviteid){
				window.location.href="${basepath}/m/ext/enn/ask/detail.xhtml?id="+id+"&inviteid="+inviteid;
            }
            
            function toTagQuesetionList(tagid){
            	window.location.href = "${basepath}/m/ext/enn/ask/questions.xhtml?model=tag&tagid="+tagid;
            }
            
            function toquestiondetail(url){
				window.location.href="${basepath}/m/ext/enn/ask/toanswer.xhtml?"+url;
            } 
            
            
            function readNotice(noticeId){
				window.location.href="${basepath}/m/ext/enn/notice/read.xhtml?id="+noticeId;
            }
            
            
            function setHash(tag){
            	
            	setCookie("messageTag",tag);
            }
            function getHash(){
            	var tag = getCookie("messageTag");
            	if(tag==null || tag==""){
            		return "a";
            	}
            	return tag;
            }
            
            
            function agreefindpwd(rid,div_id){
        		var code = $("#code").val();
        		
        		showHandling();
        		if(code==null||code==""){
        		$("#module-handling").remove();
        			lightBlock.show("请输入确认码");
        			
        			return;
        		}
        		$.ajax({
        			type : "POST",
        			url:"${basepath}/m/ext/enn/agreefindpwd.json",
        			cache : false,
        			data:{"rid":rid , "code" :code },
        			success:function(map){
        				lightBlock.show({text:map.message,time:3});
        				$('#module-handling').remove();
        				if(map.cleanMsg==true){
        					//$("#"+div_id).remove();
        					setTimeout("$('#"+div_id+"').remove()",900 );
        				}
        				//setTimeout("window.location.reload()",900 );
        			   
        			}

        		});
        	}
            
        </script>
	</body>
</html>
