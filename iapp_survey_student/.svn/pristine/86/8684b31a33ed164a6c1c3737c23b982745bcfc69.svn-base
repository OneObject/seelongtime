<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
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
	<title>${taskuser.creator }提交的</title>
</head>
<body>
<header class="ctl_header">
    	<div class="back"><a href="javascript:void(0);" onclick="goback();"><i class="fa fa-angle-left"></i></a></div>
        ${taskuser.creator }提交的
	</header>   
    <article class="zuoye ctl_cont">
    <section class="subInfo">
        	<h2>${task.title }</h2>
            <p>${task.taskrequire}</p>
        </section>

        <section class="detailBox">
        	<ul>
            	<li><img src="${basepath}/user/avatar/'+task.uid+'.xhtml?style=80x80&color=blue&r=" /></li>
                <li>${taskuser.creator}</li>
                <li>提交时间： ${ltfun:dateLongToStringFormat(taskuser.createtime, "yyyy-MM-dd HH:mm") }</li> 
            </ul>
			<p>${taskuser.content}</p>
        	<div>
		        <c:forEach items="${taskuser.attachments }" var="attachment" varStatus="status">
					<img style="width:80px;height:80px;" class="img-rounded" src="<%=Constant.IMG_SERVER_DOWNLOAD %>${attachment.url}" data-src="<%=Constant.IMG_SERVER_DOWNLOAD%>${attachment.url}-1024x1024" data-gid="${task.id}" onclick="preViewImg4Doc('${task.id}',${status.index});" data-index="${status.index}" onerror="javascript:this.src='${basepath}/static/img/task/fujian.png'">
		        </c:forEach>
            </div>            
            <textarea id= "comment" placeholder="请输入评语..."></textarea>
            <input id="score" placeholder="评分"></input>
            <label>得分达到${task.score }即通过</label>
            <span class="sub" onclick="submit();">提交</span>
        </section>
    </article>

<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
<script src='${basepath }/static/js/commonValidate.js' type='text/javascript' ></script> 
<script type="text/javascript">
$(function(){	
	var orientationEvent;
	var supportsOrientationChange = "onorientationchange" in window;
	var w=$(".detailBox div").width()-40;
	var len=$(".detailBox div img").length;
	var imgArr=$(".detailBox div img");
	var j;
	var imgW=Math.floor(w/3);
	for(var i=0;i<len;i++){
		j=i+1;
		if(j%3==0){
			$(imgArr[i]).css({"margin-right":"0px"});
			}
		$(imgArr[i]).width(imgW);
		$(imgArr[i]).height(imgW);				
		}
	//文本域自适应高度		
	$(".detailBox textarea").bind("propertychange input",function(){
			if(this.scrollHeight>82){
				this.style.height=this.scrollHeight+'px';
				}	
		});
	$(".detailBox textarea").css({"width":"100%"});

	orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
	window.addEventListener(orientationEvent, function() {
		var w=$(".detailBox div").width()-40;
		var len=$(".detailBox div img").length;
		var imgArr=$(".detailBox div img");
		var j;
		var imgW=Math.floor(w/3);
		for(var i=0;i<len;i++){
			j=i+1;
			if(j%3==0){
				$(imgArr[i]).css({"margin-right":"0px"});
				}
			$(imgArr[i]).width(imgW);
			$(imgArr[i]).height(imgW);				
			}
	}, false);			
	
	//文本域获得焦点时，安卓手机页面重新定位				
	if (/android/i.test(navigator.userAgent)){
		var judge=isWeiXin();	
		if(!judge){
			$("textarea").css({"width":"100%"});
			$("textarea").bind("focus",function(event){
			var h=$(this).offset().top-80;
			$("html,body").animate({scrollTop:h},1000);
			event.stopPropagation();
			});	
			}else{
				//微信，重定位 未测试
				$("textarea").css({"width":"100%"});
				$("textarea").bind("focus",function(event){
				var h=$(this).offset().top-60;
				$("html,body").animate({scrollTop:h},1000);
				event.stopPropagation();	
				});		
				}	
		}						
	});
	function isWeiXin(){
	var ua = window.navigator.userAgent.toLowerCase();
	if(ua.match(/MicroMessenger/i) == 'micromessenger'){
		return true;
	}else{
		return false;
	}
}
var taskid = "${task.id}";
var usertaskid = "${taskuser.id}"; 
function submit(){
	var comment = $("#comment").val();
	var score = $("#score").val();
	if(comment == null || "" == comment){
		showTishi("请输入评语");
		return;
	}
	if(score == null || "" == score){
		showTishi("请输入评分");
		return;
	} 
	  var isnumber=zeroFloatCheck(score);
      if(!isnumber){
    	  showTishi("请输入数字");
    	  $.trim($("#score").val(""));
          return ;
      }
	
	$.ajax({
		type : "POST",
		url : "${basepath}/m/h5/task/pigai.json",
		data : { 
			taskid : taskid,
			comment : comment,
			score : score,
			usertaskid : usertaskid
		},
		success : function(data) { 
			if(data){
				window.location.href="${basepath}/m/h5/task/index.xhtml";
			}
		},
		error : function() {
		}
	});
}		
/**
$("#score").bind("keyup blur propertychange input",function(){
	var check=/[^0-9]/i;
	var txt=$(this).val();
	if(check.test(txt)){
		(this.val=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this);
		showTishi("请输入数字");							
		}
});*/

var imgDate = {};//二位数组，保持图片的组别，顺序和地址信息
var imgs = document.getElementsByTagName("img"); 
for(var i = 0; i < imgs.length; i++){
	var img = imgs[i];
  	var index = img.getAttribute("data-index");//存放索引
	var gid = img.getAttribute("data-gid");//组号 data-gid 存放组号
	var dsrc = img.getAttribute("data-src");//地址 
	if(index && gid && dsrc){ 
		imgDate[gid] = imgDate[gid]||[]; //该组不存在则创建
		imgDate[gid][index] = dsrc;//按照索引设置地址
	}
} 
 //点击图片时调用，groupid组号，index索引号
function preViewImg4Doc(groupid, index) {  
	var wxJSbridge = window.WeixinJSBridge || parent.window.WeixinJSBridge;
	if (typeof wxJSbridge != 'undefined') {
		wxJSbridge.invoke('imagePreview', {
            'current' : imgDate[groupid][index],//当前地址
            'urls' : imgDate[groupid] //组
        });
    }else{
        //alert("请在微信中查看", null, function(){});
    }
}

function goback(){
	window.location.href="${basepath}/m/h5/task/index.xhtml";
}
</script>
    
   	<style type="text/css">
    	body{background:#f8f8f8;}
    </style> 
</body>
</html>
