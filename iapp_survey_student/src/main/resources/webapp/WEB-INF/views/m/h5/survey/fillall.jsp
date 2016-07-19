<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/include/taglibs_m.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><fmt:message key="fillall.title" bundle="${bundle}"/></title>
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	 <link rel="shortcut icon" type="image/ico" href="${basepath }/static/img/favicon.ico">
	<link rel="stylesheet" type="text/css" href="${basepath }/static/css/survey/style_mobile.css" />
	<script type="text/javascript" src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src="${basepath}/static/plugins/layer/layer.js"></script>
	<style type="text/css">
		.star li{
			float:left;
			width:30px;
			height:30px;
			text-indent:-9999px;
			background:url(${basepath}/static/img/survey/like.jpg) no-repeat;
			background-size:auto 29px;
			cursor:pointer;
			margin-left:10px;
			margin-bottom:10px;
		}
		.star li.on{
			background:url(${basepath}/static/img/survey/like_active.jpg) no-repeat;
			background-size:auto 29px;
		}
	</style>
	<script type="text/javascript">
		function initFlush() {		//用于解决火狐浏览器的缓存问题
			document.getElementById("flushFlag").value = "sss";
		}
	</script>
</head>
<body onload="initFlush()">
	<div class="paper">
		<div class="exam_top">
			<h2>${entity.title }</h2>
			<div class="exam-tip clear">
			<div class="fl" style="text-align: left;"><fmt:message key="fillall.question" bundle="${bundle}"/>&nbsp;${size}&nbsp;<fmt:message key="fillall.ge" bundle="${bundle}"/>，<fmt:message key="fillall.use_time" bundle="${bundle}"/>${size*15/10}&nbsp;<fmt:message key="fillall.minute" bundle="${bundle}"/></div>
			</div>
			<c:if test="${not empty entity.summary}">
				<p style="text-align:left;"><span>${entity.summary}</span></p>
			</c:if>
		</div>
		<c:set var="sectionNum" value="1"></c:set>
		<c:forEach var="question" items="${list }" varStatus="index">
		<c:if test="${index.index == 0 }">
		<div class="survuy">
			<c:if test="${question.type == 5 }">
			<h4>${question.title }</h4>
			</c:if>
			<div>
		</c:if>
		<c:if test="${question.type == 5 && index.index != 0}">
				</div>
			</div>
			<div class="survuy">
				<h4>${question.title }</h4>
					<div>
			<c:set var="sectionNum" value="1"></c:set>
		</c:if>
			<!-- 单选start -->
			<c:if test="${question.type == 1 }">
				<ul class="questions" id="${question.id }_${question.type}"  data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
					<li>
						<span id="title_${question.id }">${sectionNum}<fmt:message key="symbol.stop" bundle="${bundle}"/>${question.title }</span><span>【<fmt:message key="fillall.single" bundle="${bundle}"/>】</span>
					</li>
					<li>
						<c:forEach var="voteoption" items="${question.voteOptionEntities }">
							<span class="answer clear">
								<input class="fl" type="radio" id="${voteoption.id }" name="${question.id}" value="${voteoption.id }" />
								<label for="${voteoption.id }">${voteoption.title }</label>
							</span>
							<c:if test="${not empty voteoption.coverPath }">
							<span class="answer clear">
								<label for="${voteoption.id }"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${voteoption.coverPath}-640x360" alt="${voteoption.title }" /></label>
							</span>
							</c:if>
						</c:forEach>
					</li>
				</ul>
			</c:if>
			<!-- 单选end -->
			
			<!-- 多选start -->
			<c:if test="${question.type == 2 }">
				<ul class="questions"  id="${question.id }_${question.type}" data-max="${question.maxChooseNum }" data-min="${question.minChooseNum }"  data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
					<li>
						<span id="title_${question.id }">${sectionNum}<fmt:message key="symbol.stop" bundle="${bundle}"/>${question.title }</span><span>【<fmt:message key="fillall.multi" bundle="${bundle}"/>】</span>
					</li>
					<li>
						<c:forEach var="voteoption" items="${question.voteOptionEntities }">
							<span class="answer clear">
							<input class="fl" type="checkbox" id="${voteoption.id }" name="${question.id}" value="${voteoption.id }"/>
							<label for="${voteoption.id }">${voteoption.title }</label>
							</span>
							<c:if test="${not empty voteoption.coverPath }">
							<span class="answer clear">
								<label for="${voteoption.id }"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${voteoption.coverPath}-640x360" alt="${voteoption.title }" /></label>
							</span>
							</c:if>
						</c:forEach>
					</li>
				</ul>
			</c:if>
			<!-- 多选end -->
			
			<!-- 问答start -->
			<c:if test="${question.type == 3 }">
				<ul class="questions"  id="${question.id }_${question.type}"  data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
					<li>
						<span id="title_${question.id }">${sectionNum}<fmt:message key="symbol.stop" bundle="${bundle}"/>${question.title }</span><span>【<fmt:message key="fillall.ask" bundle="${bundle}"/>】</span>
					</li>
					<li>
						<span class="answer ques_answer clear">
						<textarea class="fl search_text" name="${question.id}" id="${question.id}"></textarea>
						</span>
					</li>
				</ul>
			</c:if>
			<!-- 问答end -->
			
			<!-- 打分start -->
			<c:if test="${question.type == 4 }">
				<div class="questions"   id="${question.id }_${question.type}"  data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
					<ul class="star-title">
						<li>
							<span id="title_${question.id }">${sectionNum}<fmt:message key="symbol.stop" bundle="${bundle}"/>${question.title }</span><span>【<fmt:message key="fillall.score" bundle="${bundle}"/>】</span>
						</li>
					</ul>
					<div class="star">
						<input type="hidden" id="${question.id }" value="">
						<input type="hidden" id="score_${question.id }" value="">
						<input type="hidden" id="flushFlag" value="sss">
						<ul>
							<c:forEach var="voteoption" items="${question.voteOptionEntities }" varStatus="_index">
								<li data-index="${_index.index }"  data-questionId="${question.id }" data-optionId="${voteoption.id }" >
									<a href="javascript:;"></a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</c:if>
			<!-- 打分end -->
			
			<!-- 填空start -->
			<c:if test="${question.type == 6 }">
					<ul class="star-title">
						<li>
							<span id="title_${question.id }">${sectionNum}<fmt:message key="symbol.stop" bundle="${bundle}"/><fmt:message key="fillall.fillin" bundle="${bundle}"/></span>
						</li>
					</ul>
					<div class="fill-wrap questions"  id="${question.id }_${question.type}"  data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
						<c:forEach var="voteoption" items="${question.voteOptionEntities }">
							<span class="search-box" id="${voteoption.id }" data-optionId="${voteoption.id }" >
								${voteoption.title }
								<input class="search-age" type="text" id="${voteoption.id }" name="${question.id}" value="" style="width: ${voteoption.inputBoxSize*13+30}px;"/>
								<!-- <span>岁</span> -->
							</span>
							<br/>
							<br/>
						</c:forEach>
					</div>
			</c:if>
			<!-- 填空end -->
			<c:if test="${question.type != 5}">
				<c:set var="sectionNum" value="${sectionNum+1 }"></c:set>
			</c:if>
		</c:forEach>
			</div>
		</div>
		<div>
		<c:if test="${entity.allowAnonymous == 1 }">
		<div style="padding-left: 5px;margin-top: 20px;margin-bottom: 20px;">
		<input type="checkbox" id="allowAnonymous" name="allowAnonymous" value="1"><label for="allowAnonymous" style="font-size:16px;">&nbsp;<fmt:message key="fillall.anonymous" bundle="${bundle}"/></label>
		</div>
		</c:if>
		<div class="answer-btn btn-beaty" onclick="sub();">
		<fmt:message key="fillall.submit" bundle="${bundle}"/>
		</div>
			
		</div>
	</div>
	<script type="text/javascript">
	 	var flag = false;
		function sub(){
			// 获取所有试题
				var questions = $(".questions");
				if ( questions.length<1 ){
					layer.msg('<fmt:message key="fillall.no_question" bundle="${bundle}"/>');
					return;
				}
				
				var qObj ;
				var data = new Object();
				for(index=0;index<questions.length;index++){
					qObj = $(questions.get(index));
					
					var qid = qObj.data("id");
					var type = qObj.data("type");
					var must = qObj.data("must");
					var key = qid+"_" + type;
					var chooseNum = 0;
					var title = $("#title_"+qid).html();
					
					//获取值
					switch(type){
						case 1://单选
							var checkedObjs = $("input[name='"+qid+"']:checked");
							var answers = $(checkedObjs).val() ;
							if(answers){
								data[key] = answers;
							}
							break;
						case 2://多选
							var answers ="" ;
							$("input[name='"+qid+"']:checked").each(function(){
								answers += $(this).val() + ",";
								chooseNum++; 
							});
							if(answers){
								data[key] = answers;
							}
							break;
						case 3://问答
							var answers = $("#"+qid).val();
							if(answers != null && answers != ""){
								data[key] = answers;
							}
							break;
						case 4://打分
							var answers = $("#"+qid).val() ;
							if(answers){
								data[key] = answers
							}
							break;
						case 6://填空
							var answers ="" ;
							$("input[name='"+qid+"']").each(function(){
								var optionId = $(this).attr("id"); 
								var value = $(this).val();
								if(value != ""){
									var answerItem = optionId+",#o#"+$(this).val();
									answers += answerItem + ",#q#";
									chooseNum++; 
								}
							});
							if(answers){
								data[key] = answers;
							}
							break;
					} 
					
					if(type==2){
						var max = qObj.data("max");
						var min = qObj.data("min");
						if(min!=0 && chooseNum < min){
							layer.msg('<'+title+'><fmt:message key="fillall.min_select" bundle="${bundle}"/> '+min+' <fmt:message key="fillall.select_info" bundle="${bundle}"/>');
							window.location.hash = "#"+key;
							return;
						}
						if(max!=0 && chooseNum > max){
							layer.msg('<'+title+'><fmt:message key="fillall.max_select" bundle="${bundle}"/> '+max+' <fmt:message key="fillall.select_info" bundle="${bundle}"/>');
							window.location.hash = "#"+key;
							return;
						}
					} 
					
					if(type!=5 && must && must==1){ //必答
						if(!data[key] ){
							layer.msg('<fmt:message key="fillall.unanswer" bundle="${bundle}"/>');
							window.location.hash = "#"+key;
							return;
						}
					} 
				}
				var allowAnonymous = $("input[name='allowAnonymous']:checked").val();
				if(!allowAnonymous){
					allowAnonymous = "";
				}
				var oData = {"uid":"${uid}","activityId":"${entity.id}","voteId":"${voteEntity.id}","domain":"${entity.domain}","allowAnonymous":allowAnonymous,"answers":JSON.stringify(data)};
				submitAnswer(oData);
			}
	
		function submitAnswer(data){
			if(flag){
				return;
			}
			flag = true;
			 $.ajax({
			        type: "POST",
			        url:"${basepath}/survey/saveanswer.json",
			        data:data,// 要提交的表单 
			        success: function(code) {
			        		flag = false;
			            if(code==1){
			            		layer.msg('<fmt:message key="fillall.submit_success" bundle="${bundle}"/>',{time:2000},function(){
			            			location.href="${basepath}/m/ixin/nsurvey/prompt.xhtml?id="+"${entity.id}";
			            		});
				            return;
			            }
			            if(code==-2){
			            		layer.msg('<fmt:message key="fillall.has_submit" bundle="${bundle}"/>');
				            return;
			            }
			            if(code==-3){
				            	layer.msg('<fmt:message key="fillall.answer_not_be_blank" bundle="${bundle}"/>');
				            	return;
			            }
			            if(code==-5){
			             	layer.msg('<fmt:message key="message.user_unexists" bundle="${bundle}"/>');
			            		return;
			            }
			            layer.msg('<fmt:message key="fillall.submit_fail" bundle="${bundle}"/>');
			        },
			        error:function(){
			        		flag = false;
				        layer.msg('<fmt:message key="fillall.network_error" bundle="${bundle}"/>');
				    }
			    });
		}   
		
		;(function (){
			function Score(options){
				this.config = {
					selector : '.star',
					renderCallback : null,
					callback : null
				};
				this.cache = {
					iStar : 0,
					iScore : 0
				};
				this.init(options);
			}

			Score.prototype = {
				constructor : Score,
				init : function (options){
					this.config = $.extend(this.config,options || {});
					var self = this,
						_config = self.config,
						_cache = self.cache;
					self._renderHTML();
				},
				_renderHTML : function (){
					var self = this,
						_config = self.config;
					$(_config.selector).each(function (index,item){
						$(item).wrap($('<div class="parentCls" style="position:relative;" />'));
						var parentCls = $(item).closest('.parentCls');
						self._bindEnv(parentCls);
						_config.renderCallback && $.isFunction(_config.renderCallback) && _config.renderCallback();
					});
				},
				_bindEnv : function (parentCls){
					var self = this,
						_config = self.config,
						_cache = self.cache;
					$(_config.selector + ' li',parentCls).each(function (index,item){
						$(item).mouseover(function (e){
							var offsetLeft = $('ul',parentCls)[0].offsetLeft;
							ismax(index + 1);
							$('p',parentCls).hasClass('hidden') && $('p',parentCls).removeClass('hidden');
							$('p',parentCls).css({
								left : index * $(this).width() + 12 + 'px'
							});
						});
						$(item).mouseout(function (){
							var qid = $(this).attr("data-questionId");
							var _index = $("#score_"+qid).val();
							if(_index == ""){
								_cache.iStar = 0;
							} else {
								_cache.iStar = parseInt(_index)+1;
							}
							ismax();
							!$('p',parentCls).hasClass('hidden') && $('p',parentCls).addClass('hidden');
							
							if($("#flushFlag").val() == "sss") {		//如果是第一次没有点击那么移出，也没有效果
								$(this).parent().find("li").attr("class", " ");
							}
							
							$(this).addClass('cur').siblings().removeClass('cur');
							
							
							
						});
						$(item).click(function (e){
							var index = $(_config.selector + ' li',parentCls).index($(this));
							_cache.iStar = index + 1;
							$(this).addClass('cur').siblings().removeClass('cur');

							!$('p',parentCls).hasClass('hidden') && $('p',parentCls).addClass('hidden');
							_config.callback && $.isFunction(_config.callback) && _config.callback({
								starAmount : _cache.iStar
							});
							var qid = $(this).attr("data-questionId");
							var _index = $(this).data("index");
							$("#score_"+qid).val(_index);
							$("#"+qid).val($(this).attr("data-optionId"));
							
							if($("#flushFlag").val() == "sss") {$("#flushFlag").val(ssc);}  //用来判断是否是页面刷新的第一次点击
						});
					});

					function ismax(iArg){
						_cache.iScore = iArg || _cache.iStar;
						var lis = $(_config.selector + ' li',parentCls);

						for(var i=0;i<lis.length;i++){
							lis[i].className = i < _cache.iScore ? 'on' : '';
						}
					}
				}
			};
			var score = new Score({
				callback : function (cfg){
					/* layer.msg($(this).attr("id"));
					layer.msg(cfg.starAmount); */
				}
			});
		})()
	</script>
</body>
</html>     