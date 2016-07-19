<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
	<head>
		<title>我感兴趣的标签</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
	</head>
	<body>
            <header>
                <span class="btn btn-left"  id="btn-left-3">
                    <i class="fa fa-angle-left"></i>
                </span>
                <span class="btn btn-right btn-width-70"  id="btn-right-3">
                    提交
                </span>
                <div class="title title-2">
                    我感兴趣的标签
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
                    <div class="block-selected-tag" id="block-selected-tag"  style="display: ${ empty tags ?'none':'block' };">
                        <div class="head-line">已添加的标签</div>
                        <div class="tag-box">
                        	<c:forEach items="${tags }" var="item">
                        		<span class="set-color" id="tid${item.id }" data-href="abc" data-id="${item.id }" data-name="${item.name }">${item.name }</span>
							</c:forEach>
                        </div>
                        <input type="hidden" value="${tagids }" id="tagids" />
                    </div>
                    <%--
                    <div class="block-tag-list">
                        <div class="head-line">常用标签</div>
                        <div class="selected-tag-list">
                            <div class="tag" data-name="金融" data-id="t1" data-href="abc">
                                <label><i class="fa fa-check"></i></label>
                                <div>金融</div>
                            </div>
                            <div class="tag" data-name="投资" data-id="t2" data-href="abc">
                                <label><i class="fa fa-check"></i></label>
                                <div>投资</div>
                            </div>
                            <div class="tag" data-name="能源" data-id="t3" data-href="abc">
                                <label><i class="fa fa-check"></i></label>
                                <div>能源</div>
                            </div>

                        </div>
                    </div>
                     --%>

                    <div class="block-tag-list">
                        <div class="head-line">全部标签</div>
                        <div class="selected-tag-list" id="tag-list-total">
                          
                            <div class="loading">上滑加载更多</div>
                        </div>
                    </div>


                </div>
            </section>
	    
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js?v=111"></script>
        <script type="text/javascript">
        	var tagpage = 1;
        
            $(function () {
                var $btnLeft3 = $('#btn-left-3');
                var $btnRight3 = $('#btn-right-3');
                var $btnSearch3 = $('#search-3');
                var $input3 = $('#input-3');
                var $btnDelete3 = $('#delete-3');
                var $loading;

                taglist(1);
                $btnLeft3.bind('click', function () {
                    window.history.go(-1);
                });

                $btnRight3.bind('click', function () {//提交
                    //标签ids
                    var tagids = $("#tagids").val();
                    
                    if(tagids==null || tagids ==""){
                    	lightBlock.show("请选择标签！");
                    }else{
                    	lightDialog.show("确定提交吗？",
                        function(){
                    		lightDialog.remove();
                    		showHandling();
                			$.ajax({
                				type : "POST",
                				url : "${basepath}/m/ext/enn/ask/savetag.json",
                				cache : false,
                				data : {
                					tagids : tagids,
                				},
                				success : function(data) {
									window.location.href="${basepath}/m/ext/enn/ask/index.xhtml#e";
                				},
                				error : function() {
                				}
                			});
                        },
                        function(){
                        	lightDialog.remove();
                        });

                    }
                });
                $btnDelete3.bind('click', function () {
                    $input3.val('');
                    taglist(1,true);
                });

                $btnSearch3.bind('click', function () {
                 	taglist(1,true);
                });

                $input3.bind('focus', function () {
                    $btnDelete3.show();
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

            });



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
    					size : 100
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
	

        </script>
	</body>
</html>
