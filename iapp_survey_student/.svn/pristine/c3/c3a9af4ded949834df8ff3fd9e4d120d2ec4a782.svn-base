<%@ page import="java.util.Map"%>
<%@ page import="com.google.common.collect.Maps"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%

Map<String, String> options = Maps.newHashMap();

options.put("0","不能做到");
options.put("1","不能做到");
options.put("2","不能做到");
options.put("3","偶尔做到");
options.put("4","偶尔做到");
options.put("5","基本做到");
options.put("6","基本做到");
options.put("7","按标准做到");
options.put("8","按标准做到");
options.put("9","主动及时做到");
options.put("10","主动及时做到");

pageContext.setAttribute("options", options);

%>
<!DOCTYPE html>
<html>
	<head>
		<title>观察评估</title>
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
                观察评估
            </div>
        </header>
        <section class="wrapper-static margin-top-50">
            <div class="block-name">${sResult.authoruname }对${sResult.touname }的观察评估</div>
            <div class="block-score-show">
                <dl>
                    <dt>1.每周与我一起总结本周工作并制定下周工作计划</dt>
                    <dd>
                   		${qid_1.answer }分 ${options[qid_1.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>2.经常与我沟通（至少1次/周），提出有助我成长的建议</dt>
                    <dd>
                        ${qid_2.answer }分 ${options[qid_2.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>3.我情绪上处于低谷时，能倾听并鼓励我，帮我缓解情绪困扰</dt>
                    <dd>
                        ${qid_3.answer }分 ${options[qid_3.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>4.为我提供学习实践的机会、资源及空间，使我从工作中成长</dt>
                    <dd>
                        ${qid_4.answer }分 ${options[qid_4.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>5.即使我犯了错，指导人仍能态度平和地纠正我的失误</dt>
                    <dd>
                        ${qid_5.answer }分 ${options[qid_5.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>6.指导方法灵活，有创新，容易让人接受且效果好，对我进行协同辅导</dt>
                    <dd>
                        ${qid_6.answer }分 ${options[qid_6.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>7.我因为工作或生活难题求助指导人时，都能得到有效的解决</dt>
                    <dd>
                        ${qid_7.answer }分 ${options[qid_7.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>8.指导人曾经给我独立完成了某个专项任务的机会，并给我及时有效的指导和反馈</dt>
                    <dd>
                        ${qid_8.answer }分 ${options[qid_8.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>9.向我明确工作职责和试用期间应达到的目标，并制定了相应的机会</dt>
                    <dd>
                        ${qid_9.answer }分 ${options[qid_9.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>10.对我未来的职业发展提供建议和指导</dt>
                    <dd>
                        ${qid_10.answer }分 ${options[qid_10.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>11.指导人指导过程中的优秀表现</dt>
                    <dd>
                        ${qid_11.answer }
                    </dd>
                </dl>
                <dl>
                    <dt>12.您对指导人未来的期待和建议</dt>
                    <dd>
                        ${qid_12.answer }
                    </dd>
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
