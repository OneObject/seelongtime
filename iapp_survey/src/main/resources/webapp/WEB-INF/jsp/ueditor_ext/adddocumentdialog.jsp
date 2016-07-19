<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="com.longtime.app.config.Constants"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<script type="text/javascript" src="${path}/static/ixin/plugin/ueditor1_4_3-utf8-jsp/third-party/dialogs/internal.js"></script>
	<script type="text/javascript"	src="${path}/static/ixin/plugin/ueditor1_4_3-utf8-jsp/third-party/jquery-1.10.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
	<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css" >
	<link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css">
	<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/bootstrap/css/bootstrap.min.css" type="text/css">
</head>
<body>
	<div class="wrapper">
		<div id="videoTab">
			<div id="tabHeads" class="tabhead"> 
			</div> 
			<c:if test="${fn:length(docs) eq 0 }">
				没有文档数据！！！
			</c:if>
			<c:forEach items="${docs}" var="doc">
				<div style="float: left;border:1px solid #eee;padding:2px;">
					<img src="${doc.path}page_1.png"
							width="179" height="113" style="margin: 5px 5px 5px 5px;"
							onclick="addDoc('${doc.pagenum}', '${doc.path}', '${doc.id }');" />
					<span style="display: block; width: 179px;height:24px;line-height: 24px;font-size: 12px;color: #000;padding-left: 5px;">
							${doc.originalname}
					</span>
					<div id = "${doc.id}" class="zhezhao"
							style="display: none;overflow: hidden;position: absolute;width: 179px;height:142px;color:green;font-size: 36px;text-align: center;line-height: 113px;margin-top: -142px;margin-left: 5px;z-index: 999;background-color: rgba(0, 0, 0, 0.6) !important;">
						<i class="glyphicon glyphicon-ok" style="margin-top: 30%;"></i>
					</div>
				</div>					 
			</c:forEach> 
			<div style="display: block;overflow: hidden;clear: both;width: 200px;">
			<div class="input-group">
			  <span class="input-group-addon"  style="height: 24px;font-size: 12px;padding: 3px;">文档展示方式：</span>
			  <select id="imgtype" class = "form-control" style="height: 24px;font-size: 12px;padding: 3px;" onchange="settype();">
				<!-- <option value="1">图集</option> -->
				<option value="2">平铺</option>
			</select>
			</div>
			</div>		
			<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
		</div>
	</div>

<script type="text/javascript">
	function addDoc(num, path, id) { //点击选择文档
		$(".zhezhao").css("display","none");
		$("#"+id).css("display","block");
		parent.document.getElementById('pagenum').value =  num;//文档页数， 从1 开始
		parent.document.getElementById('docpath').value =  path;//路径
	//	parent.document.getElementById('docid').value =  id;//文档id
		parent.document.getElementById('imgtype').value = document.getElementById('imgtype').value;//图片展示方式
	}
	function settype(){//选择下拉框文档展示方式时 保存设置
		parent.document.getElementById('imgtype').value = document.getElementById('imgtype').value;//图片展示方式 
	}
	function page(i) {//分页
		var params = "currPage=" + i + "&pageSize=6";
		window.location.href = "${basepath}/base/admin/ueditor/document.xhtml?" + params;
	}
</script>
</body>
</html>