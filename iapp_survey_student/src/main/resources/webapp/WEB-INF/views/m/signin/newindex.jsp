<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.common.utils.HtmlUtils"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>签到</title>
<link rel="stylesheet" type="text/css"
	href="${basepath}/static/css/sign.css" />
	<style type="text/css">
		.error-info{
			position:absolute;
			width:100%;
			font-size:24px;
			height:26px;
			line-height:26px;
			z-index:30;
			color:rgba(0,0,0,0.24);
			top:50%;
			margin-top:-13px;
			text-align:center;
		}
		.back a{
			color:#fff;
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
		    top:50%;
		    margin-top:-12px;
		    text-align: center;
		    -webkit-transform: translate3d(-50%, 0, 0);
		    transform: translate3d(-50%, 0, 0);
		    overflow: hidden;
		}
	</style>
</head>
<body class="body-bg-gray">
	<c:set var="signinCode" value="${empty currentSignin.sign_time_code?  entity.signinCode:currentSignin.sign_time_code }"/>
	<header class="ctl_header">
		<div class="title">签到</div>
		<div class="back" style="display: none"><a href="javascrpit:window.history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
	</header>
	<article class="scroll ctl_cont">
	<c:if test="${flag ne '0' }">
		<div class="sign-header">
			<ul>
				<li>${entity.name }</li>
				<c:if test="${ not empty currentSignin.id }">
				<li>${ltfun:dateLongToStringFormat(currentSignin.startTime,'yyyy-MM-dd')}</li>
				</c:if>
			</ul>
		</div>
	</c:if>

	<c:if test="${flag eq '0' }">

		<div class="error-info">签到不存在</div>

	</c:if>
	
	<c:if test="${flag eq '1' }">
		<div class="error-info">签到已结束</div>

	</c:if>

	<c:if test="${flag eq 2 }">
	
		<c:if test="${empty currentSignin.id }">
			<div class="error-info">当前时间无法签到</div>
		</c:if>
	
		<c:if test="${ not empty currentSignin.id }">
		<div class="sign-content">
			<div class="time">签到时间：${ltfun:dateLongToStringFormat(currentSignin.startTime,'HH:mm')}
						~${ltfun:dateLongToStringFormat(currentSignin.endTime,'HH:mm')}</div>
			<c:choose>
			<c:when test="${currentSignin.isSignin eq 0 }">

				<c:set var="isAutoSign" value="${empty signinCode and  ( current_domain eq 'ajy' or current_domain eq 'ENN' )}"/>

			<div class="box-to-sign" id="box-to-sign">
				<c:if test="${!isAutoSign}">
				<div class="info">您还未签到</div>
				</c:if>
				<c:if test="${ not empty signinCode  }">
					<input type="text" id="code" placeholder="输入签到码" />
					<div class="btn-sign" id="btn-sign-in">签到</div>
				</c:if>


				<c:if test="${empty signinCode && !isAutoSign}">
					<div class="btn-sign" id="btn-sign-in" style="margin-top: 40px;">签到</div>
				</c:if>
			</div>
			</c:when>
			<c:otherwise>
				<div class="box-signed" id="box-signed">
					<div class="sign-img"></div>
					<div class="info">
						已于 <label>${ltfun:dateLongToStringFormat(currentSignin.signinTime,'HH:mm')}</label> 签到
					</div>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
		</c:if>
		
		<c:if test="${not empty nextSignin.id }">
			<div class="sign-footer">
				<ul>
					<li>下次签到时间</li>
					<li>${ltfun:dateLongToStringFormat(nextSignin.startTime,'yyyy-MM-dd
						HH:mm')}~${ltfun:dateLongToStringFormat(nextSignin.endTime,'yyyy-MM-dd
						HH:mm')}</li>
				</ul>
			</div>
		</c:if>
	</c:if>
	
	</article>
	<input type="hidden" id="openId" value="${openId }">
	<input type="hidden" id="signinCode" value="${signinCode}">
	<input type="hidden" id="sid" value="${entity.id }">
	<input type="hidden" id="tid" value="${currentSignin.id}">
	<script type="text/javascript"
		src="${basepath}/static/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
        var $btnSignIn;
        var $boxToSign;
        var $boxSigned
        var lightBlock = (function () {
            'use strict';
            var showLightBlock;
            var configMap = {//可选配置参数
                text: '请输入提示文字',  //设置提示文本
                time: 1,  //设置提示色块几秒后消失
                bottom: '50%',  //设置提示色块，距离页面底部的距离，单位px
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
                    div.style.bottom = myConfigMap.bottom;
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
        $(function () {
            $btnSignIn = $('#btn-sign-in');
            $boxToSign = $('#box-to-sign');
            $boxSigned = $('#box-signed');
            $btnSignIn.bind('click', function () {
                //处理程序
            	signin();
                
            });

        });
        function showSigned() {
            $('body').append('<div class="signing-box" id="signing-box"><div class="signing"></div></div>');
            setTimeout(function () {
               		window.location.href="${basepath}/m/h5/signin/newindex.xhtml?id=${entity.id }";
            }, 500);
          }
 

var signinCode ="";
function signin(){
    signinCode = $("#signinCode").val();
	if(signinCode==null||signinCode==""){
		  dosign();
	}else{
		dosignincode();
	}
}


function dosignincode(){
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

var sflag = 0;
function dosign(){
	if(sflag == 1){
		return;
	}
	sflag = 1;
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
			}else if(data.rs == "-1"){
				lightBlock.show("不能重复签到！");
			}else{
				showSigned();
			}
			sflag = 0;
		},
		error:function(data){
			sflag = 0;
			lightBlock.show("系统忙，请重新尝试！");
		} 

	});

}

<c:if test="${isAutoSign}">

		signin();

</c:if>



</script>
</body>
</html>