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
		<title>辅导计划详情</title>
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
                ${user.name }的辅导计划
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="box-wrapper">

<c:if test="${empty task    }">
	<ul class="no-answer-img-ul" style="padding-top:50px;">
        <li>敬请期待</li>
        <li></li>
    </ul>
</c:if>
<c:if test="${not empty task    }">
            <div id="tasklist">
            
            
            <div class="new-task-box-wrapper">
<c:forEach items="${task }" var="item"  varStatus="i">
<div class="new-big-task-box">
               <div class="task-head closed">
                   <label class="arrow"><i class="fa fa-angle-right"></i></label>
                   <div class="text">${item.title }</div>
                   <div class="select-status-box">
                       <div class="select-status-title" data-status="closed" data-href="#" data-value="0">
                           <span>${item.status eq 0 ? '进行中':item.status eq 1 ? '未完成':'已完成' }</span><label></label>
                       </div>
                       <div class="select-status-list">
                            <span data-taskid="${item.id }" data-value="0" data-text="进行中" class="${item.status eq 0 ? 'active':'' }">进行中</span>
                            <span data-taskid="${item.id }" data-value="1" data-text="未完成" class="${item.status eq 1 ? 'active':'' }">未完成</span>
                            <span data-taskid="${item.id }" data-value="2" data-text="已完成" class="${item.status eq 2 ? 'active':'' }">已完成</span>
                       </div>
                   </div>
                   <input type="hidden" id="${item.id }_status" value="${item.status }"> 
               </div>
               <div class="task-content padding-top-0" style="display: none;">
                  <div class="green-white-line">
                      <div class="block-green border-right-0">
                          <label>1</label>主题任务
                      </div>
                      <div class="block-white border-left-0">
                          <label>2</label>辅导明细
                      </div>
                      <span class="arrow-green-white"></span>
                  </div>
                  <div class="edit-title">主题任务</div>
                  <div class="edit">
                      <textarea placeholder="" readonly="readonly" class="min-height-48  textarea-info bg-gray" id="${item.id }_subject">${item.subject }</textarea>
                  </div>
                  <div class="edit-title">辅导目标</div>
                  <div class="edit">
                      <textarea placeholder="" readonly="readonly" class="min-height-48 bg-gray" id="${item.id }_target">${item.target }</textarea>
                  </div>
                  <div class="btn-line">
                      <div class="btn-next-step" data-id="${item.id }" onclick="totaskcontentdetail(this)">
                         查看辅导明细
                      </div>
                  </div>
              </div>
          </div>
</c:forEach>
</div>
            </div>
</c:if>
        </section>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
        	var coachid = "${coachid}"; 
        	
        	function totaskcontentdetail(thi){
        		var id = $(thi).data('id');
        		window.location.href="${basepath}/m/ext/enn/coach/detailtaskcontent.xhtml?taskid="+id;
        		
        	}
        	
        	
            $(function () {
                var $btnLeft1 = $('#btn-left-1');
                var $btnRight1 = $('#btn-right-1');

                
        		
                bindEvent(true);
				
                
                function bindEvent(isAdd) {

                    var $taskHeadList = $('.task-head');

                    if (isAdd) {
 
                        $taskHeadList.unbind('click');


                    }


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


                }
				
				 $btnRight1.bind('click', function () {
                    window.history.go(-1);
                });

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
