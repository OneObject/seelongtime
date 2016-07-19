<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html >
<html>
<head lang="en">
<meta charset="UTF-8">
<title>课程详情</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet"
	href="${basepath}/static/plugins/fonticon/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/css/courseframe.css">
<script type="text/javascript"
	src="${basepath }/static/js/courseframe.js"></script>
<style type="text/css">
.tback {
	position: absolute;
	display: block;
	width: 50px;
	height: 50px;
	line-height: 50px;
	cursor: pointer;
	text-align: center;
	top: 0px;
	left: 0px;
	font-size: 22px;
	color: #529BEA;
}
</style>
</head>
<body>
	<iframe src="${location}" width="100%" id="iframe"
		style="position: absolute; border: none;"> </iframe>

	<div class="userdiscuss-content"
		style="display: none; position: fixed; top: 0px; left: 0px;">
		<span class="closedisbtn" onclick="hidediscontent()"><i
			class="fa fa-times"></i></span>
		<div class="textareabox">
			<textarea id="discuss"></textarea>
			<span class="submitbtn" onclick="sub()">发表</span>
		</div>
		<div class="userdiscuss-content-list" style="padding-bottom: 20px;">
			<ul id="commentList">
			</ul>
			<span id="moreComment"
				style="display: block; width: 90%; border: 1px solid #529bea; color: #529bea; text-align: center; border-radius: 5px; line-height: 40px; margin-left: 4%;">加载更多</span>
		</div>
	</div>
	<div class="courseframe-footer" style="position: fixed; bottom: 0px;">
		<a href="javascript:history.go(-1);" class="tback">
			<i class="fa fa-angle-left"></i>
		</a>

		<c:if test="${practiceId ne null }">
			<span class="practice"
				onclick="topratice('${practiceId}','${course.id }')"><i
				class="fa fa-pencil"></i>&nbsp;练习</span>
		</c:if>
		<span class="userdiscussbtn" onclick="showdiscuss()" id="commentNum">
			<i class='fa fa-comment-o'></i>&nbsp;(0)
		</span> <span style="margin-right: 10px;" onclick="zan(this)" id="zan"></span>
	</div>
	<span class="successzan"
		style="display: none; position: fixed; bottom: 70px; left: 50%; margin-left: -50px; z-index: 999; width: 100px; text-align: center; color: #FFFFFF; background-color: #000; line-height: 30px;">赞成功</span>
	<span class="quxiaozan"
		style="display: none; position: fixed; bottom: 70px; left: 50%; margin-left: -50px; z-index: 999; width: 100px; text-align: center; color: #FFFFFF; background-color: #000; line-height: 30px;">取消赞</span>
	<span class="zanshibai"
		style="display: none; position: fixed; bottom: 70px; left: 50%; margin-left: -50px; z-index: 999; width: 100px; text-align: center; color: #FFFFFF; background-color: #000; line-height: 30px;">赞失败</span>
	<div class="courseframezhezhao"
		style="display: none; position: fixed; top: 0px; left: 0px;">
		<!--遮罩层-->
	</div>
	<%--计时 --%>
	<iframe style="display: none;" src="${traceLocation}"></iframe>
	<script type="text/javascript"
		src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#iframe").height(window.screen.availHeight - 50);
		})

		//跳到练习页面
		function topratice(practiceId, courseId) {
			window.location.href = "${basepath }/m/h5/practice/detail.xhtml?id="
					+ practiceId + "&courseid=" + courseId;
		}

		var coursetype = "${course.restype}";
		//显示评论列表
		function showdiscuss() {
			if (coursetype == "3" || coursetype == 5) {
				$("iframe").animate({
					left : -99999,
					top : -9999
				});
			}
			$(".userdiscuss-content").css({
				width : document.body.clientWidth - 20 + "px",
				left : "10px",
				top : "10px"
			});
			$(".userdiscuss-content-list").css({
				height : $(".userdiscuss-content").height() - 170
			});
			$(".userdiscuss-content,.courseframezhezhao").show();
		}
		//隐藏评论列表
		function hidediscontent() {
			if (coursetype == "3" || coursetype == 5) {
				$("iframe").animate({
					left : 0,
					top : 0
				});
			}
			$(".userdiscuss-content,.courseframezhezhao").hide();
		}

		var resid = "${course.id}";
		var restype = 1;
		var praisenum = "${ajy:praiseTotal(course.id,1)}"; //赞数量
		var zanhtml = "";
		if ("${zanStatus}" == "1") {
			zanhtml = "<i class='fa fa-thumbs-o-up'></i>";
		} else {
			zanhtml = "<i class='fa fa-thumbs-up'></i>";
		}
		$("#zan").html(zanhtml + "&nbsp;赞(" + praisenum + ")");

		var commentTotal = 0;//评论数量
		var currentPage = 1;
		var pageSize = 10;
		page(currentPage);
		function getCommentTotal() { //获取论数
			$.get("${basepath}/m/comment/count/1/${course.id}.json", function(
					data, status) {
				commentTotal = data;
				showCommentTotal();
			});
		}
		//显示评论数
		function showCommentTotal() {
			$("#commentNum").html(
					"<i class='fa fa-comment-o'></i>&nbsp;(" + commentTotal
							+ ")");
		}
		getCommentTotal();

		$("#moreComment").click(function() {
			page(currentPage);
		});

		//分页查询评论
		function page(i) {
			$.ajax({
				url : "${basepath}/m/comment/list.list",
				type : "GET",
				data : {
					"restype" : "1",
					"resid" : "${course.id}",
					"page" : i,
					"size" : "" + pageSize
				},
				success : function(data) {
					$("#commentList").append(data);
					if (commentTotal > i * pageSize) {
						currentPage = i + 1;
						$("#moreComment").show();
					} else {
						$("#moreComment").hide();
					}
				}
			});
		}

		//发表评论
		function sub() {
			var body = $("#discuss").val();
			if (body == null || body == "") {
				return;
			}
			$.ajax({
				url : "${basepath}/m/comment/add.json",
				type : "POST",
				data : {
					"restype" : "1",
					"resid" : "${course.id}",
					"action" : "1",
					"body" : body
				},
				success : function(data) {
					$("#commentList").html("");
					commentTotal = commentTotal + 1;
					showCommentTotal();
					if (commentTotal > pageSize) {
						currentPage = 2;
						$("#moreComment").show();
					}
					$("#discuss").val("");
					page(1);
				}
			});
		}

		/*点赞*/
		function zan(_this) {
			var str = $(_this).find("i").attr("class");
			var courseid = "${course.id}";
			$.ajax({
				url : "${basepath}/m/ixin/study/clickpraise.json",
				type : "POST",
				data : {
					"restype" : "1",
					"resid" : courseid
				},
				success : function(data) {
					if (data.uid != null && data.uid != "") {
						if (praisenum < data.num) {//赞
							praisenum++;
							$(_this).html(
									'<i class="fa fa-thumbs-up"></i>&nbsp;赞('
											+ praisenum + ')');
							$(".successzan").show(function() {
								setTimeout(function() {
									$(".successzan").hide();
								}, 2000);
							});
						} else {//取消赞
							praisenum--;
							$(_this).html(
									'<i class="fa fa-thumbs-o-up"></i>&nbsp;赞('
											+ praisenum + ')');
							$(".quxiaozan").show(function() {
								setTimeout(function() {
									$(".quxiaozan").hide();
								}, 2000);
							});
						}
					} else {
						$(".quxiaozan").show(function() {
							setTimeout(function() {
								$(".zanshibai").hide();
							}, 2000)
						})
					}
				},
				error : function() {
					$(".quxiaozan").show(function() {
						setTimeout(function() {
							$(".zanshibai").hide();
						}, 2000)
					})
				}
			});
		}
	</script>
</body>
</html>