<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<html>
<head>
<title>好友列表</title>
</head>
<body class="bg-color-gray">
        <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
                ${user.name}的好友列表
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="wrapper-static">
         <c:if test="${empty list }">
				<div class="no-data-img"></div>
			</c:if>
			 <c:if test="${not empty list }">
			<div class="module-group-people3">
			
                <c:forEach var="user" items="${list }">
					<div class="people">
                    <ul>
                        <li onclick="toUserDetail('${user.id}');"><img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray" /></li>
                        <li>${user.name}</li>
                    </ul>
					</div>
                </c:forEach>
            </div>
			</c:if>
        </section>

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
            $(function () {
                var $btnBack = $('#btn-back');

                $btnBack.bind('click', function () {
                    window.history.go(-1);
                });

            });
        </script>
	</body>
</html>