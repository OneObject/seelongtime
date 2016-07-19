<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta name="format-detection" content="telephone=no" />
		<title>辅导明细</title>
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
                辅导明细
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="box-wrapper">
                <div class="new-task-intro">
                    <div class="green-white-line">
                        <div class="block-white border-right-0">
                            <label>1</label>主题任务
                        </div>
                        <div class="block-green border-left-0">
                            <label>2</label>辅导明细
                        </div>
                        <span class="arrow-green-white arrow-white-green"></span>
                    </div>
                    <div class="new-intro-text"><label>主题任务:</label>${task.title }</div>
                    <input type="hidden" id="tid" value="${task.id }">
                    <input type="hidden" id="taskid" value="${taskid }">
                </div>

            <div class="new-task-box-wrapper padding-bottom-10" id="detail-box-wrapper">
			<c:forEach var="item" varStatus="i" items="${taskcontent }">
                <div class="new-big-task-box">
                    <div class="task-head closed">
                        <label class="arrow"><i class="fa fa-angle-right"></i></label>
                        <div class="text text2"><label class="new-num">${i.count }. </label><span class="new-text">${item.mainpoints}</span></div>
                    </div>
                    <div class="task-content comparecontent" style="display: none;">
                        <div class="edit-title">辅导要点</div>
                        <div class="edit">
                            <textarea placeholder="" readonly="readonly" class="min-height-48 textarea-info mainpoints compareitem" id="${item.id }_mainpoints">${item.mainpoints}</textarea>
                            <input type="hidden" value="${item.mainpoints}"  class="mainpointscompare" />
                        </div>
                        <div class="edit-title">完成标准</div>
                        <div  class="edit">
                            <textarea placeholder="" readonly="readonly" class="min-height-48 completioncriteria compareitem" id="${item.id }_completioncriteria">${item.completioncriteria}</textarea>
                            <input type="hidden" value="${item.completioncriteria}"  class="completioncriteriacompare" />
                        </div>
                        <div class="edit-title">开始时间</div>
                        <div class="select-date">
                        <input id="${item.id }_start" readonly="readonly" type="text" class="input-date starttime compareitem" placeholder="请输入日期" value="${ltfun:dateLongToStringFormat(item.starttime,'yyyy-MM-dd')}"/>
                        <input type="hidden" value="${item.starttime}"  class="starttimecompare" />
                        <label></label></div>
                        <div class="edit-title">结束时间</div>
                        <div class="select-date">
                        <input id="${item.id }_end" readonly="readonly"  type="text" class="input-date endtime compareitem" placeholder="请输入日期" value="${ltfun:dateLongToStringFormat(item.endtime,'yyyy-MM-dd')}"/>
                        <input type="hidden" value="${item.endtime}"  class="endtimecompare" />
                        <label></label></div>
                        <input type="hidden" class="itemid" value="${item.id }"  />
                        
                    </div>
                </div>
			</c:forEach>

            </div>


        </section>
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
                var $btnLeft1 = $('#btn-left-1');
                bindEvent(false);
                function bindEvent(isAdd) {
                    var $taskHeadList = $('.task-head');
                    if (isAdd) {
                        $taskHeadList.unbind('click');
                    }
                    $taskHeadList.bind('click', function () {
                        var temp = $(this);
                        var $infoLine = temp.find('.new-text');
                        var text;
                        if (temp.is('.closed')){
                            temp.prop('class', 'task-head opened');
                            temp.find('i').prop('class', 'fa fa-angle-down');
                            text = $infoLine.html();
                            temp.next('.task-content').find('.textarea-info').val(text).end().slideDown(300);
                            resetTextarea();
                        } else {
                            temp.prop('class', 'task-head closed');
                            temp.find('i').prop('class', 'fa fa-angle-right');
                            text = temp.next('.task-content').find('.textarea-info').val();
                            $infoLine.html(text);
                            temp.next('.task-content').slideUp(300);
                            resetTextarea();
                        }
                    });
                }

                $btnLeft1.bind('click', function () {
                    window.history.go(-1);
                });
            });
            
            function resetTextarea() {
            	$("textarea").each(function () {
                   this.style.height = this.scrollHeight + 'px';
            	});
            }

        </script>
	</body>
</html>
