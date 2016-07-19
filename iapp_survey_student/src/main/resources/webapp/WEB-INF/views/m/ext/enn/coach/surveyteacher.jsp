<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>观察评估表</title>
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
       观察评估表
            </div>
        </header>
        <section class="wrapper-static margin-top-50">
	            <div class="block-man-box">
	                <label>学员</label>
	                <c:forEach items="${list }" var="item">
		                <div data-id="${item.id }">
		                    <label><i class="fa fa-check set-color"></i></label>
		                    <span class="image"><img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray" /></span>
		                    <span class="name">${item.name }</span>
		                </div>
	                </c:forEach>
	                <input type="hidden" id="uids" value="">
	            </div>
            
            <div class="block-star-box">
	                <div class="head">
	                    	评估项
	                </div>
                <dl>
                    <dt>1.人际沟通：清晰流畅表达自己的想法，根据不同的交往对象使用不同的沟通方式，倾听他人表达内容，并恰当及时地回应；设身处地为他人着想，与周围人形成良好的人际关系</dt>
                    <dd>
                        <div class="select-item-box">
                            <div  class="q_option  select-item-title"  data-qid="qid_1" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 合格</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="0" data-text="0分 最差">0分 最差</span>
                                <span data-value="1" data-text="1分 非常差">1分 非常差</span>
                                <span data-value="2" data-text="2分 非常差">2分 非常差</span>
                                <span data-value="3" data-text="3分 非常差">3分 非常差</span>
                                <span data-value="4" data-text="4分 较差">4分 较差</span>
                                <span data-value="5" data-text="5分 较差">5分 较差</span>
                                <span data-value="6" data-text="6分 合格">6分 合格</span>
                                <span data-value="7" data-text="7分 合格">7分 合格</span>
                                <span data-value="8" data-text="8分 良好">8分 良好</span>
                                <span data-value="9" data-text="9分 良好">9分 良好</span>
                                <span data-value="10" data-text="10分 优秀">10分 优秀</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>2.团队合作: 积极参与配合团队事务，发挥自身优势，努力贡献团队；乐于配合他人完成任务，不计较个人得失而达成团队目标</dt>
                    <dd>
                        <div class="select-item-box">
                            <div  class="q_option  select-item-title"  data-qid="qid_2" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 合格</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="0" data-text="0分 最差">0分 最差</span>
                                <span data-value="1" data-text="1分 非常差">1分 非常差</span>
                                <span data-value="2" data-text="2分 非常差">2分 非常差</span>
                                <span data-value="3" data-text="3分 非常差">3分 非常差</span>
                                <span data-value="4" data-text="4分 较差">4分 较差</span>
                                <span data-value="5" data-text="5分 较差">5分 较差</span>
                                <span data-value="6" data-text="6分 合格">6分 合格</span>
                                <span data-value="7" data-text="7分 合格">7分 合格</span>
                                <span data-value="8" data-text="8分 良好">8分 良好</span>
                                <span data-value="9" data-text="9分 良好">9分 良好</span>
                                <span data-value="10" data-text="10分 优秀">10分 优秀</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>3.压力应对：冷静面对困难和挫折，运用技巧有效控制和处理压力，保持良好情绪状态，最终达成目标</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_3" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 合格</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="0" data-text="0分 最差">0分 最差</span>
                                <span data-value="1" data-text="1分 非常差">1分 非常差</span>
                                <span data-value="2" data-text="2分 非常差">2分 非常差</span>
                                <span data-value="3" data-text="3分 非常差">3分 非常差</span>
                                <span data-value="4" data-text="4分 较差">4分 较差</span>
                                <span data-value="5" data-text="5分 较差">5分 较差</span>
                                <span data-value="6" data-text="6分 合格">6分 合格</span>
                                <span data-value="7" data-text="7分 合格">7分 合格</span>
                                <span data-value="8" data-text="8分 良好">8分 良好</span>
                                <span data-value="9" data-text="9分 良好">9分 良好</span>
                                <span data-value="10" data-text="10分 优秀">10分 优秀</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>4.适应性：乐于接受新环境，主动了解新情况，根据要求或环境变化而主动调整行为，以积极的态度面对调整过程中的不适，并很快形成新的行为方式</dt>
                    <dd>
                        <div class="select-item-box">
                            <div  class="q_option  select-item-title"  data-qid="qid_4" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 合格</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="0" data-text="0分 最差">0分 最差</span>
                                <span data-value="1" data-text="1分 非常差">1分 非常差</span>
                                <span data-value="2" data-text="2分 非常差">2分 非常差</span>
                                <span data-value="3" data-text="3分 非常差">3分 非常差</span>
                                <span data-value="4" data-text="4分 较差">4分 较差</span>
                                <span data-value="5" data-text="5分 较差">5分 较差</span>
                                <span data-value="6" data-text="6分 合格">6分 合格</span>
                                <span data-value="7" data-text="7分 合格">7分 合格</span>
                                <span data-value="8" data-text="8分 良好">8分 良好</span>
                                <span data-value="9" data-text="9分 良好">9分 良好</span>
                                <span data-value="10" data-text="10分 优秀">10分 优秀</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>5.敬业负责：明白自身角色和职责，认真履行工作职责，做事有始有终，努力追求高质量的工作成果，为自己在工作中的行为及其结果负责</dt>
                    <dd>
                        <div class="select-item-box">
                            <div  class="q_option  select-item-title"  data-qid="qid_5" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 合格</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="0" data-text="0分 最差">0分 最差</span>
                                <span data-value="1" data-text="1分 非常差">1分 非常差</span>
                                <span data-value="2" data-text="2分 非常差">2分 非常差</span>
                                <span data-value="3" data-text="3分 非常差">3分 非常差</span>
                                <span data-value="4" data-text="4分 较差">4分 较差</span>
                                <span data-value="5" data-text="5分 较差">5分 较差</span>
                                <span data-value="6" data-text="6分 合格">6分 合格</span>
                                <span data-value="7" data-text="7分 合格">7分 合格</span>
                                <span data-value="8" data-text="8分 良好">8分 良好</span>
                                <span data-value="9" data-text="9分 良好">9分 良好</span>
                                <span data-value="10" data-text="10分 优秀">10分 优秀</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>6.计划组织能力：有效管理自己或他人的时间和资源，确保工作目标能够有效达成</dt>
                    <dd>
                        <div class="select-item-box">
                            <div  class="q_option  select-item-title"  data-qid="qid_6" data-type="1" data-status="closed" data-href="#" data-value="6"><label></label><span>6分 合格</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="0" data-text="0分 最差">0分 最差</span>
                                <span data-value="1" data-text="1分 非常差">1分 非常差</span>
                                <span data-value="2" data-text="2分 非常差">2分 非常差</span>
                                <span data-value="3" data-text="3分 非常差">3分 非常差</span>
                                <span data-value="4" data-text="4分 较差">4分 较差</span>
                                <span data-value="5" data-text="5分 较差">5分 较差</span>
                                <span data-value="6" data-text="6分 合格">6分 合格</span>
                                <span data-value="7" data-text="7分 合格">7分 合格</span>
                                <span data-value="8" data-text="8分 良好">8分 良好</span>
                                <span data-value="9" data-text="9分 良好">9分 良好</span>
                                <span data-value="10" data-text="10分 优秀">10分 优秀</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl>
                    <dt>7.学习能力：有旺盛的求知欲和强烈的好奇心，能不断接受新事物，及时学习，更新知识，提高个人能力</dt>
                    <dd>
                        <div class="select-item-box">
                            <div class="q_option  select-item-title"  data-qid="qid_7" data-type="1"  data-status="closed" data-href="#" data-value="6"><label></label><span>6分 合格</span></div>
                            <div class="select-item-list" style="display: none;">
                                <span data-value="0" data-text="0分 最差">0分 最差</span>
                                <span data-value="1" data-text="1分 非常差">1分 非常差</span>
                                <span data-value="2" data-text="2分 非常差">2分 非常差</span>
                                <span data-value="3" data-text="3分 非常差">3分 非常差</span>
                                <span data-value="4" data-text="4分 较差">4分 较差</span>
                                <span data-value="5" data-text="5分 较差">5分 较差</span>
                                <span data-value="6" data-text="6分 合格">6分 合格</span>
                                <span data-value="7" data-text="7分 合格">7分 合格</span>
                                <span data-value="8" data-text="8分 良好">8分 良好</span>
                                <span data-value="9" data-text="9分 良好">9分 良好</span>
                                <span data-value="10" data-text="10分 优秀">10分 优秀</span>
                            </div>
                        </div>
                    </dd>
                </dl>
                
	            <div class="block-edit-box block-edit-box2">
	                <div class="edit-title">优秀表现</div>
	                <div class="edit">
	                     <textarea data-qid="qid_8" data-type="2" placeholder="" class="min-height-64 q_option"></textarea>
	                </div>
	                <div class="edit-title">不良表现</div>
	                <div  class="edit">
	                    <textarea data-qid="qid_9" data-type="2" placeholder="" class="min-height-64 q_option"></textarea>
	                </div>
	            </div>
        </section>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/mobiscroll.custom-2.15.1.min.js"></script>
        <script type="text/javascript">
            $(function () {
            	var $manList = $('.block-man-box > div');
                var $btnLeft1 = $('#btn-left-1');
                var $selectItemTitleList = $('.select-item-title');
                var $selectItemList = $('.select-item-list span');
                var $btnRight1 = $('#btn-right-1');
               


                $btnRight1.bind('click', function () {//提交数据
                	var uids = $("#uids").val();
                	var uidsarray = uids.split(",");
                	var $temp;
                	var obj;
                   	if(uidsarray.length<2){
                   		lightBlock.show('请选择学员！');
                   		return;
                    };
                	
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
                    			if(obj.qid == 'qid_8'){
	                				lightBlock.show('优秀表现不能为空！');
                        		}else if(obj.qid == 'qid_9'){
	                				lightBlock.show('不良表现不能为空！');
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
                        			data: {answer:JSON.stringify(objs),coachid :"${param.coachid}",uids:uids,surveyid:'2',},
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
