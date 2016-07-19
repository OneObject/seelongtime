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
	<link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css?v=1">
	<link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css?v=1">
	
	<title>你问我答</title>
</head>
<body> 
    <article class="wenda">
       	<section class="wendaBox" id="asks">  
	    </section>
        
		<section class="more" style="padding-bottom:60px;" id="toload">
    		<a href="javascript:void(0);" onclick="next();">点击加载更多</a>
    	</section>
    
 		<section class="loading" id="loading" style="padding: 25px 55px 45px;">
			<i class="fa fa-spinner fa-spin"></i>
		</section>
		<section id="placeholder" class="more" style="display: none;"></section>
       	<div class="placeHolder" style="height:50px;width:100px;"></div>
      <section class="optionBox">
        	<span  onclick="add('${activityid}',event);"> 我要提问</span>         
        </section>
    </article> 
    <footer class="ctl_footer"></footer>
 <script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
    var pagenumber = 1;//当前页
    var pagesize = 10;//总页数 
    var activityTotal = 0;//总数
    var currentNum = 0;//已显示数
    var activityid = "${activityid}";
    $(function(){   
    	loadList();  
    }) 
    //下一页
    function next(){
    	pagenumber ++;
    	loadList();	
    }
    //问题列表
    function loadList(){
    	$("#loading").show();  //正在加载
    	$("#toload").hide();  //加载更多

    	$.ajax({
    		type : "GET",
    		url : "${basepath}/m/h5/ask/list.json",
    		cache:false,
    		data : { 
    			page : pagenumber,
    			size : pagesize,
    			activityid : activityid
    		},
    		success : function(data) { 
    			activityTotal = data.pageable.total;   
    			if(activityTotal > 0 ){
    				var asks = data.data;
    				currentNum += asks.length;
    				var html = [];
    				for ( var i = 0; i < asks.length; i++) {
    					var ask = asks[i];
    					html.push('<a href="javascript:void(0);" onclick="indetail(\'' + ask.id +'\');")>');
    					html.push('<ul>');
    					html.push('<li><img src="${basepath}/user/avatar/'+ask.author_id+'.xhtml?style=80x80&color=blue&r=" /></li>');
    					html.push('<li>'+ ask.author_name+'</li>');
    					html.push('<li>'+ ask.userCreated + '</li>');
    					html.push('</ul>');
    					html.push('<p>'+ask.supplement+'</p>');
    					html.push('<div>');
    					html.push('<span><i class="fa fa-comments-o"></i>'+ask.answer_num+'人回答</span>');
    					html.push('</div>');
    					html.push('</a>');
    				}
    				$("#asks").html($("#asks").html() + html.join(""))//加载
    				if (activityTotal == currentNum) {
    					$("#toload").hide();
    					$("#placeholder").show();
    				} else {
    					$("#toload").show();
    				}
    			}else{				
    				var html = [];
    					html.push('<article class="scroll">');
    					html.push('<section class="noData">');
    					html.push('<img src="${basepath }/static/img/noData.png" />');
    					html.push('</section>');
    					html.push(' </article>');
    				$("#asks").html( html.join(""))//加载
    				$("#toload").hide();
    			}
    			$("#loading").hide();
    		},
    		error : function() {
    		}
    	});
    }

    //详情
    function indetail(id)
    {
        window.location.href="${basepath}/m/h5/ask/detail.xhtml?askid="+id+"&activityid="+activityid;
    }
    
    	$(function(){
			$(".options").bind("click",function(){
				var judge=$("#ops").css("display");
				var that=$("#ops");
				if(judge==="none"){
					that.show(300);
					}else if(judge==="block"){
						that.hide(150);
					}
				
				});		
			});

	function add(aid,event){
		window.location.href="${basepath}/m/h5/ask/toadd.xhtml?activityid="+aid;
		event.stopPropagation();
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

		$(function(){
	    	var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;		   
	    	orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
			window.addEventListener(orientationEvent, function() {
				var curH;
				curH=$(window).height();
				$("article.wenda").height(curH);
				setting();			
			}, false);   
	    	
	    }); 
				
    </script>
<style type="text/css">
    	html,body{background:#f8f8f8;}
  </style>
</body>
</html>
 