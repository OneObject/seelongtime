<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<h2 class="contentTitle">添加消息[新闻]</h2>

<div class="pageContent">
	
	<form  method="post" action="${basepath }/remind/add.xhtml" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
		<div class="pageFormContent nowrap" layoutH="97" >

			<dl>
				<dt>标题[简介]：</dt>
				<dd>
					<input type="text" name="title" style="width: 400px;" class="required" alt=""/>
					<span class="info"></span>
				</dd>
			</dl>

			<dl>
				<dt>内容：</dt>
				<dd>
				<textarea name="content" style="width: 480px; height: 200px;"></textarea>
				<span class="info"></span>
				</dd>
			</dl>
			
			<dl>
				<dt>图片地址：</dt>
				<dd>
					<input type="url" name="imgUrl" style="width: 400px;" class="required"  alt=""/>
					<span class="info"></span>
				</dd>
			</dl>
			<dl>
				<dt>域：</dt>
				<dd>
					<select name="domain" id="remind_domain">
						<option value="all">公共</option>
						<option value="ksf">康师傅</option>
						<option value="longtimeit">龙泰</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>类型：</dt>
				<dd>
					<select name="type">
					<c:forEach items="${map }" var="entry">
						<option value="${entry.key }">${entry.value }</option>
					</c:forEach>
					</select>
				</dd>
			</dl>
			
			<dl>
				<dt>是否发布：</dt>
				<dd>
					<select name="release">
						<option value="1">发布</option>
						<option value="0">暂不发布</option>
					</select>
				</dd>
			</dl>
			
			<dl>
				<dt>原文地址：</dt>
				<dd>
					<input type="url" name="resourceUrl" style="width: 400px;" class="required" alt=""/>
					<span class="info"></span>
				</dd>
			</dl>
		</div>	
		<div class="formBar" >
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript">
function customvalidXxx(element){
	if ($(element).val() == "xxx") return false;
	return true;
}
</script>
