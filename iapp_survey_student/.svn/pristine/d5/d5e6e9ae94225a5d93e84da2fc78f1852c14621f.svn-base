<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
	<head>
		<title>辅导计划</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
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
            <c:if test="${isCoach }">
            <span class="btn btn-right btn-width-70" id="btn-right-1">
                完成
            </span>
            </c:if>
            <div class="title title-2">
                辅导计划
            </div>
        </header>
        <section class="wrapper-static margin-top-50 margin-bottom-71" id="box-wrapper">
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

            <div id="task-box-wrapper">
            	
            	<c:forEach var="item" items="${tasks }" > 
            	
                <div class="big-task-box ">
                    <div class="task-head closed  ${isCoach?'':'bg-gray' }">
                        <label class="arrow "><i class="fa fa-angle-down"></i></label>
                        <div class="func-line ">
                            <div class="text">${item.title }</div>
                            <div class="select-status-box">
                                <div class="select-status-title" data-status="closed" data-href="#" data-value="0">
                                    <span>${item.status eq 0 ? '进行中':item.status eq 1 ? '未完成':'已完成' }</span><label></label>
                                </div>
                                <div class="select-status-list">
                                    <span data-id="${item.id }" data-value="0" data-text="进行中" class="${item.status eq 0 ? 'active':'' }">进行中</span>
                                    <span data-id="${item.id }" data-value="1" data-text="未完成" class="${item.status eq 1 ? 'active':'' }">未完成</span>
                                    <span data-id="${item.id }" data-value="2" data-text="已完成" class="${item.status eq 2 ? 'active':'' }">已完成</span>
                                </div>
                            </div>
                            <input type="hidden" id="${item.id }_status" value="${item.status }"> 
                        <span class="btn-add-record" data-id='${item.id }'>
                            	     ${isCoach ? '添加':'查看' }辅导明细
                        </span>
                        </div>
                    </div>
                    <div class="task-content" style="display: none;">
                        <div class="edit-title">辅导目标</div>
                        <div class="edit">
                            <textarea placeholder="" ${isCoach?'':'readonly="readonly"' } class="min-height-48 ${isCoach?'':'bg-gray' }" id="${item.id }_target">${item.target }</textarea>
                        </div>
                        <div class="edit-title">主题任务</div>
                        <div class="edit">
                            <textarea placeholder="" ${isCoach?'':'readonly="readonly"' } class="min-height-48 ${isCoach?'':'bg-gray' }" id="${item.id }_subject">${item.subject }</textarea>
                        </div>
                        <c:if test="${isCoach }">
                        <div class="btn-line">
                            <div class="btn-delete-task"  data-id='${item.id }'>
                              		  删除主题任务
                            </div>
                            <div class="btn-save-task"  data-id='${item.id }' onclick="save(this)">
                              		  保存主题任务
                            </div>
                        </div>
                        </c:if>
                    </div>
                </div>
            	</c:forEach>

            </div>



        </section>
        <c:if test="${isCoach }">
        <div class="block-add-task" id="block-add-task">
            <div class="btn-add-task" id="btn-add-task">
                添加主题任务
            </div>
        </div>
        </c:if>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
	        var $boxWrapper;
	        var $window;
	        var windowSize = [window.innerWidth, window.innerHeight];
	        var isIos = browserUtil.isIos();
	        
            $(function () {
                var $manList = $('.block-man-box > div');
                var $btnLeft1 = $('#btn-left-1');
                var $btnRight1 = $('#btn-right-1');
                var $taskBoxWrapper = $('#task-box-wrapper');
                var $btnAddTask = $('#btn-add-task');

                var $header = $('header');
                var $blockAddTask = $('#block-add-task');
                
                $boxWrapper = $('#box-wrapper');
                if (isIos) {
                    $window = $boxWrapper;
                    $header.css({'position': 'absolute'});
                    $boxWrapper.attr('style', 'position: relative;top: 50px;z-index:20;overflow:auto;margin:0px !important;').height(windowSize[1] - 111);
                    $blockAddTask.css({'position': 'absolute'});
                } else {
                    $window = $('html,body');
                }
                
                bindEvent(false);

				var flag = true;
                function createTaskBox() {
					if(!flag){
						return;
					}
					flag = false;
                	$.ajax({
    					type:"GET",
    					url:"${basepath}/m/ext/enn/coach/addtask.json",
    					data:{coachid:'${coachid}'},
    					cache:false,
    					success:function(map){
    						flag = true;
    						var taskNum = map.index;
    						var id = map.id;
    	                    var html =
    	                        '<div class="big-task-box">'
    	                        + '<div class="task-head opened">'
    	                        + '<label class="arrow"><i class="fa fa-angle-down"></i></label>'
    	                        + '<div class="func-line">'
    	                        + '<div class="text">主题任务'+ taskNum +'</div>'
    	                        + '<div class="select-status-box">'
    	                        + '<div class="select-status-title" data-status="closed" data-href="#" data-value="0">'
    	                        + '<span>进行中</span><label></label>'
    	                        + '</div>'
    	                        + '<div class="select-status-list">'
    	                        + '<span data-id='+id+' data-value="0" data-text="进行中" class="active">进行中</span>'
    	                        + '<span data-id='+id+' data-value="1" data-text="未完成">未完成</span>'
    	                        + '<span data-id='+id+' data-value="2" data-text="已完成">已完成</span>'
    	                        + '</div>'
    	                        + '</div>'
    	                        + '<input type="hidden" id="'+id+'_status" value="0"> '
    	                        + '<span class="btn-add-record" data-id='+id+'>'
    	                        + '添加辅导明细'
    	                        + '</span>'
    	                        + '</div>'
    	                        + '</div>'
    	                        + '<div class="task-content" >'
    	                        + '<div class="edit-title">辅导目标</div>'
    	                        + '<div class="edit">'
    	                        + '<textarea placeholder="" class="min-height-48" id="'+id+'_target"></textarea>'
    	                        + '</div>'
    	                        + '<div class="edit-title">主题任务</div>'
    	                        + '<div class="edit">'
    	                        + '<textarea placeholder="" class="min-height-48" id="'+id+'_subject"></textarea>'
    	                        + '</div>'
    	                        + '<div class="btn-line">'
    	                        + '<div class="btn-delete-task" data-id='+id+'>'
    	                        + '删除主题任务'
    	                        + '</div>'
    	                        + '<div class="btn-save-task" data-id="'+id+'" onclick="save(this);">'
    	                        + '保存主题任务'
    	                        + '</div>'
    	                        + '</div>'
    	                        + '</div>'
    	                        + '</div>';

    	                    $taskBoxWrapper.append(html);
    	                    bindEvent(true);

    	                    var gap;
    	                    if (isIos) {
        	                    gap = $boxWrapper[0].scrollHeight - $boxWrapper.height();
    	                    } else {
        	                    gap = document.body.scrollHeight - windowSize[1];
    	                    }
							if (gap > 0) {
								$window.animate({
									scrollTop: gap
								}, 500);
							}

    					},
    					error:function(){
    						flag = true;
        				}
    				});
                    
                    
                }


                function bindEvent(isAdd) {
                    var $selectItemTitleList = $('.select-status-title');
                    var $selectItemList = $('.select-status-list span');
                    var $taskHeadList = $('.task-head');
                    var btnAddRecordList = $('.btn-add-record');
                    var btnDeleteRecordList = $('.btn-delete-task');
                    var btnSaveRecordList = $('.btn-save-task');
                    
                    var $textareaList = $('textarea');


                    if (isAdd) {
                        $selectItemTitleList.unbind('click');
                        $selectItemList.unbind('click');
                        $taskHeadList.unbind('click');
                        btnAddRecordList.unbind('click');
                        btnDeleteRecordList.unbind('click');
                        btnSaveRecordList.unbind('click');
                    }

                    
                    $selectItemTitleList.bind('click', function (e) {
                    	 var isCoach = ${isCoach};
                         if(!isCoach){
                             return;
                         }
                        var temp = $(this);
                        var href = temp.data('href');
                        var status = temp.data('status');

                        if (status === 'closed') {
                            temp.data('status', 'opened');
                            temp.next().show();
                        } else if (status === 'opened') {
                            temp.data('status', 'closed');
                            temp.next().hide();
                        }
                        e.stopPropagation();
                    });

                    $selectItemList.bind('click', function (e) {
                        var $temp = $(this);
                        var value = $temp.data('value');
                        var text = $temp.data('text');
                        var id = $temp.data('id');
                        $("#"+id+"_status").val(value);
                        $temp.addClass('active').siblings().removeClass('active');
                        $temp.closest('.select-status-list').hide().prev('.select-status-title').data('status', 'closed').data('value', value).find('span').html(text);
                        e.stopPropagation();
                    });

                    $taskHeadList.bind('click', function () {
                        var isCoach = ${isCoach};
                        var temp = $(this);
                        if (temp.is('.closed')){
                            
                            if(!isCoach){
                            	temp.prop('class', 'task-head opened bg-gray');
                            } else {
                            	temp.prop('class', 'task-head opened');
                                }
                            temp.find('i').prop('class', 'fa fa-angle-up');
                            temp.next('.task-content').slideDown(300);
                        } else {
                            if(!isCoach){
                            	temp.prop('class', 'task-head closed bg-gray');
                            } else {
                            	temp.prop('class', 'task-head closed');
                                }
                            temp.find('i').prop('class', 'fa fa-angle-down');
                            
                            temp.next('.task-content').slideUp(300);
                        }
                    });


                    btnDeleteRecordList.bind('click', function (e) {
                        var _this = $(this);
                        var id = _this.data('id');
                        $.ajax({
        					type:"GET",
        					url:"${basepath}/m/ext/enn/coach/deletetask.json",
        					data:{id:id},
        					cache:false,
        					success:function(data){
        						_this.closest('.big-task-box').remove();
                                e.stopPropagation();
        					},
        					error:function(){
            				}
        				});
                        
                    });


                    btnAddRecordList.bind('click', function (e) {
                        var taskid = $(this).data('id');
                        e.stopPropagation();
                        window.location.href="${basepath}/m/ext/enn/coach/toaddtaskcontent.xhtml?coachid=${coachid}&taskid="+taskid;
                    });

                }


                $btnAddTask.bind('click', function (e) {
                    createTaskBox();
                });

                $btnRight1.bind('click', function () {
                    window.history.go(-1);
                });

                $btnLeft1.bind('click', function () {
                    window.history.go(-1);
                });

				/*
                $manList.bind('click', function () {
                    var temp = $(this);
                    if (temp.hasClass('selected')) {
                        temp.removeClass('selected');
                    } else {
                        temp.addClass('selected');
                    }
                });
				*/

                $("textarea").bind("propertychange input",function(){
                    this.style.height = this.scrollHeight + 'px';
                });

            });


            
            
            function save(thi){
	            var id = $(thi).data('id');
				var status = $("#"+id+"_status").val();
				var target = $("#"+id+"_target").val();
				var subject = $("#"+id+"_subject").val();
	            $.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/coach/addtask.json",
					data:{id:id,status:status,target:target,subject:subject},
					cache:false,
					success:function(map){
						lightBlock.show('保存成功!');
					},
					error:function(){
	    			}
				});

            }
        </script>
	</body>
</html>
