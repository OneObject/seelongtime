<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>

<!DOCTYPE html>
<html>
	<head>
		<title>提示</title>
		<style type="text/css">
			body{
				background: #eee;
			}
			
		</style>
	</head>
	<body class="bg-color-gray">
	  <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
          	提示
            </div>
        </header>
	
		<section class="wrapper-static margin-top-50 ">
		<ul class="no-answer-img-ul" style="padding-top:50px;">
		    <li>
		    	${empty msg?'内容不存在':msg }
		    </li>
		    <li></li>
		</ul>
		</section>
    
    
     	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>

        <script type="text/javascript">
            $(function () {
                var $btnBack = $('#btn-back');

                $btnBack.bind('click', function () {
                	goback4UXue();
                });

            });
            
            function goback4UXue(){
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
        }
        </script>
    </body>
</html>