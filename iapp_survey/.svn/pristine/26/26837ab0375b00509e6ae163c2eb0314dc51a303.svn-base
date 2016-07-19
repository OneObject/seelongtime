<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<h2 class="contentTitle">添加移动端版本信息</h2>

<div class="pageContent">
	
	<form  method="post" action="${basepath }/mobile/add.xhtml" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
		<div class="pageFormContent nowrap" layoutH="97" >

			<dl>
				<dt>设备：</dt>
				<dd>
					<input type="text" name="device" style="width: 200px;" class="required"  maxlength="30" alt=""/>
					<span class="info"></span>
				</dd>
			</dl>
			<dl>
				<dt>版本：</dt>
				<dd>
					<input type="text" name="version" style="width: 200px;" class="required"  maxlength="30" alt=""/>
					<span class="info"></span>
				</dd>
			</dl>
			<dl>
				<dt>能否继续使用：</dt>
				<dd>
					<select id="canUser" name="canUser">
						<option value="1">正常</option>
						<option value="0">废弃</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>域：</dt>
				<dd>
					<input type="text" name="domain" style="width: 200px;" class="required"  maxlength="30" alt=""/>
					<span class="info"></span>
				</dd>
			</dl>
			<dl>
				<dt>更新路径：</dt>
				<dd>
					<input type="url" name="downloadPath" style="width: 450px;" class="required"  alt=""/>
					<span class="info"></span>
				</dd>
			</dl>
			<dl>
				<dt>版本信息:</dt>
				<dd>
					<textarea type="text" name="versionInfo" style="width: 450px;height: 90px" class="required"  alt=""></textarea>
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
