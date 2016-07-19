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
		<title>管理辅导计划</title>
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
            <span class="btn btn-right btn-width-70" id="btn-right-1">
                <%---完成 --%>
            </span>
            <div class="title title-2">
                管理辅导计划
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="box-wrapper">
            <div class="block-man-box  margin-bottom-5" id="block-man-box">
                <label>学员</label>
                 <c:forEach var="item" varStatus="v" items="${list }">
                	<div data-id="${item.id }" id="user_${item.id}" >
                    	<label><i class="fa fa-check set-color"></i></label>
                    	<span class="image"><img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span>
                    	<span class="name">${item.name }</span>
                	</div>
                </c:forEach>
            </div>

            <div id="tasklist"></div>

        </section>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
        	var coachid = "${coachid}"; 
            $(function () {
                var $manList = $('.block-man-box > div');
                var $btnLeft1 = $('#btn-left-1');
                var $btnRight1 = $('#btn-right-1');
                var $btnAddTask = $('#btn-add-task');

                
        		
				
				
                
                function bindEvent(isAdd) {
                    var $selectItemTitleList = $('.select-status-title');
                    var $selectItemList = $('.select-status-list span');
                    var $taskHeadList = $('.task-head');
                    var btnAddRecordList = $('.btn-add-record');
                    var btnDeleteRecordList = $('.btn-delete-task');
                    var btnSaveRecordList = $('.btn-save-task');

                    var $copyTargetList = $('#copy-holder > span');


                    var $textareaList = $('textarea');

                    if (isAdd) {
                        $selectItemTitleList.unbind('click');
                        $selectItemList.unbind('click');
                        $taskHeadList.unbind('click');
                        btnAddRecordList.unbind('click');
                        btnDeleteRecordList.unbind('click');
                        btnSaveRecordList.unbind('click');

                        $textareaList.unbind('focus');
                        $textareaList.unbind('blur');
                    }


                    $("textarea").bind("propertychange input",function(){

                        this.style.height = this.scrollHeight + 'px';
                    });
                    
                    $selectItemTitleList.bind('click', function (e) {
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
                        var taskid = $temp.data('taskid');
                        
                        lightDialog.show("确定修改任务状态吗？",
        	                    function(){
        	                		lightDialog.remove();
        	                		updatetaskstatus(taskid,value,function(flag){
        	                				if (flag){
        	                					 $temp.addClass('active').siblings().removeClass('active');
                	                             $temp.closest('.select-status-list').hide().prev('.select-status-title').data('status', 'closed').data('value', value).find('span').html(text);
        	                				}else{
        	                					lightBlock.show('修改任务状态失败');
        	                				}
        	                			
        	                		});
        	                		
        	                		
        	                    },
        	                    function(){
									$temp.closest('.select-status-box').find('.select-status-title').click();
        	                    	lightDialog.remove();
        	                    });
                        
                        e.stopPropagation();
                    });

                    $taskHeadList.bind('click', function () {
                        var temp = $(this);
                        var $infoLine = temp.find('.text');
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


                    btnDeleteRecordList.bind('click', function (e) {
                        $(this).closest('.big-task-box').remove();
                        e.stopPropagation();
                    });


                    btnAddRecordList.bind('click', function (e) {
                        e.stopPropagation();
                    });
                    
                    $copyTargetList.bind('click', function () {
                        var temp = $(this);
                        if (temp.hasClass('selected')) {
                            temp.removeClass('selected');
                        } else {
                            temp.addClass('selected');
                        }
                    });

                }



                $btnAddTask.bind('click', function (e) {
                    createTaskBox();
                });

                $btnRight1.bind('click', function () {
                    window.history.go(-1);
                });

                $btnLeft1.bind('click', function () {
					delCookie('checkuserid');
					window.history.go(-1);
                });

                $manList.bind('click', function () {
                    var temp = $(this);
                    if (temp.hasClass('selected')) {
                        temp.removeClass('selected');
                        $("#tasklist").contents().remove();
                    } else {
                       	if(temp.siblings().hasClass('selected')){
                       		lightDialog.show("确定切换到其他学员吗？",
            	                    function(){
            	                		lightDialog.remove();
            	                		temp.addClass('selected');
            	                		temp.siblings().removeClass('selected');
            	                		var uid = temp.data('id');
            	                        gettasklist(uid);
            	                    },
            	                    function(){
            	                    	lightDialog.remove();
            	                    });
                       		
                       	}else{
                       		temp.addClass('selected');
                       		temp.siblings().removeClass('selected');
                            var uid = temp.data('id');
                            gettasklist(uid);
                       	}
        				
                        
                        
                    }
                    //ajax实时获取uid的主题任务

                    
                    
                });

                

                
                
                var checkuserid = getCookie("checkuserid");
            	if(checkuserid==null || checkuserid==""){
            		$('#block-man-box').find('div:nth(0)').click();
            	}else{
            		 $('#user_'+checkuserid).click();
            	}
            	
                
              
				function gettasklist(uid){
					//var  u = $('.block-man-box > div').hasClass('selected');
					//var uid = u.data('id');
					var  $load = $('#tasklist');
	            	$load.html('<div class="loading"><i class="fa fa-spinner fa-pulse"></i>正在加载... </div>');
	            	$.ajax({
						type:"GET",
						url:"${basepath}/m/ext/enn/coach/newtotasklist.list",
						cache:false,
						data:{uid:uid,coachid:coachid},
						success:function(html){
							$('#tasklist').empty();
							$load.append(html);
							bindEvent(false);
							
							setCookie("checkuserid",uid);
						}
					});
				}
				
				function updatetaskstatus(taskid,status,callback){
	            	$.ajax({
						type:"GET",
						url:"${basepath}/m/ext/enn/coach/updatetaskstatus.json",
						data:{taskid:taskid,status:status},
						success: function (response) {
							callback(response);
						}
					});
				}
				
            });
            
            function resetTextarea() {
            	$("textarea").each(function () {
                   this.style.height = this.scrollHeight + 'px';
            	});
            }
            
            
            function nextstep(thi){
				
				var u =$('#block-man-box').find('.selected');
				var uid = u.data('id') + ",";
				
				var $copyManList = $('#copy-holder').find('.selected');
				for (var i = 0; i < $copyManList.length; i++) {
					uid += $($copyManList[i]).data('id')+",";
				}
				
				
				var id = $(thi).data('id');
				var status = $("#"+id+"_status").val();
				var target = $.trim($("#"+id+"_target").val());
				var subject = $.trim($("#"+id+"_subject").val());
				
				if(subject==""){
					lightBlock.show('主题任务不能为空');
					return;
				}
				
				if(target==""){
					lightBlock.show('辅导目标不能为空');
					return;
				}
				showHandling();
	            $.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/coach/newsavetask.json",
					data:{coachid:coachid,uid:uid,id:id,status:status,target:target,subject:subject},
					cache:false,
					success:function(map){
						
						
						var taskid = map.taskid;
						var coachid = map.coachid;
						window.location.href="${basepath}/m/ext/enn/coach/newtoaddtaskcontent.xhtml?taskid="+taskid+"&coachid="+coachid;
					},
					error:function(){
						$('#module-handling').remove();
						lightBlock.show('保存失败!');
	    			}
				});
			}
        </script>
	</body>
</html>
