<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="viewport"
	content="width=device-width,height=device-height,inital-scale=1,maximum-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<title>抽奖</title>
<link href="${basepath}/static/m/activity-style.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript">
		function loading(canvas, options) {
			this.canvas = canvas;
			if (options) {
				this.radius = options.radius || 12;
				this.circleLineWidth = options.circleLineWidth || 4;
				this.circleColor = options.circleColor || 'lightgray';
				this.moveArcColor = options.moveArcColor || 'gray';
			} else {
				this.radius = 12;
				this.circelLineWidth = 4;
				this.circleColor = 'lightgray';
				this.moveArcColor = 'gray';
			}
		}
		loading.prototype = {
			show: function() {
				var canvas = this.canvas;
				if (!canvas.getContext) return;
				if (canvas.__loading) return;
				canvas.__loading = this;
				var ctx = canvas.getContext('2d');
				var radius = this.radius;
				var me = this;
				var rotatorAngle = Math.PI * 1.5;
				var step = Math.PI / 6;
				canvas.loadingInterval = setInterval(function() {
					ctx.clearRect(0, 0, canvas.width, canvas.height);
					var lineWidth = me.circleLineWidth;
					var center = {
						x: canvas.width / 2,
						y: canvas.height / 2
					};

					ctx.beginPath();
					ctx.lineWidth = lineWidth;
					ctx.strokeStyle = me.circleColor;
					ctx.arc(center.x, center.y + 20, radius, 0, Math.PI * 2);
					ctx.closePath();
					ctx.stroke();
					//在圆圈上面画小圆   
					ctx.beginPath();
					ctx.strokeStyle = me.moveArcColor;
					ctx.arc(center.x, center.y + 20, radius, rotatorAngle, rotatorAngle + Math.PI * .45);
					ctx.stroke();
					rotatorAngle += step;

				},
				100);
			},
			hide: function() {
				var canvas = this.canvas;
				canvas.__loading = false;
				if (canvas.loadingInterval) {
					window.clearInterval(canvas.loadingInterval);
				}
				var ctx = canvas.getContext('2d');
				if (ctx) ctx.clearRect(0, 0, canvas.width, canvas.height);
			}
		};
	</script>
</head>
<body data-role="page" class="activity-scratch-card-winning">
	<script src="${basepath}/static/js/jquery-2.1.0.min.js"
		type="text/javascript"></script>
	<script src="${basepath}/static/m/wScratchPad.js"
		type="text/javascript"></script>
	<div class="main">
		<!-- 抽奖区域 -->
		<c:if
			test="${reward.status == 1 && not empty container && (container.maxAttendNum == 0 || container.maxAttendNum > applyCount) }">
			<div class="cover" id="card"
				style="<c:out value="${iswining == 1?'display:none':'display:'}"/>">
				<img
					src="${basepath}/static/m/img/activity-scratch-card-bannerbg.png">
				<div id="prize"></div>
				<div id="scratchpad"></div>
			</div>
		</c:if>
		<!-- 若活动还未开始或已经用完了所有抽奖机会 -->
		<c:if test="${iswining == 0}">
			<c:if
				test="${reward.status != 1 || container == null || (container.maxAttendNum != 0 && container.maxAttendNum <= applyCount) }">
				<div>
					<p class="title-red" style="size: 16px">无法抽奖</p>
					<p>
						<c:if test="${reward.status == 0}">
							<p class="red">活动还未开始</p>
						</c:if>
						<c:if test="${reward.status == 2}">
							<p class="red">活动已经结束</p>
						</c:if>
						<c:if test="${container == null }">
							<p class="red">本轮活动还未开始，敬请等待！</p>
						</c:if>
						<c:if
							test="${not empty container && container.maxAttendNum <= applyCount}">
							<p class="red">${reward.replyContent }</p>
						</c:if>
					</p>
				</div>
			</c:if>
		</c:if>
		<!-- 若已经中奖 -->
		<div class="content">
			<div id="zjl"
				style="<c:out value="${iswining == 0?'display:none':'display:'}"/>"
				class="boxcontent boxwhite">

				<div class="box">
					<div class="title-red">
						<span id="rewardAlert"> 恭喜你中奖了 </span>
					</div>
					<div class="Detail">
						<p>
							你中了： <span class="red" id="rewardaward">${vo.awardTitle}</span>
						</p>
						
						<%--判断是否奖励积分 --%>
						<c:choose>
							<c:when test="${creditFlag }">
							<p>
								已领取${vo.awardContent }
							</p>
							</c:when>
							<c:otherwise>
							
							<p>
								兑奖SN码： <span class="red" id="sncode">${vo.sncode}</span>
							</p>
							<form id="phoneForm" action="#" onsubmit="return false;">
								
								<p class="red"></p>
								<p>
									<input name="tel" class="px" id="tel" value="" type="text"
										placeholder="用户请输入您的手机号">
								</p>
								<input name="code" id="code" value="${vo.sncode }" type="hidden">
								<input name="awardId" id="awardId" value="${vo.awardId}"
									type="hidden"> <input name="recordId" id="recordId"
									value="${vo.id }" type="hidden">
								<p>
							</form>
							<p>
								<input class="pxbtn" name="提 交" id="save-btn" type="button"
									value="用户提交">
							</p>
							
							</c:otherwise>
						
						</c:choose>
						
						
						<input name="awardTitle" id="awardTitle" value="" type="hidden">
						<!-- <p>
									<input name="" class="px" id="parssword" type="password" value="" placeholder="商家输入兑奖密码">
								</p>
								<p>
									<input class="pxbtn" name="提 交" id="save-btnn" type="button" value="商家提交">
								</p> -->
					</div>
				</div>

			</div>

			<div id="zjl_t" style="display: none;" class="boxcontent boxwhite">
				<div class="box" style="padding: 20px; text-align: center;">
					恭喜您，提交成功！
				</div>
			</div>

			<c:if test="${not empty awards }">
				<div class="boxcontent boxwhite">
					<div class="box">
						<div class="title-brown">
							<span> 奖项设置： </span>
						</div>
						<div class="Detail">
							<c:if test="${not empty awards }">
								<c:forEach items="${awards }" var="award">
									<p>${award.title }：${award.content }。奖品数量：${award.num }</p>
								</c:forEach>
							</c:if>

						</div>
					</div>
				</div>
			</c:if>
			<div class="boxcontent boxwhite">
				<div class="box">
					<div class="title-brown">活动说明：</div>
					<div class="Detail">
						<c:if test="${not empty container }">
							<p class="red">
								<c:if test="${container.maxAttendNum ne 0 }">
										本轮活动总共可以抽${container.maxAttendNum }次,你已经抽了${applyCount }次,机会如果没用完可以再抽!
									</c:if>
								<c:if test="${container.maxAttendNum eq 0 }">
										本轮活动不限次数,可以再抽!
									</c:if>
							</p>
						</c:if>
						<c:if test="${reward.status == 1}">
							<p>${reward.explain2.content }</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="isRefresh">
		<div style="clear: both;"></div>
	</div>
	<script src="${basepath}/static/m/alert.js"
		type="text/javascript"></script>
	<script type="text/javascript">
			window.sncode = "null";
			window.prize = "谢谢参与";
			

			var zjl = false;
			var num = 0;
			var goon = true;
			$(function() {
				
				
				$("#scratchpad").wScratchPad({
					width: 150,
					height: 40,
					color: "#a9a9a7",
					touchstart:function(){
					},
					scratchMove: function(e, percent) {
						
						num++;
						if(num == 1) {
							if(${container.maxAttendNum} != 0 && ${container.maxAttendNum} <= ${applyCount}) {
								alert("你已经没有机会了！");
							}
						}
						if (num == 2) {
							$.get("${basepath}/m/ixin/lottery/applycardreward.json", { rewardId: "${reward.id}",containerId:"${container.id}", openId: "${openId}", uid : "${uid}"},
									   function(data){
									     if(data) {
									    	 document.getElementById('prize').innerHTML = data.awardTitle;
									    	 var content = data.awardContent;
								    		 $("#code").val(data.sncode);
									    	 $("#awardId").val(data.awardId);
									    	 $("#awardTitle").val(data.awardTitle);
									    	 $("#recordId").val(data.id);
									    	 
									    	 var content =  data.awardContent;
									    	 console.log(/^[1-9][0-9]?/.test(content.slice(0, content.length-3)));
									    	 console.log(content);
									    	if(/^[1-9][0-9]?/.test(content.slice(0, content.length-3))){
												window.location.reload();
									    	 }
									     } else {
									    	 document.getElementById('prize').innerHTML = "谢谢参与";
									     }
									   });
						}
						if(percent > 50){
							this.clear();
							var awardid = $("#awardId").val();
							if(awardid) {
								var awardTitle = $("#awardTitle").val();
								var sncode = $("#code").val();
								$("#rewardaward").html(awardTitle);
								$("#sncode").html(sncode);
								$("#card").attr("style", "display:none");
								$("#zjl").attr("style", "display:");
							}
							//
						}
                

						if (zjl && num > 5 && goon) {
							//$("#zjl").fadeIn();
							goon = false;

							$("#zjl").slideToggle(500);
							//$("#outercont").slideUp(500)
						}
					}
				});

				//$("#prize").html("谢谢参与");
				//loadingObj.hide();
				//$(".loading-mask").remove();
			});

			$("#save-btn").bind("click", function() {
				var btn = $(this);
				var tel = $("#tel").val();
				var awardid = $("#awardId").val();
				if (tel == '') {
					alert("请输入手机号");
					return
				}
				if(awardid == '') {
					alert("非法操作");
					return;
				}

				    
				
				$.ajax({
					type:"post",
					url:"${basepath}/m/ixin/lottery/submitreward.json",
					data:$("#phoneForm").serialize(),// 要提交的表单 
					success:function(data){
						if(data)
							{
								$("#zjl").hide();
								$("#zjl_t").show();
							}
						else
							{
								alert("操作出错！");							
							}
						}
					});
				
			});
			$(function(){
				var my_h=$(window).height();
				var my_h1=$("body").height();
				$("html").height(my_h);
				$("body").height(my_h);
				});

		</script>

</body>

</html>

