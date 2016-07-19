<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>规格型号</title>
		<style>
			body{
				background:#fff;
			}
		</style>
	</head>
	<body>
		<section class="search no-margin">
		<span class="back" onclick="window.history.go(-1);"></span>
			<div class="search-box">
				<form onsubmit="list();return false;">
                	<input type="search" placeholder="请输入关键字" id="searchContent" value="${searchContent }"/>
                </form>
                <span class="search-btn" onclick="list();"></span>
			</div>
		</section>
        <section class="product-list" id="plist">
            
               <div class="holder-loading">
                </div>
        </section>
        <input type="hidden" id="cid" value="${cid}"> 
        
		<script type="text/javascript" src="${basepath}/static/m/ext/muyang/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript">
		/**
		 * swipeAjax  向上滑动异步加载
		 */

		var swipeAjax = (function ($) {
		    'use strict';
		    var startY;
		    var endY;
		    var gap;
		    var ajaxCount = 0;  //一次滑动请求次数，防止多次ajax请求
		    var getAjaxCount, setAjaxCount;
		    var tapstart, tapmove, tapend;
		    var handleTap;
		    var bindTapEvent;
		    var handleAjax;
		    var stateMap = {
		        'clientWidth': window.innerWidth,
		        'clientHeight': window.innerHeight
		    };
		    var domMap = {
		        node: document.body
		    };

		    if (typeof window.ontouchstart !== 'undefined') {
		        tapstart = 'touchstart';
		        tapmove = 'touchmove';
		        tapend = 'touchend';
		    } else if (typeof window.onmspointerdown !== 'undefined') {
		        tapstart = 'MSPointerDown';
		        tapmove = 'MSPointerMove';
		        tapend = 'MSPointerUp';
		    } else {
		        tapstart = 'mousedown';
		        tapmove = 'mousemove';
		        tapend = 'mouseup';
		    }

		    handleTap = function (e) {
		        switch (e.type) {
		            case 'mousedown':
		            case 'MSPointerDown':
		            case 'touchstart':
		                startY = e.touches ? e.touches[0].screenY : e.screenY;
		                endY = startY;
		                break;
		            case 'mousemove':
		            case 'MSPointerMove':
		            case 'touchmove':
		                endY = e.touches ? e.touches[0].screenY : e.screenY;
		                gap = endY - startY;
		                if (stateMap.clientHeight + domMap.node.scrollTop  + 50 >= domMap.node.scrollHeight) {
		                    if (gap < -5) {
		                        ajaxCount++;
		                        if (ajaxCount === 1) {
		                            handleAjax && handleAjax();
		                        }
		                    }
		                }
		                break;
		            case 'mouseup':
		            case 'MSPointerCancel':
		            case 'MSPointerUp':
		            case 'touchcancel':
		            case 'touchend':
		                break;
		        }
		    };

		    bindTapEvent = function (node, callback) {//node：绑定touch事件的节点，callback：事件发生时回调函数
		        if (node && node !== document) {
		            node.addEventListener(tapstart, handleTap, false);
		            node.addEventListener(tapmove, handleTap, false);
		            node.addEventListener(tapend, handleTap, false);
		            stateMap.clientWidth = node.clientWidth;
		            stateMap.clientHeight = node.clientHeight;
		            domMap.node = node;
		        } else {
		            document.addEventListener(tapstart, handleTap, false);
		            document.addEventListener(tapmove, handleTap, false);
		            document.addEventListener(tapend, handleTap, false);
		        }
		        if (callback) {
		            handleAjax = callback;
		        }
		    };

		    getAjaxCount = function () {
		        return ajaxCount;
		    };

		    setAjaxCount = function (num) {
		        ajaxCount = num;
		    };

		    return {//外部可调用的接口函数
		        bindTapEvent: bindTapEvent,  //为某节点
		        getAjaxCount: getAjaxCount,  //得到当前的ajax请求数目
		        setAjaxCount: setAjaxCount  //重置ajax请求，用于清零，防止多次ajax请求
		    };
		}(jQuery));

		var index = 1;
		$(function(){
			
			page(1);
			
			var $loading;
			swipeAjax.bindTapEvent(document, function () {//模拟上滑加载
                	$loading = $('.product-list .holder-loading');
                	if (!$loading.length) {
     					swipeAjax.setAjaxCount(0);
     					return;
     				}

     				if(total<= current ){
             			swipeAjax.setAjaxCount(0);  //这一行必须加 
     					return;
                 	}	
                 	
                    $loading.html('正在加载...');
                     
                    index = index + 1;
     				
     				page(index);
                    
                });


			

			
		});

		function page(i) {
			$(".holder-loading").html('正在加载...');
			var url = "${basepath}/m/ext/muyang/product/product/list.list";
			$.ajax({
				type : "GET",
				url : url,
				cache : false,
				data : {
					cid : $("#cid").val(),
					searchContent : $("#searchContent").val(),
					page : i,
					size : 10
				},
				success : function(list) {
					$(".holder-loading").html('');
					$(".holder-loading").before(list);
					
					if(total > current ){
						$(".holder-loading").html('上滑加载更多');
					}else if(total != 0 && total !=1 ){
						$(".holder-loading").html('已无更多');
					}
					swipeAjax.setAjaxCount(0); 
				},
				error : function() {
				}
			});
		}
		
		function list() {
			var searchContent = $.trim($("#searchContent").val());
			if(searchContent==null||searchContent==""){
				return;
			}
			window.location.href = "${basepath}/m/ext/muyang/product/product/index.xhtml?searchContent="+searchContent;
		}

		</script>
	
	</body>
</html>

