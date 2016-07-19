<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
	<head>
		<title>辅导记录</title>
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
                辅导记录
            </div>
        </header>
        <section class="wrapper-static margin-top-50">
            <div class="block-man-box">
                <label>学员</label>
                <c:forEach var="item" varStatus="v" items="${list }">
                	<div data-id="${item.id }">
                    	<label><i class="fa fa-check set-color"></i></label>
                    	<span class="image"><img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<span class="name">${item.name }</span>
                	</div>
                </c:forEach>
            </div>
            <input type="hidden" id="uids" value="">
            <div class="block-edit-box">
                <div class="edit-title">本期辅导主题</div>
                <div class="edit">
                    <div id="text-holder" class="text-holder min-height-48"></div>
                </div>
                <div class="edit-title">表现好的方面</div>
                <div  class="edit">
                    <textarea placeholder="" class="min-height-64" id="advantage"></textarea>
                </div>
                <div class="edit-title">待改进的方面</div>
                <div class="edit">
                    <textarea placeholder="" class="min-height-64" id="weakness"></textarea>
                </div>
                <div class="date">
                    ${ltfun:dateLongToStringFormat(now,'yyyy-MM-dd')}
                </div>
            </div>
            <div class="block-date-box">
                <div class="info">
                    下期辅导主题
                </div>
                <div class="edit-title">辅导重点</div>
                <div class="edit">
                    <textarea placeholder=""  class="min-height-48" id="nexttask"></textarea>
                </div>
                <div class="select-date"><input type="text" id="select-date1" placeholder="请输入日期" /><label></label></div>
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
            <input type="hidden" id="taskid" value=""> 
        </div>
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
                    var uids = $("#uids").val();
                    var taskid = $("#taskid").val();
                    var advantage = $("#advantage").val();
                    var weakness = $("#weakness").val();
                    var nexttask = $("#nexttask").val();
                    var date = $("#select-date1").val();
                   	var uidsarray = uids.split(",");
                   	if(uidsarray.length<2){
                   		lightBlock.show('请选择学员！');
                   		return;
                    };
                    if(taskid==null||taskid==""){
                    	lightBlock.show('请选择本期辅导主题！');
                    	return;
                    }
                    if(advantage==null||advantage==""){
                    	lightBlock.show('表现好的方面不能为空！');
                    	return;
                    }
                    if(advantage.length>400){
                    	lightBlock.show('表现好的方面最多不能超过400字！');
                    	return;
                    }
                    if(weakness==null||weakness==""){
                    	lightBlock.show('待改进的方面不能为空！');
                    	return;
                    }
                    if(weakness.length>400){
                    	lightBlock.show('待改进的方面最多不能超过400字！');
                    	return;
                    }
                    if(nexttask==null||nexttask==""){
                    	lightBlock.show('下次辅导重点不能为空！');
                    	return;
                    }
                    if(nexttask.length>400){
                    	lightBlock.show('下次辅导重点最多不能超过400字！');
                    	return;
                    }
                    if(date==null||date==""){
                    	lightBlock.show('下次辅导日期不能为空！');
                    	return;
                    }


                	lightDialog.show("确定提交吗？",
                            function(){
                        		lightDialog.remove();
                        		showHandling();
                    			$.ajax({
                    				type : "POST",
                    				url : "${basepath}/m/ext/enn/coach/addguidance.json",
                    				cache : false,
                    				data : {
                                        uids : uids,
                                        taskid : taskid,
                                        advantage : advantage,
                                        weakness : weakness,
                                        nexttask : nexttask,
                                        date : date,
                                        coachid : '${coachid}',
                    				},
                    				success : function(data) {
    									window.location.href="${basepath}/m/ext/enn/coach/chat.xhtml?coachid=${coachid}";
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

                $textHolder.bind('click', function () {
                    $dialogSelectorWrapper.show();
                });

                $dialogSelectorWrapper.bind('click', function () {
                    $dialogSelectorWrapper.hide();
                });

                $dialogSelectorBoxText.bind('click', function (e) {
                    e.stopPropagation();
                });

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

                $('#select-date1').mobiscroll().date(dateOps);

                $manList.bind('click', function () {
                    var temp = $(this);
                    var ids = $("#uids").val();
                    if (temp.hasClass('selected')) {
                        temp.removeClass('selected');
                        ids = ids.replace(temp.data('id')+",","");
                       	$("#uids").val(ids);
                    } else {
                        temp.addClass('selected');
                        ids = ids + temp.data('id') +",";
                       	$("#uids").val(ids);
                    }
                });

                $("textarea").bind("propertychange input",function(){
                    this.style.height = this.scrollHeight + 'px';
                });
            });
        </script>
	</body>
</html>
