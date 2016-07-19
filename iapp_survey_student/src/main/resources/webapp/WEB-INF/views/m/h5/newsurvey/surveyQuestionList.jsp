<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%> 
			<section  class="questionBox" style="display:block;">
        	<div class="qHead">
            	<span>调研评估</span>
                <span>${survey.answer_num}人参与 </span>
            </div> 
            
					  	<c:if test="${empty questions }">
		            		<span> </span>
		            		<span>暂无题目。</span>
		            		<span> </span>
		            	</c:if>
		            	
		            	
		            	<c:forEach var="item" items="${questions}">
		            		
		            		<c:if test="${item.type == 1 }">
			            		<!--单选题，无图片-->
					            <dl class="sel_dan sel" data="${item.id}" qtype = "danxuan">
					            	<dt>${item.title_num}.${item.title}<label>（单选）</label></dt>
					                <c:forEach var="option" items="${item.options }">
					                	<dd>
					                		<c:if test="${answermap[item.id].answer==option.id}">
						                		<span class="select dan">
						                			<input type="radio"  value="${option.id}" checked="checked"/>
						                		</span>
					                		</c:if>
					                		
					                		<c:if test="${answermap[item.id].answer!=option.id}">
					                		<span class="select">
						                			<input type="radio"  value="${option.id}" />
						                		</span>
					                		</c:if>
					                	
					                	<span>${option.content}</span>
					                	<c:if test="${option.has_input_field==1}">
					                		<input type="text" id="${option.id}_input" value="${answermap[item.id].exts[option.id]}"/>
					                	</c:if>
					                	</dd>
					                </c:forEach>
					                           
					            </dl>
		            		</c:if>
		            		
		            		<c:if test="${item.type == 2 }">
		            			
			            			<!--多选题，无图片-->
					            	<dl class="sel_duo sel" data="${item.id }" qtype="duoxuan">
					            		<dt>${item.title_num}.${item.title}<label>（多选）</label></dt>
					                	
					                	<c:forEach var="option" items="${item.options }">
						                	<c:if test=""></c:if>
						                	<dd>
							                	<c:if test="${answermap[item.id].answers[option.id]=='checked' }">
							                		<span class="select select2 duo">
							                			<input type="checkbox" value="${option.id}" checked="checked"/>
							                		</span>
							                	</c:if>
							                	<c:if test="${answermap[item.id].answers[option.id]!='checked' }">
							                		<span class="select select2">
							                			<input type="checkbox" value="${option.id}"/>
							                		</span>
							                	</c:if>
							                	
							                	<span>${option.content}</span>
							                	<c:if test="${option.has_input_field==1}">
							                		<input type="text"  class="invalid" id="${option.id}_input" value="${answermap[item.id].exts[option.id]}"/>
							                	</c:if>
						                	</dd>
						                </c:forEach>
					            	</dl>
			            			
			            		</c:if>
			            		<c:if test="${item.type == 3 }">
			            			
			            			<!--问答题-->
					            	<dl data="${item.id }" qtype="wenda">
					            		<dt>${item.title_num}.${item.title}</dt>
					                	<dd><textarea id="${item.id }">${answermap[item.id].answer}</textarea></dd>             
					            	</dl> 
			            			 
			            		</c:if>
			            		<c:if test="${item.type == 4 }">
			            			<!--打分题-->
					            <dl class="dafen" fen="${item.min_score}" qtype="dafen" data="${item.id }">
									<dt>${item.title_num}.${item.title}<label>（${item.min_score}-${item.max_score}分）</label></dt>
					                <dd>
					                
					                	<c:forEach var="option" items="${item.options }">
						                	<dl>
						                    	<dt>${option.content}</dt>
						                        <dd>
						                       			<c:if test="${not empty (answermap[item.id].answers[option.id])}">
						                        			<label class="fen" data="${(answermap[item.id].answers[option.id])}">${(answermap[item.id].answers[option.id])}分</label>
						                        		</c:if>
						                        	<ul data="${option.id}">
						                            	<li class="star">
						                            		<c:forEach begin="${item.min_score}" end="${item.max_score}" varStatus="st">
						                            			<c:if test="${answermap[item.id].answers[option.id] >= st.index }">
						                            				<span class="cur"><i class="fa fa-star" ${(answermap[item.id].answers[option.id] - item.min_score) >= st.index }></i></span>
						                            			</c:if>
						                            			
						                            			<c:if test="${!(answermap[item.id].answers[option.id] >= st.index)}">
						                            				<span class ><i class="fa fa-star"></i></span>
						                            			</c:if>
						                            			
						                            		</c:forEach>
						                                </li>
						                                <li class="label3">
						                                	<c:if test="${not empty item.left_tip }"><label class="a">${item.left_tip }</label></c:if>
						                                	<c:if test="${not empty item.middle_tip }"><label class="b">${item.right_tip }</label></c:if>
						                                	<c:if test="${not empty item.right_tip }"><label class="c">${item.middle_tip }</label></c:if>
						                                </li>                  
						                            </ul>
						                        </dd>
						                    </dl>
					                	</c:forEach>
					            </dd>
					            </dl>
		            		</c:if>
		            		
		            		<c:if test="${item.type == 5 }">
		            			
		            			<dl class="jzdanxuan" qtype="jzdanxuan" data="${item.id }"> 
				            	<dt>${item.title_num}.${item.title}</dt>
				                <dd>
				                	<c:forEach var="option" items="${item.options}">
					                	<dl>
					                    	<dt>${option.content}</dt>
					                        <dd>
					                        	<ul data="${option.id}">
					                        		<c:forEach var="matrix_option" items="${item.matrix_options}">
					                        			<li data="${matrix_option.id}">
					                        			<c:if test="${answermap[item.id].answers[option.id] == matrix_option.id }">
					                        				<span class="select dan"><input type="radio" value="${option.id},${matrix_option.id}" checked="checked"/></span>
					                        			</c:if>
					                        			<c:if test="${answermap[item.id].answers[option.id] != matrix_option.id }">
					                        				<span class="select"><input type="radio" value="${option.id},${matrix_option.id}"/></span>
					                        			</c:if>
					                        			
					                        			<span>${matrix_option.content }</span>
					                        			</li>  
					                        		</c:forEach>
					                            </ul>    
					                        </dd>                    
					                    </dl>
				                	</c:forEach>
				                </dd>
				                </dl>
		            		</c:if>
		            		
		            		<c:if test="${item.type == 6 }">
		            				
		            				<dl class="jzduoxuan" qtype="jzduoxuan" data="${item.id }">
						            	<dt>${item.title_num}.${item.title}</dt>
						                <dd>
						                	<c:forEach var="option" items="${item.options}">
							                	<dl>
							                    	<dt>${option.content}</dt>
							                        <dd>
							                        	<ul data="${option.id}">
							                        		<c:forEach var="matrix_option" items="${item.matrix_options}">
							                        			<li data="${matrix_option.id}">
							                        			
							                        			<c:if test="${fn:containsIgnoreCase(answermap[item.id].answers[option.id],matrix_option.id)}">
							                        				<span class="select select2 duo"><input type="checkbox" value="${option.id},${matrix_option.id}" checked="checked"/></span>
							                        			</c:if>
							                        			
							                        			<c:if test="${!fn:containsIgnoreCase(answermap[item.id].answers[option.id],matrix_option.id)}">
							                        				<span class="select select2"><input type="checkbox" value="${option.id},${matrix_option.id}"/></span>
							                        			</c:if>
							                        			
							                        			
							                        			<span>${matrix_option.content }</span></li>  
							                        		</c:forEach>
							                            </ul>    
							                        </dd>                    
							                    </dl>
						                	</c:forEach>
						                </dd>
						            </dl>
				            				
		            		</c:if>
		            		
		            		<c:if test="${item.type == 8 }">
		            			<dl class="duanluo">
		            				<dt>${item.title}<dt>
		            			</dl>
		            		</c:if>
		            		
		            	</c:forEach>
		            <c:if test="${not empty questions }">
			            	<input type="hidden" id="pagenum" value="${pagenum}">
			            	<input type="hidden" id="pager" value="${page}">
							<div class="ctlBox">
								<c:if test="${page!=pagenum}">
									<c:if test="${page==1}"><span class="c" onClick="toPage(${page+1},true);">下一页</span></c:if>
									<c:if test="${page!=1}">
										<span class="a" onClick="toPage(${page-1});">上一页</span>
										<span class="b" onClick="toPage(${page+1},true);">下一页</span>
									</c:if>
								</c:if>
								
								<c:if test="${page==pagenum&&page==1}">
								<span class="c" onClick="submitSurvey();">提交</span>
								</c:if>
								<c:if test="${page==pagenum&&page!=1}">
								<span class="a" onClick="toPage(${page-1});">上一页</span>
								<span class="b" onClick="submitSurvey();">提交</span>
								</c:if>
							</div>
						</c:if>
					</section>
				<div id="progressBar"><span></span></div>
				

<script type="text/javascript">
	$(function() {
		var orientationEvent;
		var supportsOrientationChange = "onorientationchange" in window;
		orientationEvent = supportsOrientationChange ? "orientationchange"
				: "resize";
		window.addEventListener(orientationEvent, function() {

		}, false);
		setPageProgress();

		//单选题
		$("dl.sel_dan dd").click(
				function(event) {
					var $op = $("span.select", this);
					if ($op.is(".dan")) {
						$op.removeClass("dan");
						$op.find(":radio").attr("checked", false);
					} else {
						$op.addClass("dan").closest("dd").siblings("dd").find(
								"span.select").removeClass("dan")
								.find(":radio").attr("checked", false);
						$op.find(":radio").attr("checked", true);
					}
					event.stopPropagation();
				});
		//多选题
		$("dl.sel_duo dd").click(function(event) {
			var $op = $("span.select", this);
			if ($op.is(".duo")) {
				$op.removeClass("duo");
				$op.find(":checkbox").attr("checked", false);
			} else {
				$op.addClass("duo").find(":checkbox").attr("checked", true);
			}
			event.stopPropagation();
		});
		$("dl.sel_dan dd > input,dl.sel_duo dd > input").click(function(event) {
			event.stopPropagation();
		});
		//文本域自适应高度		
		$("dl textarea").bind("propertychange input", function() {
			this.style.height = this.scrollHeight + 'px';
		});
		//新打分题	
		$("dl.dafen li.star span").bind(
				"click",
				function(event) {
					var init = parseInt($(this).closest(".dafen").attr("fen"));
					var fen, html;
					var temp = $(this).closest("dd");
					$(this).addClass("cur").prevAll("span").addClass("cur")
							.end().nextAll("span").removeClass("cur");
					fen = temp.find("span.cur").length + init - 1;
					html = "<label class='fen' data='"+fen+"'>" + fen + "分</label>";
					temp.find("label.fen").remove().end().prepend(html);
				});
		//矩阵单选题
		$("dl.jzdanxuan ul li").click(
				function(event) {
					var $op = $("span.select", this);
					if ($op.is(".dan")) {
						$op.removeClass("dan");
						$op.find(":radio").attr("checked", false);
					} else {
						$op.addClass("dan").closest("li").siblings("li").find(
								"span.select").removeClass("dan")
								.find(":radio").attr("checked", false);
						$op.find(":radio").attr("checked", true);
					}
					event.stopPropagation();
				});

		//矩阵多选题
		$("dl.jzduoxuan ul li").click(function(event) {
			var $op = $("span.select", this);
			if ($op.is(".duo")) {
				$op.removeClass("duo");
				$op.find(":checkbox").attr("checked", false);
			} else {
				$op.addClass("duo").find(":checkbox").attr("checked", true);
			}
			event.stopPropagation();
		});
		//ios文本框获得焦点时，fixed bug
		if (/ipad|iphone/i.test(navigator.userAgent)) {
			$("dd textarea").focus(function() {
				$("header").css({
					"position" : "absolute"
				});
			});
			$("dd textarea").blur(function() {
				$("header").css({
					"position" : "fixed"
				});
			});
		}

		//文本域获得焦点时，安卓手机页面重新定位				
		if (/android/i.test(navigator.userAgent)) {
			var judge = isWeiXin();
			if (!judge) {
				$("html,body").css({
					"width" : "100%",
					"height" : "100%",
					"overflow" : "scroll"
				});
				$("article.survey section.submit").css({
					"padding-bottom" : "60px"
				});
				$("textarea,dl.sel_dan dd > input,dl.sel_duo dd > input").bind(
						"focus", function(event) {
							var h = $(this).offset().top - 80;
							$("html,body").animate({
								scrollTop : h
							}, 1000);
							event.stopPropagation();
						});
			} else {
				//微信，重定位 未测试
				$("textarea,dl.sel_dan dd > input,dl.sel_duo dd > input").bind(
						"focus", function(event) {
							var h = $(this).offset().top - 60;
							$("html,body").animate({
								scrollTop : h
							}, 1000);
							event.stopPropagation();
						});
			}
		}
	});

	//设置页面进度条
	function setPageProgress(){
		var page = $("#pager").val();
		var pagenum = $("#pagenum").val();
        
		$("#progressBar span").css({"width" : (page/pagenum*100)+"%"});
	}
</script>
