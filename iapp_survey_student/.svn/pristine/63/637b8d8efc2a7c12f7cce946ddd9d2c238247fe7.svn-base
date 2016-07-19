<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@page import="com.longtime.ajy.model.vo.TenantInfo"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%
String domain = MwebHelper.getCurrentDomain();
if(StringUtils.isNotBlank(domain)){
    pageContext.setAttribute("domain", domain);
}
%>
<!DOCTYPE html>
<html>
	<head>
		<title>登录</title>
		<meta http-equiv="content-language" content="en-US" />
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"/>
		<meta name="format-detection" content="telephone=no" />
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/font-awesome.min.css?v=2" />
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/guidance.2.0.css?v=2" />	
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css?v=2" />	
		        <style type="text/css">
            body{
                background: #f8f8f8;
            }
        </style>
        <script type="text/javascript">
		<!--手机设备id-->
		var deviceId = "";
		window.apiready = function(){
			var ajpush = api.require('ajpush');
		    ajpush.init(function(ret) {
		        if (ret && ret.status){


		        }
		    });
		    ajpush.getRegistrationId(function(ret) {
		    	deviceId = ret.id;
                //alert("rgid="+deviceId);
                
            });
		    
		    var backSecond = 0;
		      api.addEventListener({name: 'keyback'}, function(ret, err){
		         var curSecond = (new Date).getSeconds();
		         if(Math.abs(curSecond - backSecond) > 3){
		             backSecond = curSecond;
		            // alert("next click will exit!");
		         }else{
		             api.closeWidget();  //exit
		         }
		    });
			  
		}
		</script>
		<%@ include file="/WEB-INF/layouts/m_ext_enn/analysis_baidu.jsp"%>

	</head>
	<body>
	 	<span id="showUxue" style="display:none;" class="btn-back-box">
            <i class="fa fa-angle-left"></i>
        </span>
	<form method="post" action="${basepath}/m/ext/enn/login.xhtml" id="loginForm" method="post">
		<input type="hidden" name="deviceId" id="deviceId"> 
        <section class="module-login">
            <div class="block-logo"></div>
            <div class="block-link-info" style="margin:-5px 0 8px;">
            <c:choose>
            	<c:when test="${not empty loginForm and loginForm.customLogin }">
            		 <a style="text-decoration:underline;font-size: 15px;"  href="javascript:void(0);" class="change-input-model1" id="change-input-model">返回</a>
            	</c:when>
            	<c:otherwise>
            		 <a style="text-decoration:underline;font-size: 15px;"  href="javascript:void(0);" class="change-input-model1"  id="change-input-model">首次登录？点击这里</a>
            	</c:otherwise>
            </c:choose>
            
               
            </div>
            <div class="block-input">
            
            <c:choose>
            	<c:when test="${not empty loginForm and loginForm.customLogin }">
            		<input type="text"  name="c_username" placeholder="员工编号" value="${loginForm.username}" />
            		<input type="hidden" name="custom" value="username"/>
            		<input type="hidden" name="custom" value="name"/>
            	</c:when>
            	<c:otherwise>
            		 <input type="text" id="username"  name="username" placeholder="员工编号" value="${loginForm.username }" />
            	</c:otherwise>
            </c:choose>
            
               
            </div>
            <div class="block-help-info">
                无员工编号请填写手机号
            </div>
            <div class="block-input" id="change-input-box">
            
             <c:choose>
            	<c:when test="${not empty loginForm and loginForm.customLogin }">
            		<input type="text" name="c_name" placeholder="第一次登录输入姓名" />
            	</c:when>
            	<c:otherwise>
            		<input type="password" id="password"  name="password" placeholder="密码" />
            	</c:otherwise>
            </c:choose>
            
                
            
            
            </div>
            <div class="block-error-info">
           	 <c:if test="${not empty loginForm and loginForm.code !='success'}">
		           <c:choose>
		                <c:when test="${loginForm.code=='empty'}">请输入信息</c:when>
		                <c:when test="${loginForm.code=='pwdfial'}">账号或密码错误</c:when>
		                <c:when test="${loginForm.code=='disable'}">账号被禁用</c:when>
		                <c:when test="${loginForm.code=='expire'}">账号已过期</c:when>
		                <c:when test="${loginForm.code=='ineffective'}">账号未生效</c:when>
		                <c:when test="${loginForm.code=='already_bind'}">账号已被绑定</c:when>
		                <c:when test="${loginForm.code=='fail'}">信息输入错误</c:when>
		                <c:when test="${loginForm.code=='notnamelogin'}">已经激活，不支持员工编号和姓名登录</c:when>
		           </c:choose>
	         </c:if>
            </div>
            <div class="block-login-btn" data-status="" onclick="submitENN(this);">
                登录
            </div>
            <div class="block-link-info">
            <c:choose>
            	<c:when test="${not empty loginForm and loginForm.customLogin }">
            		 <a style="text-decoration:underline;font-size: 15px;"  href="javascript:void(0);" class="change-input-model2"  id="change-input-model">返回</a>
            	</c:when>
            	<c:otherwise>
            		 <a style="text-decoration:underline;font-size: 15px; color:blue;"  href="${basepath}/m/ext/enn/findpwd/index.xhtml?fdomain=${empty domain ? 'ennapp':domain}" class="findpwd"  id="findpwd ">忘记密码?</a>
            	</c:otherwise>
            </c:choose>
            
               
            </div>
            <ul class="block-tel">
                <li>客服电话</li>
                <li><a href="tel:021-50936301">021-50936301</a></li>
            </ul>
        
         <input type="hidden" name="domain" value="${empty domain ? 'ennapp':domain}"/>
         
        </section>
        </form>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
            $(function () {
                var $btnBack = $('#btn-back');
                var firstLoginShowed = ${not empty loginForm and loginForm.customLogin ? true:false };
                var $changeInputModel1 = $('.change-input-model1');
                var $changeInputModel2 = $('.change-input-model2');
                var $changeInputBox = $('#change-input-box');
                var $blockinput = $('.block-input');


                $changeInputModel1.bind('click', function () {
                    var $temp = $(this);
                    if (!firstLoginShowed) {
                        $temp.html('返回');
                        if ($changeInputModel2.length) {
                        	$changeInputModel2.html('返回');
                        }
                        $blockinput.html('<input type="text"  name="c_username" placeholder="员工编号" value="${loginForm.username}" />');
                        $changeInputBox.html('<input type="text" name="c_name" placeholder="第一次登录输入姓名" />');
        				$changeInputBox.append('<input type="hidden" name="custom" value="username"/>');
        				$changeInputBox.append('<input type="hidden" name="custom" value="name"/>');
                        firstLoginShowed = true;
                    } else {
                        $temp.html('首次登录？点击这里');
                        if ($changeInputModel2.length) {
                        	$changeInputModel2.html('首次登录？点击这里');
                        }
                        $blockinput.html('<input type="text" id="username"  name="username" placeholder="员工编号" />');
                        $changeInputBox.html('<input type="password" id="password"  name="password" placeholder="密码" />');
                        firstLoginShowed = false;
                    }
                });
                
                $changeInputModel2.bind('click', function () {
                    var $temp = $(this);
                    if (!firstLoginShowed) {
                        $temp.html('返回');
                        if ($changeInputModel1.length) {
                        	$changeInputModel1.html('返回');
                        }
                        $blockinput.html('<input type="text"  name="c_username" placeholder="员工编号" value="${loginForm.username}" />');
                        $changeInputBox.html('<input type="text" name="c_name" placeholder="第一次登录输入姓名" />');
        				$changeInputBox.append('<input type="hidden" name="custom" value="username"/>');
        				$changeInputBox.append('<input type="hidden" name="custom" value="name"/>');
                        firstLoginShowed = true;
                    } else {
                        $temp.html('首次登录？点击这里');
                        if ($changeInputModel1.length) {
                        	$changeInputModel1.html('首次登录？点击这里');
                        }
                        $blockinput.html('<input type="text" id="username"  name="username" placeholder="员工编号" />');
                        $changeInputBox.html('<input type="password" id="password"  name="password" placeholder="密码" />');
                        firstLoginShowed = false;
                    }
                });

            });

            $("#showUxue").bind('click',function(){
            	if (/ipad|iphone/i.test(navigator.userAgent)){
             	   var str1 = '{ "type": "goHome"}'; 
                     connectWebViewJavascriptBridge(function (bridge) {
                         bridge.init(function (message, responseCallback) {
                             responseCallback()
                         })
                         bridge.registerHandler('JavascriptHandler', function (data, responseCallback) {
                             responseCallback(data)
                         })
                         bridge.send(str1,function (responseData) {
                         })
                     })
                     }
                 if (/android/i.test(navigator.userAgent)){
                            window.dome.goBackHome();
                   }else{
                        return false;
                    }
                
                 function connectWebViewJavascriptBridge(callback) {
                     if (window.WebViewJavascriptBridge) {
                         callback(WebViewJavascriptBridge)
                     } else {
                         document.addEventListener('WebViewJavascriptBridgeReady', function () {
                             callback(WebViewJavascriptBridge)
                         }, false)
                     }
                 }

                 if (window.WebViewJavascriptBridge) {
                     return
                 }
                 var messagingIframe
                 var sendMessageQueue = []
                 var receiveMessageQueue = []
                 var messageHandlers = {}
                 var CUSTOM_PROTOCOL_SCHEME = 'wvjbscheme'
                 var QUEUE_HAS_MESSAGE = '__WVJB_QUEUE_MESSAGE__'
                 var responseCallbacks = {}
                 var uniqueId = 1

                 function _createQueueReadyIframe(doc) {
                     messagingIframe = doc.createElement('iframe')
                     messagingIframe.style.display = 'none'
                     doc.documentElement.appendChild(messagingIframe)
                 }

                 function init(messageHandler) {
                     if (WebViewJavascriptBridge._messageHandler) {
                         throw new Error('WebViewJavascriptBridge.init called twice')
                     }
                     WebViewJavascriptBridge._messageHandler = messageHandler
                     var receivedMessages = receiveMessageQueue
                     receiveMessageQueue = null
                     for (var i = 0; i < receivedMessages.length; i++) {
                         _dispatchMessageFromObjC(receivedMessages[i])
                     }
                 }

                 function send(data, responseCallback) {
                     _doSend({data: data}, responseCallback)
                 }

                 function registerHandler(handlerName, handler) {
                     messageHandlers[handlerName] = handler
                 }

                 function callHandler(handlerName, data, responseCallback) {
                     _doSend({handlerName: handlerName, data: data}, responseCallback)
                 }

                 function _doSend(message, responseCallback) {
                     if (responseCallback) {
                         var callbackId = 'cb_' + (uniqueId++) + '_' + new Date().getTime()
                         responseCallbacks[callbackId] = responseCallback
                         message['callbackId'] = callbackId
                     }
                     sendMessageQueue.push(message)
                     messagingIframe.src = CUSTOM_PROTOCOL_SCHEME + '://' + QUEUE_HAS_MESSAGE
                 }

                 function _fetchQueue() {
                     var messageQueueString = JSON.stringify(sendMessageQueue)
                     sendMessageQueue = []
                     return messageQueueString
                 }

                 function _dispatchMessageFromObjC(messageJSON) {
                     setTimeout(function _timeoutDispatchMessageFromObjC() {
                         var message = JSON.parse(messageJSON)
                         var messageHandler

                         if (message.responseId) {
                             var responseCallback = responseCallbacks[message.responseId]
                             if (!responseCallback) {
                                 return;
                             }
                             responseCallback(message.responseData)
                             delete responseCallbacks[message.responseId]
                         } else {
                             var responseCallback
                             if (message.callbackId) {
                                 var callbackResponseId = message.callbackId
                                 responseCallback = function (responseData) {
                                     _doSend({responseId: callbackResponseId, responseData: responseData})
                                 }
                             }

                             var handler = WebViewJavascriptBridge._messageHandler
                             if (message.handlerName) {
                                 handler = messageHandlers[message.handlerName]
                             }

                             try {
                                 handler(message.data, responseCallback)
                             } catch (exception) {
                                 if (typeof console != 'undefined') {
                                     console.log("WebViewJavascriptBridge: WARNING: javascript handler threw.", message, exception)
                                 }
                             }
                         }
                     })
                 }

                 function _handleMessageFromObjC(messageJSON) {
                     if (receiveMessageQueue) {
                         receiveMessageQueue.push(messageJSON)
                     } else {
                         _dispatchMessageFromObjC(messageJSON)
                     }
                 }

                 window.WebViewJavascriptBridge = {
                     init: init,
                     send: send,
                     registerHandler: registerHandler,
                     callHandler: callHandler,
                     _fetchQueue: _fetchQueue,
                     _handleMessageFromObjC: _handleMessageFromObjC
                 }

                 var doc = document
                 _createQueueReadyIframe(doc)
                 var readyEvent = doc.createEvent('Events')
                 readyEvent.initEvent('WebViewJavascriptBridgeReady', false, true)
                 readyEvent.bridge = WebViewJavascriptBridge
                 doc.dispatchEvent(readyEvent)
            });
            
            UXueAPP();
            function UXueAPP(){
            	if (/ulearning/i.test(navigator.userAgent) || 'true'=='${param.uxuedebug}'){
    				$("#showUxue").show();
    			}
            }

           	function submitENN(_this){
           		var $temp = $(_this);
           		var status = $temp.data('status');
           		if (status === 'clicked') {
					return;           			
           		}
           		$temp.data('status', 'status');
           		$temp.html('提交中...');
           		
           		//失败回调
           		//$temp.data('status', '');
           		//$temp.html('登录');
           		
           		$("#deviceId").val(deviceId);
           		$("#loginForm").submit();
            }

        </script>
	</body>
</html>
