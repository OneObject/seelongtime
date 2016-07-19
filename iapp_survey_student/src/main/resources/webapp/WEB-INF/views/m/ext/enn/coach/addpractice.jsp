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
            <span class="btn btn-right btn-width-70" id="btn-right-1">
                完成
            </span>
            <div class="title title-2">
                实习记录
            </div>
        </header>
        <section class="wrapper-static margin-top-50">
            <div class="block-practice-box">
                <div class="select-date"><input type="text" id="select-date1" placeholder=""  readonly="true" value="${ltfun:dateLongToStringFormat(now,'yyyy-MM-dd')}" /><!--<label></label>--></div>
                <div class="edit-title">本期主题任务 <span class="new-select-btn" data-target="dialog-selector-wrapper3">选择</span></div>
                <div class="edit">
                    <textarea placeholder=""  class="min-height-48" id="select-textarea3"></textarea>
                </div>
                <div class="edit-title">实习内容概述</div>
                <div class="edit">
                    <textarea id="content" placeholder=""  class="min-height-48"></textarea>
                </div>
                <div class="edit-title">我的收获</div>
                <div class="edit">
                    <textarea id="gains" placeholder=""  class="min-height-48"></textarea>
                </div>
                <div class="edit-title">我的问题及需要的帮助</div>
                <div class="edit">
                    <textarea id="problem" placeholder=""  class="min-height-48"></textarea>
                </div>
                <div class="info"><span>${ltfun:dateLongToStringFormat(now,'yyyy-MM-dd')}</span><span>学员：${user.name }</span></div>
            </div>
        </section>

        
        <div class="dialog-selector-wrapper" id="dialog-selector-wrapper3" data-target="select-textarea3" data-model="replace" style="display: none;">
            <div class="dialog-selector-box-text">
                <ul id="list-num-judge">
                	 <c:forEach var="item" items="${tasks }">
                    	<li data-model="single" data-text="${item.title }" data-id="${item.id }"><span class="radio-box"><span class="radio"></span></span>${item.title }</li>
                	</c:forEach>
                </ul>
                <div class="dialog-selector-box-btns"><span class="cancel-select">取消</span><span class="sure-select">确认</span></div>
            </div>
        </div>
        
           <input type="hidden" id="select-input3" value="" />
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
            var gradeValue;
            $(function () {
                var $manList = $('.block-man-box > div');
                var $btnLeft1 = $('#btn-left-1');
                var $btnRight1 = $('#btn-right-1');
                //var $textHolder = $('#text-holder');
                //var $dialogSelectorWrapper = $('#dialog-selector-wrapper');
               	//var $dialogSelectorBoxText = $('#dialog-selector-box-text');
                //var $selectorList = $('#dialog-selector-box-text li');
                
                var $showDialogBtnList = $('.new-select-btn');
                var $selectorBoxList = $('.dialog-selector-box-text');
                var $selectorItemList = $('.dialog-selector-box-text li');
                var $cancelSelectList = $('.cancel-select');
                var $sureSelectList = $('.sure-select');
                var $selectInput3 = $('#select-input3');
                
                var listNumJudge = $('#list-num-judge li').length;

                $btnRight1.bind('click', function () {
                	  var taskid = $("#select-input3").val();
                	  var subject = $("#select-textarea3").val();
                	  var content = $("#content").val();
                      var gains = $("#gains").val();
                      var problem = $("#problem").val();
                      var date = $("#select-date1").val();

                      if(subject==null||subject==""){
                      	lightBlock.show('请填写主题任务！');
                      	return;
                      }
                      if(content==null||content==""){
                      	lightBlock.show('实习内容概述不能为空！');
                      	return;
                      }
                      if(content.length>1000){
                      	lightBlock.show('实习内容概述最多不能超过1000字！');
                      	return;
                      }
                      if(gains==null||gains==""){
                      	lightBlock.show('我的收获不能为空！');
                      	return;
                      }
                      if(gains.length>1000){
                      	lightBlock.show('我的收获最多不能超过1000字！');
                      	return;
                      }
                      if(problem==null||problem==""){
                      	lightBlock.show('我的问题及需要的帮助不能为空！');
                      	return;
                      }
                      if(problem.length>1000){
                      	lightBlock.show('我的问题及需要的帮助最多不能超过1000字！');
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
                                          taskid : taskid,
                                          subject : subject,
                                          content : content,
                                          gains : gains,
                                          date : date,
                                          problem : problem,
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

                /*$textHolder.bind('click', function () {
                	if (listNumJudge === 0) {
                		lightDialog.show({
                			btnModel: 1,  
                	        contentText: '暂无主题任务！',  
                	        footerText: ['确定']
                		});
                	} else {
                		$dialogSelectorWrapper.show();
                	}
                    
                });*/

               

//new
                

                $showDialogBtnList.bind('click', function () {
                    var $temp = $(this);
                    var targetId = $temp.data('target');
                    if (listNumJudge === 0) {
                		lightDialog.show({
                			btnModel: 1,  
                	        contentText: '暂无主题任务！',  
                	        footerText: ['确定']
                		});
                	}else{
                   	 resetSelect(targetId);
                    }

                });

                $cancelSelectList.bind('click', function (e) {
                    $(this).closest('.dialog-selector-wrapper').hide();
                    e.stopPropagation();
                });

                $sureSelectList.bind('click', function (e) {
                    var $temp = $(this).closest('.dialog-selector-wrapper');
                    var target = $temp.data('target');
                    var model = $temp.data('model');
                    var $target = $('#' + target);
                    var $selectedItemList = $temp.find('.selected');
                    var $tempItem;
                    var text = '';

                    if (target === 'select-textarea1') {
                        gradeValue = $selectedItemList.data('value');
                    }
                    if (model === 'replace') {
                        text = $selectedItemList.data('text');
                        $target.val(text);
                    }
                    if (model === 'add') {
                        for (var i = 0; i < $selectedItemList.length; i++) {
                            $tempItem = $($selectedItemList[i]);
                            if ($tempItem.data('value') === gradeValue) {
                                text += $tempItem.data('text') + '; ';
                            }
                        }
                        $target.val(text);
                    }
                    changeTextareaHeight($target);

                    saveSelectId(target);
                    $temp.hide();
                    e.stopPropagation();
                });

                $selectorBoxList.bind('click', function (e) {
                    e.stopPropagation();
                });

                $selectorItemList.bind('click', function () {
                    var $temp = $(this);
                    var text = $temp.data('text');
                    var model = $temp.data('model');
                    if (model === 'single') {
                        if ($temp.hasClass('selected')) {
                            $temp.removeClass('selected');
                        } else {
                            $temp.addClass('selected').siblings().removeClass('selected');
                        }
                    }
                    if (model === 'multi') {
                        if ($temp.hasClass('selected')) {
                            $temp.removeClass('selected');
                        } else {
                            $temp.addClass('selected');
                        }
                    }
                });

                //$('#select-date1').mobiscroll().date(dateOps);

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



                function resetSelect(targetId) {
                    var $itemList;
                    var $tempItem;
                    var count = 0;
                    var idList = [];
                    if (targetId === 'dialog-selector-wrapper3') {
                        idList[0] = $selectInput3.val();

                        actionReset('#dialog-selector-wrapper3', idList);
                    }

                    $('#' + targetId).show();
                }

                function actionReset(wrapperId, idList) {
                    var $itemList = $(wrapperId).find('li');
                    var $tempItem;
                    if (idList[0] === '') {
                        $itemList.each(function () {
                            $(this).removeClass('selected');
                        });
                       
                        return;
                    }
                    for (var i = 0; i < idList.length; i++) {
                        for (var j = 0; j < $itemList.length; j++) {
                            $tempItem = $($itemList[j]);
                            if ($tempItem.data('id') == idList[i]) {
                                $tempItem.addClass('selected');
                            } else {
                                $tempItem.removeClass('selected');
                            }
                        }
                    }
                }

                function saveSelectId(target){
                    switch (target) {
                        case 'select-textarea3':
                                getSelectId('#dialog-selector-wrapper3');
                            break;
                        default:
                            break;
                    }
                }

                function getSelectId(wrapperId) {
                    var id = '';
                    var $selectList = $(wrapperId).find('li.selected');
                    var $temp;

                    for (var i = 0; i < $selectList.length; i++) {
                        id += $($selectList[i]).data('id');
                    }
                    if (wrapperId === '#dialog-selector-wrapper3') {
                        $selectInput3.val(id);
                    }
                }
                function changeTextareaHeight($target) {
                    var scrollHeight = $target[0].scrollHeight;
                    if (scrollHeight > 48) {
                        $target[0].style.height = ($target[0].scrollHeight - 16) + 'px';
                    }
                }
            });
        </script>
	</body>
</html>
