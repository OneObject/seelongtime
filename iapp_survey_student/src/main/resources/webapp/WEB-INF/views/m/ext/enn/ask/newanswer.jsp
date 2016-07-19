<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%
String random = String.valueOf(System.currentTimeMillis());
%>
<!DOCTYPE html>
<html>
<head>
<title>${entity.anonymous eq 0 ? entity.author_name :'匿名' }的提问</title>
<link rel="stylesheet" type="text/css"
	href="${basepath}/static/m/ext/enn/css/module.css" />
<style type="text/css">
body {
	background: #eee;
}
header .btn-width-80{
	width:80px;  
}
</style>
</head>
<body class="bg-color-gray">
	<header>
		<span class="btn btn-left" id="btn-left-1"> <i
			class="fa fa-angle-left"></i>
		</span>
		<c:if
			test="${entity.is_set_best_answer eq 0 and entity.author_id eq user.id }">
			<span class="btn btn-right btn-width-70" id="btn-right-1"> 采纳
			</span>
		</c:if>
		
		<c:if test="${empty entity.best_aid and showInvite}">
		<%--  
		<c:if test="${entity.is_set_best_answer eq 0 and entity.author_id ne user.id  and ((answer.isinvite eq 0 or empty answer) or (answer.isinvite eq 0 and answer.author_id eq user.id )  )  }">
		--%>	
			<span class="btn btn-right btn-width-80" id="invite0" onclick="invite();">
			 邀请采纳
			</span>
		</c:if>
		<c:if test="${showInvited }">
			<span class="btn btn-right btn-width-70" id="invite1"> 已邀请
			</span>
		</c:if>
		<c:if test="${showaccept }">
			<span class="btn btn-right btn-width-70" id="invite1"> 已采纳
			</span>
		</c:if>
		
		
		<div class="title title-2">${not empty answer ?
			answer.author_name:user.name}的回答</div>
	</header>
	
	
			<section class="wrapper-static-chat margin-top-50 margin-bottom-51"
				id="chat-wrapper">
				<c:choose>
				 <c:when test="${user.id eq entity.author_id }">
				<div class="me">
					<div class="chat-box">
						<span class="image"> <img
							src="${basepath}/user/avatar/${entity.author_id}.xhtml?style=80x80&color=gray&r=<%=random%>" />
						</span>
						<div class="content-line-1">${entity.title }</div>
						<label class="arrow set-bg-color"></label>
					</div>
				</div>
				 </c:when>
				 <c:otherwise>
				 	<div class="other">
							<div class="chat-box">
								<span class="image">
								<c:choose>
									<c:when test="${entity.anonymous eq 0}">
										<img src="${basepath}/user/avatar/${entity.author_id}.xhtml?style=80x80&color=gray&r=<%=random%>" />
									</c:when>
									<c:otherwise>
										<img src="${basepath}/static/m_h5/nask/img/nm.png" />
									</c:otherwise>
												
								</c:choose>
								
								</span>
								<div class="name">
									${entity.anonymous eq 0 ? entity.author_name :'匿名' }
								</div>
								<div class="content-line-1">${entity.title}</div>
								<label class="arrow"></label>
							</div>
						</div>
				 </c:otherwise>
				</c:choose>
				<c:if test="${not empty answer }">
				<sns:imTimeLine timestamp="${answer.dateCreated  }">
							<div class="system-info">${ltfun:dateLongToStringFormat(answer.dateCreated ,'yyyy-MM-dd')}</div>
				</sns:imTimeLine>
				<c:choose>
				<c:when test="${user.id eq answer.author_id }">
						<div class="me">
							<div class="chat-box">
								<span class="image"> <img
									src="${basepath}/user/avatar/${answer.author_id}.xhtml?style=80x80&color=gray&r=<%=random%>" />
								</span>
								<div class="content-line-1">
								<c:choose>
									<c:when test="${answer.contenttype  eq 1 }">
										<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${answer.content }-imageView0h520q85"/>
									</c:when>
									<c:otherwise>
										<c:out value="${answer.content }"/>
									</c:otherwise>
								</c:choose>
								</div>
								<label class="arrow set-bg-color"></label>
							</div>
						</div>
				</c:when>
				<c:otherwise>
				<div class="other">
					<div class="chat-box">
						<span class="image"> <img
							src="${basepath}/user/avatar/${answer.author_id}.xhtml?style=80x80&color=gray&r=<%=random%>" />
						</span>
						<div class="name">
							${answer.author_name }
						</div>
						<div class="content-line-1">
						<c:choose>
									<c:when test="${answer.contenttype  eq 1 }">
										<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${answer.content }-imageView0h520q85"/>
									</c:when>
									<c:otherwise>
										<c:out value="${answer.content }"/>
									</c:otherwise>
								</c:choose>
						</div>
						<label class="arrow"></label>
					</div>
				</div>
				</c:otherwise>
				</c:choose>
				</c:if>

				<c:forEach var="item" items="${list }">
				<sns:imTimeLine timestamp="${answer.dateCreated  }">
							<div class="system-info">${ltfun:dateLongToStringFormat(answer.dateCreated ,'yyyy-MM-dd')}</div>
				</sns:imTimeLine>
					<c:choose>
						<c:when test="${user.id ne item.uid }">
							<div class="other">
								<div class="chat-box">
									<span class="image"> 
										<c:choose>
											<c:when test="${entity.author_id eq item.uid and entity.anonymous eq '1' }"><img src="${basepath}/static/m_h5/nask/img/nm.png" /></c:when><c:otherwise><img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=random%>" /></c:otherwise>
										</c:choose>
									</span>
									<div class="name">
										<c:choose>
											<c:when test="${entity.author_id eq item.uid and entity.anonymous eq '1' }">匿名</c:when><c:otherwise>${item.uname}</c:otherwise>
										</c:choose>
									</div>
									<div class="content-line-1">
									<c:choose>
									<c:when test="${item.bodytype  eq 1 }">
										<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.body }-imageView0h520q85"/>
									</c:when>
									<c:otherwise>
									<c:out value="${item.body }"/>
									</c:otherwise>
								</c:choose>
									
									</div>
									<label class="arrow"></label>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="me">
								<div class="chat-box">
									<span class="image"> <img
										src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=random%>" />
									</span>
									<div class="content-line-1">
									<c:choose>
									<c:when test="${item.bodytype  eq 1 }">
										<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.body }-imageView0h520q85"/>
									</c:when>
									<c:otherwise>
										<c:out value="${item.body }"/>
									</c:otherwise>
									</c:choose>
									</div>
									<label class="arrow set-bg-color"></label>
								</div>
							</div>
						</c:otherwise>
					</c:choose>



				</c:forEach>

			</section>
			
			<c:if test="${showsend }">
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
			</c:if>

	<script type="text/javascript"
		src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/ext/enn/js/plupload/plupload.full.min.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
	<script type="text/javascript" src="${basepath}/static/plugins/socket.io/socket.io.js"></script>
	<script type="text/javascript">
		var isCredit = ${entity.credit>0};
		var $chatWrapper;
		var $window;
		var $upLoading;
		var windowSize = [ window.innerWidth, window.innerHeight ];
		var focusStamp = false;
		var isIos = browserUtil.isIos();
		var iconUrl ="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray"; //当前用户头像路径
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

			var sendFlag = true;
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
				if (sendFlag) {
					sendFlag = false;
				} else {
					return;
				}
				
				$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/ask/saveanswer.json",
					data:{content:str,qid:'${entity.id}',authorid:'${author}'},
					success:function(data){
						focusStamp = false;
						createMyChatBox({//插入数据
							type : 'text',
							title : '',
							content : str,
							iconUrl : "${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray",
							imageUrl : '',
							linkUrl : ''
						});

						$input.val('');
						sendFlag = true;
					},
    				error : function() {
						sendFlag = true;
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
			var str = '<img src="'+url+'" />';
			$.ajax({
				type:"GET",
				url:"${basepath}/m/ext/enn/ask/saveanswer.json",
				data:{content:hashid,qid:'${entity.id}',url:url,authorid:'${author}'},
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
		

			//<img src="'+ initMap.imageUrl +'" />
			
		}

		function accept(id) {
			lightDialog.show((isCredit?'该用户会获得悬赏奖励，':'')+'你确认采纳吗？', function() {//确认操作时的回调函数
				$.ajax({
					type : "GET",
					url : '${basepath}/m/ext/enn/ask/accept.json',
					cache : false,
					data : {
						aid : id
					},
					success : function(data) {
						$("#btn-right-1").hide();
						//window.location.href="${basepath}/m/ext/enn/ask/toanswer.xhtml?aid=${answer.id}&qid=${entity.id}";
					},
					error : function() {
					}
				});
				lightDialog.remove();
			}, function() {//取消操作时的回调函数
				lightDialog.remove();
			});
		}
		var flag_invite =true; 
		function invite() {
			if(flag_invite){
				flag_invite = false;
				$.ajax({
					type : "GET",
					url : '${basepath}/m/ext/enn/ask/inviteaccept.json',
					cache : false,
					data : {qid:'${entity.id}'},
					success : function(data) {
						if(data){
							//lightBlock.show('邀请成功');
							$("#invite0").html("已邀请");
							$("#invite0").removeAttr("onclick");
							$("#chat-wrapper").append('<div class="system-info">邀请采纳成功</div>');
						}else{
							lightBlock.show('请先回答问题');
							$("#invite0").attr("onclick","invite();");
						}
					},
					error : function() {
					}
				});
				
			}
			
		}

	var qid = '${entity.id}';
	var authorid='${author}';

	var socket;
	function socketioInit(){
		socket =  io.connect('<%=Constant.WEBSOCKET_SERVER%>?type=im&domain=<%=MwebHelper.getCurrentDomain()%>&id='+qid+'_'+authorid);
		//socket =  io.connect('http://socketio.aijiayou.com:80?type=vote&id=${id}');

		socket.on('connect', function() {
			console.log('Client has connected to the server!');//正常
	
		});

		socket.on('message', function(data) {
			if(null!=data && data.payload!=null){

				if(data.payload.authorid == '${user.id}'){
					return;
				}
				var initMap = {};
				initMap.type = data.payload.type;
				initMap.title = '';
				
				if(initMap.type=='image'){
					initMap.imageUrl = data.payload.content;
				}else{
					initMap.content = data.payload.content;
				}
				
				if('${entity.anonymous}'=='1' && '${user.id}' !='${entity.author_id}'){// 匿名
					initMap.name = '匿名';
					initMap.iconUrl = "${basepath}/static/m_h5/nask/img/nm.png";
				}else{
					initMap.name = data.payload.authorname;
					initMap.iconUrl = "${basepath}/user/avatar/"+data.payload.authorid+".xhtml?style=80x80&color=gray";
				}
				
				initMap.linkUrl = '';
				createOtherChatBox(initMap,false);
				
			}
			console.log(data.payload.id);
		});

		socket.on('disconnect', function() {
			console.log('The client has disconnected!');//连接错误'
			
		});	
		
		
	}	

	socketioInit();

		
	</script>
</body>
</html>

