<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="test.importLog" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>导入结果</title>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>

<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/base/admin/itest/importlog/importlog.xhtml">导入记录管理</a><i class="icon-angle-right"></i></li>
				<li><span href="#">导入结果</span></li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box red">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>导入结果
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<c:if test="${empty errorMsgList }">
						<div>
							<b class="b1"></b> <b class="b2"></b> <b class="b3"></b>
							<div class="alert alert-success">
								<span>导入数据成功！</span>
							</div>
							<b class="b3"></b> <b class="b2"></b> <b class="b1"></b>
						</div>
					</c:if>
					<c:if test="${not empty errorMsgList }">
						<div>
							<b class="b1"></b> <b class="b2"></b> <b class="b3"></b>
							<div class="alert alert-danger">
								<span>解析数据失败，或部分数据解析失败！</span>
							</div>
							<b class="b3"></b> <b class="b2"></b> <b class="b1"></b>
						</div>
						<div>
							<table>
							<c:forEach items="${errorMsgList }" var="e" varStatus="st">
								<tr class="col1">
									<td class="cont">
										<div class="label label-sm label-danger">                        
											<i class="glyphicon glyphicon-warning-sign"></i>
										</div>
										${st.index+1 }
									</td>
									<td >${e }</td>
								</tr>
							</c:forEach>	
							</table>
						</div>
					</c:if>	
				</div>
			</div>
		</div>
	</div>

</body>
</html>
