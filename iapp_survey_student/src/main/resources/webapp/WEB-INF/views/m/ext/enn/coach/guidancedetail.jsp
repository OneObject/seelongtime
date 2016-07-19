<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
	<head>
		<title>辅导记录</title>
		 <style type="text/css">
			body {
				background: #eee;
			}
		</style>
	</head>
	<body class="bg-color-gray">
        <header>
            <span class="btn btn-left"  id="btn-left-1">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
                辅导记录
            </div>
        </header>
        <section class="wrapper-static margin-top-50">
            <div class="block-teach-record">
                <dl>
                    <dt>本期辅导主题</dt>
                    <dd>${entity.subject }</dd>
                </dl>
				<dl>
                    <dt>本期辅导要点</dt>
                    <dd>${entity.point }</dd>
                </dl>
                <dl>
                    <dt>表现好的方面</dt>
                    <dd>${entity.advantage }</dd>
                </dl>
                <dl>
                    <dt>待改进的方面</dt>
                    <dd>${entity.weakness }</dd>
                </dl>
            </div>
            <div class="block-help-footer">
                <ul>
                    <li>${ltfun:dateLongToStringFormat(entity.createtime,'yyyy-MM-dd')}</li>
                    <li>学员：${entity.uname }</li>
                </ul>
            </div>
            <div class="block-teach-record next-round">
                <dl>
                    <dt>下期辅导<label>${ltfun:dateLongToStringFormat(entity.nexttime ,'yyyy-MM-dd')}</label></dt>
                    <dd>${entity.nexttask }</dd>
                </dl>
            </div>
        </section>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
            $(function () {
                var $btnLeft1 = $('#btn-left-1');

                $btnLeft1.bind('click', function () {
                    window.history.go(-1);
                });
            });
        </script>
	</body>
</html>