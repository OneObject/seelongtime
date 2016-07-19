<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
	<head>
		<title>通讯录</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
	</head>
	<body>
        <div class="wrapper-box" id="wrapper-box-2" >
            <header>
                <span class="btn btn-left"  id="btn-left-2">
                    <i class="fa fa-angle-left"></i>
                </span>
                
                <span class="btn btn-right btn-add-friend2" id="btn-right-2">
                  
                </span>
                
                <div class="title title-2">
                   通讯录
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
                 
                    <div id="atlist">
                    
                    </div>
                    
                    
                    
                    
                </div>
            </section>

        </div>
	    
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/plupload/plupload.full.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js?v=22"></script>
        <script type="text/javascript">
            $(function () {
                var $wrapperBox2 = $('#wrapper-box-2');
                var $btnLeft1 = $('#btn-left-1');
                var $btnRight1 = $('#btn-right-1');
                var $btnRight2 = $('#btn-right-2');
                var $btnLeft2 = $('#btn-left-2');
                var $btnLeft3 = $('#btn-left-3');
                var $btnRight3 = $('#btn-right-3');
                var $btnSearch2 = $('#search-2');
                var $input2 = $('#input-2');
                var $btnDelete2 = $('#delete-2');
                var $btnSearch3 = $('#search-3');
                var $input3 = $('#input-3');
                var $btnDelete3 = $('#delete-3');
                var $btnInsertImage = $('#btn-insert-image');
                var $btnAt = $('#btn-at');
                var $btnAnony = $('#btn-anony');
                var $btnReward = $('#btn-reward');
                var $blockScoreBox = $('#block-score-box');
                var $scoreList = $('#score-list label');
                var $blockFixedFunc = $('#block-fixed-func');
                var $loading;


                $btnLeft2.bind('click', function () {
                   window.history.go(-1);
                // window.location.href="${basepath}/m/ext/enn/ask/index.xhtml#e";
                });
                
                $btnRight2.bind('click', function () {
                	window.location.href = '${basepath }/m/ext/enn/sns/addfriend.xhtml';
                });
                





                $btnDelete2.bind('click', function () {
                    $input2.val('');
                    atlist(true);
                });

                $btnSearch2.bind('click', function () {
                    //搜索好友
                });

                $input2.bind('focus', function () {
                    $btnDelete2.show();
                });



            });   



			$(function(){
				atlist(false);
			});



			var atflag = 0 ;
    		function atlist(issearch) {
				if(atflag > 0 && !issearch){
					return;
				}else{
    				$("#atlist").html('<div class="loading"><i class="fa fa-spinner fa-pulse"></i>正在加载...</div>');
				}
				atflag = atflag + 1;
    			var url = "${basepath}/m/ext/enn/sns/addresslist.list";
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


    	                
    				},
    				error : function() {
    				}
    			});
    		}


			
            

        </script>
	</body>
</html>
