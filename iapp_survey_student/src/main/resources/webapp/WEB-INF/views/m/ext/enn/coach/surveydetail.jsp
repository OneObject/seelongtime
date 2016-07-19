<%@ page import="java.util.Map"%>
<%@ page import="com.google.common.collect.Maps"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%

Map<String, String> options = Maps.newHashMap();

options.put("0","最差");
options.put("1","非常差");
options.put("2","非常差");
options.put("3","非常差");
options.put("4","较差");
options.put("5","较差");
options.put("6","合格");
options.put("7","合格");
options.put("8","良好");
options.put("9","良好");
options.put("10","优秀");

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
                    <dt>1.人际沟通：清晰流畅表达自己的想法，根据不同的交往对象使用不同的沟通方式，倾听他人表达内容，并恰当及时地回应；设身处地为他人着想，与周围人形成良好的人际关系</dt>
                    <dd>
                   		${qid_1.answer }分 ${options[qid_1.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>2.团队合作: 积极参与配合团队事务，发挥自身优势，努力贡献团队；乐于配合他人完成任务，不计较个人得失而达成团队目标</dt>
                    <dd>
                        ${qid_2.answer }分 ${options[qid_2.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>3.压力应对：冷静面对困难和挫折，运用技巧有效控制和处理压力，保持良好情绪状态，最终达成目标</dt>
                    <dd>
                        ${qid_3.answer }分 ${options[qid_3.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>4.适应性：乐于接受新环境，主动了解新情况，根据要求或环境变化而主动调整行为，以积极的态度面对调整过程中的不适，并很快形成新的行为方式</dt>
                    <dd>
                        ${qid_4.answer }分 ${options[qid_4.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>5.敬业负责：明白自身角色和职责，认真履行工作职责，做事有始有终，努力追求高质量的工作成果，为自己在工作中的行为及其结果负责</dt>
                    <dd>
                        ${qid_5.answer }分 ${options[qid_5.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>6.计划组织能力：有效管理自己或他人的时间和资源，确保工作目标能够有效达成</dt>
                    <dd>
                        ${qid_6.answer }分 ${options[qid_6.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>7.学习能力：有旺盛的求知欲和强烈的好奇心，能不断接受新事物，及时学习，更新知识，提高个人能力</dt>
                    <dd>
                        ${qid_7.answer }分 ${options[qid_7.answer]}
                    </dd>
                </dl>
                <dl>
                    <dt>8.优秀表现</dt>
                    <dd>
                        ${qid_8.answer }
                    </dd>
                </dl>
                <dl>
                    <dt>9.不良表现</dt>
                    <dd>
                        ${qid_9.answer }
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
