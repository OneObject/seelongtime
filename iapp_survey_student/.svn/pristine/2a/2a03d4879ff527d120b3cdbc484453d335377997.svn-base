<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
	<head>
		<title>导师端</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
        <style type="text/css">
			body {
				background: #eee;
			}
		</style>
	</head>
	
	<body class="bg-color-gray">
        <header>
            <span class="btn btn-left"  id="btn-left-1">
                <i class="fa fa-angle-left"></i>
            </span>
            <span class="btn btn-right btn-menu" id="btn-menu">
                <i class="fa fa-bars">
                <%--
                <label class="red-dot"></label>
                 --%>
                </i>
            </span>
            <div class="title title-2">
                辅导
            </div>
        </header>
        <nav>
            <ul class="module-nav ctl-hide" id="module-nav">
	            <c:choose>
		            <c:when test="${iscoach }">
		            <li>
		                    <a href="${basepath}/m/ext/enn/coach/newtoaddtask.xhtml?coachid=${coachid}">辅导计划</a>
		                </li>
		            <li>
		                    <a href="javascript:void(0);" onclick="toCoachList('${coachid}',false);">辅导记录</a>
		                    <%--
		                    <span><em>15</em></span>
		                     --%>
		                </li>
		                <li>
		                    <a href="${basepath}/m/ext/enn/coach/surveyresult.xhtml?coachid=${coachid}">观察评估</a>
		                    <%--
		                    <span><em>12</em></span>
		                    --%>
		                </li>
		                
		                <li>
		                    <a href="${basepath }/m/ext/enn/coach/member.xhtml?coachid=${coachid}">辅导成员</a>
		                </li>
		            
		            </c:when>
	            	<c:otherwise>
	            		  <!--学员端-->
		               <!--<li>
		                    <a href="${basepath}/m/ext/enn/ask/questions.xhtml?model=me&coachid=${coachid }">问答</a>
		                    <!-- <span><em>15</em></span> 
		                </li> -->
		                <li>
		                    <a href="javascript:void(0);" onclick="toCoachList('${coachid}',false);">实习记录</a>
		                    <!-- <span><em>15</em></span> -->
		                </li>
		                <li>
		                    <a href="${basepath }/m/ext/enn/coach/member.xhtml?coachid=${coachid}">辅导成员</a>
		                </li>
	            	</c:otherwise>
	            
	            </c:choose>
                

              
            </ul>
        </nav>

        <section class="wrapper-static-chat margin-top-50 margin-bottom-51" id="chat-wrapper">
             <%--
            <div class="banner">
                <img src="${basepath}/static/m/ext/enn/img/banner.png" />
            </div>
            --%>
            <div class="loading down-loading" id="down-loading">下滑加载历史</div>
            
            <%--
            <sns:imTimeLine timestamp="${answer.dateCreated  }">
							<div class="system-info">${ltfun:dateLongToStringFormat(answer.dateCreated ,'yyyy-MM-dd')}</div>
			</sns:imTimeLine>
            <div class="other">
                <div class="chat-box">
                    <span class="image"><img src="img/tx/tx1.jpg" /></span>
                    <div class="name">司徒正美</div>
                    <div class="content-line-3">
                        <div>提交了今日的实习记录</div>
                        <div>我刚刚提交了一份实习记录，感谢老师今天的帮助。谢谢</div>
                        <div><a href="shi-xi-ji-lu.html">点击查看</a> </div>
                    </div>
                    <label class="arrow"></label>
                </div>
            </div>
            <div class="me">
                <div class="chat-box">
                    <span class="image"><img src="img/tx/tx5.jpg" /></span>
                    <div class="content-line-1">回复了司徒正美的实习记录<a href="#">点击生成辅导记录</a> </div>
                    <label class="arrow"></label>
                </div>
            </div>
            <div class="loading up-loading" id="up-loading">上滑刷新页面</div>
             --%>
        </section>
        <section class="block-fixed-func-chat">
            <div class="wrapper-func">
                <span class="plus" id="btn-plus"><i class="fa fa-plus"></i></span>
                <div><input type="text" id="input-text" placeholder="请输入内容" /></div>
                <span class="send set-color" id="btn-send">发送</span>
            </div>
        </section>

        <section class="block-fixed-module-chat ctl-hide" id="fixed-module">
        <c:choose>
        <c:when test="${iscoach }">
        
		  <a href="${basepath }/m/ext/enn/coach/newtoaddtask.xhtml?coachid=${coachid}">
                <div>
                    <label><img src="${basepath}/static/m/ext/enn/img/c3.png" /></label>
                    <span>辅导计划</span>
                </div>
            </a>
            <a href="${basepath }/m/ext/enn/coach/newaddguidance.xhtml?coachid=${coachid}">
                <div>
                    <label><img src="${basepath}/static/m/ext/enn/img/c2.png" /></label>
                    <span>辅导记录表</span>
                </div>
            </a>
            
          
            <a href="${basepath }/m/ext/enn/coach/survey.xhtml?coachid=${coachid}">
                <div>
                    <label><img src="${basepath}/static/m/ext/enn/img/c4.png" /></label>
                    <span>观察评估表</span>
                </div>
            </a>

        </c:when>
        <c:otherwise>
            <!--学员端-->
            <!--<a href="${basepath }/m/ext/enn/ask/tomiaoshu.xhtml?coachid=${coachid}">
                <div>
                   <label><img src="${basepath}/static/m/ext/enn/img/c5.png" /></label>
                   <span>问答</span>
                </div>
            </a>
			-->
            <a href="${basepath }/m/ext/enn/coach/toaddpractice.xhtml?coachid=${coachid}">
                <div>
                    <label><img src="${basepath}/static/m/ext/enn/img/c6.png" /></label>
                    <span>实习记录</span>
                </div>
            </a>
            <%-- <a href="${basepath }/m/ext/enn/coach/survey.xhtml?coachid=${coachid}">
                <div>
                    <label><img src="${basepath}/static/m/ext/enn/img/c4.png" /></label>
                    <span>观察评估表</span>
                </div>
            </a> --%>
        </c:otherwise>
        </c:choose>
        
        </section>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        	<script type="text/javascript" src="${basepath}/static/plugins/socket.io/socket.io.js"></script>
        
        <script type="text/javascript">
            var $chatWrapper;
            var $window;
            var $moduleFixed;
            var $downLoading;
            var $upLoading;
            var windowSize = [window.innerWidth, window.innerHeight];
            var focusStamp = false;
            var isIos = browserUtil.isIos();
            var page = 1;
            $(function () {
                var $btnMenu;
                var $btnPlus;
                var $btnSend;
                var $moduleNav;
                var $input;
                var $btnLeft1 = $('#btn-left-1');
                var swipeContainer = document;

                $btnMenu = $('#btn-menu');
                $btnPlus = $('#btn-plus');
                $btnSend = $('#btn-send');
                $moduleNav = $('#module-nav');
                $moduleFixed = $('#fixed-module');
                $input = $('#input-text');
                $chatWrapper = $('#chat-wrapper');
                $downLoading = $('#down-loading');
                $upLoading = $('#up-loading');

                if (isIos) {
                    $window = $chatWrapper;
                    $chatWrapper.attr('style', 'position: fixed;top: 0;bottom:0;overflow:auto;');
                    swipeContainer = $chatWrapper[0];
                } else {
                    $window = $('html,body');
                }

    			

                $btnLeft1.bind('click', function () {
                    //window.history.go(-1);
                    window.location.href="${basepath}/m/ext/enn/ask/index.xhtml#d";
                });

                $btnMenu.bind('click', function () {
                    if (isIos && focusStamp) {
                        $input.focus();
                        setTimeout(function () {
                            $input.blur();
                            focusStamp = false;
                        }, 30);
                    }
                    if ($moduleNav.is('.ctl-hide')) {
                        $moduleNav.prop('class', 'module-nav ctl-show');
                        $moduleFixed.prop('class', 'block-fixed-module-chat ctl-hide');
                    } else {
                        $moduleNav.prop('class', 'module-nav ctl-hide');
                        $moduleFixed.prop('class', 'block-fixed-module-chat ctl-hide');
                    }
                });

                $btnPlus.bind('click', function () {
                    if (isIos && focusStamp) {
                        $input.focus();
                        setTimeout(function () {
                            $input.blur();
                            focusStamp = false;
                        }, 30);
                    }
                    if ($moduleFixed.is('.ctl-hide')) {
                        $moduleFixed.prop('class', 'block-fixed-module-chat ctl-show');
                        $moduleNav.prop('class', 'module-nav ctl-hide');
                    } else {
                        $moduleFixed.prop('class', 'block-fixed-module-chat ctl-hide');
                        $moduleNav.prop('class', 'module-nav ctl-hide');
                    }
                });

                $input.bind('focus', function () {
                    focusStamp = true;
                    $moduleFixed.prop('class', 'block-fixed-module-chat ctl-hide');
                    $moduleNav.prop('class', 'module-nav ctl-hide');
                });

                $btnSend.bind('click', function () {
                    var str = $input.val();
                    focusStamp = false;
                    if (str === '') {
                        lightBlock.show('内容不能为空！');
                        if (isIos) {
                            $input.focus();
                            setTimeout(function () {
                                $input.blur();
                                focusStamp = false;
                            }, 30);
                        }
                        return;
                    }

                    if (isIos) {
                        $input.focus();
                        setTimeout(function () {
                            $input.blur();
                            focusStamp = false;
                        }, 30);
                    }
                    //保存
                   $.ajax({
						type:"GET",
						url:"${basepath}/m/ext/enn/coach/savechat.json",
						data:{content:str,coachid:'${coachid}'},
						success:function(data){
							focusStamp = false;
							createMyChatBox({//插入数据
								type : 'text',
								title : '',
								content : htmlEncode(str),
								iconUrl : "${basepath}/user/avatar/${uid}.xhtml?style=80x80&color=gray",
								imageUrl : '',
								linkUrl : ''
							});
							$input.val('');
						}
					});
                });

                $moduleNav.bind('touchmove', function (e) {
                    return false;
                });


                swipeAjax.bindTapEvent(swipeContainer, function () {//异步加载
                    $upLoading.html('<i class="fa fa-spinner fa-pulse"></i>正在刷新页面...');
                    setTimeout(function () {//ajax请求
                        $upLoading.before('<div class="me"><div class="chat-box"><span class="image"><img src="img/tx/tx1.jpg" /></span><div class="content-line-1">这是上滑加载的数据</div><label class="arrow set-bg-color"></label></div></div>');
                        $upLoading.html('上滑刷新页面');  //或者内容为已无更多
                        swipeAjax.setAjaxCount(0);  //这一行必须加
                    }, 2000);
                }, function () {
                	  if (total <= current) {
  						swipeAjax.setAjaxCount(0); //这一行必须加 
  						return;
  						}
                      page = page + 1;
                      getlist(page);
                });
            });

            
            function createMyChatBox(initMap) {
                var type = initMap.type;
                var html;
                switch (type) {
                    case 'text':
                        html = '<div class="me">'
                        + '<div class="chat-box">'
                        + '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
                        + '<div class="content-line-1">'+ initMap.content +'</div>'
                        + '<label class="arrow set-bg-color"></label>'
                        + '</div>'
                        + '</div>';
                        break;
                    case 'link_text':
                        html = '<div class="me">'
                        + '<div class="chat-box">'
                        + '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
                        + '<div class="content-line-1">'+ initMap.content +'<a href="'+ initMap.linkUrl +'">点击查看</a></div>'
                        + '<label class="arrow set-bg-color"></label>'
                        + '</div>'
                        + '</div>';
                        break;
                    case 'image':
                        html = '<div class="me">'
                        + '<div class="chat-box">'
                        + '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
                        + '<div class="content-line-1"><img src="'+ initMap.imageUrl +'" /></div>'
                        + '<label class="arrow set-bg-color"></label>'
                        + '</div>'
                        + '</div>';
                        break;
                    case 'multiline':
                        html = '<div class="me">'
                        + '<div class="chat-box">'
                        + '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
                        + '<div class="content-line-3"><div>'+ initMap.title +'</div><div>'+ initMap.content +'</div><div><a href="'+ initMap.linkUrl +'">点击查看</a> </div></div>'
                        + '<label class="arrow set-bg-color"></label>'
                        + '</div>'
                        + '</div>';
                        break;
                    default:
                        console.log('type类型不合法');
                }
                $moduleFixed.prop('class', 'block-fixed-module-chat ctl-hide');
                $("#chat-wrapper").append(html);
                $window.animate({
                    scrollTop: $chatWrapper.prop('scrollHeight') - windowSize[1] + 101
                }, 150);
            }

            function createOtherChatBox(initMap, hasHat) {
                var type = initMap.type;
                var html;
                var hatHtml = '';
                if (hasHat) {
                    hatHtml = '<span class="hat"></span>';
                }
                switch (type) {
                    case 'text':
                        html = '<div class="other">'
                        + '<div class="chat-box">'
                        + '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
                        + '<div class="name">'+ initMap.name + hatHtml +'</div>'
                        + '<div class="content-line-1">'+ initMap.content +'</div>'
                        + '<label class="arrow"></label>'
                        + '</div>'
                        + '</div>';
                        break;
                    case 'link_text':
                        html = '<div class="other">'
                        + '<div class="chat-box">'
                        + '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
                        + '<div class="name">'+ initMap.name + hatHtml +'</div>'
                        + '<div class="content-line-1">'+ initMap.content +'<a href="'+ initMap.linkUrl +'">点击查看</a></div>'
                        + '<label class="arrow"></label>'
                        + '</div>'
                        + '</div>';
                        break;
                    case 'image':
                        html = '<div class="other">'
                        + '<div class="chat-box">'
                        + '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
                        + '<div class="name">'+ initMap.name + hatHtml +'</div>'
                        + '<div class="content-line-1"><img src="'+ initMap.imageUrl +'" /></div>'
                        + '<label class="arrow"></label>'
                        + '</div>'
                        + '</div>';
                        break;
                    case 'multiline':
                        html = '<div class="other">'
                        + '<div class="chat-box">'
                        + '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
                        + '<div class="name">'+ initMap.name + hatHtml +'</div>'
                        + '<div class="content-line-3"><div>'+ initMap.title +'</div><div>'+ initMap.content +'</div><div><a href="'+ initMap.linkUrl +'">点击查看</a> </div></div>'
                        + '<label class="arrow"></label>'
                        + '</div>'
                        + '</div>';
                        break;
                    default:
                        console.log('type类型不合法');
                }
                $moduleFixed.prop('class', 'block-fixed-module-chat ctl-hide');
                $("#chat-wrapper").append(html);
                $window.animate({
                    scrollTop: $chatWrapper.prop('scrollHeight') - windowSize[1] + 101
                }, 150);
            }

			$(function(){
				getlist(1);

			});

            function getlist(i){
            	var  $loading1 = $('#down-loading');
            	$loading1.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
            	$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/coach/chatlist.list",
					data:{page : i,size :50,coachid:'${coachid}'},
					cache:false,
					success:function(html){
						$loading1.after(html);
						if(total>current){
							$loading1.html('下滑加载历史');
						}else if(total!=1&&current!=1){
							$loading1.html('');
							$loading1.hide();
						}else if(total == 0 || total == 1 ){
							$loading1.html('');
							$loading1.hide();
						}
						
		    			$window.scrollTop($chatWrapper.prop('scrollHeight') - windowSize[1] + 101);
		    			
						swipeAjax.setAjaxCount(0);  //这一行必须加
					}
				});
            }
            
            function toCoachList(id,isTeacher){
        		
        		window.location.href = "${basepath}/m/ext/enn/coach/coach.xhtml?coachid="+id;
        		
        	}

        </script>
        
    <script type="text/javascript">
    
    function updateVisitTimeline(model){
    	$.ajax({
			type:"POST",
			url:"${basepath}/m/ext/enn/notice/uptimeline.json",
			data:{model : model},
			success:function(data){
				console.log('记录离开chat时间'+data);
			}
		});
    	
    }
    
    
    var socket;
	function socketioInit(){
		socket =  io.connect("<%=Constant.WEBSOCKET_SERVER%>?type=im&domain=<%=MwebHelper.getCurrentDomain()%>&id=coach_${coachid}");
		//socket =  io.connect('http://socketio.aijiayou.com:80?type=vote&id=${id}');

		socket.on('connect', function() {
			console.log('Client has connected to the server!');//正常
	
		});

		socket.on('message', function(data) {
			if(null!=data && data.payload!=null){

				updateVisitTimeline("coach"); //
				if(data.payload.authorid == '${uid}'){
					return;
				}
				var log = JSON.parse(data.payload.content);
				var html = '<div class="other"><div class="chat-box">';
				html += '<span class="image"><img src="${basepath}/user/avatar/'+log.uid+'.xhtml?style=80x80&color=gray" /></span>';
				html +=	'<div class="name">'+log.uname+'</div>'
				if(log.model == 'text'){
					html += '<div class="content-line-1">'+htmlEncode(log.content)+'</div>';
				}else if(log.model == 'fudao'){
					html += '<div class="content-line-3">';
					html += '<div>'+log.title+'</div>';
					html += '<div>'+log.content+'</div>';
					html += '<div><a href="${basepath }/m/ext/enn/coach/guidancedetail.xhtml'+log.url+'">点击查看</a> </div>';
					html += '</div>';
					
				}else if(log.model == 'practice'){
					html += '<div class="content-line-3">';
					html += '<div>提交了今日的实习记录</div>';
					html += '<div>我刚刚提交了一份实习记录，感谢老师今天的帮助。谢谢</div>';
					html += '<div><a href="${basepath }/m/ext/enn/coach/practicedetail.xhtml'+log.url+'">点击查看</a> </div>';
					html += '</div>';

				}else if(log.model == 'feedback'){
            		html += '<div class="content-line-1">';
					html += '<ul>';
					html += '<li>'+log.content+'</li>';
					html += '<li><a href="${basepath }/m/ext/enn/coach/practicedetail.xhtml'+log.url+'">点击查看</a> </li>';
					html += '</ul>';
					html += '</div>';
				}else if(log.model == 'question'){
					html += '<div class="content-line-3">';
					html += '<div>提问了一个问题</div>';
					html += '<div>我提问了一个问题，期待解答。谢谢</div>';
					html += '<div><a href="${basepath }/m/ext/enn/ask/detail.xhtml'+log.url+'">点击查看</a> </div>';
					html += '</div>';
				}else if(log.model=='studentsurvey'){
					html += '<div class="content-line-3">';
					html += '<div>'+log.title+'</div>';
					html += '<div>'+log.content+'</div>';
					html += '<div><a href="${basepath }/m/ext/enn/coach/surveydetail.xhtml'+log.url+'">点击查看</a> </div>';
					html += '</div>';
				}else if(log.model=='coach_plan'){
					html += '<div class="content-line-3">';
					html += '<div>'+log.title+'</div>';
					html += '<div>'+log.content+'</div>';
					html += '<div><a href="${basepath }/m/ext/enn/coach/plandetail.xhtml'+log.url+'">点击查看</a> </div>';
					html += '</div>';
				}

				html += '<label class="arrow"></label>';
				html += '</div></div>';
				$("#chat-wrapper").append(html);
				$window.animate({
					scrollTop : $chatWrapper.prop('scrollHeight') - windowSize[1]
							+ 101
				}, 150);
				
			}
			console.log(data.payload.id);
		});

		socket.on('disconnect', function() {
			
			//记录最后离开时间
			updateVisitTimeline("coach");
			
			console.log('The client has disconnected!');//连接错误'
			
		});	
		
		
	}	

	socketioInit();

		
	</script>
	</body>
</html>


