<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
<head>
<title>聊天</title>
<link rel="stylesheet" type="text/css"
	href="${basepath}/static/m/ext/enn/css/module.css" />
<style type="text/css">
body {
	background: #eee;
}

header .btn-width-80 {
	width: 80px;
}
</style>
</head>
<body class="bg-color-gray">
	<header>
		<span class="btn btn-left" id="btn-left-1"> <i
			class="fa fa-angle-left"></i>
		</span> 
		<c:if test="${ type eq 1 }">
			<span class="btn btn-right btn-group" onclick="window.location.href='${basepath}/m/ext/enn/sns/groupmember.xhtml?to=${to }'">

            </span>
		</c:if>

		<div class="title title-2">${toname }</div>
	</header>

	<section class="wrapper-static-chat margin-top-50 margin-bottom-51"
		id="chat-wrapper">
		<div class="loading down-loading" id="down-loading">下滑加载历史</div>


	</section>
	<section class="block-fixed-func-chat">
		<div class="wrapper-func" id="wrapper-func">
			<span class="plus img" id="insert-image"><i
				class="fa fa-picture-o"></i></span>
			<div>
				<input type="text" id="input-text" placeholder="请输入内容" />
			</div>
			<span class="send" id="btn-send">发送</span>
		</div>
	</section>





	<script type="text/javascript"
		src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/ext/enn/js/plupload/plupload.full.min.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/plugins/socket.io/socket.io.js"></script>
	<script type="text/javascript">
		var page = 1;
		var $chatWrapper;
		var $window;
		var $upLoading;
		var windowSize = [ window.innerWidth, window.innerHeight ];
		var focusStamp = false;
		var isIos = browserUtil.isIos();
		var iconUrl ="${basepath}/user/avatar/${uid}.xhtml?style=80x80&color=gray"; //当前用户头像路径
		$(function() {
			var $btnSend;
			var $input;
			var $btnInsertImage = $('#insert-image');
			var swipeContainer = document;
			var $btnLeft1 = $('#btn-left-1');
			var $btnRight1 = $('#btn-right-1');

			$btnSend = $('#btn-send');
			$input = $('#input-text');
			$chatWrapper = $('#chat-wrapper');
			$upLoading = $('#up-loading');

			if (isIos) {
				$window = $chatWrapper;
				$chatWrapper.attr('style',
						'position: fixed;top: 0;bottom:0;overflow:auto;');
				swipeContainer = $chatWrapper[0];
			} else {
				$window = $('html,body');
			}

			setTimeout(function () {
				$window.scrollTop($chatWrapper.prop('scrollHeight') - windowSize[1] + 101);
			}, 300);

			$btnInsertImage.bind('click', function() {
				if (isIos && focusStamp) {
					$input.focus();
					setTimeout(function() {
						$input.blur();
						focusStamp = false;
					}, 30);
				}
			});

			$input.bind('focus', function() {
				focusStamp = true;
			});

			$btnSend.bind('click', function() {
				var str = $.trim($input.val());
				if (str === '') {
					lightBlock.show('内容不能为空！');
					if (isIos) {
						$input.focus();
						setTimeout(function() {
							$input.blur();
							focusStamp = false;
						}, 30);
					}
					return;
				}
				if (isIos) {
					$input.focus();
					setTimeout(function() {
						$input.blur();
						focusStamp = false;
					}, 30);
				}
				$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/sns/savechat.json",
					data:{content:str,type:'${type}',to:'${to}',contenttype:0,groupname:"${group.title}",cover:"${group.cover}"},
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

			$btnLeft1.bind('click', function() {
				window.history.go(-1);
			});

			$btnRight1.bind('click', function() {
				var temp = $(this);
				if (isIos && focusStamp) {
					$input.focus();
					setTimeout(function() {
						$input.blur();
						focusStamp = false;
					}, 30);
				}
				accept('${answer.id}');
			});
			//dddd
			uploadImage.createUploader($btnInsertImage[0], document.getElementById('wrapper-func'),  '<%=Constant.QINIU_SERVER%>', '${uptoken}', '<%=Constant.IMG_SERVER_DOWNLOAD%>');
			swipeAjax
					.bindTapEvent(
							swipeContainer,
							function() {//异步加载
								$upLoading
										.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
								setTimeout(
										function() {//ajax请求
											$upLoading
													.before('<div class="me"><div class="chat-box"><span class="image"><img src="img/tx/tx1.jpg" /></span><div class="content-line-1">这是上滑加载的数据</div><label class="arrow set-bg-color"></label></div></div>');
											$upLoading.html('上滑刷新页面');
											swipeAjax.setAjaxCount(0); //这一行必须加
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
						+ '<div class="content-line-1">' + initMap.content
						+ '</div>'
						+ '<label class="arrow set-bg-color"></label>'
						+ '</div>' + '</div>';
				break;
			case 'link_text':
				html = '<div class="me">'
						+ '<div class="chat-box">'
						+ '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
						+ '<div class="content-line-1">' + initMap.content
						+ '<a href="'+ initMap.linkUrl +'">点击查看</a></div>'
						+ '<label class="arrow set-bg-color"></label>'
						+ '</div>' + '</div>';
				break;
			case 'image':
				html = '<div class="me">'
						+ '<div class="chat-box">'
						+ '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
						+ '<div class="content-line-1"><img src="'+ initMap.imageUrl +'" /></div>'
						+ '<label class="arrow set-bg-color"></label>'
						+ '</div>' + '</div>';
				break;
			case 'multiline':
				html = '<div class="me">'
						+ '<div class="chat-box">'
						+ '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
						+ '<div class="content-line-3"><div>'
						+ initMap.title
						+ '</div><div>'
						+ initMap.content
						+ '</div><div><a href="'+ initMap.linkUrl +'">点击查看</a> </div></div>'
						+ '<label class="arrow set-bg-color"></label>'
						+ '</div>' + '</div>';
				break;
			default:
				console.log('type类型不合法');
			}
			$chatWrapper.append(html);

			$window.animate({
				scrollTop : $chatWrapper.prop('scrollHeight') - windowSize[1]
						+ 101
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
						+ '<div class="name">' + initMap.name + hatHtml
						+ '</div>' + '<div class="content-line-1">'
						+ initMap.content + '</div>'
						+ '<label class="arrow"></label>' + '</div>' + '</div>';
				break;
			case 'link_text':
				html = '<div class="other">'
						+ '<div class="chat-box">'
						+ '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
						+ '<div class="name">' + initMap.name + hatHtml
						+ '</div>' + '<div class="content-line-1">'
						+ initMap.content
						+ '<a href="'+ initMap.linkUrl +'">点击查看</a></div>'
						+ '<label class="arrow"></label>' + '</div>' + '</div>';
				break;
			case 'image':
				html = '<div class="other">'
						+ '<div class="chat-box">'
						+ '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
						+ '<div class="name">'
						+ initMap.name
						+ hatHtml
						+ '</div>'
						+ '<div class="content-line-1"><img src="'+ initMap.imageUrl +'" /></div>'
						+ '<label class="arrow"></label>' + '</div>' + '</div>';
				break;
			case 'multiline':
				html = '<div class="other">'
						+ '<div class="chat-box">'
						+ '<span class="image"><img src="'+ initMap.iconUrl +'" /></span>'
						+ '<div class="name">'
						+ initMap.name
						+ hatHtml
						+ '</div>'
						+ '<div class="content-line-3"><div>'
						+ initMap.title
						+ '</div><div>'
						+ initMap.content
						+ '</div><div><a href="'+ initMap.linkUrl +'">点击查看</a> </div></div>'
						+ '<label class="arrow"></label>' + '</div>' + '</div>';
				break;
			default:
				console.log('type类型不合法');
			}
			$chatWrapper.append(html);
			$window.animate({
				scrollTop : $chatWrapper.prop('scrollHeight') - windowSize[1]
						+ 101
			}, 150);

		}

		function insertImage(url,hashid) {
			if (!url) {
				return;
			}
			$.ajax({
				type:"GET",
				url:"${basepath}/m/ext/enn/sns/savechat.json",
				data:{content:hashid,type:'${type}',to:'${to}',contenttype:1,groupname:"${group.title}",cover:"${group.cover}"},
				success:function(data){
					//action
					createMyChatBox({//插入数据
						type : 'image',
						title : '',
						content : '',
						iconUrl : iconUrl,
						imageUrl : url+'-imageView0h520q85',
						linkUrl : ''
					});
				}
			});
		

			
		}

		

		$(function(){
			getlist(1);

		});

        function getlist(i){
        	var  $loading1 = $('#down-loading');
        	$loading1.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
        	$.ajax({
				type:"GET",
				url:"${basepath}/m/ext/enn/sns/chatlist.list",
				data:{page : i,size :20,to:'${to}',type:'${type}'},
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
        
        
        
        
        var socket;
        var type = "${ type eq 1 ? 'g':'p'}";

        var isPersonChart = (type=='p');
        var imid = "${to}";
        var toUid = "${to}";
        if(type=='p'){
			imid='${imTo}';
        }
    	function socketioInit(){
    		socket =  io.connect('<%=Constant.WEBSOCKET_SERVER%>?type=im&domain=<%=MwebHelper.getCurrentDomain()%>&id='+type+'_'+imid);
    		//socket =  io.connect('http://socketio.aijiayou.com:80?type=vote&id=${id}');

    		socket.on('connect', function() {
    			console.log('Client has connected to the server!');//正常
    	
    		});

    		socket.on('message', function(data) {
        		
    			if(null!=data && data.payload!=null && data.payload.content!=null){
    				
    				if(data.payload.authorid == '${uid}'){
    					return;
    				}
    				var  chatLog = JSON.parse(data.payload.content);
    				
    				var msgtype= chatLog.type;//int type;//消息类型 text:0  image:1
    				
    				var initMap = {};
    				initMap.type = msgtype==1?'image':'text';
    				initMap.title = '';
    				initMap.name = chatLog.name;
    				if(initMap.type=='image'){
    					initMap.imageUrl = '<%=Constant.IMG_SERVER_DOWNLOAD%>'+chatLog.content+'-imageView0h520q85';
    				}else{
    					initMap.content = htmlEncode(chatLog.content);
    				}
    				
    				initMap.iconUrl = "${basepath}/user/avatar/"+chatLog.sender+".xhtml?style=80x80&color=gray";
    				
    				initMap.linkUrl = '';
    				createOtherChatBox(initMap,false);

    				updateVisitTimeline(toUid);
    				
    			}
    			console.log(data.payload.content);
    		});

    		socket.on('disconnect', function() {
    			updateVisitTimeline(toUid);
    			
    			console.log('The client has disconnected!');//连接错误'
    			
    		});	
    		
    		
    	}	

    	socketioInit();

        
       function updateVisitTimeline(model){
    	    	$.ajax({
    				type:"POST",
    				url:"${basepath}/m/ext/enn/notice/uptimeline.json",
    				data:{model : model,isPersonChart:isPersonChart,toUid:toUid,resourcetype:isPersonChart?"person":"group"},
    				success:function(data){
    					console.log('记录离开chat时间'+data);
    				}
    			});
    	    	
     }
		
	</script>
</body>
</html>

