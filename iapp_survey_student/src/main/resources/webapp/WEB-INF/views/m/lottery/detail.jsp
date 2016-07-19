<%@page contentType="text/html; charset=utf-8"%>
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
<body data-role="page" class="activity-scratch-card-winning">
	<script src="${basepath}/static/js/jquery-2.1.0.min.js"
		type="text/javascript"></script>
	<script src="${basepath}/static/m/wScratchPad.js"
		type="text/javascript"></script>
	<div class="main">
		<div class="content">
			<div id="zjl"
				class="boxcontent boxwhite">

				<div class="box" >
					<div  style="display: block; color: red;padding-top: 5px;text-align: center;" >
						<span > 谢谢参与 </span>
					</div>
					<div class="Detail">
					
						<p>
							<input class="pxbtn" name="提 交" id="save-btn" type="button"
								value="继续抽奖">
						</p>
						<!-- <p>
									<input name="" class="px" id="parssword" type="password" value="" placeholder="商家输入兑奖密码">
								</p>
								<p>
									<input class="pxbtn" name="提 交" id="save-btnn" type="button" value="商家提交">
								</p> -->
					</div>
				</div>

			</div>


			<div class="boxcontent boxwhite">
				<div class="box">
					<div  >活动说明：</div>
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
	
	</div>
	<input type="hidden" id="rewardId" value="${reward.id}">
	<script src="${basepath}/static/ixin/js/alert.js"
		type="text/javascript"></script>
	<script type="text/javascript">
			$("#save-btn").bind("click", function() {
				var rewardId = $("#rewardId").val();
				window.location.href="${basepath}/m/ixin/lottery/cardreward.xhtml?rewardId="+rewardId;
			});

		</script>

</body>

</html>

