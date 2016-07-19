<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.common.utils.HtmlUtils"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>用户签到</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no"/>
    <link href="http://cdn.bootcss.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${basepath }/static/css/easydialog.css">
    <script type="text/javascript" src="${basepath }/static/js/easydialog.js"></script>
    <script type="text/javascript" src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
   
    <style type="text/css">
        html,body{margin: 0px;padding: 0px;}
        .container{
            max-width: 760px;
            padding: 8px;
        }
        .header{
            border-bottom: 1px solid #aaaaaa;
            min-height: 86px;;
        }
        .signitem{
            height: 50px;
            line-height: 50px;
            font-size: 20px;
            border-bottom: 1px solid #DDDDDD;
        }
        .old{
            color: #999999;
        }
        .time{
            float: left;
            font-size: 18px;
        }
        .state{
            float: right;
            font-size: 18px;
        }
        .done{
            color: #666;
        }
        .done .state{
            color: #529bea;
        }
        .doit{
            color: #529bea;
        }
        .signbtn{
            color: #FFFFFF;
            background-color: #529bea;
            display: inline-block;
            padding: 5px 10px;
            line-height: normal;
            border-radius: 5px;
            float: right;
            margin-top: 6px;;
        }
        .wait {
            color: #999999;
        }
        .wait .signbtn{
            background-color: #999999;
            color: #FFFFFF;
        }
        .topimg{
            height: 70px;
            float: right;
            margin-top: -70px;;
        }
        .leftheader{
            padding-right: 80px;
        }
        .leftheader h2{
            color: #53575e;
        }
        .leftheader span{
            color: #999999;
        }
        
        .dialog-wrapper{
    position:fixed;
    left:0;
    top:0;
    right:0;
    bottom:0;
    background-color:rgba(0,0,0,0.5);
    z-index:100;
}
.dialog-box{
    border-radius:4px;
    border:1px solid #ccc;
    position:fixed;
    left:50%;
    top:50%;
    background:#fff;
    z-index:105;
    text-align:center;
    -webkit-transform: translate3d(-50%, -50%, 0);
    transform: translate3d(-50%, -50%, 0);
}
.dialog-box .dialog-header{
    min-height:44px;
    line-height:44px;
    font-size:16px;
    color:#529bea;
    border-bottom:2px solid #529bea;
    padding:0 15px;
    text-align: left;
}
.dialog-box .dialog-content{
    font-size:16px;
    color:#53575e;
    border-bottom:1px solid #ccc;
    padding:15px;
    line-height:22px;
    text-align: left;
}
.dialog-box .dialog-content input{
	width:100%;
	box-sizing:border-box;
	display:block;
	height:38px;
	padding:6px;
	line-height:24px;
	border:1px solid #ccc;
	border-radius:5px;
	text-align:center;
	font-size:16px;
}
.dialog-box .dialog-footer{
    min-height:44px;
    line-height:44px;
    font-size:16px;
    color:#53575e;
}
.dialog-box .dialog-footer span{
    text-align:center;
    display:inline-block;
    cursor:pointer;
    width:50%;
    color:#529bea;
}
.dialog-box .dialog-footer span:last-child{
    box-sizing:border-box;
    border-left:1px solid #ccc;
}
.dialog-box .dialog-footer.cols-1 span{
    width:100%;
}

.light-block{
		    line-height: 20px;
		    height:24px;
		    color:#fff;
		    background-color: #000;
		    font-size:14px;
		    -webkit-box-sizing: border-box;
		    -moz-box-sizing: border-box;
		    box-sizing: border-box;
		    padding:2px 20px;
		    position: fixed;
		    z-index: 200;
		    left:50%;
			bottom:55px;
		    text-align: center;
		    -webkit-transform: translate3d(-50%, 0, 0);
		    transform: translate3d(-50%, 0, 0);
		    overflow: hidden;
		}
        
    </style>
    
</head>
<body>
    <div class="container">
        <c:if test="${flag eq 'yes' }">
        <div class="header">
            <div class="leftheader">
               <h2>${entity.name }</h2>
                <span>${ltfun:dateLongToStringFormat(entity.createTime,'yyyy-MM/dd HH:mm') }</span>
            </div>
     	<img src="${basepath }/static/img/signin.png" class="topimg">
        </div>
        </c:if>
        <div class="body">
         <c:if test="${flag eq 'no' }">
            <div class="signitem old">
                <span class="time">今天无签到，明天再来~！</span>
            </div>
        </c:if>
        <c:forEach items="${list}" var="item" varStatus="vs">
        	<c:if test="${item.isSignin == 0 && current >item.endTime }">
           		<div class="signitem old">
               		<span class="time">${ltfun:dateLongToStringFormat(item.startTime,'MM/dd HH:mm') }-${ltfun:dateLongToStringFormat(item.endTime,'MM/dd HH:mm') }</span>
                	<span class="state">未签到</span>
            	</div>
        	</c:if>
        	
        	<c:if test="${item.isSignin == 1 && current >item.endTime }">
           		<div class="signitem done">
                	<span class="time">${ltfun:dateLongToStringFormat(item.startTime,'MM/dd HH:mm') }-${ltfun:dateLongToStringFormat(item.endTime,'MM/dd HH:mm') }</span>
                	<span class="state">&nbsp;已签到</span>
            	</div>
        	</c:if>
        	
        	<c:if test="${item.isSignin == 1 && current >=item.startTime && current<= item.endTime   }">
           		<div class="signitem done">
                	<span class="time">${ltfun:dateLongToStringFormat(item.startTime,'MM/dd HH:mm') }-${ltfun:dateLongToStringFormat(item.endTime,'MM/dd HH:mm') }</span>
                	<span class="state">&nbsp;已签到</span>
            	</div>
        	</c:if>
        	<c:if test="${item.isSignin == 0 && current >=item.startTime && current<= item.endTime   }">
           		<div class="signitem doit">
                	<span class="time">${ltfun:dateLongToStringFormat(item.startTime,'MM/dd HH:mm') }-${ltfun:dateLongToStringFormat(item.endTime,'MM/dd HH:mm') }</span>
            		  <span class="signbtn" onclick="signin('${item.id}');"><i class="fa fa-calendar"></i>&nbsp;签到</span>
            	</div>
        	</c:if>
        	<c:if test="${item.isSignin == 0 && current < item.startTime   }">
           		<div class="signitem wait">
                	<span class="time">${ltfun:dateLongToStringFormat(item.startTime,'MM/dd HH:mm') }-${ltfun:dateLongToStringFormat(item.endTime,'MM/dd HH:mm') }</span>
            		  <span class="signbtn"><i class="fa fa-calendar"></i>&nbsp;未开始</span>
            	</div>
        	</c:if>
        
        </c:forEach>
          <input type="hidden" id="openId" value="${openId }">
          <input type="hidden" id="signinCode" value="${entity.signinCode }">
          <input type="hidden" id="sid" value="${entity.id }">
          <input type="hidden" id="tid" value="">
        </div>
    </div>
</body>
<script type="text/javascript">
var lightBlock = (function () {
    'use strict';
    var showLightBlock;
    var configMap = {//可选配置参数
        text: '请输入提示文字',  //设置提示文本
        time: 1,  //设置提示色块几秒后消失
        bottom: 55,  //设置提示色块，距离页面底部的距离，单位px
        isVerticalMiddle: false,  //设置是否在垂直方向上，居中提示色块
        isStaticWidth: false,  //设置是否固定提示色块的宽度
        width: 120,  //设置提示色块的宽度
        isVerticalTop: false,  //设置是否在垂直方向上，依据页面头部布局
        top: 5,  //设置提示色块，距离页面头部的距离，单位px
        bgColor: '#000',  //设置提示色块背景色
        color: '#fff'  //设置提示色块文字颜色
    };
    var stateMap = {
        block: null
    };
    var myConfigMap;

    showLightBlock = function (initMap) {
        var div;
        if (!initMap) {
            myConfigMap = configMap;
        }
        if (typeof initMap === 'string') {
            configMap.text = initMap;
            myConfigMap = configMap;
        }
        if (initMap && typeof initMap === 'object') {
            myConfigMap = $.extend(true, {}, configMap, initMap);
        }
        div = document.createElement('div');
        div.id = 'light-block';
        div.className = 'light-block';
        if (myConfigMap.isVerticalMiddle) {
            div.style.bottom = '50%';
            div.style.webkitTransform = 'translate3d(-50%, 50%, 0)';
            div.style.transform = 'translate3d(-50%, 50%, 0)';
        } else if (myConfigMap.isVerticalTop) {
            div.style.bottom = 'auto';
            div.style.top = myConfigMap.top + 'px';
        } else {
            div.style.bottom = myConfigMap.bottom + "px";
        }
        if (myConfigMap.isStaticWidth) {
            div.style.width = myConfigMap.width + 'px';
        }
        div.style.backgroundColor = myConfigMap.bgColor;
        div.style.color = myConfigMap.color;
        div.innerHTML = myConfigMap.text;
        document.body.appendChild(div);
        stateMap.block = div;
        setTimeout(function () {
            document.body.removeChild(div);
        }, myConfigMap.time * 1000);
    };

    return {//外部可调用的接口函数
        show: showLightBlock  //弹出提示色块
    };
}());

var lightDialog = (function () {
    'use strict';
    var createHtml, showLightDialog;
    var handleClickSure, handleClickCancel;
    var actionSure, actionCancel;
    var remove;
    var configMap = {//可选配置参数
        isShowHeader: true,  //设置对话框是否包含标题
        headerText: '请输入签到码',  //设置标题内容
        btnModel: 2,  //设置对话框按钮的数目，可配置为1或2
        contentText: '暂无内容',  //设置对话框提示内容
        footerText: ['取消', '确定'],  //设置按钮上文字
        width: 280  //设置对话框宽度
    };
    var myConfigMap;
    var domMap = {
        dialog: null
    };

    createHtml = function () {
        var html = [];
        var div = document.createElement('div');
        div.className = 'dialog-wrapper';
        div.id = 'dialog-wrapper';
        html.push('<div class="dialog-box" style="width:'+ myConfigMap.width +'px;">');
        if (myConfigMap.isShowHeader) {
            html.push('<div class="dialog-header set-color set-bd-color">'+ myConfigMap.headerText +'</div>');
        }
        html.push('<div class="dialog-content"><input id="code" type="text" placeholder="请输入签到码" /></div>');
        if (myConfigMap.btnModel === 2) {
            html.push('<div class="dialog-footer"><span class="set-color" id="dialog-cancel">'+ myConfigMap.footerText[0] +'</span><span  class="set-color" id="dialog-sure">'+ myConfigMap.footerText[1] +'</span></div>');
        } else if (myConfigMap.btnModel === 1) {
            html.push('<div class="dialog-footer cols-1"><span class="set-color"  id="dialog-sure">'+ myConfigMap.footerText[0] +'</span></div>');
        }
        html.push('</div>');
        div.innerHTML = html.join('');
        domMap.dialog = div;
        return div;
    };

    showLightDialog = function (initMap, sureCallBack, cancelCallBack) {//initMap：对话框的配置参数，sureCallBack:点击确认时的回调函数，cancelCallBack：点击取消时的回调函数
        if (!initMap) {
            myConfigMap = configMap;
        }
        if (typeof initMap === 'string') {
            configMap.contentText = initMap;
            myConfigMap = configMap;
        } else if (initMap && typeof initMap === 'object') {
            myConfigMap = $.extend(true, {}, configMap, initMap);  //这一行代码依赖了jQuery,可优化
        }
        if (sureCallBack && typeof sureCallBack === 'function') {
            actionSure = sureCallBack;
        } else {
            actionSure = remove;
        }
        if (cancelCallBack && typeof cancelCallBack === 'function') {
            actionCancel = cancelCallBack;
        } else {
            actionCancel = remove;
        }
        document.body.appendChild(createHtml());
        if (myConfigMap.btnModel === 2) {
            document.getElementById('dialog-sure').addEventListener('click', handleClickSure, false);
            document.getElementById('dialog-cancel').addEventListener('click', handleClickCancel, false);
        } else if (myConfigMap.btnModel === 1) {
            document.getElementById('dialog-sure').addEventListener('click', handleClickSure, false);
        }
    };

    handleClickSure = function (e) {
        actionSure();
    };

    handleClickCancel = function (e) {
        actionCancel();
    };

    remove = function () {
        document.body.removeChild(domMap.dialog);
    };

    return {//外部可调用的接口函数
        show: showLightDialog,  //弹出对话框
        remove: remove  //移除对话框
    };
}());


var signinCode ="";
function signin(tid){
	$("#tid").val(tid);
    signinCode = $("#signinCode").val();
	if(signinCode==null||signinCode==""){
		  dosign();
	}else{
		lightDialog.show("确定提交吗？",
                function(){
					tosignincode();
            		
        
                },
                function(){
                	lightDialog.remove();
                });
	
		
	}
}

/*
	 easyDialog.open({
 	      container : {
 	        content : '<div style="padding:2%;width:100%;box-sizing:border-box;"><label>请输入签到码</label></div><input type="text" id="code" style="box-sizing:border-box;margin:0 auto;display:block;width:96%;height:30px"/>',
 	        yesFn : sign,
 	        noFn : btnFn
 	 	  }
	 });

 */
	 
function tosignincode(){
	var code = $("#code").val();
	signinCode = $("#signinCode").val();
	if(signinCode!=code && code !="" && code!=null){
		lightBlock.show("签到码错误！");
	}else if(code =="" || code==null){
		lightBlock.show("请输入签到码!");
	}else{
		dosign();
	}
	

}

function dosign(){
	var openId = $("#openId").val();
	var sid = $("#sid").val();
	var tid = $("#tid").val();
	$.ajax({
		type:"POST",
		url : "${basepath}/m/signin/sign",
		data:{openId:openId,sid:sid,tid:tid},
		success:function(data){
			if(data.rs=="fail"){
				lightBlock.show("签到失败！");
			}else{
				lightBlock.show("签到成功");
				lightDialog.remove();
				setTimeout(function(){
					window.location.href="${basepath}/m/signin/index.xhtml?id=${entity.id }";
				},800);
			}
		}

	});

}


</script>
</html>