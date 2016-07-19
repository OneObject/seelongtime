<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
   
<title>创新之家</title>

<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
<script type="text/javascript" src="${basepath}/static/m/common.js"></script>

<style type="text/css">
header{
    width:100%;
    height:48px;
    line-height:32px;
    background-color:#529bea;
    padding:8px 10px;
    font-size:16px;
    color:#fff;
    text-align:center;
}

.dialog-box {
  border-radius: 4px;
  position: fixed;
  left: 50%;
  top: 50%;
  background: #f3f3f3;
  z-index: 105;
  text-align: center;
  -webkit-transform: translate3d(-50%, -50%, 0);
  transform: translate3d(-50%, -50%, 0); }
  
  
  
.dialog-box .dialog-header {
  min-height: 44px;
  line-height: 44px;
  font-size: 16px;
  color: #f64e55;
  border-bottom: 2px solid #f64e55;
  padding: 0 15px;
  text-align: left; }

.dialog-box .dialog-content {
  font-size: 16px;
  color: #53575e;
  padding: 15px;
  line-height: 58px;
  text-align: center; }

section,header,div,ul,dl,ol,a,span,h1,h2,h3,h4,li{
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

div.radio{padding:20px 10px 0px 10px;line-height:16px;}
div.radio div{width:50%;float:left;margin-bottom:18px;}
div.radio span{height:16px;padding-left:30px;display:block;float:left;font-size:16px;color:#999;background:url(${basepath}/static/m/ext/muyang/img/de.png) 3px center no-repeat;}
div.radio .checked{background:url(${basepath}/static/m/ext/muyang/img/ch.png) 3px center no-repeat;}

section.msg{padding:24px 10px 38px 10px;width:100%;overflow:hidden;}
section.msg div{width:auto;overflow:hidden;background:#fff;border-radius:5px;color:#999;font-size:16px;padding:8px;}
section.msg div textarea{border:none;min-height:152px;color:#999;width:auto;font-size:16px;}
section.msg p.textarea+p{height:16px;width:auto;line-height:16px;padding:8px;text-align:right;}

.keyword-input{
padding:15px 10px 10px;
width:100%;
height:52px;
overflow:hidden;
}
.keyword-input input{
background:#fff;
border-radius:5px;
color:#999;
font-size:16px;
padding:4px 8px;
line-height:24px;
border:0;
display:block;
width:100%;
}

a.sub{display:block;margin:0 10px;width:auto;height:38px;font-size:16px;color:#fff; background-color:#529bea;line-height:38px;text-align:center;}

.light-block {
  line-height: 20px;
  color: #fff;
  background-color: #000;
  font-size: 14px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  padding: 4px 20px;
  position: fixed;
  z-index: 105;
  left: 50%;
  bottom: 55px;
  text-align: center;
  -webkit-transform: translate3d(-50%, 0, 0);
  transform: translate3d(-50%, 0, 0);
  overflow: hidden; }
	
</style>
</head>

<body>
	

	<header>创新之家</header>
    
    <article class="scroll ctl_cont">
    <div class="radio">
		<div><span class="checked" value="0">新产品开发</span></div>
		<div><span value="1">技术创新</span></div>
		<div><span value="2">产品问题</span></div>
		<div><span value="3">其他</span></div>        
    </div>
    <div class="keyword-input">
    	<input type="text/css" id="keyword" placeholder="请输入关键字" />
    	
    </div>
    <div style="font-size:12px;color:#999;padding:0 14px;">
    	范例：粉碎机/自动换筛
    </div>
    <section class="msg">

    	<div>
        	<textarea id="context"  placeholder="请提出与产品开发、产品创新、产品问题等相关的详细建议与意见"></textarea>
        </div>
    </section>
    <a id="save"  onclick="save();" class="sub">提交</a>
    
    </article>
    <input type="hidden" id="type" value="0">
<script type="text/javascript" >

/**
 * lightDialog  可自定义的对话框
 */
var lightDialog = (function () {
    'use strict';
    var createHtml, showLightDialog;
    var handleClickSure, handleClickCancel;
    var actionSure, actionCancel;
    var remove;
    var configMap = {//可选配置参数
        isShowHeader: false,  //设置对话框是否包含标题
        headerText: '提示',  //设置标题内容
        //btnModel: 2,  //设置对话框按钮的数目，可配置为1或2
        contentText: '暂无内容',  //设置对话框提示内容
        //footerText: ['取消', '确定'],  //设置按钮上文字
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
        html.push('<div class="dialog-content">'+ myConfigMap.contentText +'</div>');
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


/**
 * lightBlock  可自定义的提示色块
 */
var lightBlock = (function () {
    'use strict';
    var showLightBlock;
    var configMap = {//可选配置参数
        text: '请输入提示文字',  //设置提示文本
        time: 2,  //设置提示色块几秒后消失
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
            div.style.bottom = myConfigMap.bottom + 'px';
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


$(function(){
	var tWidth=$(window).width()-36;
	$("textarea").width(tWidth);
	$("div.radio span").click(function(){
		var value;
		
		$(this).addClass("checked").closest('div').siblings().find('span').removeClass("checked");
		value=$(this).attr("value");
		$("#type").val(value);
		
		});

	});
function save(){
	var context = $.trim($("#context").val());
	var type = $("#type").val();
	var keyword = $.trim($("#keyword").val());
	if(context==""||context==null){
		lightBlock.show({ "text": "请输入内容",  //设置提示文本
	        "time": 1,  //设置提示色块几秒后消失
	        "bottom": 55,  //设置提示色块，距离页面底部的距离，单位px
	        "isVerticalMiddle": false,  //设置是否在垂直方向上，居中提示色块
	        "isStaticWidth": false,  //设置是否固定提示色块的宽度
	        "width": 120,  //设置提示色块的宽度
	        "isVerticalTop": false,  //设置是否在垂直方向上，依据页面头部布局
	        "top": 5,  //设置提示色块，距离页面头部的距离，单位px
	        "bgColor": '#000',  //设置提示色块背景色
	        "color": '#fff' });
		return;
	}
	$('#save').attr("onclick","");
	$.ajax({
		   async:false,
	       type:"POST",
	       url:"${basepath}/m/h5/feed/save.json",
	       data:{"context":context,"type":type,"keyword":keyword},
	       success:function(data){
				if(data){
				//	showTishi("感谢您的反馈");
					lightDialog.show({ "isShowHeader": false,  //设置对话框是否包含标题
				        "headerText": '提示',  //设置标题内容
				       // "btnModel": 1,  //设置对话框按钮的数目，可配置为1或2
				        "contentText": '感谢您的建议',  //设置对话框提示内容
				        //"footerText": ['确定'],  //设置按钮上文字
				        "width": 280   });
					//showMyTishi(, "#fff" , "#000" , 85);
					setTimeout(function(){
						window.location.href="${basepath}/m/ext/muyang/feedback.xhtml";
					},1000);
				}else{
					$('#save').attr("onclick","save();");
					showTishi("保存失败");
				}
	       },
		   error:function(){
			   $('#save').attr("onclick","save();");
			   showTishi("保存失败");
			}

		});
	
	
}


</script>
</body>
</html>
