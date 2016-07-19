<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta name="format-detection" content="telephone=no" />
		<title>辅导成员</title>
		<style type="text/css">
			body {
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
                辅导成员
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="block-member-title">
                学员
            </div>
            <div class="module-group-people module-group-people2">
	            <c:forEach items="${studentlist }" var="item">
	            	<div class="people"  onclick="toUserDetail('${item.id }');">
	                    <ul>
	                        <li><img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray" /></li>
	                        <li>${item.name }</li>
	                    </ul>
	                </div>
	            </c:forEach>
            </div>
            <div class="block-member-title">
               指导人
            </div>
            <div class="module-group-people module-group-people2">
                <c:forEach items="${teacherlist }" var="item">
	            	<div class="people" onclick="toUserDetail('${item.id }');">
	                    <ul>
	                        <li><img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray" /></li>
	                        <li>${item.name }</li>
	                    </ul>
	                </div>
	            </c:forEach>
            </div>
            <!-- <div class="view-history">
                查找历史记录
            </div> -->
        </section>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
            $(function () {
                var $btnBack = $('#btn-back');
                var $loading;

                $btnBack.bind('click', function () {
                    window.history.go(-1);
                });
            });
        </script>
	</body>
</html>
