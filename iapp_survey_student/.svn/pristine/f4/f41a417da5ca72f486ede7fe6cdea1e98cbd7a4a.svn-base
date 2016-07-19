<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
	<head>
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
            <c:if test="${isCoach }">
            <span class="btn btn-right btn-width-70" id="btn-right-1">
                完成
            </span>
            </c:if>
            <div class="title title-2">
                辅导明细
            </div>
        </header>
        <section class="wrapper-static margin-top-50  margin-bottom-71" id="detail-box-wrapper">
        	<c:if test="${empty taskcontents }">
        		<div class="no-data-img" id="no-data-img"></div>
        	</c:if>
            <c:forEach var="item" items="${taskcontents }">
            <div class="teach-detail-box">
                <div class="teach-detail-title">
                    ${task.title }
                </div>
                <div class="block-edit-box block-edit-box2">
                    <div class="edit-title">辅导要点</div>
                    <div class="edit">
                        <textarea placeholder="" class="min-height-48 ${isCoach?'':'bg-gray' }" ${isCoach?'':'readonly="readonly"' }  id="${item.id }_mainpoints">${item.mainpoints}</textarea>
                    </div>
                    <div class="edit-title">完成标准</div>
                    <div  class="edit">
                        <textarea placeholder="" class="min-height-48 ${isCoach?'':'bg-gray' }" ${isCoach?'':'readonly="readonly"' }  id="${item.id }_completioncriteria">${item.completioncriteria}</textarea>
                    </div>
                    <div class="edit-title">开始时间</div>
                    <div class="select-date ${isCoach?'':'bg-gray' }"><input id="${item.id }_start" type="text" class="input-date ${isCoach?'':'bg-gray' }" ${isCoach?'':'readonly="readonly"' }  placeholder="请输入日期" value="${ltfun:dateLongToStringFormat(item.starttime,'yyyy-MM-dd')}"/><label></label></div>
                    <div class="edit-title ">结束时间</div>
                    <div class="select-date ${isCoach?'':'bg-gray' }"><input id="${item.id }_end" type="text" class="input-date ${isCoach?'':'bg-gray' }"  ${isCoach?'':'readonly="readonly"' }  placeholder="请输入日期" value="${ltfun:dateLongToStringFormat(item.endtime,'yyyy-MM-dd')}"/><label></label></div>
                </div>
                <c:if test="${isCoach }">
                <div class="btn-line">
                    <div class="btn-delete-task" data-id="${item.id }">
                        删除
                    </div>
                    
                    <div class="btn-save-task" data-id="${item.id }" onclick="save(this)">
                        保存
                    </div>
                </div>
                </c:if>
            </div>
			</c:forEach>
        </section>
		
		<c:if test="${isCoach }">
        <div class="block-add-task"  id="block-add-task">
            <div class="btn-add-task" id="btn-add-detail">
                添加
            </div>
        </div>
		</c:if>

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

			var $boxWrapper;
	        var $window;
	        var windowSize = [window.innerWidth, window.innerHeight];
	        var isIos = browserUtil.isIos();

            $(function () {
                var $btnLeft1 = $('#btn-left-1');
                var $btnRight1 = $('#btn-right-1');
                var $detailBoxWrapper = $('#detail-box-wrapper');
                var $btnAddDetail = $('#btn-add-detail');
                
                var $noDataImg = $('#no-data-img');

				var $header = $('header');
                var $blockAddTask = $('#block-add-task');

                $boxWrapper = $detailBoxWrapper;
                if (isIos) {
                    $window = $boxWrapper;
                    $header.css({'position': 'absolute'});
                    $boxWrapper.attr('style', 'position: relative;top: 50px;z-index:20;overflow:auto;margin:0px !important;').height(windowSize[1] - 111);
                    $blockAddTask.css({'position': 'absolute'});
                } else {
                    $window = $('html,body');
                }


                $btnRight1.bind('click', function () {
                    window.history.go(-1);
                });

                $btnLeft1.bind('click', function () {
                    window.history.go(-1);
                });

                $btnAddDetail.bind('click', function (e) {
                	if ($noDataImg.length > 0) {
                		$noDataImg.remove();
                	}
                    createDetailBox();
                    e.stopPropagation();
                });

                bindEvent(false);


                var flag = true;
                function createDetailBox() {
                	if(!flag){
						return;
					}
					flag = false;
                	$.ajax({
    					type:"GET",
    					url:"${basepath}/m/ext/enn/coach/addtaskcontent.json",
    					data:{coachid:'${coachid}',taskid:'${taskid}'},
    					cache:false,
    					success:function(map){
    						flag = true;
    						var id = map.id;
    						var html =
                                '<div class="teach-detail-box">'
                                + '<div class="teach-detail-title">'
                                + '${task.title}</div>'
                                + '<div class="block-edit-box block-edit-box2">'
                                + '<div class="edit-title">辅导要点</div>'
                                + '<div class="edit">'
                                + '<textarea placeholder="" class="min-height-48" id="'+id+'_mainpoints"></textarea>'
                                + '</div>'
                                + '<div class="edit-title">完成标准</div>'
                                + '<div  class="edit">'
                                + '<textarea placeholder="" class="min-height-48" id="'+id+'_completioncriteria"></textarea>'
                                + '</div>'
                                + '<div class="edit-title">开始时间</div>'
                                + '<div class="select-date"><input type="text" id="'+id+'_start" class="input-date" placeholder="请输入日期" /><label></label></div>'
                                + '<div class="edit-title">结束时间</div>'
                                + '<div class="select-date"><input type="text" id="'+id+'_end" class="input-date" placeholder="请输入日期" /><label></label></div>'
                                + '</div>'
                                + '<div class="btn-line">'
                                + '<div class="btn-delete-task" data-id="'+id+'">'
                                + '删除'
                                + '</div>'
                                + '<div class="btn-save-task" data-id="'+id+'" onclick="save(this);">保存</div>'
                                + '</div>'
                                + '</div>';

                        $detailBoxWrapper.append(html);
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
                    var $inputDateList = $('.input-date');
                    var btnDeleteRecordList = $('.btn-delete-task');

                    if (isAdd) {
                        btnDeleteRecordList.unbind('click');
                    }
                    var isCoach = ${isCoach};
                    if(isCoach){
                    	$inputDateList.mobiscroll().date(dateOps);
                    }
                    btnDeleteRecordList.bind('click', function (e) {
                    	   var _this = $(this);
                           var id = _this.data('id');
                           $.ajax({
           					type:"GET",
           					url:"${basepath}/m/ext/enn/coach/deletetaskcontent.json",
           					data:{id:id},
           					cache:false,
           					success:function(data){
           						_this.closest('.teach-detail-box').remove();
                                e.stopPropagation();
           					},
           					error:function(){
               				}
           				});
                    });

                }





                $("textarea").bind("propertychange input",function(){
                    this.style.height = this.scrollHeight + 'px';
                });
            });


            function save(thi){
                var id = $(thi).data("id");
    			var mainpoints = $("#"+id+"_mainpoints").val();
    			var completioncriteria = $("#"+id+"_completioncriteria").val();
    			var starttime = $("#"+id+"_start").val();
    			var endtime = $("#"+id+"_end").val();
    			
    			if(starttime === ''){
					lightBlock.show('开始时间不能为空!');
					return;
    			}
    			
    			if(endtime === ''){
					lightBlock.show('结束时间不能为空!');
					return;
    			}
    			
    			
    			
				if (!validateTime(starttime, endtime)) {//error
					//alert(111111111);
					lightBlock.show('结束时间不能小于开始时间!');
					return;
				}
    			
                $.ajax({
    				type:"GET",
    				url:"${basepath}/m/ext/enn/coach/addtaskcontent.json",
    				data:{id:id,coachid:'${coachid}',taskid:'${taskid}',mainpoints:mainpoints,completioncriteria:completioncriteria,starttime:starttime,endtime:endtime},
    				cache:false,
    				success:function(map){
    					lightBlock.show('保存成功!');
    				},
    				error:function(){
        			}
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
