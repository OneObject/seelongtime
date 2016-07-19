<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
	<head>
		<title>实习记录</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/mobiscroll.custom-2.15.1.min.css" />
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
            实习记录
        </div>
    </header>
        <section class="wrapper-static margin-top-50 margin-bottom-55">
            <div class="block-name-date">
                <span class="name">学员：${user.name }</span>
                <span class="date">${ltfun:dateLongToStringFormat(entity.createtime,'yyyy-MM-dd')}</span>
            </div>
             <input type="hidden" id="taskid" value="${entity.taskid }"> 
            <div class="block-record">
                <dl>
                    <dt>本期主题任务</dt>
                    <dd class="bg-gray">${entity.subject }</dd>
                </dl>
                <dl>
                    <dt>实习内容概述</dt>
                    <dd class="bg-gray">${entity.content }</dd>
                </dl>
                <dl>
                    <dt>我的收获</dt>
                    <dd class="bg-gray">${entity.gains }</dd>
                </dl>
                <dl>
                    <dt>我的问题及需要的帮助</dt>
                    <dd class="bg-gray">${entity.problem}</dd>
                </dl>
                <c:if test="${not empty entity.heuristicproblem }">
                <dl>
                    <dt>启发式问题</dt>
                    <dd class="bg-gray">${entity.heuristicproblem }</dd>
                </dl>
                </c:if>
                <c:if test="${not empty entity.advise }">
                <dl>
                    <dt>下一步实践建议</dt>
                    <dd class="bg-gray">${entity.advise }</dd>
                </dl>
                </c:if>
                <c:if test="${not empty entity.promote }">
                <dl>
                    <dt>鼓励</dt>
                    <dd class="bg-gray">${entity.promote }</dd>
                </dl>
                </c:if>
            </div>
        </section>
        <c:if test="${isCoach }">
        <div class="block-create-record">
            <div>
                <span onclick="window.location.href='${basepath }/m/ext/enn/coach/newaddguidance.xhtml?pid=${entity.id}&coachid=${entity.coachid}'"><i class="fa fa-pencil"></i> 一键生成辅导记录</span>
            </div>
            <div>
                <span onclick="window.location.href = '${basepath }/m/ext/enn/coach/toaddfeedback.xhtml?id=${entity.id}';"><i class="fa fa-pencil-square-o"></i> 实习反馈</span>
            </div>
        </div>
        </c:if>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/mobiscroll.custom-2.15.1.min.js"></script>
        <script type="text/javascript">
            var dateOps = {
                theme: 'android',
                mode: 'mixed',
                display: 'modal',
                lang: 'zh'
            };

            $(function () {
                var $manList = $('.block-man-box > div');
                var $btnLeft1 = $('#btn-left-1');

                $btnLeft1.bind('click', function () {
                    window.history.go(-1);
                });

                $('#select-date1').mobiscroll().date(dateOps);

                $manList.bind('click', function () {
                    var temp = $(this);
                    if (temp.hasClass('selected')) {
                        temp.removeClass('selected');
                    } else {
                        temp.addClass('selected');
                    }
                });

            });
        </script>
	</body>
</html>
