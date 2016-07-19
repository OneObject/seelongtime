<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

.clr {
	clear: both;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
}

.mybox {
	width: 312px;
	padding: 10px;
	border: 1px solid #ddd;
	float: left;
}

.mypHead {
	width: 312px;
	position: relative;
	float: left;
	margin-bottom: 2px;
}

.mypHead img {
	width: 290px;
	height: 145px;
}

.mypHead a {
	display: block;
	width: 290px;
	padding: 0px 6px;
	text-align: left;
	height: 36px;
	line-height: 36px;
	position: absolute;
	bottom: 0px;
	background: #000;
	filter: alpha(opacity =     65);
	-moz-opacity: 0.65;
	-khtml-opacity: 0.65;
	opacity: 0.65;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
}

.mypHead a span.r {
	float: right;
}

.mybox ul {
	width: 290px;
	padding: 6px 14px;
	float: left;
	position: relative;
}
/** .mybox ul.b{border-top:1px solid #ddd;color:#666;}*/
.mybox ul.b li {
	text-align: left;
	float: left;
}

.mybox ul.b li.txt {
	width: 174px;
}

.mybox ul.b li.txt a {
	float: left;
	width: 174px;
	color: #666;
	padding: 5px 0px;
}

.mybox ul.b li.txt span {
	float: left;
	width: 174px;
}

.mybox ul.b li.pic {
	width: 78px;
	height: 78px;
	float: right;
}

.mybox ul.b li.del {
	position: absolute;
	right: -8px;
	top: 40px;
	display: none;
}

.mybox ul:hover li.del {
	display: block;
}

.mybox ul.b li.del .fa {
	font-size: 22px;
	color: #666;
}

.mybox ul.b img {
	width: 78px;
	height: 78px;
}

.mypHead+ul.b {
	padding-top: 10px;
	border: none;
}
</style>
<!-- 素材管理内容 start -->

<c:if test="${not empty list }">
	<c:forEach items="${list }" var="info" varStatus="vs">
		<div class="mybox">
			<c:if test="${vs.index eq 0}">
				<div class="mypHead">
					<img src="${info.coverPath }" alt="" class="appmsg_thumb"> <a
						href="${basepath }/protal/fodder/detail.xhtml?id=${info.id }"
						target="other"><span>${info.title}</span>  </a>
				</div>
			</c:if>
			<c:if test="${vs.index ne 0}">
				<ul class="b">
					<li class="txt"><a
						href="${basepath }/protal/fodder/detail.xhtml?id=${info.id }"
						target="other">${info.title }</a><br /> <span> 
					</span></li>
					<li class="pic"><img src="${info.coverPath }" alt=""
						class="appmsg_thumb"></li>
					<li class="del" title="删除"><a href="javascript:void(0);"
						onclick="dropMatter('${info.id}')"> <i class="fa fa-trash-o"></i>
					</a></li>
				</ul>
			</c:if>
		</div>
	</c:forEach>
	<input type="hidden" id="sumFodder" value="${sum}">
</c:if>
<!-- 素材管理内容 end -->
