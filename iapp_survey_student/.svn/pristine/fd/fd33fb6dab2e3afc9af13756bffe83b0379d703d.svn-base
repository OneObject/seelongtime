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
		<title>管理辅导明细</title>
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
                管理辅导明细
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="box-wrapper">
                <div class="new-task-intro">
                    <div class="green-white-line">
                        <div class="block-white border-right-0">
                            <label>1</label>添加主题任务
                        </div>
                        <div class="block-green border-left-0">
                            <label>2</label>添加辅导明细
                        </div>
                        <span class="arrow-green-white arrow-white-green"></span>
                    </div>
                    <div class="new-intro-text"><label>主题任务:</label>${task.title }</div>
                    <input type="hidden" id="tid" value="${task.id }">
                    <input type="hidden" id="taskid" value="${taskid }">
                </div>

            <div class="new-task-box-wrapper padding-bottom-10" id="detail-box-wrapper">
			<c:forEach var="item" varStatus="i" items="${taskcontents }">
                <div class="new-big-task-box">
                    <div class="task-head closed">
                        <label class="arrow"><i class="fa fa-angle-right"></i></label>
                        <div class="text text2"><label class="new-num">${i.count }. </label><span class="new-text">${item.mainpoints}</span></div>
                    </div>
                    <div class="task-content comparecontent" style="display: none;">
                        <div class="edit-title">辅导要点</div>
                        <div class="edit">
                            <textarea placeholder="" class="min-height-48 textarea-info mainpoints compareitem" id="${item.id }_mainpoints">${item.mainpoints}</textarea>
                            <input type="hidden" value="${item.mainpoints}"  class="mainpointscompare" />
                        </div>
                        <div class="edit-title">完成标准</div>
                        <div  class="edit">
                            <textarea placeholder="" class="min-height-48 completioncriteria compareitem" id="${item.id }_completioncriteria">${item.completioncriteria}</textarea>
                            <input type="hidden" value="${item.completioncriteria}"  class="completioncriteriacompare" />
                        </div>
                        <div class="edit-title">开始时间</div>
                        <div class="select-date">
                        <input id="${item.id }_start"  type="text" class="input-date starttime compareitem" placeholder="请输入日期" value="${ltfun:dateLongToStringFormat(item.starttime,'yyyy-MM-dd')}"/>
                        <input type="hidden" value="${item.starttime}"  class="starttimecompare" />
                        <label></label></div>
                        <div class="edit-title">结束时间</div>
                        <div class="select-date">
                        <input id="${item.id }_end"   type="text" class="input-date endtime compareitem" placeholder="请输入日期" value="${ltfun:dateLongToStringFormat(item.endtime,'yyyy-MM-dd')}"/>
                        <input type="hidden" value="${item.endtime}"  class="endtimecompare" />
                        <label></label></div>
                        <input type="hidden" class="itemid" value="${item.id }"  />
                        <div class="btn-line">
                            <div class="btn-delete-task" data-id="${item.id }">
                                删除
                            </div>
                            <div class="btn-save-task" data-id="${item.id }" onclick="save(this);">
                                保存
                            </div>
                        </div>
                    </div>
                </div>
			</c:forEach>

            </div>


                <div class="break-wrapper" id="break-wrapper">
                    辅导明细
                </div>

            <div class="new-task-box-wrapper padding-bottom-10  padding-top-0">
                <div class="new-big-task-box">
                    <div class="task-content">
                        <div class="edit-title">辅导要点</div>
                        <div class="edit">
                            <textarea placeholder="" class="min-height-48" id="add-point"></textarea>
                        </div>
                        <div class="edit-title">完成标准</div>
                        <div  class="edit">
                            <textarea placeholder="" class="min-height-48" id="add-standard"></textarea>
                        </div>
                        <div class="edit-title">开始时间</div>
                        <div class="select-date"><input id="add-start-time"   type="text" class="input-date" placeholder="请输入日期"/><label></label></div>
                        <div class="edit-title">结束时间</div>
                        <div class="select-date"><input id="add-end-time"   type="text" class="input-date" placeholder="请输入日期"/><label></label></div>
                        <div class="btn-line">
                            <div class="btn-next-step" id="add-new-detail">
                                继续添加明细
                            </div>
                        </div>
                    </div>
                </div>
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
                var $btnRight1 = $('#btn-right-1');
                var $detailBoxWrapper = $('#detail-box-wrapper');
                var $addPoint = $('#add-point');
                var $addStandard = $('#add-standard');
                var $addStartTime = $('#add-start-time');
                var $addEndTime = $('#add-end-time');
                var $addNewDetail = $('#add-new-detail');

                bindEvent(false);
                
                function bindEvent(isAdd) {
                    var $taskHeadList = $('.task-head');
                    var btnDeleteRecordList = $('.btn-delete-task');
                    //var btnSaveRecordList = $('.btn-save-task');

                    var $textareaList = $('textarea');
                    var $inputDateList = $('.input-date');

                    if (isAdd) {
                        $taskHeadList.unbind('click');
                        btnDeleteRecordList.unbind('click');
                        //btnSaveRecordList.unbind('click');

                        $textareaList.unbind('focus');
                        $textareaList.unbind('blur');
                    }

                    $inputDateList.mobiscroll().date(dateOps);

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
                        }
                    });

                    btnDeleteRecordList.bind('click', function (e) {
					
					var _this = $(this);
					var id = _this.data('id');
					
					lightDialog.show("是否删除辅导明细？",
            	                    function(){
            	                		lightDialog.remove();
            	                		$.ajax({
											type:"GET",
											url:"${basepath}/m/ext/enn/coach/newdeletetaskcontent.json",
											data:{id:id,taskid:'${taskid}'},
											cache:false,
											success:function(data){
												lightBlock.show('删除成功!');
											},
											error:function(){
											}
										});
										_this.closest('.new-big-task-box').remove();
										changeNum();
										e.stopPropagation();
            	                    },
            	                    function(){
            	                    	lightDialog.remove();
            	                    });
					
                    	
                     	   
                            
                    	
                    });

                    //btnSaveRecordList.bind('click', function (e) {
                    //    alert('保存');
                     //   e.stopPropagation();
                    //});

                }


                function changeNum() {
                    var $numList = $('.new-num');
                    for (var i = 0; i < $numList.length; i++) {
                        $numList[i].innerHTML = i + 1 + '. ';
                    }
                }

                
                function createDetailBox() {
                	
					
                    var pointValue = $addPoint.val();
                    var standardValue = $addStandard.val();
                    var startTimeValue = $addStartTime.val();
                    var endTimeValue = $addEndTime.val();
                    var html = [];
                    var num = $('.new-num').length + 1;
                    if (pointValue && standardValue && startTimeValue && endTimeValue) {

                        html.push('<div class="new-big-task-box">');
                        html.push('<div class="task-head closed">');
                        html.push('<label class="arrow"><i class="fa fa-angle-right"></i></label>');
                        html.push('<div class="text text2"><label class="new-num">'+ num +'. </label><span class="new-text">'+ pointValue +'</span></div>');
                        html.push('</div>');
                        html.push('<div class="task-content" style="display: none;">');
                        html.push('<div class="edit-title">辅导要点</div>');
                        html.push('<div class="edit">');
                        html.push('<textarea placeholder="" class="min-height-48 textarea-info">'+ pointValue +'</textarea>');
                        html.push('</div>');
                        html.push('<div class="edit-title">完成标准</div>');
                        html.push('<div  class="edit">');
                        html.push('<textarea placeholder="" class="min-height-48">'+ standardValue +'</textarea>');
                        html.push('</div>');
                        html.push('<div class="edit-title">开始时间</div>');
                        html.push('<div class="select-date"><input type="text" class="input-date" value="'+ startTimeValue +'" placeholder="请输入日期" /><label></label></div>');
                        html.push('<div class="edit-title">结束时间</div>');
                        html.push('<div class="select-date"><input type="text" class="input-date" value="'+ endTimeValue +'" placeholder="请输入日期" /><label></label></div>');
                        html.push('<div class="btn-line">');
                        html.push('<div class="btn-delete-task">删除</div>');
                        html.push('<div class="btn-save-task">保存</div>');
                        html.push('</div></div></div>');
                        $detailBoxWrapper.append(html.join(''));
                        bindEvent(true);
                        resetAddBox();
                    } else {
                        alert('有空值');
                    }
                }
                function resetAddBox() {
                    $addPoint.val('');
                    $addStandard.val('');
                    $addStartTime.val('');
                    $addEndTime.val('');
                }

                $addNewDetail.bind('click', function (e) {
                	var id='';
	    			var mainpoints = $.trim($("#add-point").val());
	    			var completioncriteria = $.trim($("#add-standard").val());
	    			var starttime = $("#add-start-time").val();
	    			var endtime = $("#add-end-time").val();
					
	    			if(mainpoints === ''){
						lightBlock.show('辅导要点不能为空!');
						return;
	    			}
	    			if(completioncriteria === ''){
						lightBlock.show('完成标准不能为空!');
						return;
	    			}
	    			if(starttime === ''){
						lightBlock.show('开始时间不能为空!');
						return;
	    			}
	    			
	    			if(endtime === ''){
						lightBlock.show('结束时间不能为空!');
						return;
	    			}
	    			
	    			
	    			
					if (!validateTime(starttime, endtime)) {
						lightBlock.show('结束时间不能小于开始时间!');
						return;
					}
	    			
	                $.ajax({
	    				type:"GET",
	    				url:"${basepath}/m/ext/enn/coach/newaddtaskcontent.json",
	    				data:{id:id,coachid:'${coachid}',taskid:'${taskid}',mainpoints:mainpoints,completioncriteria:completioncriteria,starttime:starttime,endtime:endtime},
	    				cache:false,
	    				success:function(map){
	    					lightBlock.show('保存成功!');
	    					var id = map.id;
	    					
	    					var html = [];
    	                    var num = $('.new-num').length + 1;

   	                        html.push('<div class="new-big-task-box">');
   	                        html.push('<div class="task-head closed">');
   	                        html.push('<label class="arrow"><i class="fa fa-angle-right"></i></label>');
   	                        html.push('<div class="text text2"><label class="new-num">'+ num +'. </label><span class="new-text">'+ mainpoints +'</span></div>');
   	                        html.push('</div>');
   	                        html.push('<div class="task-content" style="display: none;">');
   	                        html.push('<div class="edit-title">辅导要点</div>');
   	                        html.push('<div class="edit">');
   	                        html.push('<textarea placeholder="" class="min-height-48 textarea-info" id="'+id+'_mainpoints" >'+ mainpoints +'</textarea>');
   	                        html.push('</div>');
   	                        html.push('<div class="edit-title">完成标准</div>');
   	                        html.push('<div  class="edit">');
   	                        html.push('<textarea placeholder="" class="min-height-48" id="'+id+'_completioncriteria">'+ completioncriteria +'</textarea>');
   	                        html.push('</div>');
   	                        html.push('<div class="edit-title">开始时间</div>');
   	                        html.push('<div class="select-date"><input  id="'+id+'_start"  type="text" class="input-date" value="'+ starttime +'" placeholder="请输入日期" /><label></label></div>');
   	                        html.push('<div class="edit-title">结束时间</div>');
   	                        html.push('<div class="select-date"><input   id="'+id+'_end" type="text" class="input-date" value="'+ endtime +'" placeholder="请输入日期" /><label></label></div>');
   	                        html.push('<div class="btn-line">');
   	                        html.push('<input type="hidden" class="itemid" value="'+id+'">');
   	                        html.push('<div class="btn-delete-task" data-id="'+id+'">删除</div>');
   	                        html.push('<div class="btn-save-task"  data-id="'+id+'" onclick="save(this);">保存</div>');
   	                        html.push('</div></div></div>');
   	                        $detailBoxWrapper.append(html.join(''));
   	                        bindEvent(true);
   	                        resetAddBox();
   	                        
	    				},
	    				error:function(){
	        			}
	    			});
                });

                $btnRight1.bind('click', function () {
                    //整体完成操作
                    validateItemContent();
                    //验证列表中明细是否修改
                    //验证辅导明细新添加的是否完成
                    
                    //第一步提交列表项 列表项转换成object对象新增的字段直接传到controller中
                });
                
                
                
                function submitItemContent() {
            		var obj = new Object();
            		var options = new Array();
            		
            		var $itemIdList = $('.itemid');
            		var j=0;
                    for (i = 0; i < $itemIdList.length; i++) {
                        var item = $.trim($($itemIdList[i]).val());
                        var opt = new Object();
                        opt.mainpoints = $.trim($("#"+item+"_mainpoints").val());
                        opt.completioncriteria = $.trim($("#"+item+"_completioncriteria").val());
                        opt.starttime = $("#"+item+"_start").val();
                        opt.endtime = $("#"+item+"_end").val();
                        opt.id = item;
        				options[j] = opt;
        				j++;
                    }
                    
                    
                    
                    var mainpoints = $.trim($("#add-point").val());
	    			var completioncriteria = $.trim($("#add-standard").val());
	    			var starttime = $("#add-start-time").val();
	    			var endtime = $("#add-end-time").val();
	    			
                    if(!($itemIdList.length > 0)){
                    	
                    	if(mainpoints === '' ){
							lightBlock.show('辅导要点不能为空!');
							return;
		    			}
		    			
		    			if(completioncriteria === ''){
							lightBlock.show('完成标准不能为空!');
							return;
		    			}
		    			
		    			if(starttime === ''){
							lightBlock.show('开始时间不能为空!');
							return;
		    			}
		    			
		    			if(endtime === ''){
							lightBlock.show('结束时间不能为空!');
							return;
		    			}
		    			
						if (!validateTime(starttime, endtime)) {
							lightBlock.show('开始时间需小于结束时间!');
							return;
						}
                    	
                    }
                    
    				var opt = new Object();
                   	opt.id='';
   	    			opt.mainpoints = mainpoints;
   	    			opt.completioncriteria = completioncriteria;
   	    			opt.starttime = starttime;
   	    			opt.endtime = endtime;
   	    			options[j] = opt;
   	    			j++;
            		
	   	    			
            		obj.taskid = '${taskid}';
            		obj.coachid = '${coachid}';
            		obj.items = options;
            		showHandling();
            		$.ajax({
            			type: "POST",
            			url:  "${basepath}/m/ext/enn/coach/newbatchaddtaskcontent.json",
            			data: JSON.stringify(obj),
            			dataType:"json", 
            			contentType: "application/json; charset=utf-8",
            			success:function(data){
            						if(data){
            							window.history.go(-1);
            						}else{
            							$('#module-handling').remove();
            							lightBlock.show('保存失败!');
            						}
            			},
            			error: function(data){
            				$('#module-handling').remove();
    						lightBlock.show('保存失败!');
            			}
            		});
            	}
                
                
                function validateItemContent(){
                	
                	
                	var $itemContentList = $('.compareitem');
                    for (var i = 0; i < $itemContentList.length; i++) {
                        var item = $.trim($($itemContentList[i]).val());
                       	if(item === ''){
							lightBlock.show('列表项不能为空!');
							return;
                       	}
                    }
                    
                    
                    var mainpoints = $.trim($("#add-point").val());
	    			var completioncriteria = $.trim($("#add-standard").val());
	    			var starttime = $("#add-start-time").val();
	    			var endtime = $("#add-end-time").val();
					
	    			
	    			
	    			if(!(completioncriteria === ''&& mainpoints === ''&&starttime === ''&& endtime === '')){
	    			
		    			if(mainpoints === '' ){
							lightBlock.show('新增辅导要点不能为空!');
							return;
		    			}
		    			
		    			if(completioncriteria === ''){
							lightBlock.show('新增完成标准不能为空!');
							return;
		    			}
		    			
		    			if(starttime === ''){
							lightBlock.show('新增开始时间不能为空!');
							return;
		    			}
		    			
		    			if(endtime === ''){
							lightBlock.show('新增结束时间不能为空!');
							return;
		    			}
		    			
						if (!validateTime(starttime, endtime)) {
							lightBlock.show('新增的结束时间不能小于开始时间!');
							return;
						}
                	
	    			}
	    			
	    			
	    			submitItemContent();
                	
                }
                
                

                $btnLeft1.bind('click', function () {
				
					lightDialog.show("是否取消未保存的辅导明细？",
            	                    function(){
            	                		lightDialog.remove();
            	                		window.history.go(-1);
            	                    },
            	                    function(){
            	                    	lightDialog.remove();
            	                    });
                    
                });

                
                
                $("textarea").bind("propertychange input",function(){
                    this.style.height = this.scrollHeight + 'px';
                });
                


            });
            
            
            function resetTextarea() {
            	$("textarea").each(function () {
                   this.style.height = this.scrollHeight + 'px';
            	});
            }
          
            

            function save(thi){
                var id = $(thi).data("id");
    			var mainpoints = $.trim($("#"+id+"_mainpoints").val());
    			var completioncriteria = $.trim($("#"+id+"_completioncriteria").val());
    			var starttime = $("#"+id+"_start").val();
    			var endtime = $("#"+id+"_end").val();
    			
    			if(mainpoints === ''){
					lightBlock.show('辅导要点不能为空!');
					return;
    			}
    			if(completioncriteria === ''){
					lightBlock.show('完成标准不能为空!');
					return;
    			}
    			
    			if(starttime === ''){
					lightBlock.show('开始时间不能为空!');
					return;
    			}
    			
    			if(endtime === ''){
					lightBlock.show('结束时间不能为空!');
					return;
    			}
    			
    			
    			
				if (!validateTime(starttime, endtime)) {
					lightBlock.show('结束时间不能小于开始时间!');
					return;
				}
    			
				lightDialog.show("是否保存辅导明细吗？",
            	                    function(){
            	                		lightDialog.remove();
            	                		 $.ajax({
											type:"GET",
											url:"${basepath}/m/ext/enn/coach/newaddtaskcontent.json",
											data:{id:id,coachid:'${coachid}',taskid:'${taskid}',mainpoints:mainpoints,completioncriteria:completioncriteria,starttime:starttime,endtime:endtime},
											cache:false,
											success:function(map){
												lightBlock.show('保存成功!');
											},
											error:function(){
											}
										});
            	                    },
            	                    function(){
            	                    	lightDialog.remove();
            	                    });
				
               

            }
            
            function validateTime(startStr, endStr) {
            	if(startStr === endStr){
            		return true;
            	}
            	var startArr = startStr.split('-');
            	var endArr = endStr.split('-');
            	
            	if (startArr[0] < endArr[0]) {
            		return true;
            	} else {
            		if (startArr[1] < endArr[1]) {
            			return true;
            		} else {
            			if (startArr[2] < endArr[2]) {
            				return true;
            			} else {
            				return false;
            			}
            		}
            	}
            	
            }

        </script>
	</body>
</html>
