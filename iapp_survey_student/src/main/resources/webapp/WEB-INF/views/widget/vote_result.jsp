<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>投票实时结果</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style type="text/css">
        .container-box{
            max-width: 1000px;
            margin: 0px auto;
        }
        .refresh-box{
            float: right;
            color: #999999;
        }
        .refresh-box>img{
            width: 32px;
            height: 7px;
        }
        .refresh-box>.refreshbtn{
            height: 14px;
            width: 14px;;
            cursor: pointer;
        }
        .refresh-box>span{
            font-size:12px;
            vertical-align: bottom;
        }
        .error-msg{
            width: 100%;
        height: 200px;
        display: block;
            overflow: hidden;
            border: 1px solid #eaeaea;
        background-color: #ffffff;
            color: #ffffff;
            text-align: center;
        border-radius: 10px;;
        }
        .error-msg>img{
            margin-top: 40px;;
        }
        #warnBox{color: red;border:1px solid;background-color: #FCF8E3;border-color: #FAEBCC;box-sizing:border-box;font-size:16px;height:44px;line-height:44px;width:640px;text-align:center;position: absolute;left:50%;margin-left:-320px;top:0px;}
        #stop{cursor: pointer;}
        #stop:hover{color:red;text-decoration: underline;}
    </style>
    <script type="text/javascript" src="${basepath}/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/plugins/Highcharts-4.1.9/js/highcharts.js"></script>
    <script type="text/javascript" src="${basepath}/static/plugins/Highcharts-4.1.9/js/modules/exporting.js"></script>
    <script type="text/javascript" src="${basepath}/static/plugins/socket.io/socket.io.js"></script>
    <script>
	var basepath='${basepath}';
	</script>
</head>
<body>
<div id="warnBox" style="display: none;" >您的IE浏览器版本过低，请使用IE9+、Chrome、Firefox浏览器浏览本站!</div>
<div class="container-box" id="table-box">
    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
    <div class="refresh-box" id="zhengchang">
    <img src="${basepath }/static/img/re.png" class="refreshbtn" onclick = "refresh()">
        <span>最后更新于<span id ="currentTime">00:00:00</span></span>
        <img src="${basepath }/static/img/green.png" class="deng" id="deng">&nbsp; <span  id="stop"  >断开</span>
        
    </div>
    <button  id="button1" style="width: 100%;height: 40px; display: none" onclick="sendDisconnect()" >断开socket</button>
</div>
<div class="container-box" id="error-msg" style="display:none;">
    <div class="error-msg">
    <!--错误信息-->
        <img src="${basepath }/static/img/nocount.png">
    </div>
</div>
<script type="text/javascript">
	var ie = !-[1,];
	var warn = document.getElementById("warnBox");
	if(ie){
		 alert("您的IE浏览器版本过低，请使用IE9+、Chrome、Firefox浏览器浏览本站!");
	 	warn.style.display="block";
	}
    /*初始化数据*/
    var names =  new Array();//选项
    var RS = new Array()//每一个选项的投票人数
    var optionIds = new Array();
    var leibie = ["百分比","投票数"];//类别
    var title = "投票实时结果";
    var chart ;
    var online = false;
    
    function loadData(){
    	var question;
        $.ajax({
         		type: "GET",
         		async:false,
         		url: basepath+"/api/vote/result.json",
         		data: {"id":"${id}"},
         		success: function(data){
         			if(!data || !data.body){
         				//alert("投票不存在");
         				$("#error-msg").show();
         				$("#table-box").hide();
         				return false;
         			}
             		question = data.body.questions[0];
         		}
         		
         	});
     	var list = question.options;
     	if(question.title){
     		title = question.title;
     	}
        
     	for(var i = 0; i <list.length;i++){
     	 	   names.push(list[i].title);
     	 	   RS.push(list[i].voteNum);
     	 	   optionIds.push(list[i].id);
     	}
     	return true;
    }
    
    
    function dabao(poll){//将处理后的数据打包
        if(poll == "" || poll == undefined || poll == "undefined" || poll == null){
            poll = RS;
        }
       var baifenbi = calculate(poll);
        var serie = [];
        for(var i = 0 ;i<leibie.length;i++){
            var item = {};
            serie.push(item)
        }
       // console.log(serie.length+"系列的个数");
        for(var i= 0;i<serie.length;i++){
            serie[i].name = leibie[i];
            serie[i].data = [];
            for (var j = 0;j<poll.length; j++){
                if(i==1){
                    serie[i].data.push(poll[j]);
                }else{
                    serie[i].data.push(baifenbi[j]);
                }
            }
        }
        serie[0].visible=false;//默认将第一个不显示
        return serie;
    }
    function calculate(poll) {
        //计算百分比
        var all = 0;
        var BFB = [];//百分比
        for(var i=0;i<poll.length;i++){
            all += parseInt(poll[i]);
        }
        for(var i =0;i<poll.length;i++){
        	var v = parseFloat(parseFloat(poll[i])/parseFloat(all)*100);
         	BFB.push(  parseFloat( v.toFixed(2)) ); //2位小数 四舍五入
        }
        return BFB;//输出
    }
    function initchats(){
        var _series = dabao(RS);
        console.log(_series);
        $('#container').highcharts({
            chart: {
                type: 'column',
            },
            colors: [
                  '#79C807','#18A0E7','#ED561B', '#DDDF00', '#24CBE5', '#64E572'
            ],
            title: {
                text: title,
                style : {
                	fontWeight: 'bold',
                    'fontSize' : '28px',
                    
                }
                
            },
            xAxis: {
                categories:names,
                labels : {
                    style : {
                        fontWeight: 'bold',
                        'fontSize' : '20px',
                        'color':'#000'
                    },
                    y:20,
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '数量'
                },
            	labels : {
               		style : {
                    'fontSize' : '18px',
                	}
           		}
            },
            tooltip: {
                headerFormat: '<span style="font-size:15px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
                footerFormat: '</table>',
                shared: false,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            fontSize:"20px"
                        },
                        formatter: function() {
                            return this.y ;
                        }
                    }
                }
            },
            series: _series
        });
    }
    
    function init(){
    	if(loadData()){
    	
        	initchats();
    	}
    	setDateTimeDisplay(getCurrentDate());
    }
    function refresh(){
    	console.log("refresh");
    	names =  new Array();//选项
        RS = new Array()//每一个选项的投票人数
        loadData();//将值设置到全局变量
    	var series = dabao(RS);
        chart.series[0].setData(series[0].data);
        chart.series[1].setData(series[1].data);
        
        setDateTimeDisplay(getCurrentDate());
    }
    function inc(options){
    	for(var i=0;i<options.length;i++){
    		var index = optionIds.indexOf(options[i]);
    		if(index<0){
    			continue;
    		}
    		RS[index] = RS[index]+1;
        }
    	var series = dabao(RS);
        chart.series[0].setData(series[0].data);
        chart.series[1].setData(series[1].data);
    }

var socket;
function socketioInit(){
	socket =  io.connect('<%=Constant.WEBSOCKET_SERVER%>?type=vote&id=${id}');
	//socket =  io.connect('http://socketio.aijiayou.com:80?type=vote&id=${id}');

	socket.on('connect', function() {
		console.log('Client has connected to the server!');//正常
		online = true;
		onlineStatusSetting(online);
	});

	socket.on('message', function(data) {
		if(null!=data){
			inc(data.option);
			setDateTimeDisplay(data.timestamp);
		}
		console.log('voteid=' + data.id + ' questionid=' + data.qid + ' option=' + data.option+ ' timestamp=' + data.timestamp);
	});

	socket.on('disconnect', function() {
		console.log('The client has disconnected!');//连接错误'
		online = false;
		onlineStatusSetting(online);
	});	
	
	
}

function sendDisconnect() {
	socket.disconnect();
}


$(function () {
	init();
	socketioInit();
   chart = $('#container').highcharts();
   $("#stop").bind("click",function(){
		sendDisconnect();
		cleartimerefresh();
		$("#stop").text("已断开");
	});
});


    function onlineStatusSetting(online){
    	if(online){
    		 $("#deng").attr("src","${basepath}/static/img/green.png");
    		 cleartimerefresh();
    	}else{
    		 $("#deng").attr("src","${basepath}/static/img/red.png");
    		 settimerefresh();
    	}
    }
    var interval;//定义定时器
    function settimerefresh(){
        //定时刷新页面
       interval = setInterval(function(){
            refresh();
        }, 5000);
       console.log("定时器启动！");
    }
    function cleartimerefresh() {
        //清除定时器
        clearTimeout(interval);
        console.log("定时器销毁！");
    }
    
    function getCurrentDate(){
    	//获取当前时间
    	var rightNow = new Date();
    	return rightNow.getTime();//输出long型的时间
    }
    
    
    function setDateTimeDisplay(timestamp){
    	var current = getFormatDateByLong(timestamp, "hh:mm:ss");
    	$("#currentTime").html(current);
    }
    
    /**
     * 下面的代码为转换时间格式的
     */
    //扩展Date的format方法 
    Date.prototype.format = function (format) {
        var o = {
            "M+": this.getMonth() + 1,
            "d+": this.getDate(),
            "h+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),
            "S": this.getMilliseconds()
        }
        if (/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
            }
        }
        return format;
    }

    function getFormatDateByLong(l, pattern) {
        return getFormatDate(new Date(l), pattern);
    }
    /**  
    *转换日期对象为日期字符串  
    * @param l long值  
    * @param pattern 格式字符串,例如：yyyy-MM-dd hh:mm:ss  
    * @return 符合要求的日期字符串  
    */  
    function getFormatDate(date, pattern) {
        if (date == undefined) {
            date = new Date();
        }
        if (pattern == undefined) {
            pattern = "yyyy-MM-dd hh:mm:ss";
        }
        return date.format(pattern);
    }

    
</script>
</body>
</html>