<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导入试题</title>

<style type="text/css">
	
	.QQQ{
		line-height: 30px;
	}
	.noborder{border: none !important; width:150px; }
</style>
</head>
<body>
<h2 class="contentTitle">导入试题</h2>

<div class="pageContent">
<form  method="post" action="${basepath }/testquestion/importquestion.xhtml" enctype="multipart/form-data" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);"> 
	<div class="pageFormContent nowrap" layoutH="97" >

			<dl>
				<dt>模板下载：</dt>
				<dd>
					<a href="${basepath }/modelfile/试题导入模板.xls" style="color: #0093c3;">模板下载</a>
					<span class="info"></span>
				</dd>
			</dl>
			<dl>
				<dt>题库名称：</dt>
				<dd>
					<select name="blankid" id="blank_id" style="width:150px;">
						<c:forEach items="${list }" var="item" varStatus="st">
							<option value="${item.id }" <c:out value="${item.id eq blankId ?'selected=selected':'' }" />>${item.name }</option>
						</c:forEach>
					</select>
					<span class="info"></span>
				</dd>
			</dl>
			<dl>
				<dt>选择要导入的试题：</dt>
				<dd>
					<input type="file" name="file" class="required noborder" title="请选择文件" />
					<span class="info"></span>
				</dd>
			</dl>
		</div>

		<div class="formBar" id="btnSubmit">
		 	<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul> 
		</div>
</form>
</div>
</body>
</html>