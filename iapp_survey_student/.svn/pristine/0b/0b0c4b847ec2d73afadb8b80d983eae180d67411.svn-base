<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
	<head>
		<title>激活</title>
        <style type="text/css">
            body{
                background: #f8f8f8;
            }
        </style>
        <script type="text/javascript">
		window.apiready = function(){
		    
		    var backSecond = 0;
		      api.addEventListener({name: 'keyback'}, function(ret, err){
		         var curSecond = (new Date).getSeconds();
		         if(Math.abs(curSecond - backSecond) > 3){
		             backSecond = curSecond;
		            // alert("next click will exit!");
		         }else{
		             api.closeWidget();  //exit
		         }
		    });
			  
		}
		</script>
		
	</head>
	<body>
        <div class="wrapper-box" id="wrapper-box-1">
            <section class="module-login" id="module-login">
                <div class="block-image" id="block-image">
                    <div class="image-header" id="image-header">
                        <!--<div class="box-upload-show" id="box-upload-show">-->
                        <!--<label id="box-percent">66%</label>-->
                        <!--<div class="box-progress" id="box-progress" data-percent="66%">-->
                        <!--</div>-->
                        <!--</div>-->
                        <!--<div class="icon-uploaded-box">-->
                            <!--<img src="img/tx/tx1.jpg">-->
                        <!--</div>-->
                    </div>
                    <div class="image-footer">
                        更换头像
                    </div>
                </div>
                <div class="block-green-info">
                    *新密码
                </div>
                <div class="block-input">
                    <input type="password" placeholder="请输入你的密码" id="newpassword"/>
                </div>
                <div class="block-green-info">
                    *确认密码
                </div>
                <div class="block-input">
                    <input type="password" placeholder="再次输入密码" id="repassword" />
                </div>
                <div class="block-green-info">
                    *擅长标签
                </div>
                <div class="block-tags-box" id="block-tags-box">

                </div>
                <div class="block-add-tag" id="block-add-tag">
                    添加
                </div>
		<c:if test="${isSuper}">
				<div class="block-green-info">
                    邀请码（非必填）
                </div>
                <div class="block-input">
                    <input type="text" placeholder="请输入邀请码" id="invitecode" />
                </div>
		</c:if>
                <div class="block-error-info">
                 <p id="tishi"></p>
                </div>
                <div class="block-login-btn" data-status="" onclick="submit_(this);">
                    激活账号
                </div>

                <ul class="block-tel block-tel2">
                    <li>客服电话</li>
                    <li><a href="tel:021-50936301">021-50936301</a></li>
                </ul>
            </section>
        </div>

        <div class="wrapper-box" id="wrapper-box-3" style="display: none;">
            <header>
                <span class="btn btn-left"  id="btn-left-3">
                    <i class="fa fa-angle-left"></i>
                </span>
                <span class="btn btn-right btn-width-70"  id="btn-right-3">
                    保存
                </span>
                <div class="title title-2">
                    请选择擅长标签
                </div>
            </header>
            <section class="wrapper-static margin-top-50">
                <div class="module-add-tag">
                    <div class="block-search">
                        <span class="search" id="search-3"><i class="fa fa-search set-color"></i></span>
                        <form onsubmit="taglist(1,true);return false;">
                        	<input  class="set-bd-color" type="search" id="input-3" placeholder="请输入标签名">
                        </form>
                        <span class="delete" id="delete-3"><i class="fa fa-times set-color"></i></span>
                    </div>
                    <div class="block-selected-tag" id="block-selected-tag"  style="display: none;">
                        <div class="head-line">已添加的标签</div>
                        <div class="tag-box" id="new-tag-box">
                        </div>
                        <input type="hidden" value="" id="tagids" />
                    </div>
                   
                    <div class="block-tag-list">
                        <div class="head-line">全部标签</div>
                        <div class="selected-tag-list" id="tag-list-total">
                      
                            <div class="loading">上滑加载更多</div>
                        </div>
                    </div>


                </div>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/plupload/plupload.full.min.js"></script>
        <script type="text/javascript">
        var tagpage = 1;
        var tagtotal =0;
        var tagcurrent = 0;
            var $imageHeader;
            $(function () {
                $imageHeader = $('#image-header');
                var $wrapperBox1 = $('#wrapper-box-1');
                var $wrapperBox3 = $('#wrapper-box-3');
                var $btnLeft3 = $('#btn-left-3');
                var $btnRight3 = $('#btn-right-3');
                var $btnSearch3 = $('#search-3');
                var $input3 = $('#input-3');
                var $btnDelete3 = $('#delete-3');
                var $blockTagsBox = $('#block-tags-box');
                var $blockAddTag = $('#block-add-tag');
                var $newTagBox = $('#new-tag-box');
                var $loading;

                $blockAddTag.bind('click', function () {
                    ctlWrapperShow($wrapperBox3);
                    taglist(1);
                });

                $btnLeft3.bind('click', function () {
                    ctlWrapperShow($wrapperBox1);
                });
                
                $btnSearch3.bind('click', function () {
                 	taglist(1,true);
                });

                $btnRight3.bind('click', function () {
                    var html = $newTagBox.html().replace(/id="tid/g, 'id="did');
                    $blockTagsBox.html(html);
                    ctlWrapperShow($wrapperBox1);
                });


                swipeAjax.bindTapEvent(document, function () {//上滑回调
                    $loading = $('#tag-list-total .loading');
                    if (!$loading.length) {
                        return;
                    }
                    if (tagtotal <= tagcurrent) {
						swipeAjax.setAjaxCount(0); //这一行必须加 
						return;
					}
                    tagpage = tagpage+1 ;
                    taglist(tagpage,true);
                });

                function ctlWrapperShow($obj) {
                    $obj.show().siblings('.wrapper-box').hide();
                }

            });

            uploadImage.createUploader(document.getElementById('block-image'), document.getElementById('module-login'),  '<%=Constant.QINIU_SERVER%>', '${token}', '<%=Constant.IMG_SERVER_DOWNLOAD%>', {
            	container: document.getElementById('image-header')
                });
			
            function insertImage(url, hash) {
                if (!url) {
                    return;
                }
        		$.ajax({
	                type: "POST",
	                url:"${basepath}/m/ext/enn/updateavatar.json",
	                data:{'avatar':hash},
	                error: function(data) {
	                },
	                success: function(data) {
                		$imageHeader.html('<div class="icon-uploaded-box"  id="icon-uploaded-box"><img src="'+ url +'-80x80" /></div>');
	                }
	            });
            }

			var tagflag = 0 ;
			
    		function taglist(i,issearch) {
    			var $tagloading = $('#tag-list-total .loading');
    			$tagloading.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');

    			var $tagList;
				var tList;
    			
				if(tagflag > 0 && !issearch){
					return;
				}
				tagflag = tagflag + 1;
    			tagpage = i ;
    			var url = "${basepath}/m/ext/enn/ask/taglist.list";
    			$.ajax({
    				type : "GET",
    				url : url,
    				cache : false,
    				data : {
    					content : $.trim($("#input-3").val()),
    					page : i ,
    					size : 20
    				},
    				success : function(html) {
        				if(i==1){
    						$("#tag-list-total").html(html);
    						$("#tag-list-total").append('<div class="loading">上滑加载更多</div>');
        					$tagloading = $('#tag-list-total .loading');
            			}else{
    						$tagloading.before(html);
                		}
						if(tagtotal>tagcurrent){
							$tagloading.html('上滑加载更多');
						}else if(tagtotal!=1&&tagcurrent!=1){
							$tagloading.html('已无更多');
						}else if(tagtotal == 0 || tagtotal== 1 ){
							$tagloading.html("");
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
						
						swipeAjax.setAjaxCount(0);  //这一行必须加
    				},
    				error : function() {
    				}
    			});
    		}

    		function getTagList() {
				var arr = [];
				var $spanList = $('.tag-box').find('span');
				for (var i = 0; i < $spanList.length; i++) {
					arr.push($($spanList[i]).data('id'));
				}
				return arr;
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
                    $('#block-selected-tag').hide();
                } else {
                    $('#block-selected-tag').show();
                }
			}



            function submit_(_this){
            	var $temp = $(_this);
            	var status = $temp.data('status');
            	$("#tishi").html("");
            	
            	if (status !== 'activing') {
            		
            		$temp.html('激活中...');
            		$temp.data('status', 'activing');
            		
            	} else {
            		return;
            	}
            	var newpassword = $.trim($("#newpassword").val());
            	var repassword = $.trim($("#repassword").val());
            	if(repassword=='' || newpassword=="" ){
    				$("#tishi").html("密码不能为空");
            		$temp.html('激活账号');
            		$temp.data('status', '');
    				return;
    			}else if(repassword.length<6 ||  newpassword.length <6 || repassword.length>15 || newpassword.length>15){
    				$("#tishi").html("密码长度为6-15");
            		$temp.html('激活账号');
            		$temp.data('status', '');
    				return;
    			}else{
    				$("#tishi").html("");
        		}
            	if(newpassword != repassword){
                	$("#tishi").html("两次密码输入不一致");
            		$temp.html('激活账号');
            		$temp.data('status', '');
                	return;
                }
            	if($("#tagids").val()==''){
            		$("#tishi").html("请添加标签");
            		$temp.html('激活账号');
            		$temp.data('status', '');
                	return;
            		
            	}else{
                	$("#tishi").html("");
    				$.ajax({
    	                type: "POST",
    	                url:"${basepath}/m/ext/enn/updatepassword.json",
    	                data:{'password':repassword,"tagids":$("#tagids").val(),"active":true,"invitecode":$("#invitecode").val()},
    	                error: function(data) {
    	                	$("#tishi").html("修改失败");
    	            		$temp.html('激活账号');
    	            		$temp.data('status', '');
    	                },
    	                success: function(data) {
    	                    if(data){
    	                    	location.href="${basepath}/m/ext/enn/ask/index.xhtml";
    	                    }else{
    	                    	$("#tishi").html("修改失败");
    	                		$temp.html('激活账号');
    	                		$temp.data('status', '');
    	                     }
    	                }
    	            });
	
                }
            }
                
        </script>
	</body>
