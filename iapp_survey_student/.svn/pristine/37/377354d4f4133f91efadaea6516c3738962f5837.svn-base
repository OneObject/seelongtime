<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>评估指导人</title>
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/mobiscroll.custom-2.15.1.min.css" />
        <style type="text/css">
			body {
				background: #eee;
			}
			.block-edit-box2{
				padding:12px;
				overflow:hidden;
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
评估指导人
            </div>
        </header>
        <section class="wrapper-static margin-top-50">
        	
	            <div class="new-student-list-box padding-bottom-10">
	                <div class="new-student-list" id="new-student-list">
		                <c:forEach items="${list }" var="item">
		                    <div data-id="${item.id }" class="student margin-bottom-0">
		                        <span class="image"><img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray" /></span>
				                    <ul>
				                        <li>${item.name }</li>
				                        <li>等级：<span>${not empty item.level ? item.level : 'LV0' }</span><label>(${item.percent }%)</label></li>
				                        <li><span class="progress-bar"><label class="percent" data-percent="${item.percent }"></label></span></li>
				                    </ul>
		                    </div>
	                    </c:forEach>
	                    <input type="hidden" id="uids" value="">
	                </div>
	            </div>
	            
	            <div style=" height:80px; overflow:hidden; padding:0 5px;">
	                <p style="margin-top:1rem;">&nbsp;&nbsp;&nbsp; 为了持续改善我们的培养方案，请认真填写，此评估结果为保密形式，不会被其他人看到。</p>
	            </div>
	            
	            
            <div class="block-star-box">
                <dl>
                    <dt>1.每周与我一起总结本周工作并制定下周工作计划</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_1" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 基本做到</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="1" data-text="1分 不能做到">1分 不能做到</span>
                                <span data-value="2" data-text="2分 不能做到">2分 不能做到</span>
                                <span data-value="3" data-text="3分 偶尔做到">3分 偶尔做到</span>
                                <span data-value="4" data-text="4分 偶尔做到">4分 偶尔做到</span>
                                <span data-value="5" data-text="5分 基本做到">5分 基本做到</span>
                                <span data-value="6" data-text="6分 基本做到">6分 基本做到</span>
                                <span data-value="7" data-text="7分 按标准做到">7分 按标准做到</span>
                                <span data-value="8" data-text="8分 按标准做到">8分 按标准做到</span>
                                <span data-value="9" data-text="9分 主动及时做到">9分 主动及时做到</span>
                                <span data-value="10" data-text="10分 主动及时做到">10分 主动及时做到</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>2.经常与我沟通（至少1次/周），提出有助我成长的建议</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_2" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 基本做到</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="1" data-text="1分 不能做到">1分 不能做到</span>
                                <span data-value="2" data-text="2分 不能做到">2分 不能做到</span>
                                <span data-value="3" data-text="3分 偶尔做到">3分 偶尔做到</span>
                                <span data-value="4" data-text="4分 偶尔做到">4分 偶尔做到</span>
                                <span data-value="5" data-text="5分 基本做到">5分 基本做到</span>
                                <span data-value="6" data-text="6分 基本做到">6分 基本做到</span>
                                <span data-value="7" data-text="7分 按标准做到">7分 按标准做到</span>
                                <span data-value="8" data-text="8分 按标准做到">8分 按标准做到</span>
                                <span data-value="9" data-text="9分 主动及时做到">9分 主动及时做到</span>
                                <span data-value="10" data-text="10分 主动及时做到">10分 主动及时做到</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>3.我情绪上处于低谷时，能倾听并鼓励我，帮我缓解情绪困扰</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_3" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 基本做到</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="1" data-text="1分 不能做到">1分 不能做到</span>
                                <span data-value="2" data-text="2分 不能做到">2分 不能做到</span>
                                <span data-value="3" data-text="3分 偶尔做到">3分 偶尔做到</span>
                                <span data-value="4" data-text="4分 偶尔做到">4分 偶尔做到</span>
                                <span data-value="5" data-text="5分 基本做到">5分 基本做到</span>
                                <span data-value="6" data-text="6分 基本做到">6分 基本做到</span>
                                <span data-value="7" data-text="7分 按标准做到">7分 按标准做到</span>
                                <span data-value="8" data-text="8分 按标准做到">8分 按标准做到</span>
                                <span data-value="9" data-text="9分 主动及时做到">9分 主动及时做到</span>
                                <span data-value="10" data-text="10分 主动及时做到">10分 主动及时做到</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>4.为我提供学习实践的机会、资源及空间，使我从工作中成长</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_4" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 基本做到</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="1" data-text="1分 不能做到">1分 不能做到</span>
                                <span data-value="2" data-text="2分 不能做到">2分 不能做到</span>
                                <span data-value="3" data-text="3分 偶尔做到">3分 偶尔做到</span>
                                <span data-value="4" data-text="4分 偶尔做到">4分 偶尔做到</span>
                                <span data-value="5" data-text="5分 基本做到">5分 基本做到</span>
                                <span data-value="6" data-text="6分 基本做到">6分 基本做到</span>
                                <span data-value="7" data-text="7分 按标准做到">7分 按标准做到</span>
                                <span data-value="8" data-text="8分 按标准做到">8分 按标准做到</span>
                                <span data-value="9" data-text="9分 主动及时做到">9分 主动及时做到</span>
                                <span data-value="10" data-text="10分 主动及时做到">10分 主动及时做到</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>5.即使我犯了错，指导人仍能态度平和地纠正我的失误</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_5" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 基本做到</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="1" data-text="1分 不能做到">1分 不能做到</span>
                                <span data-value="2" data-text="2分 不能做到">2分 不能做到</span>
                                <span data-value="3" data-text="3分 偶尔做到">3分 偶尔做到</span>
                                <span data-value="4" data-text="4分 偶尔做到">4分 偶尔做到</span>
                                <span data-value="5" data-text="5分 基本做到">5分 基本做到</span>
                                <span data-value="6" data-text="6分 基本做到">6分 基本做到</span>
                                <span data-value="7" data-text="7分 按标准做到">7分 按标准做到</span>
                                <span data-value="8" data-text="8分 按标准做到">8分 按标准做到</span>
                                <span data-value="9" data-text="9分 主动及时做到">9分 主动及时做到</span>
                                <span data-value="10" data-text="10分 主动及时做到">10分 主动及时做到</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>6.指导方法灵活，有创新，容易让人接受且效果好，对我进行协同辅导</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_6" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 基本做到</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="1" data-text="1分 不能做到">1分 不能做到</span>
                                <span data-value="2" data-text="2分 不能做到">2分 不能做到</span>
                                <span data-value="3" data-text="3分 偶尔做到">3分 偶尔做到</span>
                                <span data-value="4" data-text="4分 偶尔做到">4分 偶尔做到</span>
                                <span data-value="5" data-text="5分 基本做到">5分 基本做到</span>
                                <span data-value="6" data-text="6分 基本做到">6分 基本做到</span>
                                <span data-value="7" data-text="7分 按标准做到">7分 按标准做到</span>
                                <span data-value="8" data-text="8分 按标准做到">8分 按标准做到</span>
                                <span data-value="9" data-text="9分 主动及时做到">9分 主动及时做到</span>
                                <span data-value="10" data-text="10分 主动及时做到">10分 主动及时做到</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>7.我因为工作或生活难题求助指导人时，都能得到有效的解决</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_7" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 基本做到</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="1" data-text="1分 不能做到">1分 不能做到</span>
                                <span data-value="2" data-text="2分 不能做到">2分 不能做到</span>
                                <span data-value="3" data-text="3分 偶尔做到">3分 偶尔做到</span>
                                <span data-value="4" data-text="4分 偶尔做到">4分 偶尔做到</span>
                                <span data-value="5" data-text="5分 基本做到">5分 基本做到</span>
                                <span data-value="6" data-text="6分 基本做到">6分 基本做到</span>
                                <span data-value="7" data-text="7分 按标准做到">7分 按标准做到</span>
                                <span data-value="8" data-text="8分 按标准做到">8分 按标准做到</span>
                                <span data-value="9" data-text="9分 主动及时做到">9分 主动及时做到</span>
                                <span data-value="10" data-text="10分 主动及时做到">10分 主动及时做到</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>8.指导人曾经给我独立完成了某个专项任务的机会，并给我及时有效的指导和反馈</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_8" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 基本做到</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="1" data-text="1分 不能做到">1分 不能做到</span>
                                <span data-value="2" data-text="2分 不能做到">2分 不能做到</span>
                                <span data-value="3" data-text="3分 偶尔做到">3分 偶尔做到</span>
                                <span data-value="4" data-text="4分 偶尔做到">4分 偶尔做到</span>
                                <span data-value="5" data-text="5分 基本做到">5分 基本做到</span>
                                <span data-value="6" data-text="6分 基本做到">6分 基本做到</span>
                                <span data-value="7" data-text="7分 按标准做到">7分 按标准做到</span>
                                <span data-value="8" data-text="8分 按标准做到">8分 按标准做到</span>
                                <span data-value="9" data-text="9分 主动及时做到">9分 主动及时做到</span>
                                <span data-value="10" data-text="10分 主动及时做到">10分 主动及时做到</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>9.向我明确工作职责和试用期间应达到的目标，并制定了相应的机会</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_9" data-type="1"  data-status="closed" data-href="#" data-value="6"><label></label><span>6分 基本做到</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="1" data-text="1分 不能做到">1分 不能做到</span>
                                <span data-value="2" data-text="2分 不能做到">2分 不能做到</span>
                                <span data-value="3" data-text="3分 偶尔做到">3分 偶尔做到</span>
                                <span data-value="4" data-text="4分 偶尔做到">4分 偶尔做到</span>
                                <span data-value="5" data-text="5分 基本做到">5分 基本做到</span>
                                <span data-value="6" data-text="6分 基本做到">6分 基本做到</span>
                                <span data-value="7" data-text="7分 按标准做到">7分 按标准做到</span>
                                <span data-value="8" data-text="8分 按标准做到">8分 按标准做到</span>
                                <span data-value="9" data-text="9分 主动及时做到">9分 主动及时做到</span>
                                <span data-value="10" data-text="10分 主动及时做到">10分 主动及时做到</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>10.对我未来的职业发展提供建议和指导</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_10" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 基本做到</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="1" data-text="1分 不能做到">1分 不能做到</span>
                                <span data-value="2" data-text="2分 不能做到">2分 不能做到</span>
                                <span data-value="3" data-text="3分 偶尔做到">3分 偶尔做到</span>
                                <span data-value="4" data-text="4分 偶尔做到">4分 偶尔做到</span>
                                <span data-value="5" data-text="5分 基本做到">5分 基本做到</span>
                                <span data-value="6" data-text="6分 基本做到">6分 基本做到</span>
                                <span data-value="7" data-text="7分 按标准做到">7分 按标准做到</span>
                                <span data-value="8" data-text="8分 按标准做到">8分 按标准做到</span>
                                <span data-value="9" data-text="9分 主动及时做到">9分 主动及时做到</span>
                                <span data-value="10" data-text="10分 主动及时做到">10分 主动及时做到</span>
                            </div>
                        </div>
                    </dd>
                </dl>
            </div>
	            <div class="block-edit-box block-edit-box2">
	                <div class="edit-title">指导人指导过程中的优秀表现</div>
	                <div class="edit">
	                     <textarea placeholder="" data-qid="qid_11" data-type="2" class="min-height-64 q_option"></textarea>
	                </div>
	                <div class="edit-title">您对指导人未来的期待和建议</div>
	                <div  class="edit">
	                    <textarea placeholder="" data-qid="qid_12" data-type="2" class="min-height-64 q_option"></textarea>
	                </div>
	            </div>
        </section>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/mobiscroll.custom-2.15.1.min.js"></script>
        <script type="text/javascript">
            $(function () {
            	var $btnLeft1 = $('#btn-left-1');
            	var $manList = $('.new-student-list > div');
                var $selectItemTitleList = $('.select-item-title');
                var $selectItemList = $('.select-item-list span');
                var $btnRight1 = $('#btn-right-1');
                var $percentList = $('#new-student-list .percent');
                var $tempPercent;
                var tempPercentWidth;

                for (var i = 0; i < $percentList.length; i++) {
                    $tempPercent = $($percentList[i]);
                    tempPercentWidth = $tempPercent.data('percent');
                    +(function ($tempPercent, tempPercentWidth) {
                        setTimeout(function () {
                            $tempPercent.css('width', tempPercentWidth + '%');
                        }, 300);
                    }($tempPercent, tempPercentWidth));
                }

                var ids = $("#uids").val();
                ids  =  ids + $manList.data('id') +",";
                $("#uids").val(ids);
                

                $btnRight1.bind('click', function () {//提交数据
                	var uids = $("#uids").val();

					var elements = $('.q_option');
                    
                    var j = 0;
                	var objs = new Array();
                	
                	for (var i = 0; i < elements.length; i++) {
                		obj = {};
                		$temp = $(elements[i]);
                		obj.qid = $temp.data('qid');
                		obj.qtype = $temp.data('type');
                		if(obj.qtype === 1){
                			obj.answer = $temp.data('value');
                		}else{
                			obj.answer = $.trim($temp.val());
                			if(obj.answer==null||obj.answer==""){
                				if(obj.qid == 'qid_11'){
	                				lightBlock.show('指导人优秀表现不能为空！');
                        		}else if(obj.qid == 'qid_12'){
	                				lightBlock.show('对指导人期待和建议不能为空！');
                            	}
	                   			return;
	                		};
                		};
                		objs[j] = obj;
	                	j=j+1;
                	}
                	
                	
                	lightDialog.show("确定提交吗？",
                            function(){
                        		lightDialog.remove();
                        		showHandling();
                        		$.ajax({
                        			type: "POST",
                        			url:  "${basepath}/m/ext/enn/coach/toSaveSurveyResult.json",
                        			cache : false,
                        			data: {answer:JSON.stringify(objs),coachid :"${param.coachid}",uids:uids,surveyid:'1',},
                        			success:function(data){
                       						window.location.href="${basepath}/m/ext/enn/coach/chat.xhtml?coachid=${param.coachid}";
                        			},
                        			error: function(data){
                        			}
                        		});
                            },
                            function(){
                            	lightDialog.remove();
                            });
                	
                	
                	
                    //window.history.go(-1);
                });
                
                
                $btnLeft1.bind('click', function () {
                    window.history.go(-1);
                });

                

                $selectItemTitleList.bind('click', function () {
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
                    return false;
                });

                $selectItemList.bind('click', function (e) {
                    var $temp = $(this);
                    var value = $temp.data('value');
                    var text = $temp.data('text');
                    $temp.addClass('active').siblings().removeClass('active');
                    $temp.closest('.select-item-list').hide().prev('.select-item-title').data('status', 'closed').data('value', value).find('span').html(text);
                    e.stopPropagation();
                });


                $("textarea").bind("propertychange input",function(){
                    this.style.height = this.scrollHeight + 'px';
                });
            
            });
        </script>
	</body>
</html>
