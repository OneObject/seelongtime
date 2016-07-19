<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
<head>
	<title>${entity.title }</title>
	<style type="text/css">
			html,body{
				-webkit-tap-highlight-color: rgba(255,0,0,0);
			}
	</style>
</head>
<body>
	<div class="temp-box" id="wrapper1">
		<header>
			<div class="title">共<span id="totalnum">${entity.answer_num }</span>回答</div>
			<span class="btn btn-back" id="btn-back"><i
				class="fa fa-angle-left"></i></span>
		</header>
		<section class="wrapper-static">
			
			<div class="module-ask-detail">
				<ul class="block-ask-detail">
					<li>${entity.title } <c:if test="${entity.credit ne 0 }">
							<label class="coin">${entity.credit }分</label>
						</c:if>
					</li>
					<li><span class="date">${entity.userCreated }</span> <label class="image">
						<c:choose>
							<c:when test="${entity.anonymous eq 0}">
							
								<img src="${basepath}/user/avatar/${entity.author_id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" />
							
							</c:when>
							
							<c:otherwise>
							
								<img src="${basepath}/static/m_h5/nask/img/niming.png" />
							
							</c:otherwise>
						
						</c:choose>
						
						</label>
						<div class="from">
							来自<label class="set-color">
							${entity.anonymous eq 0 ? entity.author_name :'匿名' }
							</label>
						</div></li>
					<li class="weixin-imgs-show">${entity.supplement }</li>
				</ul>
				<c:if test="${not empty tags }">
				<div class="show-tags">
					<c:forEach var="tag" items="${tags }">
					
						<span class="set-color">${tag }</span>
						
					</c:forEach>
				</div>
				</c:if>
				<div class="func-line">
					<%-- 
					<span class="line-count"><i class="fa fa-eye"></i>${entity.visitnum }</span>
					--%>
                        <span class="line-count"><i class="fa fa-comments-o"></i><span id="answernum">${entity.answer_num }</span></span> 
					<span class="line-btn set-color" id="btn-answer">回答</span> <span
						class="line-btn set-color" id="btn-invite" >邀请</span>
				</div>
				<div class="answer-box" id="content">
				
				<div class="holder-loading3">
					<i class="fa fa-spinner fa-pulse"></i>正在加载...
				</div>

					
				</div>
			</div>
		</section>
	</div>
	<div class="temp-box ctl-hide" id="wrapper2">
		<header>
			<div class="title" >邀请</div>
			<span class="btn btn-cancel" id="cancel2">取消</span> <span
				class="btn btn-done" id="ensure2">确定</span>
		</header>
		<section class="wrapper-static">
			<div class="module-at-somebody">
				<div class="block-search">
					<span class="search" id="search"><i
						class="fa fa-search set-color"></i></span> 
						<form onsubmit="atlist(1,true);return false;">
						<input class="set-bd-color" type="search" id="search-input" placeholder="请输入人名"> 
						</form>
						<span
						class="delete" id="delete"><i class="fa fa-times set-color"></i></span>
				</div>
				<div class="block-selected-people ${ empty invites ?'ctl-hide':'' }"
					id="block-selected-people">
					<div class="head-line">已选择的人</div>
					<div class="people-box">
					<c:forEach items="${invites }" var="item">
					
						<span class="set-color" id="aid${item.uid }" data-href="abc" data-id="${item.uid }" data-name="${item.uname }">${item.uname }</span>
					
					</c:forEach>
					
					</div>
					
					<input type="hidden" value="${userids }" id="userids" />
                    <input type="hidden" value="" id="uids" />
					
				</div>
				<div class="block-friend-list">				
					<div class="head-line">我的好友</div>
					<div class="selected-list-box"  id="userlist">
							<div class="holder-loading2">
							<i class="fa fa-spinner fa-pulse"></i>正在加载...
							</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div class="temp-box ctl-hide" id="wrapper3">
		<header>
			<div class="title">回答</div>
			<span class="btn btn-cancel" id="cancel3">取消</span> <span
				class="btn btn-done" id="ensure3">发布</span>
		</header>
		<section class="block-fixed-func">
			<div class="wrapper-func" id="func-box2">
				<input type="hidden" value="0" id="anonymous">
				<span class="btn-anonymous" id="btn-anony"> <label><i
						class="fa fa-check"></i></label>匿名
				</span> <span class="btn-image" id="insert-image"> <i
					class="fa fa-picture-o"></i>
				</span>
			</div>
		</section>
		<section class="wrapper-static">
			<!--<div class="holder-loading">-->
			<!--<i class="fa fa-spinner fa-pulse"></i>正在加载...-->
			<!--</div>-->
			<div class="wrapper-text-editor margin-bottom-51">
				<div class="block-title" id="block-title">${entity.title }</div>
				<div class="simple-rich-editor" id="simple-rich-editor"></div>
			</div>
		</section>
	</div>
	<script type="text/javascript" src="${basepath}/static/m_h5/nask/js/jquery-2.1.1.min.js"></script>
       	<script type="text/javascript" src="${basepath}/static/m_h5/nask/js/plupload/plupload.full.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m_h5/nask/js/ask_answer_base.js"></script>
		<script type="text/javascript" src="${basepath}/static/m_h5/js/weixin_img.js"></script>
	<script type="text/javascript">
	var page;
    var atpage;
            $(function () {
            	var btnBack = document.getElementById('btn-back');
                var $searchBtn = $('#search');
                var $deleteBtn = $('#delete');
                var $searchInput = $('#search-input');
                var $btnAnswer = $('#btn-answer');
                var $btnInvite = $('#btn-invite');
                var $wrapper1 = $('#wrapper1');
                var $invite = $('#wrapper2'); 
                var $answer = $('#wrapper3');
                var $cancel2 = $('#cancel2');
                var $ensure2 = $('#ensure2');
                var $cancel3 = $('#cancel3');
                var $ensure3 = $('#ensure3');
                var $blockTitle = $('#block-title');
                var $btnAnony = $('#btn-anony');
                var $insertImage = $('#insert-image');
                
                var $headerList = $('header');
                var $fixedFuncList = $('.block-fixed-func');
                
                $headerList.bind('click', function (e) {
                	e.stopPropagation();
                });
                
                $fixedFuncList.bind('click', function (e) {
                	e.stopPropagation();
                });
                
                $('html,body').bind('click', function (e) {
                	if ($answer.is(':visible')) {
                		$('#simple-rich-editor').focus();
                	}
                });
                
              
                btnBack.onclick = function () {//回到首页
                	window.history.go(-1);
                };                
				
				$btnAnswer.bind('click', function () {
					$answer.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
					simpleRichEditor.createUploader(document.getElementById('insert-image'), document.getElementById('func-box2'), '<%=Constant.QINIU_SERVER%>', '${uptoken}', '<%=Constant.IMG_SERVER_DOWNLOAD%>');
				});
				
				$btnInvite.bind('click', function () {
					atlist(1,false);
					$invite.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
				});	
				
				$cancel2.bind('click', function () {
					$wrapper1.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
				});	

				$ensure2.bind('click', function () {
					$("#uids").val($("#userids").val());
					//$wrapper1.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');

					//邀请好友
					invite();
					
				});	
				
				$cancel3.bind('click', function () {
					$wrapper1.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
				});	

				$ensure3.bind('click', function () {
					//$('.answer-box').prepend('<div>你的答案</div>');
					//$wrapper1.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
					releaseanswer();
				});	

				$btnAnony.bind('click', function () {
					var temp = $(this);
					if (temp.is('.checked')) {
						temp.find('label').removeClass();
						temp.removeClass('checked');
						$("#anonymous").val(0);
					} else {
						temp.find('label').addClass('checked set-bd-color set-bg-color');
						temp.addClass('checked');
						$("#anonymous").val(1);
					}
				});			

				$blockTitle.bind('click', function (e) {					
					var temp = $(this);
					if (temp.is('.open')) {
						temp.removeClass('open');
					} else {
						temp.addClass('open');
					}
					e.stopPropagation();
				});
				
                $deleteBtn.bind('click', function () {
                    $searchInput.val('');
                });
                
                $searchBtn.bind('click', function () {
                	atlist(1,true);
                });
                
                $searchInput.bind('focus', function () {
                    $deleteBtn.show();
                });				
				
                $("textarea").bind("propertychange input",function(){
                    this.style.height = this.scrollHeight + 'px';
                });

                simpleRichEditor.init('simple-rich-editor', '');

                $(".selected-list-box .someone").bind('click', function () {//@好友
                    var temp = $(this);
                    var objTemp;
                    var dataStr = '';
                    var html;
                    objTemp = temp.data();
                    if (temp.is('.selected')) {
                        temp.removeClass('selected');
                        $('#id' + objTemp['id']).remove();
                    } else {
                        temp.addClass('selected');
                        if ($('#id' + objTemp['id']).length !== 0) {
                            return;
                        }
                        for(var prop in objTemp) {
                            if (objTemp.hasOwnProperty(prop)) {
                                dataStr += ' data-' + prop + '="'+ objTemp[prop] +'"';
                            }
                        }
                        html = '<span class="set-color" id="id'+ objTemp['id'] +'"'+ dataStr +'>'+ objTemp['name'] +'</span>';
                        $('#block-selected-people .people-box').append(html);

                    }
                    if ($('.people-box span').length === 0) {
                        $('#block-selected-people').addClass('ctl-hide');
                    } else {
                        $('#block-selected-people').removeClass('ctl-hide');
                    }
                });

                swipeAjax.bindTapEvent(document, function () {//模拟上滑加载
					if ($wrapper1.is(':visible')) {//初始页面
	                	$loading = $('.answer-box .loading');
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
	        				
					} else if ($invite.is(':visible')) {//邀请模块 
	                	$loading = $('.selected-list-box .loading');
	                	if (!$loading.length) {

	                		swipeAjax.setAjaxCount(0);  //这一行必须加
	                		
	                		return;
	                		
	                	}

						if (usertotal <= usercurrent) {
		                	
	                		swipeAjax.setAjaxCount(0);  //这一行必须加
	                		
	                		return;
	                		
    					}
    					
	                    $loading.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
	                    
	                    atpage = atpage+1 ;

	                    atlist(atpage,true);
	        			 					
					} 

                });
            });			
	        									
			var flag=0;		
    		
		function releaseanswer() {

			if (flag == 0) {
				flag = 1;
				var anonymous = $("#anonymous ").val();

				var str = simpleRichEditor.getHtml();
				var content = str.replace(/<br>|<div>|<\/div>/g, '');
				$('#simple-rich-editor').html('');
				if (content == null || content == "") {
					lightBlock.show("请填写回答内容！");
					return;
				}

				var url = "${basepath}/m/h5/nask/answer.json";

				$.ajax({
					type : "POST",
					url : url,
					cache : false,
					data : {
						id : "${entity.id}",
						anonymous : anonymous,
						content : content,
					},
					success : function(data) {
						flag = 0;
						if (data) {
							$('#wrapper1').removeClass('ctl-hide').siblings(
									'.temp-box').addClass('ctl-hide');
							var num = parseInt($('#answernum').html());
							$('#answernum').html(++num);
							$('#totalnum').html(num);
							list(1);
						} else {
							lightBlock.show("保存失败！");
						}

					},
					error : function() {
						flag = 0;
					}
				});
				
			}
		}
		function invite() {

			var uids = $("#uids").val();

			if (uids == null || uids == "") {

				lightBlock.show("请选择好友！");
				return;
			}

			var url = "${basepath}/m/h5/nask/invite.json";

			$.ajax({
				type : "POST",
				url : url,
				cache : false,
				data : {
					id : "${entity.id}",
					uids : uids
				},
				success : function(data) {

					$('#wrapper1').removeClass('ctl-hide')
							.siblings('.temp-box').addClass('ctl-hide');

				},
				error : function() {
				}
			});
		}

		$(function() {

			list(1);

		});

		function list(i) {

			page = i;

			var url = "${basepath}/m/h5/nask/answerlist.list";

			$.ajax({
				type : "GET",
				url : url,
				cache : false,
				data : {
					id : "${entity.id}",
					page : i,
					size : 5
				},
				success : function(response) {

					var tLoading = $('.answer-box .loading');

					if (i == 1) {

						$("#content").html(response);
						if (total > current) {
							$("#content").append(
									'<div class="loading">上滑加载更多</div>');
						} else {

						}
						swipeAjax.setAjaxCount(0);
					} else {
						tLoading.before(response);
						if (total > current) {
							tLoading.html('上滑加载更多');
						} else {
							tLoading.html('已无更多');
						}
						swipeAjax.setAjaxCount(0);
					}

				},
				error : function() {
				}
			});
		}

		var atflag = 0;

		function atlist(i, issearch) {

			if (atflag > 0 && !issearch) {

				return;

			}
			atflag = atflag + 1;

			atpage = i;

			var url = "${basepath}/m/h5/nask/userlist.list";

			$.ajax({
				type : "GET",
				url : url,
				cache : false,
				data : {
					content : $.trim($("#search-input").val()),
					page : i,
					size : 10,

				},
				success : function(response) {

					var tLoading = $('.selected-list-box .loading');

					var userList;
					var $someoneList;

					if (i == 1) {
						$("#userlist").html(response);
						if (usertotal > usercurrent) {
							$("#userlist").append(
									'<div class="loading">上滑加载更多</div>');
						} else {

						}
						swipeAjax.setAjaxCount(0);

					} else {
						tLoading.before(response);
						if (usertotal > usercurrent) {
							tLoading.html('上滑加载更多');
						} else {
							tLoading.html('已无更多');
						}
						swipeAjax.setAjaxCount(0);
					}
					userList = getUserList();

					$someoneList = $('.someone');

					for (var n = 0; n < userList.length; n++) {
						for (var j = 0; j < $someoneList.length; j++) {
							if ($($someoneList[j]).data('id') === userList[n]) {
								$($someoneList[j]).addClass('selected');
							}
						}
					}

				},
				error : function() {
				}
			});
		}

		function getUserList() {
			var userId = $("#userids").val();
			var userIdList = userId.split(',');
			return userIdList;
		}
		function clickSomeoneItem(_this) {
			var temp = $(_this);
			var objTemp;
			var dataStr = '';
			var html;
			var ids = $("#userids").val();
			objTemp = temp.data();
			if (temp.is('.selected')) {
				temp.removeClass('selected');
				$('.people-box #aid' + objTemp['id']).remove();
				ids = ids.replace(objTemp['id'] + ",", "");
				$("#userids").val(ids);
			} else {
				temp.addClass('selected');
				if ($('.people-box #aid' + objTemp['id']).length !== 0) {
					return;
				}
				for ( var prop in objTemp) {
					if (objTemp.hasOwnProperty(prop)) {
						dataStr += ' data-' + prop + '="' + objTemp[prop] + '"';
					}
				}
				html = '<span class="set-color" id="aid'+ objTemp['id'] +'"'+ dataStr +'>'
						+ objTemp['name'] + '</span>';
				$('#block-selected-people .people-box').append(html);
				ids = ids + objTemp['id'] + ",";
				$("#userids").val(ids);
			}
			if ($('.people-box span').length === 0) {
				$('#block-selected-people').addClass('ctl-hide');
			} else {
				$('#block-selected-people').removeClass('ctl-hide');
			}
		}
	</script>
</body>
</html>

