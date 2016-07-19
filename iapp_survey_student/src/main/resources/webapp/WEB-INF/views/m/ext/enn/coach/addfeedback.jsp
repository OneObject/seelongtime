<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
	<head>
		<title>实习记录反馈</title>
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
            <span class="btn btn-right btn-width-70" id="btn-right-1">
                完成
            </span>
            <div class="title title-2">
                实习记录反馈
            </div>
        </header>
        <section class="wrapper-static margin-top-50">
            <div class="block-practice-box">
                <div class="select-date"><input type="text" id="select-date1" placeholder="请输入日期" value="${ltfun:dateLongToStringFormat(now,'yyyy-MM-dd')}" /><label></label></div>
                <div class="edit-title">本期主题任务</div>
                <div class="edit bg-gray">
                    <div id="text-holder" class="text-holder min-height-48">${entity.subject }</div>
                </div>
                <div class="edit-title">实习内容概述</div>
                <div class="edit" >
                    <textarea placeholder=""  class="min-height-48 bg-gray" readonly="readonly">${entity.content }</textarea>
                </div>
                <div class="edit-title">我的收获</div>
                <div class="edit">
                    <textarea placeholder=""  class="min-height-48 bg-gray" readonly="readonly">${entity.gains }</textarea>
                </div>
                <div class="edit-title">我的问题及需要的帮助</div>
                <div class="edit">
                    <textarea placeholder=""  class="min-height-48 bg-gray" readonly="readonly">${entity.problem }</textarea>
                </div>
                <div class="edit-title">启发式问题</div>
                <div class="edit">
                    <textarea placeholder=""  class="min-height-48"  id="heuristicproblem"> ${entity.heuristicproblem }</textarea>
                </div>
                <div class="edit-title">下一步实践建议</div>
                <div class="edit">
                    <textarea placeholder=""  class="min-height-48" id="advice">${entity.advise }</textarea>
                </div>
                <div class="edit-title">鼓励</div>
                <div class="edit">
                    <textarea placeholder=""  class="min-height-48" id="promote">${entity.promote}</textarea>
                </div>
                <div class="info"><span>${ltfun:dateLongToStringFormat(entity.createtime,'yyyy-MM-dd')}</span><span>学员：${user.name }</span></div>
            </div>
        </section>


        <div class="dialog-selector-wrapper" id="dialog-selector-wrapper" style="display: none;">
            <div class="dialog-selector-box-text" id="dialog-selector-box-text">
                <ul>
                    <c:forEach var="item" items="${tasks }">
                    	<li data-text="${item.title }" data-id="${item.id }">${item.title }</li>
                	</c:forEach>
                </ul>
            </div>
        </div>
        <input type="hidden" id="taskid" value="${task.id }"> 
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
                var $btnRight1 = $('#btn-right-1');
                var $textHolder = $('#text-holder');
                var $dialogSelectorWrapper = $('#dialog-selector-wrapper');
                var $dialogSelectorBoxText = $('#dialog-selector-box-text');
                var $selectorList = $('#dialog-selector-box-text li');

                $btnRight1.bind('click', function () {
                	 var id = "${entity.id}";
               	 	 var promote = $("#promote").val();
                     var advice = $("#advice").val();
                     var heuristicproblem = $("#heuristicproblem").val();
                     var date = $("#select-date1").val();

                     if(advice==null||advice==""){
                     	lightBlock.show('下一步实践建议不能为空！');
                     	return;
                     }
                     if(advice.length>400){
                     	lightBlock.show('下一步实践建议最多不能超过400字！');
                     	return;
                     }
                     if(promote==null||promote==""){
                     	lightBlock.show('鼓励不能为空！');
                     	return;
                     }
                     if(promote.length>400){
                     	lightBlock.show('鼓励最多不能超过400字！');
                     	return;
                     }
                    
                 	lightDialog.show("确定提交吗？",
                             function(){
                         		lightDialog.remove();
                         		showHandling();
                     			$.ajax({
                     				type : "POST",
                     				url : "${basepath}/m/ext/enn/coach/addpractice.json",
                     				cache : false,
                     				data : {
                     					id : id,
                     					advice : advice,
                     					heuristicproblem : heuristicproblem,
                     					promote : promote,
                                        date : date
                     				},
                     				success : function(data) {
     									window.location.href="${basepath}/m/ext/enn/coach/chat.xhtml?coachid=${entity.coachid}";
                     				},
                     				error : function() {
                     				}
                     			});
                             },
                             function(){
                             	lightDialog.remove();
                             });
                    
                });

                $btnLeft1.bind('click', function () {
                    window.history.go(-1);
                });

				/*
                $textHolder.bind('click', function () {
                    $dialogSelectorWrapper.show();
                });
				*/

                $dialogSelectorWrapper.bind('click', function () {
                    $dialogSelectorWrapper.hide();
                });

                $dialogSelectorBoxText.bind('click', function (e) {
                    e.stopPropagation();
                });

				/*
                $selectorList.bind('click', function () {
                    var $temp = $(this);
                    var text = $temp.data('text');
                    var id = $temp.data('id');
                    $temp.addClass('selected').siblings().removeClass('selected');
                    $textHolder.html(text);
                    $("#taskid").val(id);
                    setTimeout(function () {
                        $dialogSelectorWrapper.hide();
                    }, 300);
                });
				*/

                $('#select-date1').mobiscroll().date(dateOps);

                $manList.bind('click', function () {
                    var temp = $(this);
                    if (temp.hasClass('selected')) {
                        temp.removeClass('selected');
                    } else {
                        temp.addClass('selected');
                    }
                });

                $("textarea").bind("propertychange input",function(){
                    this.style.height = this.scrollHeight + 'px';
                });
            });
        </script>
	</body>
</html>
