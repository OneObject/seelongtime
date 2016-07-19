<%@page import="com.longtime.app.base.util.Constant"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="com.longtime.app.config.Constants"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<script type="text/javascript"	src="${path}/static/ixin/plugin/ueditor1_4_3-utf8-jsp/third-party/dialogs/internal.js"></script>
	<script type="text/javascript"	src="${path}/static/ixin/plugin/ueditor1_4_3-utf8-jsp/third-party/jquery-1.10.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
	<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	<link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css">
	<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/bootstrap/css/bootstrap.min.css" type="text/css">
</head>
<body>
	<div class="wrapper">
		<div id="videoTab">
			<div id="tabHeads" class="tabhead"> 
			</div>
			<div style="clear: both;display: block;overflow: hidden;">
				<c:if test="${fn:length(videos) eq 0 }">
				没有视频数据！！！
				</c:if>
				<c:forEach items="${videos}" var="video" >
					<div style="float: left;border:1px solid #eee;padding:2px;">
						<c:choose>
							<c:when test="${empty  video.posterURL  }">
								<c:choose>
									<c:when test="${video.source =='webapp' }">
										<img src="${path }/static/ixin/img/video.png"
											width="179" height="113"   style="margin: 5px 5px 5px 5px;"
											onclick="addLocalVide('${video.videoid}','${video.id}',  '${path}/static/static/ixin/img/video.png','${video.sourceURL }');" />
									</c:when>
									<c:otherwise>
										<img src="${path }/static/ixin/img/video.png"
											width="179" height="113"  style="margin: 5px 5px 5px 5px;"
											onclick="addVide('${video.videoid}','${video.id}', '${path}/static/static/ixin/img/video.png');" />
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${video.source =='webapp' }">
										<img  src="<%=Constants.IMG_SERVER_DOWNLOAD%>${video.posterURL}"
											width="179" height="113"   style="margin: 5px 5px 5px 5px;"
											onclick="addLocalVide('${video.videoid}','${video.id}',  '<%=Constants.IMG_SERVER_DOWNLOAD%>${video.posterURL}','${video.sourceURL }');" />
									</c:when>
									<c:otherwise>
										<img  src="${video.posterURL}"
											width="179" height="113"   style="margin: 5px 5px 5px 5px;"
											onclick="addVide('${video.videoid}','${video.id}',  '${video.posterURL}');" />
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<span style="display: block; width: 179px;height:24px;line-height: 24px;font-size: 12px;color: #000;padding-left: 5px;">
									${video.name}
						</span>
						<div id = "${video.id}" class="zhezhao"
									style="display: none;overflow: hidden;position: absolute;width: 179px;height:142px;color:green;font-size: 36px;text-align: center;line-height: 113px;margin-top: -142px;margin-left: 5px;z-index: 999;background-color: rgba(0, 0, 0, 0.6) !important;">
							<i class="glyphicon glyphicon-ok" style="margin-top: 30%;"></i>
						</div>
					</div>
				</c:forEach>
			</div>
			<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
		</div>
	</div>

<script type="text/javascript">
	function addVide(vid,ids, posterurl) {//点击选择视频
		$(".zhezhao").css("display","none");
		$("#"+ids).css("display","block");
		//encodeURI  posterurl 进行uft8 编码
		var val = encodeURIComponent(posterurl);
		parent.document.getElementById('videourl').value = "<%=Constants.STUDENT_WEB_ROOT%>widget/ivideoplayer.xhtml?vid="+ vid + "&cover=" + val;
	}
	
	function addLocalVide(vid,ids, posterurl,sourceurl) {//点击选择本地视频
		$(".zhezhao").css("display","none");
		$("#"+ids).css("display","block");
		//encodeURI  posterurl 进行uft8 编码
		var val = encodeURIComponent(posterurl );
		var url = encodeURIComponent('<%=Constants.STUDENT_WEB_ROOT%>'+'/'+sourceurl);
		parent.document.getElementById('videourl').value = "<%=Constants.STUDENT_WEB_ROOT%>widget/ivideoplayer.xhtml?vid="+ vid + "&cover=" + val + "&type=local&url="+url;
	}
		
	function page(i) {//分页
		var params = "currPage=" + i + "&pageSize=6";
		window.location.href = "${basepath}/base/admin/ueditor/video.xhtml?" + params;
	}
</script>
</body>
</html>