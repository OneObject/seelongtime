<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<html>
<head>
<title>TA的资料</title>
<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
<style type="text/css">
	body{
		background:#eee;
	}
</style>
</head>
<body class="bg-color-gray">
     <!--   <section class="wrapper-static margin-bottom-8" id="wrapper-static">
            <div class="my-info-box">
                <div class="bell-box">
                    <span class="btn-back" id="btn-back">
                        <i class="fa fa-angle-left"></i>
                    </span>
                </div>
                <div class="grade-1">
                    <div class="grade-2">
                        <div class="grade-3">
                            <img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray" />
                            <span>${userCreditLevelInfo.creditLevel.name}</span>
                        </div>
                    </div>
                </div>
                <div class="btns">
                    <span class="btn btn-rank"  onclick="toRank('${user.id}');">排行</span>
                     <c:if test="${!isme }">
                    <c:if test="${!ismyfriend}">
                    <span class="btn btn-add-friend"  data-status="" onclick="addFriend(this, ${ismyfriend});">加好友${uid }</span>
                    </c:if>
                    <c:if test="${ismyfriend}">
                    <span class="btn btn-add-friend"  data-status="added" >已添加 </span>
                    </c:if>
                 </c:if>
                  
                </div>
                <div class="my-name">
                    ${user.name} 
                </div>
                <div class="line-info">
                    <ul>
                        <li>${adopt}%</li>
                        <li>采纳率</li>
                    </ul>
                    <ul>
                        <li>${userCreditLevelInfo.credit}</li>
                        <li>财富值</li>
                    </ul>
                    <ul>
                        <li>${countFriend}</li>
                        <li>好友</li>
                    </ul>
                </div>
            </div> -->
					
<div class="new-student-box">
                <span class="btn-back" id="btn-back">
                    <i class="fa fa-angle-left"></i>
                </span>
                <div class="student-box-header">
                    <div class="man">
                        <img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray" />
                        <span>${userCreditLevelInfo.creditLevel.name}</span>
                    </div>
                    <ul>
                        <li>
                            <span class="list-intro">身份</span>
                            <div class="items-box">
                                <div class="item">
                                    <div class="item-wrapper">
                                       <c:if test="${user.category==1}">
												<span class="icon-zdr"></span>
                                                <label>指导人</label>
												</c:if>
												     <c:if test="${user.category==0}">
												<span class="icon-xy"></span>
                                                <label>学员</label>
												</c:if>
												     <c:if test="${user.category==3}">
												<span class="icon-dr"></span>
                                                <label>达人</label>
												</c:if>
                                    </div>
                                </div>
                               
                                <div class="item">
                                    <div class="item-wrapper">
                                        <c:if test="${user.authority==1}">
                                                <span class="icon-rz"></span>
                                                <label>认证</label>
												</c:if>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <span class="list-intro">成就</span>
                            <div class="items-box">
                                <div class="items-wrapper-box">
                                <div class="items-wrapper" id="items-wrapper">
                                    <div class="item">
                                        <div class="item-wrapper">
                                           
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>
                            <label class="arrow" id="transiton-arrow" data-target="items-wrapper"  data-status="close" onclick="elementTransition(this);" style="display:none">
                                <i class="fa fa-angle-right"></i>
                            </label>
                        </li>
                    </ul>
                </div>

                <div class="student-box-footer">
                    <div class="man-name">
                        <span>  ${user.name} </span>
                        <label id="department"></label>
                    </div>
                    <div class="line-info">
                        <ul>
                            <li>${adopt}%</li>
                            <li>采纳率</li>
                        </ul>
                        <ul>
                            <li>${userCreditLevelInfo.credit}</li>
                            <li>财富值</li>
                        </ul>
                        <ul onclick="window.location.href='${basepath }/m/ext/enn/user/findanotherfrined.xhtml?uid=${user.id}'">
                            <li>${countFriend}<span>查看</span></li>
                            <li>好友</li>
                        </ul>
                    </div>
                </div>

            </div>
            <div class="student-func-line">
                <ul onclick="window.location.href='${basepath }/m/ext/enn/sns/chat.xhtml?type=0&to=${user.id}';">
                    <li class="message"></li>
                    <li>私信</li>
                </ul>
                <ul onclick="toRank('${user.id}');">
                    <li class="rank"></li>
                    <li>排行榜</li>
                </ul>
              
				<ul>
				<input type="hidden" id="ismyfriend" name="ismyfriend" value="${ismyfriend}"/>
				<!--<c:if test="${!isme }">
                    <c:if test="${!ismyfriend}">
					 <div id="addfriend" onclick="addFriend(this, ${ismyfriend});">
                    <li class="add"></li>
                    <li>加好友</li>
					</div>
                    </c:if>
                    <c:if test="${ismyfriend}">
					<div id="deletefriend" onclick="deleteFriend(this, ${ismyfriend});">
                   
					</div>
                    </c:if>
                 </c:if>-->
				<div id="showfriend">
				
				</div>

                </ul>
            </div>
            <div class="favorite-tags">
                <div class="favorite-tags-header">
                    他感兴趣的标签
                </div>
                <div class="favorite-tags-footer">
                     <div class="tags" id="tags">
                               
                            </div>
                <!--    <span class="arrow">

                    </span> -->
                </div>
            </div>

            <div class="tab-message-list" id="tab-message-list">
                <div class="active" id="btn-list-1" data-href="message-list-1">
                    <span><label>他的提问</label></span>
                </div>
                <div id="btn-list-2" data-href="message-list-2">
                    <span><label>他的回答</label></span>
                </div>
                <div id="btn-list-3" data-href="message-list-3">
                    <span><label>他的微课</label></span>
                </div>
            </div>

            <div class="module-list module-about-list" id="message-list-1">


				<div class="loading">上滑加载更多</div>
            </div>
            <div class="module-list module-about-list"  id="message-list-2" style="display: none;">
				
				<div class="loading">上滑加载更多</div>
			
			</div>
            <div class="module-list module-course-list"  id="message-list-3"  style="display: none;">
				<div class="loading">上滑加载更多</div>
			</div>

        </section>
		<div class="block-answer">
                <span class="btn-answer" onclick="javascript:window.location.href='${basepath}/m/ext/enn/ask/index.xhtml';">
                     返回首页
                </span>
        </div>

           <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
   

        <script type="text/javascript">
			var page1 = 1;
			var page2 = 1;
			var page3 = 1;

			var $adopt;
            var $credit;
            var $friendcount;
            var $grade3;
			var $department;
			var $task;
			var $tags;
			var $transiton;
			var $friendstate;
			var windowW = window.innerWidth;
			var $showfriend ;
            var itemW = (window.innerWidth - 152) / 4;

			 function elementTransition(_this) {
                var $temp = $(_this);
                var status = $temp.data('status');
                var target = $temp.data('target');
                var $target = $('#' + target);

                if (status === 'close') {
                    $temp.find('i')[0].className = 'fa fa-angle-left';
                    $temp.data('status', 'open');
                    $target.css('left', (- itemW * 4) + 'px' );
                } else {
                    $temp.find('i')[0].className = 'fa fa-angle-right';
                    $temp.data('status', 'close');
                    $target.css('left',  '0' );
                }
            }
			$(function () {
				
                var $btnBack = $('#btn-back');
                var $loading;
                var $tabListBtns = $('#tab-message-list div');
                var $messageList1 = $('#message-list-1');
                var $messageList2 = $('#message-list-2');
                var $messageList3 = $('#message-list-3');
				var hash = getAboutHash();
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
                    $messageList1.show().siblings('.module-list').hide();
                    if (!stateMap.wrapper1Showed) {
                        stateMap.wrapper1Showed = true;
                        listanswerme(1,'me');

                    }
                }
				
                function showWrapperBox2() {
                    $messageList2.show().siblings('.module-list').hide();
                    if (!stateMap.wrapper2Showed) {
                        stateMap.wrapper2Showed = true;
                        listanswerme(1,'meAnswer');
                    }
                }

                function showWrapperBox3() {
                    $messageList3.show().siblings('.module-list').hide();
                    if (!stateMap.wrapper3Showed) {
                        stateMap.wrapper3Showed = true;
                        //ajax请求，异步加载
                        listcourse(1);
                    }
                }
     

             $tabListBtns.bind('click', function () {
                    var $temp = $(this);
                    var href = $temp.data('href');

                    $temp.addClass('active').siblings().removeClass('active');
                    switch (href) {
                        case 'message-list-1':
                            //window.location.hash = 'a';
                            setAboutHash('a');
                            showWrapperBox1();
                            break;
                        case 'message-list-2':
                            //window.location.hash = 'b';
                            setAboutHash('b');
                            showWrapperBox2();
                            break;
                        case 'message-list-3':
                            //window.location.hash = 'c';
                            setAboutHash('c');
                            showWrapperBox3();
                            break;
                        default:
                            console.log('不存在该模块！');
                    }
                });


                $btnBack.bind('click', function () {
                	delCookie("aboutsomebodyTag");
                    window.history.go(-1);
                    
                });

                swipeAjax.bindTapEvent(document, function () {//上滑回调
                    if ($messageList1.is(':visible')) {
                        $loading = $messageList1.find('.loading');
                        if (!$loading.length) {
                            return;
                        }
                        if (metotal <= mecurrent) {
    						swipeAjax.setAjaxCount(0); //这一行必须加 
    						return;
    					}
						page1 = page1+1;
						listanswerme(page1,'me');
                    }

                    if ($messageList2.is(':visible')) {
                        $loading = $messageList2.find('.loading');
                        if (!$loading.length) {
                            return;
                        }
                        if (meAnswertotal <= meAnswercurrent) {
    						swipeAjax.setAjaxCount(0); //这一行必须加 
    						return;
    					}
						page2 = page2+1;
						listanswerme(page2,'meAnswer');
                        
                        
                    }

                    if ($messageList3.is(':visible')) {
                        $loading = $messageList3.find('.loading');
                        if (!$loading.length) {
                            return;
                        }
                        if (coursetotal <= coursecurrent) {
    						swipeAjax.setAjaxCount(0); //这一行必须加 
    						return;
    					}
                        page3 = page3+1;
                        listcourse(page3);
                    }

                });
            });

			$(function(){
				
				$adopt = $('#adopt');
                $credit = $('#credit');
                $friendcount = $('#friendcount');
                $grade3 = $('#grade-3');
                $myname = $('#myname');
                $department = $('#department');
				$task=$('#items-wrapper');
				$tags = $('#tags');
				$transiton=$("#transiton-arrow");
				$friendstate = $("#ismyfriend").val();
				$showfriend = $("#showfriend");
				$('#items-wrapper').width(itemW * 7 + 'px');
                $('#items-wrapper .item').width(itemW + 'px');
			
				//listanswerme(1,'me');
				userinfo();
				showfriend();
			});

			function showfriend() {
				var $deletefriend = $("#deletefriend");
				var $addfriend = $("#addfriend");
					$.ajax({
					type : "GET",
					url : "${basepath}/m/ext/enn/user/showfriend.json",
					cache : false,
					data:{uid : "${user.id}"},
					success:function(map){
						
						if(map.ismyfriend==true){
						$showfriend.html('<div onclick="deleteFriend(this, ${ismyfriend});"><li class="delete"></li><li>删除好友</li></div>');
						}else{
						$showfriend.html('<div onclick="addFriend(this, ${ismyfriend});"><li class="add"></li><li>加好友</li></div>');
						}

					},

				});
					
				
			}
			
			  function userinfo(){
	    			$.ajax({
	    				type : "GET",
	    				url : "${basepath}/m/ext/enn/user/userInfo.json",
	    				cache : false,
	    				data : {
	    					"somebodyuid":"${user.id}"
	    				},
	    				success : function(map) {
	    				var str = '';
						var str2 = '';
						var taskcount=map.task.length;
    					$adopt.html(map.adopt+"%");
    					$credit.html(map.userCreditLevelInfo.credit);
    		            $friendcount.html(map.countFriend+'<span>查看</span>');
   		           		//$grade3.html('<img src="${basepath}/user/avatar/'+ src +'.xhtml?style=80x80&color=gray&v=<%=System.currentTimeMillis() %>" /><span>'+ name +'</span>');
   	                	$myname.html(map.user.name);
        				$department.html(map.org.name);
						for(var j=0; j<map.task.length;j++){
							if(map.task[j].id!==("sjwx")){
								str += '<div class="item"><div class="item-wrapper"><span class="icon-'+map.task[j].id+'"></span> <label >'+map.task[j].name+'</label></div></div>';
							}else{	
								taskcount=taskcount-1;
							}
					
						}
						
						$task.html(str);
						if(taskcount>4){
							$transiton.show();
						}
						for(var k=0; k<map.tags.length;k++){
						str2+= '<label>'+map.tags[k].name+'</label>';
						}
						$tags.html(str2);
						$('#items-wrapper').width(itemW * 7 + 'px');
						$('#items-wrapper .item').width(itemW + 'px');
	        			
	    				},
	    				error : function() {
	    				}
	    			});

	    		}
		

            function listanswerme(i,model){
			
                var $loading1 ;
                var t ;
                var c ;
                if(model == 'me'){
            		$loading1 = $('#message-list-1 .loading');
                }else if(model == 'meAnswer'){
                	$loading1 = $('#message-list-2 .loading');
                }
                
            	$loading1.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
            	$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/ask/list.list?somebodyUid=${user.id}",
					data:{model:model,page : i,size :20},
					cache:false,
					success:function(html){
						$loading1.before(html);
						if(model === 'me'){
		            		t = metotal;
		            		c = mecurrent;
						}
						if(model === 'meAnswer'){
		            		t = meAnswertotal;
		            		c = meAnswercurrent;
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
		
		  function listcourse(i){
		
              var $loading_course ;
              var t ;
              var c ;
             
              	$loading_course = $('#message-list-3 .loading');
              
          	$loading_course.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
          	$.ajax({
					
					type:"GET",
					url:"${basepath}/m/ext/enn/coach/courselist.list?uid=${user.id}",
					data:{page : i,size :20 , category : "${user.category}" },
					cache:false,
					success:function(html){
						$loading_course.before(html);
		            		t = coursetotal;
		            		c = coursecurrent;
		            		if(t>c){
								$loading_course.html('上滑加载更多');
							}else if(t!=1&&c!=1){
								$loading_course.html('已无更多');
							}else{
								$loading_course.html("");
							}
						swipeAjax.setAjaxCount(0);  //这一行必须加
					}
				});
          }

            function todetail(id,inviteid){
				window.location.href="${basepath}/m/ext/enn/ask/detail.xhtml?id="+id+"&inviteid="+inviteid;
            }
            function toRank(id){
				window.location.href="${basepath}/m/ext/enn/rank/rank.xhtml?id="+id;
            }
            
            
			function addFriend(_this, judge) {
				var $temp = $(_this);
				var $addfriend = $("#addfriend");
				var friend = $("#ismyfriend");
				var $ismyfriend = friend.val()=="true";
				if ($ismyfriend) {
					$showfriend.html('<div onclick="deleteFriend(this, ${ismyfriend});"><li class="delete"></li><li>删除好友</li></div>');
					return;
				}
				
				lightDialog.show('确认添加${user.name}为好友吗？', function () {

					$.ajax({
					type : "GET",
					url : "${basepath}/m/ext/enn/user/addfriend.json",
					cache : false,
					data:{uid : "${user.id}"},
					success:function(map){

						$showfriend.html('<div onclick="deleteFriend(this, ${ismyfriend});"><li class="delete"></li><li>删除好友</li></div>');
						lightDialog.remove();
						friend.val(map.ismyfriend);
						lightBlock.show("添加成功!");
						
					},

				});
					
				} ,function () {
					lightDialog.remove();
				});
			}
			
			 
			function deleteFriend(_this, judge) {
				var $temp = $(_this);
				var friend = $("#ismyfriend");
				var $deletefriend = $("#deletefriend");
				var status = $temp.data('status');
				var $ismyfriend = friend.val()=="true";
				
				if (!$ismyfriend) {
					$showfriend.html('<div onclick="addFriend(this, ${ismyfriend});"><li class="add"></li><li>加好友</li></div>');
					return;
				}
				
				lightDialog.show('确认删除好友${user.name}吗？', function () {
					var $deletefriend = $("#deletefriend");
					$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/user/deletefriend.json",
					cache : false,
					data:{uid : "${user.id}"},
					success:function(map){
					$showfriend.html('<div onclick="addFriend(this, ${ismyfriend});"><li class="add"></li><li>加好友</li></div>');
					//location.reload();
					friend.val(map.ismyfriend);
					lightDialog.remove();	
					lightBlock.show("删除成功!");
					},

				});
					
				} ,function () {
					lightDialog.remove();
				});
			}
			
			function setAboutHash(tag){
            	
            	setCookie("aboutsomebodyTag",tag);
            }
			
            function getAboutHash(){
            	var tag = getCookie("aboutsomebodyTag");
            	if(tag==null || tag==""){
            		return "a";
            	}
            	return tag;
            }
			
			function toTagQuesetionList(tagid){
            	window.location.href = "${basepath}/m/ext/enn/ask/questions.xhtml?model=tag&tagid="+tagid;

            }
		
        </script>
</body>
</html>