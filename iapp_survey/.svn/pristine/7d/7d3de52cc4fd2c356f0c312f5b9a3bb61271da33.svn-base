<%@page import="com.longtime.app.base.util.Constant"%>
<%@page import="com.longtime.app.config.Constants"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%
request.setAttribute("vEnter", "\n");//用于替换消息内容换行 无法用js处理问题
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>微信墙</title>
<style type="text/css">
        	*{padding:0px;margin:0px;}
			ul,dl{list-style-type:none;}
			.clr{clear:both;}
			a{text-decoration:none;}
			input,textarea,a{outline:none;}	
			textarea{resize:none;}
			.clear{clear:both;}
			:root{overflow:hidden;}
			body{font-family:"Microsoft yahei","sans-serif";font-size:62.5%;color:#53575e;width:100%;height:100%;/*background:rgba(190,176,176,.3);*/background:#95c23d;}
			body a,button,input{-webkit-tap-highlight-color:rgba(255,0,0,0);}
			
        	section.wallBox{width:1024px;background: #95c23d;position:absolute;left:50%;margin-left:-512px;}
        	section.wallBox div{float:left;}
        	#wrapper{margin-bottom:90px;}
        	.head{padding-bottom:10px;}
        	.head div{float:left;}
        	.head .headL{width:400px;height:84px;margin:34px 10px 0px 48px; }
        	.head .headL img{width:400px;height:84px;display:block;} 
        	.head .headC{width:118px;height:108px;margin-top:10px;display:block;}
        	.head .headC img{height:108px;width:118px;display:block;}
        	.head .headR{margin:30px 0 0 18px;position:relative;height:82px;}
        	.head .headR .arr{background: url(${basepath}/static/wall/enn/img/arr.png) center center no-repeat;width:16px;height:36px;position:absolute;left:-16px;top:25px;}
			.head .headR ul{padding:25px 10px 10px 68px;box-sizing:border-box;min-width:400px;height:82px;position:absolute;left:0px;top:0px;border-radius: 15px;background:#3dac2e  url(${basepath}/static/wall/enn/img/lb.png) 18px center no-repeat; background-size:auto 40px;}
			.head .headR ul li{height:31px;line-height: 31px;color:#fff;font-size:22px;display: block;white-space: nowrap;}
			.head .headR ul li label{color:#fff383;}
			.content{padding:10px 85px 60px 85px;width:100%;box-sizing:border-box;cursor:pointer;}
			.msgBox{margin-top:10px;box-sizing:border-box;border:2px solid #fff;width:100%;background: #3AB234 url(${basepath}/static/wall/enn/img/msg_bg.png) left top no-repeat;background-size:850px 110px;}
        	.content .msgBox:first-child{margin-top:0px;}
        	.msgBox div{float:left;}
        	.msgBox .imgBox{width:50px;height:50px;margin:10px;}
        	.msgBox .imgBox img{width:50px;height:50px;display:block;}
        	.msgBox .msg{width:750px;margin:10px 25px 10px 5px;font-size:32px;color:#fff;line-height: 44px;word-break:break-all;overflow: hidden;}
        	.msgBox .msg .name{color:#c0ff7a;font-weight: bold;}
        	.msgBox .msg img{max-height: 280px;display: block;margin-top:10px;}
        	.msgBox .msg .msg_img{display:inline-block;margin:0px;position:relative;top:5px;width:30px;height:30px;}
			#warnBox{color: red;border:1px solid;background-color: #FCF8E3;border-color: #FAEBCC;box-sizing:border-box;font-size:16px;height:44px;line-height:44px;width:640px;text-align:center;position: absolute;left:50%;margin-left:-320px;top:0px;z-index:15;}
</style>

<script type="text/javascript">
	function Map() {
		this.container = new Object();
	}

	Map.prototype.put = function(key, value) {
		this.container[key] = value;
	}

	Map.prototype.get = function(key) {
		return this.container[key];
	}

	Map.prototype.keySet = function() {
		var keyset = new Array();
		var count = 0;
		for ( var key in this.container) {
			// 跳过object的extend函数
			if (key == 'extend') {
				continue;
			}
			keyset[count] = key;
			count++;
		}
		return keyset;
	}

	Map.prototype.size = function() {
		var count = 0;
		for ( var key in this.container) {
			// 跳过object的extend函数
			if (key == 'extend') {
				continue;
			}
			count++;
		}
		return count;
	}

	Map.prototype.remove = function(key) {
		delete this.container[key];
	}

	Map.prototype.toString = function() {
		var str = "";
		for ( var i = 0, keys = this.keySet(), len = keys.length; i < len; i++) {
			str = str + keys[i] + "=" + this.container[keys[i]] + ";\n";
		}
		return str;
	}
	function biaoqingForaddress(str) {
		var imageAddress = "${basepath}/static/ixin/img/biaoqing/";
		var map = new Map();
		map.put("/::\\)", "0");
		map.put("/::~", "1");
		map.put("/::B", "2");
		map.put("/::\\|", "3");
		map.put("/:8-\\)", "4");
		map.put("/::<", "5");
		//map.put("/::\\$", "6");
		map.put("/::\\$", "6");
		map.put("/::X", "7");
		map.put("/::Z", "8");
		map.put("/::'\\(", "9");
		map.put("/::-\\|", "10");
		map.put("/::@", "11");
		map.put("/::P", "12");
		map.put("/::D", "13");
		map.put("/::O", "14");
		map.put("/::\\(", "15");
		map.put("/::\\+", "16");
		map.put("/:--b", "17");
		map.put("/::Q", "18");
		map.put("/::T", "19");
		map.put("/:,@P", "20");
		map.put("/:,@-D", "21");
		map.put("/::d", "22");
		map.put("/:,@o", "23");
		map.put("/::g", "24");
		map.put("/:\\|-\\)", "25");
		map.put("/::!", "26");
		map.put("/::L", "27");
		map.put("/::>", "28");
		map.put("/::,@", "29");
		map.put("/:,@f", "30");
		map.put("/::-S", "31");
		map.put("/:\\?", "32");
		map.put("/:,@x", "33");
		map.put("/:,@@", "34");
		map.put("/::8", "35");
		map.put("/:,@!", "36");
		map.put("/:!!!", "37");
		map.put("/:xx", "38");
		map.put("/:bye", "39");
		map.put("/:wipe", "40");
		map.put("/:dig", "41");
		map.put("/:handclap", "42");
		map.put("/:&-\\(", "43");
		map.put("/:B-\\)", "44");
		map.put("/:<@", "45");
		map.put("/:@>", "46");
		map.put("/::-O", "47");
		map.put("/:>-\\|", "48");
		map.put("/:P-\\(", "49");
		map.put("/::'\\|", "50");
		map.put("/:X-\\)", "51");
		map.put("/::\\*", "52");
		map.put("/:@x", "53");
		map.put("/:8\\*", "54");
		map.put("/:pd", "55");
		map.put("/:<W>", "56");
		map.put("/:beer", "57");
		map.put("/:basketb", "58");
		map.put("/:oo", "59");
		map.put("/:coffee", "60");
		map.put("/:eat", "61");
		map.put("/:pig", "62");
		map.put("/:rose", "63");
		map.put("/:fade", "64");
		map.put("/:showlove", "65");
		map.put("/:heart", "66");
		map.put("/:break", "67");
		map.put("/:cake", "68");
		map.put("/:li", "69");
		map.put("/:bome", "70");
		map.put("/:kn", "71");
		map.put("/:footb", "72");
		map.put("/:ladybug", "73");
		map.put("/:shit", "74");
		map.put("/:moon", "75");
		map.put("/:sun", "76");
		map.put("/:gift", "77");
		map.put("/:hug", "78");
		map.put("/:strong", "79");
		map.put("/:weak", "80");
		map.put("/:share", "81");
		map.put("/:v", "82");
		map.put("/:@\\)", "83");
		map.put("/:jj", "84");
		map.put("/:@@", "85");
		map.put("/:bad", "86");
		map.put("/:lvu", "87");
		map.put("/:no", "88");
		map.put("/:ok", "89");
		map.put("/:love", "90");
		map.put("/:<L>", "91");
		map.put("/:jump", "92");
		map.put("/:shake", "93");
		map.put("/:<O>", "94");
		map.put("/:circle", "95");
		map.put("/:kotow", "96");
		map.put("/:turn", "97");
		map.put("/:skip", "98");
		map.put("/:oY", "99");
		map.put("/:#-0", "100");
		map.put("/:kiss", "102");
		map.put("/:<&", "103");
		map.put("/:&>", "104");
		var array = map.keySet();
		for(var i = 0; i < array.length; i++){
			str = str.replace(new RegExp(array[i],"gm"), "<img class='msg_img' src=" + imageAddress + map.get(array[i]) + ".png" + ">");
		}
		str = str.replace(/(\/::\\$)/gm,"<img class='msg_img' src='"+imageAddress+"6.png'>");
		return str;
	}
</script>
</head>
<body>
<div id="warnBox" style="display: none;" >您的IE浏览器版本过低，请使用IE9+、Chrome、Firefox浏览器浏览本站!</div>
<section class="wallBox">
	<div class="head">
 				<div class="headL">
 					<img src="${basepath}/static/wall/img/hdq_20151130.png"  />
 				</div>
 				<div class="headC">
 					<img src="${basepath}/static/wall/img/logo.png"  />
 				</div>
 				<div class="headR">
 					<div class="arr"></div>
 					<ul>
 						<li>发送 <label>${topic.keywords}</label> 即可参与讨论</li>
 					</ul>
 				</div>
 	</div>
 				
	<div id="wrapper">
	 			<div class="content">
	 			
	 				
	 				<c:forEach items="${comments }" var="comment" varStatus="index">
						<c:if test="${comment.shield==0 }">
						
							
							<div class="msgBox" id="${comment.id}">
			 					<div class="imgBox">
			 						
			 						<c:if test="${empty comment.headimgurl }">
			                    		 <img src="<%=Constants.STUDENT_WEB_ROOT%>user/avatar/${comment.uid}.xhtml?domain=${topic.domain}&style=128x128"  />
			                    	</c:if>
			                       <c:if test="${not empty comment.headimgurl }">
			                       		<img src="${comment.headimgurl }">
			                       </c:if>
			 					</div>
			 					<div class="msg">
			 						<span class="name">${empty comment.uname? '匿名':comment.uname }：</span>
			 						<c:if test="${comment.type == 0 }"><script>document.write(biaoqingForaddress("${fn:replace(comment.content,vEnter,' ')}"));</script></c:if>
									<c:if test="${comment.type == 1 }"><img  src="${comment.content}"></c:if>
			 					</div>
			 				</div>
						</c:if>
				  </c:forEach>
	 		</div>
 	</div>
</section>
<script type="text/javascript" src="${basepath}/static/wall/js/jquery-2.1.1.min.js"></script>
<script src="${basepath}/static/wall/js/zepto.min.js"></script>
<script type="text/javascript" src="${basepath}/static/wall/js/iscroll4.2.5.js"></script>
<script type="text/javascript" src="${basepath}/static/public/socket.io/socket.io.js"></script>
<script type="text/javascript">
var ie = !-[1,];
var warn = document.getElementById("warnBox");
if(ie){
	 alert("您的IE浏览器版本过低，请使用IE9+、Chrome、Firefox浏览器浏览本站!");
	 warn.style.display="block";
}
var jq = jQuery.noConflict();
var myScroll;

jq(function(){
		var h = jq(window).height();
		jq("#wrapper").height(h-168);
	    setTimeout(function(){
	        myScroll=new iScroll("wrapper",{vScrollbar : false,checkDOMChanges : true});
	    },100);
	    
	    socketioInit();
    	
	    window.onresize = function (){
	    	var h = jq(window).height();
			jq("#wrapper").height(h-168);
			myScroll.refresh();
	    };
    
});
	
	

 var socket;
   function socketioInit(){
   	socket =  io.connect('<%=Constant.WEBSOCKET_SERVER%>?type=wall&id=${topic.id}');

   	socket.on('connect', function() {
   		console.log('Client has connected to the server!');//正常
   		online = true;
   		onlineStatusSetting(online);
   	});

   	socket.on('message', function(data) {
   		if(null!=data){
   			if(data.action == 1){//add
   				addMsg(data.id, data.uname, data.content,data.type, data.commentTimeFormat, data.headImgUrl);
   			}else if(data.action == 2){//delete
   				delMsg(data.id);
   			}
   		}
   		console.log('messageid=' + data.id + ' action=' + data.action + ' topicid=' + data.tid + ' content=' + data.content+'type='+data.type + ' username=' + data.uname + ' timestamp=' + data.commentTimeFormat);
   	});

   	socket.on('disconnect', function() {
   		console.log('The client has disconnected!');//连接错误'
   		online = false;
   		onlineStatusSetting(online);
   	});	
   }

   //处理连接和断开情况
   function onlineStatusSetting(online){
   	if(online){
   		cleartimerefresh();//清除定时器
   	}else{
   		settimerefresh();   //定时刷新页面
   	}
   }
   
   var interval;//定义定时器
   function settimerefresh(){//定时刷新页面
      interval = setInterval(function(){
           refresh();
       }, 5000);
      console.log("定时器启动！");
   }

//清除定时器
   function cleartimerefresh() {
       clearTimeout(interval);
       console.log("定时器销毁！");
   }

//刷新页面 临时去掉 2014-12-05  避免服务down掉后 无法显示
   function refresh(){
   	 //window.location.reload();
   }
   	
   function showQRcode(){
       $(".erweima").toggle()
   }
    		
function addMsg(id, uname, msg, type, time, headImgUrl){
	if(headImgUrl==null || headImgUrl==""){
		headImgUrl="<%=Constants.STUDENT_WEB_ROOT%>user/avatar/null.xhtml?domain=${topic.domain}&style=128x128";
	}
	if(uname==null || 'null'==uname){
		uname="匿名";
	}
	var html = [];
	
	if(!!jq("#"+id).length){
		return;
	}
	
	html.push('<div class="msg"  id="' + id + '">');
   	html.push('<div class="imgBox"><img src="' + headImgUrl + '&domain=${topic.domain}" /></div>');
	html.push('<div class="msgBody colorA">');
	html.push('<span class="a"></span>');
	html.push('<ul><li>' + uname + '：<label>' + time + '</label></li></ul>');
	html.push('<div class="txt">');
	if(type == 0){
		html.push(biaoqingForaddress(msg));
	}else{
		html.push('<img src="' + msg + '" />');
	}
	html.push('</div>');
	html.push('</div></div>');
	
	
	var html = [];
	
		html.push('<div class="msgBox" id="' + id + '">');
		html.push('<div class="imgBox"><img src="' + headImgUrl + '"  /></div>');
		html.push('<div class="msg"><span class="name">'+uname+'：</span>');
		if(type == 0){
			html.push(biaoqingForaddress(msg));
		}else{
			html.push('<img src="' + msg + '" />');
		}
		html.push('</div></div>');
		jq(".content").prepend(html.join(""));
		
	
	
	//jq(".scrollBox").prepend(html.join(""));
	//changeBgColor();
}
function delMsg(_id) {
	jq("#" + _id).remove();
}

</script>
</body>
</html>