/**
 * 长连接方式获取消息数量的变化
 * URL 长连接创建地址及参数，参数如：type=msg&id=uid&domain=domain
 * callback回调函数，如果为空，调用默认实现，主要用于展示未读消息数量
 */

function msgSocketioInit(url,callback){
	var online;
	var socket =  io.connect(url);
	socket.on('connect', function() { 
		console.log( url+ 'Client has connected to the server!');//正常
		online = true;
		onlineStatusSetting(online);
	});

	socket.on('message', function(data) {
		if(callback == null){
			defaultHandler(data);
		} else {
			callback(data);
		}
		console.log('id=' + data.id + ' type=' + data.type + ' domain=' + data.domain+ ' uid=' + data.uid);
	});

	socket.on('disconnect', function() {
		console.log(url + 'The client has disconnected!');//连接错误'
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


//update msg num 
function defaultHandler(data){
	if(data.id != null){
		var num = $("#msgNum").html();
		if(num == null){
			num = 0;
		}
		if(num == 0){
			$("#msgNum").show();
		}
		num = parseInt(num);
		$("#msgNum").html(num+1);
	}
}
