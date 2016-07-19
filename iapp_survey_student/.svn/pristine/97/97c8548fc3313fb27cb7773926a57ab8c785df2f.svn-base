<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta name="format-detection" content="telephone=no" />
		<title>辅导记录</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/mobiscroll.custom-2.15.1.min.css" />
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
            <div class="block-man-box" id="block-man-box">
                <label>学员</label>
             <c:forEach var="item" varStatus="v" items="${list }">
                <div data-id="${item.id}">
                    <label><i class="fa fa-check set-color"></i></label>
                    <span class="image"><img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    <span class="name">${item.name}</span>
                </div>
             </c:forEach>
				<input type="hidden" name="userid" id="userid"/>
            </div>
            <div class="block-edit-box">
                <div class="edit-title">本期辅导主题<span class="new-select-btn" data-target="dialog-selector-wrapper1">选择</span></div>
                <div class="edit">
                	<input type="hidden" name="taskid" id="taskid" value="${practiceTaskid}"/>
                    <textarea placeholder="" class="min-height-64" id="id_title">${record.subject}</textarea>
                </div>
                <div class="edit-title">本期辅导要点<label class="new-gray-font">(非必填)</label><span class="new-select-btn" data-target="dialog-selector-wrapper2">选择</span></div>
                <div class="edit">
                    <textarea placeholder="" class="min-height-64" id="id_point"></textarea>
                </div>
                <div class="edit-title">表现好的方面</div>
                <div  class="edit">
                    <textarea placeholder="" class="min-height-64" id="textarea1">${record.gains }</textarea>
                </div>
                <div class="edit-title">待改进的方面</div>
                <div class="edit">
                    <textarea placeholder="" class="min-height-64" id="textarea2">${record.problem}</textarea>
                </div>
                <div class="date" >
                    ${date}
                </div>
            </div>
            <div class="block-date-box">
                <div class="edit-title">下期辅导主题 <span class="new-select-btn" data-target="dialog-selector-wrapper3">选择</span></div>
                <div class="edit">
					<input type="hidden" name="nexttaskid" id="nexttaskid"/>
                    <textarea placeholder=""  class="min-height-48" id="id_next_title"></textarea>
                </div>
                <div class="select-date"><input type="text" id="select-date1" placeholder="请输入日期" /><label></label></div>
            </div>
        </section>

        <div class="dialog-selector-wrapper" id="dialog-selector-wrapper1" data-target="id_title" data-target-hidden="taskid" data-model="replace" style="display: none;">
            <div class="dialog-selector-box-text">
               <ul id="recordtitle">
                	<c:forEach var="item" items="${tasks }">
                    	<li data-text="${item.title }" data-id="${item.id }" data-value="${practiceTaskid }" data-model="single"><span class="radio-box"><span class="radio"></span></span>${item.title }</li>
                	</c:forEach>
                </ul>
                <div class="dialog-selector-box-btns"><span class="cancel-select">取消</span><span class="sure-select" >确认</span></div>
            </div>

        </div>

        <div class="dialog-selector-wrapper" id="dialog-selector-wrapper2" data-target="id_point" data-model="add" style="display: none;">
            <div class="dialog-selector-box-text">
                <ul id="recordpoint">
                <c:forEach var="item" items="${taskcontent }">
                    <li data-text="${item.mainpoints }" data-id="${item.id }" data-value="${item.taskid }" data-model="multi" style="display: none;"><span class="check-box"><span class="check"></span></span>${item.mainpoints }</li>
                </c:forEach>
                </ul>
                <div class="dialog-selector-box-btns"><span class="cancel-select" >取消</span><span class="sure-select" >确认</span></div>
            </div>
        </div>

        <div class="dialog-selector-wrapper" id="dialog-selector-wrapper3" data-target="id_next_title" data-target-hidden="nexttaskid" data-model="replace" style="display: none;">
            <div class="dialog-selector-box-text">
                <ul id="nextrecord">
                	
                </ul>
                <div class="dialog-selector-box-btns"><span class="cancel-select">取消</span><span class="sure-select">确认</span></div>
            </div>
        </div>
        <input type="hidden" id="select-input1" value="${practiceTaskid};" />
        <input type="hidden" id="select-input2" value="" />
        <input type="hidden" id="select-input3" value="" />
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/mobiscroll.custom-2.15.1.min.js"></script>
        <script type="text/javascript">
    	var coachid = "${coachid}"; 
		var taskid = $("#taskid").val();
		var isPracticeToRecord = "${isPracticeToRecord}";
            var dateOps = {
                theme: 'android',
                mode: 'mixed',
                display: 'modal',
                lang: 'zh'
            };
			var gradeValue ;
			if(isPracticeToRecord){
             gradeValue = taskid;
			
			}

            $(function () {
                var $manList = $('.block-man-box > div');
                var $btnLeft1 = $('#btn-left-1');
                var $btnRight1 = $('#btn-right-1');
                var $showDialogBtnList = $('.new-select-btn');
                var $selectorBoxList = $('.dialog-selector-box-text');
                var $selectorItemList = $('.dialog-selector-box-text li');
                var $cancelSelectList = $('.cancel-select');
                var $sureSelectList = $('.sure-select');
				var listNumJudge = false ;

                var $selectInput1 = $('#select-input1');
                var $selectInput2 = $('#select-input2');
                var $selectInput3 = $('#select-input3');

                bindEvent(true);
				function bindEvent(isAjax) {
	                $manList = $('.block-man-box > div');
	                $btnLeft1 = $('#btn-left-1');
	                $btnRight1 = $('#btn-right-1');
	                $showDialogBtnList = $('.new-select-btn');
	                $selectorBoxList = $('.dialog-selector-box-text');
	                $selectorItemList = $('.dialog-selector-box-text li');
	                $cancelSelectList = $('.cancel-select');
	                $sureSelectList = $('.sure-select');
					if (isAjax) {
						$btnRight1.unbind('click');

		                $btnLeft1.unbind('click');

		                $showDialogBtnList.unbind('click');

		                $cancelSelectList.unbind('click');

		                $sureSelectList.unbind('click');

		                $selectorBoxList.unbind('click');

		                $selectorItemList.unbind('click');

		                $manList.unbind('click');

		                $("textarea").unbind("propertychange input");
					}
			
					
	                $btnRight1.bind('click', function () {
	                    //提交记录
					var uids = $("#userid").val();
					var title = $("#id_title").val();
					var advantage =$("#textarea1").val();
					var weakness = $("#textarea2").val();
                    var nexttask = $("#id_next_title").val();
                    var date = $("#select-date1").val();
                   	var uidsarray = uids.split(",");
                   	if(uidsarray.length<1){
                   		lightBlock.show('请选择学员！');
                   		return;
                    };
                    if(title==null||title==""){
                    	lightBlock.show('请填写本期辅导主题！');
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
                    	lightBlock.show('下期辅导不能为空！');
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
							var taskid = $("#taskid").val();
							var advantage =$("#textarea1").val();
							var weakness = $("#textarea2").val();
							var nexttask = $("#id_next_title").val();
							var date = $("#select-date1").val();
							var point = $("#id_point").val();
							var nextid = $("#nexttaskid").val();
							var title = $("#id_title").val();
							var id = $("#userid").val();
							
                			$.ajax({
                				type : "POST",
                				url : "${basepath}/m/ext/enn/coach/newsaveguidance.json",
                				cache : false,
                				data : {
									title : title,
                                    uid : id,
                                    taskid : taskid,
                                    advantage : advantage,
                                    weakness : weakness,
                                    nexttask : nexttask,
                                    date : date,
									nextid : nextid,
									point : point,
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


	                $showDialogBtnList.bind('click', function () {
	          	
						var $temp = $(this);
	                    var targetId = $temp.data('target');
						  if (listNumJudge && targetId !== 'dialog-selector-wrapper2' ) {
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
	                    
	                    var target_hidden = $temp.data('target-hidden');  
	                    var $target_hidden = $('#' + target_hidden);

	                    var $selectedItemList = $temp.find('.selected');
	                    var $tempItem;
	                    var text = '';
						var id = '';
	                    if (target === 'id_title') {
	                        gradeValue = $selectedItemList.data('value');
							id = $selectedItemList.data('id');
	                    }
	                    if (model === 'replace') {
	                        text = $selectedItemList.data('text');
	                        $target.val(text);
							id = $selectedItemList.data('id');
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

						$target_hidden.val(id);

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
	                
	                $('#select-date1').mobiscroll().date(dateOps);

	                $manList.bind('click', function () {
	                    var temp = $(this);
	                   
	                    /*
	                    if (temp.hasClass('selected')) {
	                        temp.removeClass('selected');
	                    } else {
	                        temp.addClass('selected');
	                        temp.siblings().removeClass('selected');
	                       // console.log(temp.data('id'));
	                    }
	                    */
	                    var $title = $("#id_title").val();
						var $titlepoint = $("#id_point").val();
						var $titlenext = $("#id_next_title").val();
						var $advantage =$("#textarea1").val();
						var $defect = $("#textarea2").val();
						var $date = $("#select-date1").val();
	        			var title = $title=="";
						var titlepoint = $titlepoint=="";
						var titlenext = $titlenext=="";
						var advantage =$advantage=="";
						var defect = $defect=="";
						var date = $date=="";
						var uid = temp.data('id');
						if( isPracticeToRecord!="true"  &&   !(title&titlepoint&titlenext&advantage&defect&date)){
						//弹窗提醒
						lightDialog.show("确定切换到其他学员吗？",
            	                    function(){
            	                		lightDialog.remove();
            	                		temp.addClass('selected');
            	                		temp.siblings().removeClass('selected');
            	                		$title="";
										$("#taskid").val("");
										$("#nexttaskid").val("");
            							$("#id_title").val("");
            							$("#id_point").val("");
            							$("#id_next_title").val("");
            							$("#textarea1").val("");
            							$("#textarea2").val("");
										$("#select-input1").val("");
										$("#select-input2").val("");
										$("#select-input3").val("");
										$("#select-date1").val("");
            	                        gettitlejson(uid);
            	                       
            	                        gradeValue =  null;
										$("#userid").val("");
										$("#userid").val(uid);
            	                    },
            	                    function(){
            	                    	lightDialog.remove();
            	                    });			
						}else{
							temp.addClass('selected');
	                		temp.siblings().removeClass('selected');
							$("#userid").val("");
							$("#userid").val(uid);
	                   		gettitlejson(uid);
						}
	                });

	                $("textarea").bind("propertychange input",function(){
	                    this.style.height = this.scrollHeight + 'px';
	                });
				}
				$('#block-man-box').find('div:nth(0)').click();
                
                function gettitlejson(uid){
					//var  u = $('.block-man-box > div').hasClass('selected');
					//var uid = u.data('id');
		
					
					var  $load = $('#taglist');
	            	$load.html('<div class="loading"><i class="fa fa-spinner fa-pulse"></i>正在加载... </div>');
	            	$.ajax({
						type:"POST",
						url:"${basepath}/m/ext/enn/coach/gettasklist.json",
						data:{uid:uid,coachid:coachid},
						success:function(map){
							var html = '';
							var obj;
						
							if(map.tasks.length==0){
							listNumJudge=true;
							}else{
							listNumJudge=false;
							}
							for (var i = 0; i < map.tasks.length; i++) {
								obj = map.tasks[i];
								html += '<li data-text="'+ 	obj.title +'" data-id="'+ 	obj.id +'"data-value="'+ 	obj.id +'" data-model="single"><span class="radio-box"><span class="radio"></span></span>'+obj.title+'</li>';
							}
							$('#recordtitle').html(html);
							$('#nextrecord').html(html);
							bindEvent(true);
						}
					});
				}

                function resetSelect(targetId) {
                    var $itemList;
                    var $tempItem;
                    var count = 0;
                    var idList = [];
                    if (targetId === 'dialog-selector-wrapper1') {
                        idList = $selectInput1.val().split(';');
                        actionReset('#dialog-selector-wrapper1', idList);
                    }
                    if (targetId === 'dialog-selector-wrapper2') {
                        idList = $selectInput2.val().split(';');
                        actionReset('#dialog-selector-wrapper2', idList);
                        if (!gradeValue) {
                        	lightBlock.show('请先选择本期辅导主题');
                            return;
                        }
                        $itemList = $('#dialog-selector-wrapper2 li');

                        for (var i = 0; i < $itemList.length; i++) {
                            $tempItem = $($itemList[i]);
                            if ($tempItem.data('value') === gradeValue) {
                                $tempItem.show();
                                count++;
                            } else {
                                $tempItem.hide();
                            }
                        }
                        if (!count) {
                        	lightBlock.show('该辅导主题下没有辅导明细');
                            return;
                        }
                    }
                    if (targetId === 'dialog-selector-wrapper3') {
                        idList = $selectInput3.val().split(';');

                        actionReset('#dialog-selector-wrapper3', idList);
                    }

                    $('#' + targetId).show();
                }

                /*function actionReset(wrapperId, idList) {
                    var $itemList = $(wrapperId).find('li');
                    var $tempItem;
                    if (idList[0] === '') {
                        $itemList.each(function () {
                            $(this).removeClass('selected');
                        });
                        return;
                    }
                    for (var i = 0; i < idList.length - 1; i++) {
                        for (var j = 0; j < $itemList.length; j++) {
                            $tempItem = $($itemList[j]);
                            if ($tempItem.data('id') == idList[i]) {
                                $tempItem.addClass('selected');
                            } else {
                                $tempItem.removeClass('selected');
                            }
                        }
                    }
                }*/
                
                function actionReset(wrapperId, idList) {
                    var $itemList = $(wrapperId).find('li');
                    var $tempItem;
                    var input2Value = $selectInput2.val();
                    if (idList[0] === '') {
                        $itemList.each(function () {
                            $(this).removeClass('selected');
                        });
                        return;
                    }
                    for (var i = 0; i < idList.length - 1; i++) {
                        for (var j = 0; j < $itemList.length; j++) {
                            $tempItem = $($itemList[j]);
                            if ($tempItem.data('id') == idList[i]) {
                                $tempItem.addClass('selected');
                            } else {
                                if (wrapperId === '#dialog-selector-wrapper2') {
                                    if (input2Value.indexOf($tempItem.data('id')) >= 0) {
                                        continue;
                                    }
                                }
                                $tempItem.removeClass('selected');
                            }
                        }
                    }
                }

                function saveSelectId(target){
                    switch (target) {
                        case 'id_title':
                                getSelectId('#dialog-selector-wrapper1');
                            break;
                        case 'id_point':
                                getSelectId('#dialog-selector-wrapper2');
                            break;
                        case 'id_next_title':
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
                    var input1Value = $selectInput1.val();
                    var isChanged = false;
                    

                    for (var i = 0; i < $selectList.length; i++) {
                        id += $($selectList[i]).data('id') + ';';
                    }
                    if (wrapperId === '#dialog-selector-wrapper1') {
						$selectInput1.val(id);
                    	if ($selectInput1.val().indexOf(input1Value) < 0) {
                    		
							$('#id_point').val('');
							//再次回来清空选填项
							//$('#select-input2').val('');
                    	}
                        if ($selectList.length === 0) {
                            gradeValue = null;
                        }
                    }
                    if (wrapperId === '#dialog-selector-wrapper2') {
                        $selectInput2.val(id);
						
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
