<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<title>主页</title>
		<link type="text/css" rel="stylesheet" href="${basepath }/static/m_h5/css/style_robam.css" />
		<style type="text/css">
			:root{height: 100%;}
			body{height:100%;}
			.info-show{
				display: none;
				text-align: center;
				background: #000;
				color:#fff;
				font-size:16px;
				position: fixed;
				top:0;
				left:0;
				bottom:0;
				right:0;
				z-index: 100;
			}
			.info-show label{
				display: block;
				width: 100%;
				position:absolute;
				top:50%;
				-webkit-transform: translate3d(0, -50%, 0);
				transform: translate3d(0, -50%, 0);
			}
			@media screen and (min-aspect-ratio : 1/1){
				.info-show{
					display: block;
				}
			}
		</style>
	</head>
	<body>
		<section class="header">
			<h1>ROBAM</h1>
			<div class="logo">
				<c:if test="${empty user.avatar }">
					<img src="${basepath }/static/m_h5/img/robam/tx.png"  />
				</c:if>
				<c:if test="${not empty user.avatar }">
					<img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>"  />
				</c:if>
			</div>
		</section>
		<nav>
			<div>
				<span><a href="${basepath }/m/h5/custom/category_robam.xhtml"><img src="${basepath }/static/m_h5/img/robam/c1.png" /></a></span>
				<span><a href="${basepath }/m/ixin/ntopic/index.xhtml?fdomain=robam"><img src="${basepath }/static/m_h5/img/robam/c2.png" /></a></span>
				<span><a href="${basepath }/m/h5/nask/index.xhtml?fdomain=robam"><img src="${basepath }/static/m_h5/img/robam/c3.png" /></a></span>
			</div>
			<div>
				<span><a href="${basepath }/m/h5/usercenter/index.xhtml?fdomain=robam"><img src="${basepath }/static/m_h5/img/robam/c4.png" /></a></span>
				<span><a href="${basepath }/m/h5/feed/tofeedback.xhtml?model=0"><img src="${basepath }/static/m_h5/img/robam/c5.png" /></a></span>
				<span><a href="${basepath }/m/h5/exam/index.xhtml"><img src="${basepath }/static/m_h5/img/robam/c6.png" /></a></span>
			</div>
		</nav>
		<div class="info-show">
			<label>为了更好的体验，请竖屏浏览！</label>
		</div>
	</body>
</html>
