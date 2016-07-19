<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
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
	
	<title>   ${questionEntity.author_name}的提问</title>
</head>

<body>
    <article class="wenda wenda1">
    	<section class="wenti">
        	<p>
         ${questionEntity.supplement}     
            </p>
            <ul>
       <%--     	<li>标签：<label>计算机</label><label>软件</label></li> --%>
                <li><span>${ltfun:dataLongToSNS(questionEntity.dateCreated,"yyyy-MM-dd HH:mm")}</span><span><i class="fa fa-comments-o"></i>${questionEntity.answer_num }人回答</span></li>
            </ul>
        </section>
        <section class="huida" id="answers">
        	
        	
        </section>
        
        
         
		<section class="more" style="padding-bottom:50px;" id="toload">
    		<a href="javascript:void(0);" onclick="next();">点击加载更多</a>
    	</section>
    
 		<section class="loading" id="loading" style="padding: 25px 55px 45px;">
			<i class="fa fa-spinner fa-spin"></i>
		</section>
		<section id="placeholder" class="more" style="display: none;"></section>
		  <div class="placeHolder"></div>
		
		
        <section class="optionBox">
        	<span onclick="toanswer()">我要回答</span>            
        </section>

    </article> 
    <footer class="ctl_footer"></footer>
      <script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">

	 
 	var pagenumber = 1;//当前页
    var pagesize = 10;//总页数 
    var answerTotal = 0;//总数
    var currentNum = 0;//已显示数
    var askid = "${questionEntity.id}";
    $(function(){
    	var orientationEvent;
		var supportsOrientationChange = "onorientationchange" in window;		   
    	loadList();
    	orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
		window.addEventListener(orientationEvent, function() {
			var curH;
			curH=$(window).height();
			$("article.wenda").height(curH);
			setting();			
		}, false);   
    	
    }); 

    //下一页
    function next(){
    	pagenumber ++;
    	loadList();	
    }

	//问题回答列表
    function loadList(){
    	$("#loading").show();  //正在加载
    	$("#toload").hide();  //加载更多

    	$.ajax({
    		type : "GET",
    		url : "${basepath}/m/h5/ask/anwsers.json",
    		data : { 
    			page : pagenumber,
    			size : pagesize,
    			askid : askid
    		}, 
    		success : function(data) { 
    			answerTotal = data.pageable.total;   
    			if(answerTotal > 0 ){
    				var answers = data.data;
    				currentNum += answers.length;
    				var html = [];
    				for ( var i = 0; i < answers.length; i++) {
    					var answer = answers[i];
    					html.push('<div class="box">');
    					html.push('<div><img src="${basepath}/user/avatar/'+answer.author_id+'.xhtml?style=80x80&color=blue&r=" /></div>');
    					html.push('<ul>');
    					html.push('<li>'+ answer.author_name+'</li>');
    					html.push('<li>'+ answer.content+'</li>');
    					html.push('<li>' +  answer.userCreated + '</li>');
    					html.push('</ul>');
    					html.push(' </div>');
    				}
    				$("#answers").html($("#answers").html() + html.join(""))//加载
    				
    				if (answerTotal == currentNum) {
    					$("#toload").hide();
    					$("#placeholder").show();
    				} else {
    					$("#toload").show();
    				}
    			}else{				
    				var html = [];
    					html.push('<span class="noAnswer">');
    					html.push('<img src="${basepath}/static/m_h5/img/no-answer.png" />');
    					html.push('</span>');
    				$("#answers").html( html.join(""))//加载
    				$("#toload").hide();
    			}
    			$("#loading").hide();
    			setting();
    		},
    		error : function() {
    		}
    	});
    }
		
	var activityid = "${activityid}";
	var questionid = "${questionEntity.id}";


	function setting(){		
		var w=$(".huida .box").width();
		$(".box>ul").width(w-58);
		
	}
	//回答问题页面
	function toanswer(){
		window.location.href="${basepath}/m/h5/ask/answer.xhtml?askid="+questionid+"&activityid="+activityid;
	} 

	//判断是否是微信
	function isWeiXin(){
	    var ua = window.navigator.userAgent.toLowerCase();
	    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
	        return true;
	    }else{
	        return false;
	    }
	}
	$(function(){
		var isWX=isWeiXin();
		var parentH=$('article.frame', parent.document).height();
		var curH;
		if(!!parentH){
				$("html", parent.document).css({"overflow":"hidden"}); 
				$("html").css({"overflow":"scroll"});
				$(".wenda").height(parentH);
				$(".wenda").css({"overflow":"scroll"});
				$(".optionBox").css({"position":"fixed","top":parentH-49,"z-index":"10000"}); 
				if(isWX){
					$(".optionBox").css({"position":"fixed","top":parentH-49,"z-index":"10000"}); 
					$(".wenda").height(parentH);
					}
				}else{
					curH=$(window).height();
					$("article.wenda").height(curH);
					$(".optionBox").css({"position":"fixed","bottom":"0px","z-index":"10000"}); 
					}					
		});
    </script>
    <style type="text/css">
    	html,body{background:#f8f8f8;}
  </style>
</body>

</html>
