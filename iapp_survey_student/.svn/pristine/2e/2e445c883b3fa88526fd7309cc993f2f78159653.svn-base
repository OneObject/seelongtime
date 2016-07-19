<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    
    <link rel="stylesheet"	href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css">
	<link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css">
	
	<title> 我要提问</title>

</head>
<body>
 <article class="wenda wenda1">
    	<section class="txt">
        	<div><textarea id="content" placeholder="描述你的问题..."></textarea></div>
            <span onclick="add('${activityid}')">提交</span>        	
        </section>        
    </article> 
    <footer class="ctl_footer"></footer>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
		$(function(){
			//文本域自适应高度		
			$("section.txt textarea").bind("propertychange input",function(){
					this.style.height=this.scrollHeight+'px';
				});

			if (/ipad|iphone|mac/i.test(navigator.userAgent)){
				$("section.txt textarea").focus(function(){
					$('header', parent.document).css({"position":"absolute"}); 
					});
				$("section.txt textarea").blur(function(){
					$('header', parent.document).css({"position":"fixed","top":"0px"}); 
					});				
			}
			
			
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;
			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
			window.addEventListener(orientationEvent, function() {
				var curH;
				curH=$(window).height();
				$("article.wenda").height(curH);
				//文本域自适应高度		
				$("section.txt textarea").bind("propertychange input",function(){
					this.style.height=this.scrollHeight+'px';
				});
			}, false); 
			});

	function add(activityid){
		var content = $("#content").val();
		if(content == null || content == ""){
			showTishi1("请输入内容");
			return;
		}

		$.ajax({
    		type : "POST",
    		url : "${basepath}/m/h5/ask/add.json",
    		data : {  
    			activityid : activityid,
    			content : content
    		},
    		success : function(data) {  
        		if(data == true)
            	{
                	window.location.href="${basepath}/m/h5/ask/page.xhtml?activityid=${activityid}";
            	}
    		},
    		error : function() {
    		}
    	});
	}

	//默认提示色块
	function showTishi1(_val){
		var val= _val;
		if(!!val){
			$("body").append('<span class="tishi1">'+val+'</span>');		
			}else{				
			$("body").append('<span class="tishi1">暂无数据</span>');	
				}		
		$(".tishi1").fadeOut(2000);
		}

	$(function(){
		var parentH=$('article.frame', parent.document).height();
		var curH;
		curH=$(window).height();
		$("article.wenda").height(curH);
		$("html", parent.document).css({"overflow":"hidden"}); 
		$("html").css({"overflow":"scroll"});
		$(".wenda").height(parentH);
		$(".wenda").css({"overflow":"scroll"});
		$(".optionBox").css({"position":"fixed","bottom":"0px","z-index":"10000"}); 
					
		});	
    </script>
    
<style type="text/css">
    	html,body{background:#f8f8f8;}
</style>
</body>
</html>
