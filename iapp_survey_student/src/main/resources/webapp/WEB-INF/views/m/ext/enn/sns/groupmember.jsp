<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
	<head>
		<title>群组成员</title>
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
                ${group.title }(${group.member_num })
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="module-group-people">
            <c:forEach items="${list }" var="item">
                <div class="people" onclick="toUserDetail('${item.uid}');">
                    <ul>
                        <li>
                        	<img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray" />
                        </li>
                        <li>${ item.uname}</li>
                    </ul>
                </div>
            </c:forEach>
     
                <%--
                <div class="people">
                    <ul>
                        <li><img src="img/plus2.png" /></li>
                        <li></li>
                    </ul>
                </div>
                 --%>
            </div>
        </section>
		
		<%--
        <div class="block-logout-group">
            <div class="btn-logout">退出群组</div>
        </div>
		 --%>

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
