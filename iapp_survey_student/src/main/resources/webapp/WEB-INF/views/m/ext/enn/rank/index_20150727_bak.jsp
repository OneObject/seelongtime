<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<title>排行榜</title>
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
                排行榜
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="rank-list rank-list-2">
                <ul>
                    <li>
                        <a href="${basepath }/m/ext/enn/rank/rank.xhtml?model=cfirst">
                            <label></label>
                            <div>产业财富值比拼<i>（指导人人均财富值）</i></div>
                        </a>
                    </li>
                    <li>
                        <a href="${basepath }/m/ext/enn/rank/rank.xhtml?model=sfirst">
                            <label></label>
                            <div>产业经验值比拼<i>（大学生人均经验值）</i></div>
                        </a>
                    </li>
                    <li>
                        <a href="${basepath }/m/ext/enn/rank/superank.xhtml?model=ctotal">
                            <label></label>
                            <div>产业内指导人财富榜</div>
                        </a>
                    </li>
                    <li>
                        <a href="${basepath }/m/ext/enn/rank/superank.xhtml?model=coachtotal">
                            <label></label>
                            <div>指导人财富总榜</div>
                        </a>
                    </li>
                    <li>
                        <a href="${basepath }/m/ext/enn/rank/superank.xhtml?model=smonthtotal">
                            <label></label>
                            <div>学员经验排行月榜</div>
                        </a>
                    </li>
                    <li>
                        <a href="${basepath }/m/ext/enn/rank/superank.xhtml?model=stotal">
                            <label></label>
                            <div>学员经验排行总榜</div>
                        </a>
                    </li>
                    <li>
                        <a href="${basepath }/m/ext/enn/rank/rankclass.xhtml?model=group1">
                            <label></label>
                            <div>1~8班经验比拼<i>（班级人均经验值）</i></div>
                        </a>
                    </li>
                    <li>
                        <a href="${basepath }/m/ext/enn/rank/rankclass.xhtml?model=group2">
                            <label></label>
                            <div>9~16班经验比拼<i>（班级人均经验值）</i></div>
                        </a>
                    </li>
                    <li>
                        <a href="${basepath }/m/ext/enn/rank/superank.xhtml?model=daren">
                            <label></label>
                            <div>达人财富总榜</div>
                        </a>
                    </li>
                </ul>
            </div>
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
