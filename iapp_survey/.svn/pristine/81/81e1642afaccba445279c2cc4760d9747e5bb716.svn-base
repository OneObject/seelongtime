<%@page import="com.longtime.app.base.util.Constant"%>
<%@page import="com.longtime.app.config.Constants"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>微信墙</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="refresh" content="120">
    <link href="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${basepath}/static/ixin/css/qiang.css" type="text/css" rel="stylesheet">
    <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${basepath}/static/public/socket.io/socket.io.js"></script>
    <script type="text/javascript">
 function Map(){
	this.container = new Object();
	}


	Map.prototype.put = function(key, value){
	this.container[key] = value;
	}


	Map.prototype.get = function(key){
	return this.container[key];
	}


	Map.prototype.keySet = function() {
	var keyset = new Array();
	var count = 0;
	for (var key in this.container) {
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
	for (var key in this.container) {
	// 跳过object的extend函数
	if (key == 'extend'){
	continue;
	}
	count++;
	}
	return count;
	}


	Map.prototype.remove = function(key) {
	delete this.container[key];
	}


	Map.prototype.toString = function(){
	var str = "";
	for (var i = 0, keys = this.keySet(), len = keys.length; i < len; i++) {
	str = str + keys[i] + "=" + this.container[keys[i]] + ";\n";
	}
	return str;
	} 
function biaoqingForaddress(str){
  var imageAddress="${basepath}/static/ixin/img/biaoqing/";
  var map=new Map();
  map.put("/::)","0");
  map.put("/::~","1");
  map.put("/::B","2");
  map.put("/::|","3");
  map.put("/:8-)","4");
  map.put("/::<","5");
  map.put("/::$","6");
  map.put("/::X","7");
  map.put("/::Z","8");
  map.put("/::'(","9");
  map.put("/::-|","10");
  map.put("/::@","11");
  map.put("/::P","12");
  map.put("/::D","13");
  map.put("/::O","14");
  map.put("/::(","15");
  map.put("/::+","16");
  map.put("/:--b","17");
  map.put("/::Q","18");
  map.put("/::T","19");
  map.put("/:,@P","20");
  map.put("/:,@-D","21");
  map.put("/::d","22");
  map.put("/:,@o","23");
  map.put("/::g","24");
  map.put("/:|-)","25");
  map.put("/::!","26");
  map.put("/::L","27");
  map.put("/::>","28");
  map.put("/::,@","29");
  map.put("/:,@f","30");
  map.put("/::-S","31");
  map.put("/:?","32");
  map.put("/:,@x","33");
  map.put("/:,@@","34");
  map.put("/::8","35");
  map.put("/:,@!","36");
  map.put("/:!!!","37");
  map.put("/:xx","38");
  map.put("/:bye","39");
  map.put("/:wipe","40");
  map.put("/:dig","41");
  map.put("/:handclap","42");
  map.put("/:&-(","43");
  map.put("/:B-)","44");
  map.put("/:<@","45");
  map.put("/:@>","46");
  map.put("/::-O","47");
  map.put("/:>-|","48");
  map.put("/:P-(","49");
  map.put("/::'|","50");
  map.put("/:X-)","51");
  map.put("/::*","52");
  map.put("/:@x","53");
  map.put("/:8*","54");
  map.put("/:pd","55");
  map.put("/:<W>","56");
  map.put("/:beer","57");
  map.put("/:basketb","58");
  map.put("/:oo","59");
  map.put("/:coffee","60");
  map.put("/:eat","61");
  map.put("/:pig","62");
  map.put("/:rose","63");
  map.put("/:fade","64");
  map.put("/:showlove","65");
  map.put("/:heart","66");
  map.put("/:break","67");
  map.put("/:cake","68");
  map.put("/:li","69");
  map.put("/:bome","70");
  map.put("/:kn","71");
  map.put("/:footb","72");
  map.put("/:ladybug","73");
  map.put("/:shit","74");
  map.put("/:moon","75");
  map.put("/:sun","76");
  map.put("/:gift","77");
  map.put("/:hug","78");
  map.put("/:strong","79");
  map.put("/:weak","80");
  map.put("/:share","81");
  map.put("/:v","82");
  map.put("/:@)","83");
  map.put("/:jj","84");
  map.put("/:@@","85");
  map.put("/:bad","86");
  map.put("/:lvu","87");
  map.put("/:no","88");
  map.put("/:ok","89");
  map.put("/:love","90");
  map.put("/:<L>","91");
  map.put("/:jump","92");
  map.put("/:shake","93");
  map.put("/:<O>","94");
  map.put("/:circle","95");
  map.put("/:kotow","96");
  map.put("/:turn","97");
  map.put("/:skip","98");
  map.put("/:oY","99");
  map.put("/:#-0","100");
  map.put("/:kiss","102");
  map.put("/:<&","103");
  map.put("/:&>","104");
  var array = map.keySet();
  for(var i in array) {
     str=str.replace(array[i],"<img src="+imageAddress+map.get(array[i])+".png"+">");
  }
  return str;
}
</script>
    
    
</head>
<body class="bg">

    <div class="container">
        <div class="header">
            <div class="bulletin">
            <!--公告-->
                <span>发送：#${topic.keywords}#+内容，即可上墙。</span>
                 <%--<a href="javascript:void(0);" onclick="showQRcode()">扫描二维码</a> 
                <img src="${basepath}/static/ixin/img/erweima.jpg" class="erweima">--%>
            </div>
        </div>
        <div id="body">
            <div class="msg_list">
                <!-- <img  class="wechat-emoji" src="/img/emoji/wechat/103.gif" alt="发呆"> -->
                
               	<c:if test="${empty comments }">
	               	<!--  
	               	<div class="msg_item" id="no1">
	                    <div class="item_left">
	                        <img src="${basepath}/static/ixin/img/touxiang.jpg" class="item_head"><br>
	                        <span class="uname">爱加油</span>
	                    </div>
	                    <div class="item_right">
	                        <img src="${basepath}/static/ixin/img/qipao.png" class="qipao">
	                        <table>
	                            <tr>
	                                <td>
	                                    <span>发送：“#${topic.keywords}#”+您想要说的话，即可上墙。</span>
	                                </td>
	                            </tr>
	                            
	                        </table>
	                    </div>
	
	                </div>
               		-->
               	</c:if>
                <c:forEach items="${comments }" var="comment" varStatus="index">
                	<c:if test="${comment.shield==0 }">
	                 <div class="msg_item" id="${comment.id}">
	                    <div class="item_left">
	                    	<c:if test="${empty comment.headimgurl }">
	                    		 <img src="<%=Constants.STUDENT_WEB_ROOT%>user/avatar/${comment.uid}.xhtml?style=128x128" class="item_head"><br>
	                    	</c:if>
	                       <c:if test="${not empty comment.headimgurl }">
	                       		<img src="${comment.headimgurl }" class="item_head"><br>
	                       </c:if>
	                        <span class="uname">${empty comment.uname? '匿名':comment.uname }</span>
	                    </div>
	                    <div class="item_right">
	                        <img src="${basepath}/static/ixin/img/qipao.png" class="qipao">
	                        <table>
	                            <tr>
	                                <td>
	                                	<c:if test="${comment.type == 0 }">
		                                    <span>
		                                    <script>document.write(biaoqingForaddress("${ltfun:html2Text(comment.content,200)}"))</script>
		                                   </span>
	                                   </c:if>
	                                   <c:if test="${comment.type == 1 }">
	                                   		<img alt="" src="${comment.content }"  style="max-height: 280px;">
	                                   </c:if>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class ="time">${ltfun:dateLongToStringFormat(comment.commentTime,'HH:mm ss' )}</span>
	                                </td>
	                            </tr>
	                        </table>
	                    </div>
	                </div>
                </c:if>
                
                </c:forEach>
                
                
                
               <%--  
                <div class="msg_item">
                    <div class="item_left">
                        <img src="${basepath}/static/ixin/img/touxiang.jpg" class="item_head"><br>
                        <span class="uname">于波</span>
                    </div>
                    <div class="item_right">
                        <img src="${basepath}/static/ixin/img/qipao.png" class="qipao">
                        <table>
                            <tr>
                                <td>
                                    <img src="${basepath}/static/ixin/img/prize.jpg">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class ="time">2014-02-09&nbsp;10:19:30</span>
                                </td>
                            </tr>
                        </table>
                    </div>

                </div> --%>
                
                
                
                
            </div>
        </div>
        <div class="footer">
            <span></span>
        </div>
    </div>
<script type="text/javascript">
    $(document).ready(function(){
        var outspent_height=0;//非消息主体的高度
        outspent_height = $(".header").height() + $(".footer").height();
        var valid_height = 0;//可用高度
        valid_height = $(window).height()-outspent_height-69;
        $("#body").height(valid_height);
        socketioInit();
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
    				addmsg(data.id, data.uname, data.content,data.type, data.commentTimeFormat, data.headImgUrl);
    			}else if(data.action == 2){//delete
    				removemsg(data.id);
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

	//刷新页面
    function refresh(){
    	 window.location.reload();
    }
    	
    function showQRcode(){
        $(".erweima").toggle()
    }
    var mgscount = 1;
    function addmsg(id, uname, msg,type, time, headImgUrl){
    	if(headImgUrl==""){
    		headImgUrl = "${basepath}/static/ixin/img/avatar.png";
    	}
    	if(uname==null || 'null'==uname){
    		uname="匿名";
    	}
        mgscount++;
        var html=[];
        
        if(!!$("#"+id).length){
    		return;
    	}
        
        html.push('<div class="msg_item" id="'+id+'">');
        html.push('<div class="item_left">');
        html.push('<img src="'+headImgUrl+'" class="item_head"><br> <span class="uname">'+uname+'</span>');
        html.push('</div>');
        html.push('<div class="item_right">');
        html.push('<img src="${basepath}/static/ixin/img/qipao.png" class="qipao">');
        html.push('<table>');
        html.push('<tr>');
        html.push('<td>');
        if(type == 0){
        	html.push('<span>');
            html.push(biaoqingForaddress(msg));
            //html.push(msg);
            html.push('</span>');
        } else {
        	html.push('<img src="'+msg+'"  style="max-height: 280px;" />');
        }
        
        html.push('</td>');
        html.push('</tr>');
        html.push('<tr>');
        html.push('<td>');
        html.push('<span class ="time">');
        html.push(time);
        html.push('</span>');
        html.push('</td>');
        html.push('</tr>');
        html.push('</table>');
        html.push('</div>');
        html.push('</div>');
        $(".msg_list").prepend(html.join(""));
    }
    function removemsg(id){
        $("#"+id).remove();
    } 
</script>
</body>
</html>