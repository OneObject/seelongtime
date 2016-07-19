<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
	<head>
		<title>${entity.anonymous eq 0 ? entity.author_name :'匿名' }的提问</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css?v=3333333333" />
        <style type="text/css">
            body{
                background: #eee;
            }
            .bg-color-white{
            	background:#fff !important;
            }
        </style>
	</head>
	<body class="bg-color-gray">
        <div class="wrapper-box" id="wrapper-box-1">
            <header>
                <span class="btn btn-left" id="btn-left-1">
                    <i class="fa fa-angle-left"></i>
                </span>
				 <span class="btn btn-right" data-status="${collectionStatus eq 0 ? 'unsaved':'saved'}" data-type="1" onclick="changeSaveState(this,'${entity.id}');" >
                    <i class="fa ${collectionStatus eq 0 ? 'fa-star-o':'fa-star'}"></i>
                </span>
                <div class="title title-2">
                    ${entity.anonymous eq 0 ? entity.author_name :'匿名' }的提问
                </div>
            </header>
            <section class="wrapper-static margin-top-50 margin-bottom-55" id="wrapper-static">
                <div class="answer-box add-answer-box">
                 <c:if test="${entity.anonymous eq 0}">
					<span class="image"  onclick="toUserDetail('${author.id}');"><img
						src="${basepath}/user/avatar/${author.id}.xhtml?style=80x80&color=gray" /></span>
				 </c:if>
				 <c:if test="${entity.anonymous eq 1}">
					<span class="image"  onclick="toUserDetail('${author.id}');"><img src="http://localhost:8080/student/static/m_h5/nask/img/nm.png"></span>
				 </c:if>
                    <ul>
                        <li class="line-people">
						<c:if test="${entity.anonymous eq 0}">
                            <span class="grade">${author.name} | <label>${author_level}</label></span>
                               <c:if test="${author.category eq 1}">
									  <span class="add-icon">
											<span class="icon-zdr"></span>
											<span class="text">指导人</span>
									   </span>
								</c:if>
								<c:if test="${author.category eq 0}">
									  <span class="add-icon">
											 <span class="icon-xs"></span>
											 <span class="text">学生</span>
									  </span>
								</c:if>
								<c:if test="${author.category eq 3}">
									  <span class="add-icon">
											<span class="icon-dr"></span>
											<span class="text">达人</span>
									  </span>
								</c:if>
								<c:if test="${author.authority eq 1}">
									  <span class="add-icon">
											<span class="icon-rz"></span>
											<span class="text">认证</span>
									  </span>
								</c:if>
							</c:if>
							<c:if test="${entity.anonymous eq 1}">
							<span class="grade">匿名 </span>
							</c:if>
								<span class="agree ${zanstatus eq 0 ? 'checked':'' }" data-type="4" onclick="zan(this,'${entity.id}');"><i class="fa ${zanstatus eq 0 ? 'fa-thumbs-up':'fa-thumbs-o-up' }"></i><label>${ajy:praiseTotal(entity.id,4)}</label></span>
                        </li>
                    </ul>
                </div>
				<div class="question-box">
                    <span class="ask-tag">问:</span>
                    <a href="#">
                        <ul>
                            <li class="line-question">
                                <c:if test="${entity.credit ne 0 }">
										<label class="coin">${entity.credit }分</label>
								</c:if>
                                ${entity.supplement }
								
                            </li>
                            <li class="line-time">
                                <span class="ask-time">${ltfun:dateLongToStringFormat(entity.dateCreated,'yyyy-MM-dd HH:mm')}</span>
                                <span class="answer-num">${entity.answer_num }人回答</span>
								<span class="add-view-num">${entity.visitnum}次</span>
                            </li>
                        </ul>
                    </a>
                </div>
                <div class="block-invite" id="block-invite">
                <span class="btn-invite">
                    <i class="fa fa-paper-plane"></i> 邀请回答
                </span>
                </div>
                <div class="answer-list">
                    
                    <div class="loading">上滑加载更多</div>
                    
                </div>

            </section>
            <c:if test="${entity.author_id ne uid  }">
            	<div class="block-answer"  id="block-answer">
               	 	<span class="btn-answer">
                   	 <i class="fa fa-pencil"></i> 我来回答
                	</span>
            	</div>
            </c:if>

        </div>

        <div class="wrapper-box" id="wrapper-box-2"  style="display: none;">

            <header>
                <span class="btn btn-left"  id="btn-left-2">
                    <i class="fa fa-angle-left"></i>
                </span>
                <span class="btn btn-right btn-width-70" id="btn-right-2">
                    确定
                </span>
                <div class="title title-2">
                    邀请回答
                </div>
            </header>
            <section class="wrapper-static margin-top-50">
                <div class="module-at-somebody">
                    <div class="block-search">
                        <span class="search" id="search-2" onclick="atlist(true);"><i class="fa fa-search set-color"></i></span>
                        <form onsubmit="atlist(true);return false;">
                        <input class="set-bd-color" type="search" id="input-2" placeholder="请输入人名">
                        </form>
                        <span class="delete" id="delete-2"><i class="fa fa-times set-color"></i></span>
                    </div>
                    <div class="block-selected-people" id="block-selected-people" style="display: ${ empty invites ?'none':'block' };">
                        <div class="head-line">已选择的人</div>
                        <div class="people-box" id="people-box">
								<c:forEach items="${invites }" var="item">
									<span id="aid${item.uid }" data-href="abc" data-id="${item.uid }" data-name="${item.uname }">${item.uname }</span>
								</c:forEach>
                        </div>
                        
                        <input type="hidden" id="uids" value="${userids }" />
                        
                    </div>
                    
                	<div id="atlist">
                    
                    </div>
                   
                  
                   
              
                </div>
            </section>

        </div>

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
        var isCredit = ${entity.credit>0};
        var answerpage = 1;
            $(function () {
                var $loading;
                var $wrapperBox1 = $('#wrapper-box-1');
                var $wrapperBox2 = $('#wrapper-box-2');
                var $btnLeft1 = $('#btn-left-1');
                var $btnLeft2 = $('#btn-left-2');
                var $btnRight2 = $('#btn-right-2');
                var $blockInvite = $('#block-invite');
                var $blockAnswer = $('#block-answer');
                var $body = $('body');

                var $friendGroupList = $('.block-group-line');
                
                var $btnSearch2 = $('#search-2');
                var $input2 = $('#input-2');
                var $btnDelete2 = $('#delete-2');


                $btnLeft1.bind('click', function () {
                	
                	if("${param.openwin}"=="true"){
                		api.closeWin({
                		    name: 'question_detail',
                		    animation: {
                		        type: 'none'
                		    }
                		});
                		
                	}else{
                    	window.history.go(-1);
                	}
                });

                $blockInvite.bind('click', function () {
                    ctlWrapperShow($wrapperBox2);
                    $body.addClass('bg-color-white');
                    atlist(false);
                });

                $blockAnswer.bind('click', function () {
                    window.location.href = '${basepath }/m/ext/enn/ask/toanswer.xhtml?qid=${entity.id}';
                });

                $btnLeft2.bind('click', function () {
                    setTimeout(function () {
                    	ctlWrapperShow($wrapperBox1);
                        $body.removeClass('bg-color-white');
                    }, 400);
                });

                $btnRight2.bind('click', function () {
                	var uids = $("#uids").val();
        			if (uids == null || uids == "") {
        				lightBlock.show("请选择好友！");
        				return;
        			}
                    setTimeout(function () {
                        ctlWrapperShow($wrapperBox1);
                        $body.removeClass('bg-color-white');
                        //at列表，保存
                        invite(uids);
                    }, 400);
    
                });

                $btnDelete2.bind('click', function () {
                    $input2.val('');
                });

                $btnSearch2.bind('click', function () {
                    //搜索好友
                });

                $input2.bind('focus', function () {
                    $btnDelete2.show();
                });
                
                bindEvent();

                $friendGroupList.bind('click', function () {
                    var temp = $(this);
                    if (temp.is('.closed')){
                        temp.prop('class', 'block-group-line opened');
                        temp.find('i').prop('class', 'fa fa-angle-up');
                        temp.next('.block-friend-list').slideDown(300);
                    } else {
                        temp.prop('class', 'block-group-line closed');
                        temp.find('i').prop('class', 'fa fa-angle-down');
                        temp.next('.block-friend-list').slideUp(300);
                    }
                });

                $(".block-friend-list .someone").bind('click', function () {//@好友
                    var temp = $(this);
                    var objTemp;
                    var dataStr = '';
                    var html;
                    objTemp = temp.data();
                    if (temp.is('.selected')) {
                        temp.removeClass('selected');
                        $('#aid' + objTemp['id']).remove();
                    } else {
                        temp.addClass('selected');
                        if ($('#aid' + objTemp['id']).length !== 0) {
                            return;
                        }
                        for(var prop in objTemp) {
                            if (objTemp.hasOwnProperty(prop)) {
                                dataStr += ' data-' + prop + '="'+ objTemp[prop] +'"';
                            }
                        }
                        html = '<span id="aid'+ objTemp['id'] +'"'+ dataStr +'>'+ objTemp['name'] +'</span>';
                        $('#block-selected-people .people-box').append(html);

                    }
                    if ($('.people-box span').length === 0) {
                        $('#block-selected-people').hide();
                    } else {
                        $('#block-selected-people').show();
                    }
                });

                swipeAjax.bindTapEvent(document, function () {//上滑回调
                    $loading = $('.answer-list .loading');
                    if (!$loading.length) {
                        return;
                    }
                    if (answertotal <= answercurrent) {
						swipeAjax.setAjaxCount(0); //这一行必须加 
						return;
					}
                    answerpage = answerpage + 1;
                    list(answerpage);
                });

                function ctlWrapperShow($obj) {
                    $obj.show().siblings('.wrapper-box').hide();
                }

                function bindEvent() {
                    var $btnAgreeList = $('.line-people .agree');
                   // var $btnAcceptList = $('.line-time .accept');
                    $btnAgreeList.unbind('click');
                   // $btnAcceptList.unbind('click');
                    $btnAgreeList.bind('click', function () {
                        var temp = $(this);
                        var num = parseInt(temp.find('label').html());
                        if (temp.is('.checked')) {
                            temp.removeClass('checked');
                            temp.find('i').replaceWith('<i class="fa fa-thumbs-o-up"></i>');
                            temp.find('label').html(--num);
                        } else {
                            temp.addClass('checked');
                            temp.find('i').replaceWith('<i class="fa fa-thumbs-up"></i>');
                            temp.find('label').html(++num);
                        }
                    });



                }
            });

            $(function() {
    			list(1);
    		});
			
            function list(i){
            	var  $loading1 = $('.answer-list .loading');
            	$loading1.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
                if(i==1){
                	$('.answer-list').html('<div class="loading"><i class="fa fa-spinner fa-pulse"></i>正在加载...</div>');	
                	$loading1 = $('.answer-list .loading');
                }
            	$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/ask/answerlist.list",
					data:{id : "${entity.id}",
						page : i,
						size : 5},
					cache:false,
					success:function(html){
						$loading1.before(html);
						if(answertotal>answercurrent){
							$loading1.html('上滑加载更多');
						}else if(answertotal!=1&&answercurrent!=1){
							$loading1.html('已无更多');
						}else if(answertotal == 0 || answertotal == 1 ){
							$loading1.html("");
						}

						
						swipeAjax.setAjaxCount(0);  //这一行必须加
					}
				});
            }


            function accept(id){
            	lightDialog.show((isCredit?'该用户会获得悬赏奖励，':'')+'你确认采纳吗？', function () {//确认操作时的回调函数
            	 	$.ajax({
                		type : "GET",
        				url : '${basepath}/m/ext/enn/ask/accept.json',
        				cache : false,
        				data:{aid:id},
        				success : function(data) {
        					list(1);
        				},
        				error : function() {
        				}
    				});
                    lightDialog.remove();
                }, function () {//取消操作时的回调函数
                    lightDialog.remove();
                });
            }




        	var atflag = 0 ;
    		function atlist(issearch) {
				if(atflag > 0 && !issearch){
					return;
				}else{
    				$("#atlist").html('<div class="loading"><i class="fa fa-spinner fa-pulse"></i>正在加载...</div>');
				}
				atflag = atflag + 1;
    			var url = "${basepath}/m/ext/enn/ask/atlist.list";
    			$.ajax({
    				type : "GET",
    				url : url,
    				cache : false,
    				data : {
        				content:$.trim($("#input-2").val()),
    				},
    				success : function(html) {
    					$(".module-at-somebody .loading").remove();
    					$("#atlist").html(html);
    					//绑定事件初始化
    					$('.block-group-line').bind('click', function () {
    	                    var temp = $(this);
    	                    if (temp.is('.closed')){
    	                        temp.prop('class', 'block-group-line opened');
    	                        temp.find('i').prop('class', 'fa fa-angle-up');
    	                        temp.next('.block-friend-list').slideDown(300);
    	                    } else {
    	                        temp.prop('class', 'block-group-line closed');
    	                        temp.find('i').prop('class', 'fa fa-angle-down');
    	                        temp.next('.block-friend-list').slideUp(300);
    	                    }
    	                });


    					$(".block-friend-list .someone").bind('click', function () {//@好友
    	                    var temp = $(this);
    	                    var objTemp;
    	                    var dataStr = '';
    	                    var html;
    	                    var ids = $("#uids").val();
    	                    objTemp = temp.data();
    	                    if (temp.is('.selected')) {
    	                        temp.removeClass('selected');
    	                        $('#aid' + objTemp['id']).remove();
    	                        ids = ids.replace(objTemp['id']+",","");
    	                       	$("#uids").val(ids);
    	                    } else {
    	                        temp.addClass('selected');
    	                        if ($('#aid' + objTemp['id']).length !== 0) {
    	                            return;
    	                        }
    	                        for(var prop in objTemp) {
    	                            if (objTemp.hasOwnProperty(prop)) {
    	                                dataStr += ' data-' + prop + '="'+ objTemp[prop] +'"';
    	                            }
    	                        }
    	                        html = '<span id="aid'+ objTemp['id'] +'"'+ dataStr +'>'+ objTemp['name'] +'</span>';
    	                        $('#block-selected-people .people-box').append(html);
    	                        ids = ids + objTemp['id'] +",";
    	                        $("#uids").val(ids);

    	                    }
    	                    if ($('.people-box span').length === 0) {
    	                        $('#block-selected-people').hide();
    	                    } else {
    	                        $('#block-selected-people').show();
    	                    }
    	                });

						var userlist = getAtList();
						var $someoneList = $(".someone");
						for (var n = 0; n < userlist.length; n++) {
							for (var j = 0; j < $someoneList.length; j++) {
								if ($($someoneList[j]).data('id') === userlist[n]) {
									$($someoneList[j]).addClass('selected');
									
								}								
							}
						}
    	                
    				},
    				error : function() {
    				}
    			});
    		}


			
    		function getAtList() {
				var arr = [];
				var $spanList = $('#people-box').find('span');
				for (var i = 0; i < $spanList.length; i++) {
					arr.push($($spanList[i]).data('id'));
				}
				return arr;
			}


    		function invite(uids) {
    			var url = "${basepath}/m/ext/enn/ask/invite.json";
    			$.ajax({
    				type : "POST",
    				url : url,
    				cache : false,
    				data : {
    					id : "${entity.id}",
    					uids : uids
    				},
    				success : function(data) {
    				},
    				error : function() {
    				}
    			});
    		}

    		function zan(_this,id){
	    			var temp = $(_this);
	    			var type=$(_this).data('type');
					$.ajax({
	            		type : "GET",
	    				url : '${basepath}/m/ext/enn/ask/praise.json',
	    				cache : false,
	    				data:{resid:id,type:type},
	    				success : function(data) {
    	                        var num = parseInt(temp.find('label').html());
    	                        if(type==3){
								if (temp.is('.checked')) {
    	                            temp.removeClass('checked');
    	                            temp.find('i').replaceWith('<i class="fa fa-thumbs-o-up"></i>');
    	                            temp.find('label').html(--num);
    	                        } else {
    	                            temp.addClass('checked');
    	                            temp.find('i').replaceWith('<i class="fa fa-thumbs-up"></i>');
    	                            temp.find('label').html(++num);
    	                        }
								}else if(type==4){
								if (temp.is('.checked')) {
    	                            temp.addClass('checked');
    	                            temp.find('i').replaceWith('<i class="fa fa-thumbs-up"></i>');
    	                        } else { 
									temp.removeClass('checked');
    	                            temp.find('i').replaceWith('<i class="fa fa-thumbs-o-up"></i>');
    	                           
    	                        }
								}
	    				},
	    				error : function() {
	    				}
					});
                       
		

        	}

			function changeSaveState(_this,id) {
                var $temp = $(_this);
                var status = $temp.data('status');
	    		var type=$(_this).data('type');
				$.ajax({
	            		type : "GET",
	    				url : '${basepath}/m/ext/enn/ask/collection.json',
	    				cache : false,
	    				data:{resid:id,type:type},
	    				success : function(data) {
                if (status === 'unsaved') {
					lightBlock.show("收藏成功");
                    $temp.find('i')[0].className = 'fa fa-star';
                    $temp.data('status', 'saved');
                } else if (status === 'saved') {
					lightBlock.show("取消收藏");
                    $temp.find('i')[0].className = 'fa fa-star-o';
                    $temp.data('status', 'unsaved');
                }
						},
							error : function() {
	    				}
					});
            }
            
        </script>
	</body>
</html>
