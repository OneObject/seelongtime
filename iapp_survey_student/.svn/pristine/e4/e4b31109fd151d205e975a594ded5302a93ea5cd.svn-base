<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
	<head>
		<title>添加问题</title>
		<style type="text/css">
			html,body{
				-webkit-tap-highlight-color: rgba(255,0,0,0);
			}
		</style>
	</head>
	<body>
        <div class="temp-box" id="wrapper1">
            <header>
                <div class="title">添加问题</div> 
                <span class="btn btn-cancel"  id="cancel1">取消</span>   
                <span class="btn btn-done" id="ensure1_1" onclick="taglist(1,false)">下一步</span>                
                <!--<span class="btn btn-done" id="ensure1">提交</span>-->     
            </header>
            <section class="block-fixed-func">
                <div class="wrapper-func"  id="func-box1">
                    <span class="btn-anonymous" id="btn-anony">
                        <label><i class="fa fa-check"></i></label>匿名
                        <input type="hidden" id="anonymous" value="0" />
                    </span>
                    <span class="btn-reward set-color" id="btn-reward">悬赏</span>
                    	<input type="hidden" id="score" value="0" />
                    <span class="btn-description set-color" id="btn-description">添加描述</span>
                </div>
            </section>
            <section class="wrapper-static">
                <!--<div class="holder-loading">-->
                <!--<i class="fa fa-spinner fa-pulse"></i>正在加载...-->
                <!--</div>-->
                <div class="wrapper-text-editor margin-bottom-51">
                    <textarea id="title" placeholder="请写下您的问题"></textarea>
                </div>
            </section>
        </div>
        <div class="temp-box ctl-hide" id="wrapper2">
            <header>
                <div class="title">描述问题</div>
                <span class="btn btn-cancel" id="cancel2">取消</span>
                <span class="btn btn-done" id="ensure2">完成</span>
            </header>
            <section class="block-fixed-func">
                <div class="wrapper-func" id="func-box2">
                    <span class="btn-image" id="insert-image">
                        <i class="fa fa-picture-o"></i>
                    </span>
                    <span class="btn-at" id="btn-at" onclick="atlist(1,false);">
                        <i class="fa fa-at"></i>
                    </span>
                </div>
            </section>
            <section class="wrapper-static">
                <div class="wrapper-text-editor margin-bottom-51">
                    <div class="simple-rich-editor" id="simple-rich-editor"></div>
                </div>
            </section>
        </div>
        <div class="temp-box ctl-hide" id="wrapper3">
            <header>
                <div class="title">@他</div>
                <span class="btn btn-cancel" id="cancel3">取消</span>
                <span class="btn btn-done" id="ensure3">确定</span>
            </header>
            <section class="wrapper-static">
              
                <div class="module-at-somebody">
                    <div class="block-search">
                        <span class="search" id="search"><i class="fa fa-search set-color"></i></span>
                        
                        <form onsubmit="atlist(1,true);return false;">
                        <input class="set-bd-color" type="search" id="search-input" placeholder="请输入人名">
                        </form>
                        
                        <span class="delete" id="delete"><i class="fa fa-times set-color"></i></span>
                    </div>
                    <div class="block-selected-people ctl-hide" id="block-selected-people">
                        <div class="head-line">已选择的人</div>
                        <div class="people-box" id="people-box">

                        </div>
                        <input type="hidden" value="" id="userids" />
                        <input type="hidden" value="" id="uids" />
                    </div>
                    <div class="block-friend-list" >
                    
                        <div class="head-line">我的好友</div>
                        
                        <div class="selected-list-box" id="userlist">
                        
                        	<div class="holder-loading">
                        	
                				<i class="fa fa-spinner fa-pulse"></i>正在加载...
                				
                			</div>
                            
                         
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <div class="temp-box ctl-hide" id="wrapper4">
            <header>
                <div class="title title1">为问题添加分类</div>
                <span class="btn btn-back" id="cancel4"><i class="fa fa-angle-left"></i></span>
                <span class="btn btn-done" id="ensure4">提交</span>
            </header>
            <section class="wrapper-static">
                <div class="module-add-tag">
                    <div class="block-search">
                        <span class="search" id="search-tag"><i class="fa fa-search set-color"></i></span>
                        
                        <form onsubmit="taglist(1,true);return false;">
                        <input  class="set-bd-color" type="search" id="search-input-tag" placeholder="请输入分类名">
                       	</form>
                       	
                        <span class="delete" id="delete-tag"><i class="fa fa-times set-color"></i></span>
                    </div>
                    <div class="block-selected-tag ctl-hide" id="block-selected-tag">
                        <div class="head-line">已添加的分类</div>
                        <div class="tag-box" id="tag-box">

                        </div>
                        <input type="hidden" value="" id="tagids" />
                    </div>
                    <div class="block-tag-list">
                        <div class="head-line">分类</div>
                        <div class="selected-tag-list" id="tagcontent">
                        	
               				 <div class="holder-loading">
                				<i class="fa fa-spinner fa-pulse"></i>正在加载...
                			</div>
                        	 
                         
                         	
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script type="text/javascript" src="${basepath}/static/m_h5/nask/js/jquery-2.1.1.min.js"></script>
       	<script type="text/javascript" src="${basepath}/static/m_h5/nask/js/plupload/plupload.full.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m_h5/nask/js/ask_answer_base.js"></script>
        <script type="text/javascript">
			var tagpage = 0;
			var atpage = 0;
            $(function () {
                var $searchBtn = $('#search');
                var $deleteBtn = $('#delete');
                var $searchInput = $('#search-input');
                var $searchBtnTag = $('#search-tag');
                var $deleteBtnTag = $('#delete-tag');
                var $searchInputTag = $('#search-input-tag');
                var $btnAnony = $('#btn-anony');
                var $btnReward = $('#btn-reward');
                var $btnDescription = $('#btn-description');
                var $wrapper1 = $('#wrapper1');
                var $descript = $('#wrapper2');
                var $invite = $('#wrapper3');
                var $tag = $('#wrapper4');
                var $cancel1 = $('#cancel1');
                var $ensure1 = $('#ensure1');
                var $ensure1_1 = $('#ensure1_1');
                var $cancel2 = $('#cancel2');
                var $ensure2 = $('#ensure2');
                var $cancel3 = $('#cancel3');
                var $ensure3 = $('#ensure3');
                var $cancel4 = $('#cancel4');
                var $ensure4 = $('#ensure4'); 
                var $btnAt = $('#btn-at');
                
                var $headerList = $('header');
                var $fixedFuncList = $('.block-fixed-func');
                
                $headerList.bind('click', function (e) {
                	e.stopPropagation();
                });
                
                $fixedFuncList.bind('click', function (e) {
                	e.stopPropagation();
                });
                
                $('html,body').bind('click', function (e) {
                	if ($wrapper1.is(':visible')) {
                		$('#title').focus();
                	}
                	if ($descript.is(':visible')) {
                		$('#simple-rich-editor').focus();
                	}
                });
                
                $cancel1.bind('click', function () {
                	window.history.go(-1);
                });

                $ensure1_1.bind('click', function () {
                	$tag.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
                });

                $ensure1.bind('click', function () {
                	alert($("#title").val());
                });

                $cancel2.bind('click', function () {
                	$wrapper1.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
                });

                $ensure2.bind('click', function () {
                    //console.log(simpleRichEditor.getJson('#simple-rich-editor', 'span'));
                	$btnDescription.find('i').remove();
                	$btnDescription.prepend('<i class="fa fa-check"></i>');
                	$wrapper1.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
                });
                
                $cancel3.bind('click', function () {
                	$descript.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
                });

                $ensure3.bind('click', function () {
                	$("#uids").val($("#userids").val());
                    var jsonData = simpleRichEditor.getJson('#people-box', 'span');
                    simpleRichEditor.createAtList(jsonData);  //向富文本框中添加at标签
                	$descript.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
                });

                $cancel4.bind('click', function () {
                	$wrapper1.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
                });


				//完成后保存问题
                $ensure4.bind('click', function () {
                    //问题
                    var title = $.trim($("#title").val());
                    //是否匿名
                    var anonymous = $("#anonymous").val();
                    //标签ids
                    var tagids = $("#tagids").val();
                    //悬赏积分
                    var score = $("#score").val();
					//@的用户id
                    var uids = $("#uids").val();
					//问题说明
                    var remark = simpleRichEditor.getHtml();
                    
                    if(title==null || title ==""){
                        
                    	lightBlock.show("请填写问题！");
                    	
                    }else{
                        
                    	lightDialog.show("确定提交吗？",
                        function(){
                            
                    		lightDialog.remove();
                    		
                			$.ajax({
                				type : "POST",
                				url : "${basepath}/m/h5/nask/addquestion.json",
                				cache : false,
                				data : {
                					title : title,
                					anonymous : anonymous,
                					score : score,
                					tagids : tagids,
                					uids : uids,
                					remark : remark
                				},
                				success : function(data) {
									window.location.href="${basepath}/m/h5/nask/index.xhtml";
                				},
                				error : function() {
                				}
                			});
                        },
                        function(){
                        	lightDialog.remove();
                        });

                    }
                	
                	//$wrapper1.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
                });

                 
                
                $btnAt.bind('click', function () {

                	$invite.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
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
				
				/**
				*悬赏列表
				*/
				var credit = parseInt('${credit}');
				var values = new Array();
				if(credit >10 ){
					values[0] = 0;
					values[1] = 10;
				}
				if(credit >20 ){
					values[2] = 20;
				}
				if(credit >30 ){
					values[3] = 30;
				}
				if(credit >40 ){
					values[4] = 40;
				}
				if(credit >50 ){
					values[5] = 50;
				}
				
				if(credit >= 10 ){
					$btnReward.bind('click', function () {
						var temp = $(this);
	                	dialogSelector.show(values, function () {
	                    	var score = dialogSelector.getScore();
	                    	dialogSelector.remove();
	                    	//将分数放入隐藏域
	                   	 $("#score").val(score);
	                    	if (score === 0) {
	                    		temp.find('label').remove();
	                    	} else {	                    	
	                    		temp.find('label').remove();
	                    		temp.append('<label>'+ score +'分</label>');
	                    	
	                    	}
	                	});
					});	
				}
				
				
				$btnDescription.bind('click', function () {
					$descript.removeClass('ctl-hide').siblings('.temp-box').addClass('ctl-hide');
					simpleRichEditor.createUploader(document.getElementById('insert-image'), document.getElementById('func-box2'), '<%=Constant.QINIU_SERVER%>', '${uptoken}', '<%=Constant.IMG_SERVER_DOWNLOAD%>');
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
                
                $deleteBtnTag.bind('click', function () {
                    $searchInputTag.val('');
                });
                
                $searchBtnTag.bind('click', function () {

                	taglist(1,true);
                    
                });
                
                $searchInputTag.bind('focus', function () {
                    $deleteBtnTag.show();
                });                

                $("textarea").bind("propertychange input",function(){
                    this.style.height = this.scrollHeight + 'px';
                });

                $(".selected-list-box .someone").bind('click', function () {//@好友

                });

                simpleRichEditor.init('simple-rich-editor', '');                
                
                swipeAjax.bindTapEvent(document, function () {//模拟上滑加载
					if ($invite.is(':visible')) {//邀请模块
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
	                    
	                							
					} else if ($tag.is(':visible')) {
	                	$loading = $('.selected-tag-list .loading');
	                	if (!$loading.length) {
	                		swipeAjax.setAjaxCount(0);  //这一行必须加
	                		return;
	                	}

	                	if (tagtotal <= tagcurrent) {
	                		swipeAjax.setAjaxCount(0);  //这一行必须加
	                		return;
    					}
    					
	                    $loading.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');


	                    tagpage = tagpage+1 ;
	        			
	                    taglist(tagpage,true);	        			
					}
                });                

            });

			var tagflag = 0 ;
			
    		function taglist(i,issearch) {
        		
    			var $tagList;
				var tList;

				if(tagflag > 0 && !issearch){
					return;
				}
				
				tagflag = tagflag + 1;
				
    			tagpage = i ;

    			
    			var url = "${basepath}/m/h5/nask/taglist.list";
    			$.ajax({
    				type : "GET",
    				url : url,
    				cache : false,
    				data : {
    					content : $.trim($("#search-input-tag").val()),
    					page : i ,
    					size : 8
    				},
    				success : function(response) {
        				
    					var tLoading  = $('.selected-tag-list .loading');	
    					
    					if(i == 1){
    						$("#tagcontent").html(response);
    						if(tagtotal > tagcurrent ){
    							$("#tagcontent").append('<div class="loading">上滑加载更多</div>');
    						}else{
    							
    						}
    					}else{
    						tLoading.before(response);
    						if(tagtotal > tagcurrent ){
    							tLoading.html('上滑加载更多');
    						}else{
    							tLoading.html('已无更多');
    						}
    						
    					}

    					$tagList = $('.selected-tag-list .tag');
    					tList = getTagList();
    					
						for (var n = 0; n < tList.length; n++) {
							for (var j = 0; j < $tagList.length; j++) {
								if ($($tagList[j]).data('id') === tList[n]) {
									$($tagList[j]).addClass('selected');
									
								}								
							}
						}

    					
    					
						swipeAjax.setAjaxCount(0); 
    				},
    				error : function() {
    				}
    			});
    		}


    		function getTagList() {
				var arr = [];
				var $spanList = $('#tag-box').find('span');
				for (var i = 0; i < $spanList.length; i++) {
					arr.push($($spanList[i]).data('id'));
				}
				return arr;
			}

    		function getUserList() {
				var arr = [];
				var $spanList = $('#people-box').find('span');
				for (var i = 0; i < $spanList.length; i++) {
					arr.push($($spanList[i]).data('id'));
				}
				return arr;
			}

    		
			var atflag = 0 ;
			
    		function atlist(i,issearch) {

				if(atflag > 0 && !issearch){
					
					return;
					
				}
				
				atflag = atflag + 1;
				
    			atpage = i ;
    			
    			var url = "${basepath}/m/h5/nask/userlist.list";
    			
    			$.ajax({
    				type : "GET",
    				url : url,
    				cache : false,
    				data : {
    					content : $.trim($("#search-input").val()),
    					page : i ,
    					size : 10
    				},
    				success : function(response) {
        				
    					var tLoading  = $('.selected-list-box .loading');
    					var $someoneList;
    					var uList;

    					if(i == 1){
    						$("#userlist").html(response);
    						if(usertotal > usercurrent ){
    							$("#userlist").append('<div class="loading">上滑加载更多</div>');
    						}else{
    							
    						}
    						
    					}else{
    						tLoading.before(response);
    						if(usertotal > usercurrent ){
    							tLoading.html('上滑加载更多');
    						}else{
    							tLoading.html('已无更多');
    						}
    					
    					}
    					
    					$someoneList = $('.someone');
    					uList = getUserList();
    					
						for (var n = 0; n < uList.length; n++) {
							for (var j = 0; j < $someoneList.length; j++) {
								if ($($someoneList[j]).data('id') === uList[n]) {
									$($someoneList[j]).addClass('selected');
									
								}								
							}
						}
						swipeAjax.setAjaxCount(0); 
						

    				},
    				error : function() {
    				}
    			});
    		}

			function clickTagItem(_this) {
                var temp = $(_this);
                var objTemp;
                var dataStr = '';
                var html;
                var ids = $("#tagids").val();
                objTemp = temp.data();
                if (temp.is('.selected')) {
                    temp.removeClass('selected');
                    $('#tid' + objTemp['id']).remove();
                   	ids = ids.replace(objTemp['id']+",","");
                   	$("#tagids").val(ids);
                } else {
                    temp.addClass('selected');
                    if ($('#tid' + objTemp['id']).length !== 0) {
                        return;
                    }
                    for(var prop in objTemp) {
                        if (objTemp.hasOwnProperty(prop)) {
                            dataStr += ' data-' + prop + '="'+ objTemp[prop] +'"';
                        }
                    }
                    html = '<span class="set-color" id="tid'+ objTemp['id'] +'"'+ dataStr +'>'+ objTemp['name'] +'</span>';
                    $('#block-selected-tag .tag-box').append(html);
                    ids = ids + objTemp['id'] +",";
                    $("#tagids").val(ids);

                }
                if ($('.tag-box span').length === 0) {
                    $('#block-selected-tag').addClass('ctl-hide');
                } else {
                    $('#block-selected-tag').removeClass('ctl-hide');
                }
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
                    ids = ids.replace(objTemp['id']+",","");
                   	$("#userids").val(ids);
                } else {
                    temp.addClass('selected');
                    if ($('.people-box #aid' + objTemp['id']).length !== 0) {
                        return;
                    }
                    for(var prop in objTemp) {
                        if (objTemp.hasOwnProperty(prop)) {
                            dataStr += ' data-' + prop + '="'+ objTemp[prop] +'"';
                        }
                    }
                    html = '<span class="set-color" id="aid'+ objTemp['id'] +'"'+ dataStr +'>'+ objTemp['name'] +'</span>';
                    $('#block-selected-people .people-box').append(html);
                    ids = ids + objTemp['id'] +",";
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
