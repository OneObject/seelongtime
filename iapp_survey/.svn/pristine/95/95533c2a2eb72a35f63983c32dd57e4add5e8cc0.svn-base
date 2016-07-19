<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>公众号绑定</title>
<meta name="menu_path" content="ixin.menu_bind" />
<link rel="stylesheet"  href="${basepath}/static/ixin/css/base.css" type="text/css">
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<style type="text/css">
	.align_right{text-align:right; }
	.img{width:22px; height:22px;}
	.img_con{width:50px; }
	.easyDialog_wrapper .easyDialog_content {height:270px;}
	.content_td{width:100% ; height:80px;}
	.content_td div{width:99% !important; height:98% !important; border: none;}
	.content_area{width:99%; height:90%; }
</style>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">公众号绑定</span></li>
			</ul>
		</div>
	</div>
	<input type="hidden" id="syncToWx" value="${syncToWx }"/>
	<input type="hidden" id="syncFromWx" value="${syncFromWx }"/>
	<c:if test="${not empty tokenInfo.appId}"><!-- 已经绑定了appId -->
	<div class="row">
        <div class="col-md-12">
            <div class="note note-success">
			<table class="searchContent myTable" style="padding-top: 8px;">
				<tr>
					<td style="text-align: right;">
						<span>URL：</span>	
					</td>
					<td>
						<span >${baseurl }${tokenInfo.domain_token}.xhtml</span>	
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<span>Token：</span>
					</td>
					<td>
						<span>${tokenInfo.token}</span>
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<span>AESkey：</span>
					</td>
					<td>
						<span>${tokenInfo.aeskey}</span>
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<span>Domain：</span>
					</td>
					<td>
						<span>${tokenInfo.domain}</span>
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<span>启用微信服务：</span>	
					</td>
					<td>
						<span><c:if test="${tokenInfo.isEnabled eq 1}" >已启用</c:if>
						<c:if test="${tokenInfo.isEnabled eq 0}" >未启用</c:if></span>	
					</td>
				</tr>
			</table>
			</div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-12">
            <div class="note note-success">
			<table class="searchContent" style="padding-top: 8px;">
				<tr>
					<td style="text-align: right;">
						<span>账号类型：
						</span>
					</td>
					<td>
						<span>
						<c:if test="${tokenInfo.type eq 0}">
							订阅号
						</c:if> 
						<c:if test="${tokenInfo.type eq 1}">
							服务号
						</c:if> 
						<c:if test="${tokenInfo.type eq 3}">
							企业号
						</c:if> 
						</span>
						<span id="js_preview" class="btn btn_input btn_primary" onclick="addAppKey('${tokenInfo.domain}');" style="position:absolute;right:20px;top:10px;"><button>设置</button></span>
						<c:if test="${tokenInfo.type eq '3' }">
							<span id="syncToWxCp" class="btn btn_input btn_primary" onclick="syncToWxCp('${tokenInfo.domain}');" style="position:absolute;right:320px;top:10px;"><button>同步至微信</button></span>
							<span id="syncFromWxCp" class="btn btn_input btn_primary" onclick="syncFromWxCp('${tokenInfo.domain}');" style="position:absolute;right:150px;top:10px;"><button>从微信同步</button></span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<span>是否高级认证：
						</span>
					</td>
					<td>
						<span>
						<c:if test="${tokenInfo.authentication eq 1}">已认证</c:if> 
						<c:if test="${tokenInfo.authentication eq 0}">未认证</c:if> 
						</span>
					</td>
				</tr>
				<tr>
					<td  style="text-align: right;">
						<span>公众号账号：</span>
					</td>
					<td>
						<span>${tokenInfo.name}</span>
					</td>
				</tr>
				<tr>
					<td  style="text-align: right;">
						<span>AppId：</span>
					</td>
					<td>
						<span>${tokenInfo.appId}</span>
					</td>
				</tr>
				<tr>
					<td  style="text-align: right;">
						<span>AppSecret：</span>	
					</td>
					<td>
						<span>${tokenInfo.appSecret }</span>	
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<span>支持oauth协议：
						</span>
					</td>
					<td>
						<span>
						<c:if test="${tokenInfo.oauth}">支持</c:if> 
						<c:if test="${not tokenInfo.oauth}">不支持</c:if> 
						</span>
					</td>
				</tr>
				<c:if test="${tokenInfo.type eq 3}">
				<tr>
					<td  style="text-align: right;">
						<span>应用id：</span>	
					</td>
					<td>
						<span>${tokenInfo.agentid }</span>	
					</td>
				</tr>
				</c:if>
			</table>
			</div>
        </div>
    </div>
	</c:if>
	<c:if test="${empty tokenInfo.appId}"><!-- 未绑定appId -->
		<div class="row">
			<div class="col-md-12">
            <div onclick="addAppKey('${tokenInfo.domain}');" style="text-align: center;width: 200px;height: 50px;background: #56a447;margin: 200px auto;line-height: 50px;cursor: pointer;color: white;font-size: 16px;font-weight: bold;">
            	账号设置
            </div>
           	</div>
		</div>
	</c:if>
    
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript">
var type = '${tokenInfo.type}';
var authentication = '${tokenInfo.authentication}';
var appId = '${tokenInfo.appId}';
var domain = '${tokenInfo.domain}';
var oauth = '${tokenInfo.oauth}';
$(function(){
	if(appId == "" || appId == null){
		addAppKey(domain);
	}
});

//窗口
function addAppKey(domain){
	var accountinfo = "";
	var html = [];
	if(type == "3"){
		html.push('<div id ="wondowid" style="width:500px;height:500px;">');
	}else{
		html.push('<div id ="wondowid" style="width:500px;height:450px;">');
	}
	html.push('<div class="form-group" id="con_type">');
	html.push('        <label class="control-label col-md-3" >账号类型<span class="required">*</span>：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input name="type" type="radio" value="0" style="position:relative;top:2px;left:20px;" id="dingyue" onclick="checkAccount(this);" ');
	if(type == "0"){
		html.push(' checked="true"');	
	}
	html.push(' /> <label for="dingyue"> 订阅号</label>&nbsp;&nbsp;');
	html.push('            <input name="type" type="radio" value="1" style="position:relative;top:2px;left:20px;" id="fuwu" onclick="checkAccount(this);" '); 
	if(type == "1"){
		html.push(' checked="true"');	
	}
	html.push(' /> <label for="fuwu"> 服务号 </label>&nbsp;&nbsp;');
	html.push('            <input name="type" type="radio" value="3" style="position:relative;top:2px;left:20px;" id="qiye" onclick="checkAccount(this);" ');
	if(type == "3"){
		html.push(' checked="true"');	
	}
	html.push(' /> <label for="qiye"> 企业号 </label>');
	html.push('            <span id="tip_type" class="help-block hidden">请选择公众号类型！</span>');
	html.push('        </div>');
	html.push('    </div>');
	html.push('<div class="form-group" id="con_authentication">');
	html.push('        <label class="control-label col-md-3" >高级认证<span class="required">*</span>：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input name="authentication" type="radio" style="position:relative;top:2px;left:20px;" value="1" id="yes" onclick="chooseauthentication(this);" ');
	if(authentication == "1"){
		html.push(' checked="true"');	
	}
	html.push(' /><label for="yes"> 是</label>&nbsp;&nbsp;');
	html.push('            <input name="authentication" type="radio" style="position:relative;top:2px;left:20px;" value="0" id="no" onclick="chooseauthentication(this);" ');
	if(authentication == "0"){
		html.push(' checked="true"');	
	}
	html.push(' /><label for="no"> 否</label>');
	html.push('            <span id="tip_authentication" class="help-block hidden">请选择是否高级认证！</span>');
	html.push('        </div>');
	html.push('    </div>');
	html.push('<div class="form-group" id="con_name">');
	html.push('        <label class="control-label col-md-3" >公众号账号：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input type="text" class="form-control" id="name" name="name"  value="${tokenInfo.name }">');
	html.push('        </div>');
	html.push('    </div>');
	html.push('<div class="form-group" id="con_pass">');
	html.push('        <label class="control-label col-md-3" >密码：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input type="password" class="form-control" id="pass" name="pass" value="${tokenInfo.pass }">');
	html.push('        </div>');
	html.push('    </div>');
	html.push('<div class="form-group" id="con_AppId">');
	html.push('        <label class="control-label col-md-3" >AppId<span class="required">*</span>：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input type="text" class="form-control" id="AppId" name="AppId" onchange="nameValidate(this)" value="${tokenInfo.appId }">');
//	html.push('            <span id="tip_AppId" class="help-block hidden">AppId不能为空！</span>');
	html.push('        </div>');
	html.push('    </div>');
	html.push('<div class="form-group" id="con_AppSecret">');
	html.push('        <label class="control-label col-md-3" >AppSecret<span class="required">*</span>：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input type="text" class="form-control" id="AppSecret" name="AppSecret" onchange="nameValidate(this)" value="${tokenInfo.appSecret }">');
//	html.push('            <span id="tip_AppSecret" class="help-block hidden">AppSecret不能为空！</span>');
	html.push('        </div>');
	html.push('    </div>');
	html.push('<div class="form-group" id="con_AESkey" ');
	//if("3" != type){
	//	html.push(' style="display:none" ');
	//}
	html.push(' >');
		html.push('        <label class="control-label col-md-3" >AESkey');
		if("3" != type){
			html.push('<span id="mustdone" style="display:none" class="required">*</span>');
		}else{
			html.push('<span id="mustdone"  class="required">*</span>');
		}
		html.push('：</label>');
		html.push('        <div class="col-md-9">');
		html.push('            <input type="text" class="form-control" id="AESkey" name="AESkey" onchange="nameValidate(this)" value="${tokenInfo.aeskey }">');
		html.push('        </div>');
		html.push('    </div>');
	
	
	html.push('<div class="form-group" id="con_oauth" ');
	
	if(type== "1" && authentication == "1"){
		html.push('style="display:block"');
	}else if(type=="3"){
		html.push('style="display:block"');
	}else{
		html.push('style="display:none"');
	}

	html.push('>');
	html.push('        <label class="control-label col-md-3" >支持oauth<span class="required">*</span>：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input name="oauth" type="radio" style="position:relative;top:2px;left:20px;" value="true" id="yesoauth" ');
	if(oauth == "true"){
		html.push(' checked="true"');	
	}
	html.push(' /><label for="yesoauth"> 是</label>&nbsp;&nbsp;');
	html.push('            <input name="oauth" type="radio" style="position:relative;top:2px;left:20px;" value="false" id="nooauth" ');
	if(oauth == "false"){
		html.push(' checked="true"');	
	}
	html.push(' /><label for="nooauth"> 否</label>');
	html.push('            <span id="tip_oauth" class="help-block hidden">请选择是支持oauth！</span>');
	html.push('        </div>');
	html.push('    </div>');

	
	html.push('<div class="form-group" id="con_agentid" ');
	if("3" != type){
		html.push(' style="display:none" ');
	}
	html.push(' >');
	html.push('        <label class="control-label col-md-3" >应用id<span class="required">*</span>：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input type="text" class="form-control" id="agentid" name="agentid" onchange="nameValidate(this)" value="${tokenInfo.agentid }">');
//	html.push('            <span id="tip_AppSecret" class="help-block hidden">应用id！</span>');
	html.push('        </div>');
	html.push('    </div>');
	html.push('<div style="width:440px;margin:0 auto;">请前往微信公众平台，登录后到开发者中心，在开发者ID处，获取AppID和AppSecret。<div>');
	html.push("</div>");
	easyDialog.open({
	  container : {
	    header : '开发者凭证',
	    content : html.join(""),
	    yesFn : btnFn,
	    noFn : true

	  }
	});
	App.init();
}  

function syncToWxCp(domain){
	var syncToWx = $("#syncToWx").val();
	if(syncToWx == "false"){
		sureDialog("系统管理->企业配置->站点配置->同步至微信功能未开启，无法将爱加油内的组织、用户信息同步至微信企业号内。");
		return;
	}
	if(confirm("您确认要将爱加油内的组织、用户信息同步至微信企业号内吗？")){
		$.ajax({
			type : "post",
			url : "${basepath}/mgr/wx/cp/synctocp.json",
			data : {"domain" : domain},
			success : function(data) {
				if (data == 'success') {
					showMsgDialog("组织、用户信息正在同步中，请稍后查看。");
					$("#topicid").val(data.id);
				} else {
					showMsgDialog("操作失败！");
				}
			}
		});
	}
}

function syncFromWxCp(domain){
	var syncFromWx = $("#syncFromWx").val();
	if(syncFromWx=="false"){
		sureDialog("系统管理->企业配置->站点配置->从微信同步功能未开启，无法从微信企业号内将组织、用户信息同步至爱加油内。");
		return;
	}
	if(confirm("您确认要从微信企业号内将组织、用户信息同步至爱加油内吗？")){
		$.ajax({
			type : "post",
			url : "${basepath}/mgr/wx/cp/syncfromcp.json",
			data : {"domain" : domain},
			success : function(data) {
				if (data == 'success') {
					showMsgDialog("组织、用户信息正在同步中，请稍后查看。");
					$("#topicid").val(data.id);
				} else {
					showMsgDialog("操作失败！");
				}
			}
		});
	}
}

/** 带有确定按钮的弹出框 */
function sureDialog(msg){
	var html="<div style='width:360px;text-align:center;'>"+msg+"</div>";
	easyDialog.open({
		container : {
		    header : '提示',
			content : html
			,yesFn : function (){return true; }
		}
	});
}

function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
        },
        autoClose:1200
    });
}

//保存账号信息
function btnFn(){		
	if(!typeValidate("type")){
		addError("type");
		return false;
	}
	
	if(!typeValidate("authentication")){
		addError("authentication");
		return false;
	}
	if(!nameValidate($("#AppId"))){
		addError("AppId");
		return false;
	}
	if(!nameValidate($("#AppSecret"))){
		addError("AppSecret");
		return false;
	}
	if(!typeValidate("oauth")){
		addError("oauth");
		return false;
	}
	var type = $('input:radio[name="type"]:checked').val();
	if(type == "3" && !nameValidate($("#agentid"))){
		addError("agentid");
		return false;
	}

	var AESkey = "";
	
	if(type == "3"){
		if(!nameValidate($("#AESkey"))){
			addError("AESkey");
			return false;
		}
	}
	AESkey = $.trim($("#AESkey").val());

	var oauth = $('input:radio[name="oauth"]:checked').val();
	var authentication = $('input:radio[name="authentication"]:checked').val();
	if(oauth==null || oauth ==""){
		oauth = "false";
	}else if(authentication == 0 && type=='1'){
		oauth = "false";
	}else if(type=='0'){
		oauth = "false";
	}
	var appId = $('#AppId').val();	
	var appSecret = $('#AppSecret').val();
	var name = $('#name').val();
	var pass = $('#pass').val();
	var agentid = $('#agentid').val();
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/ixin/savetokeninfo.json",
		data: {
			"type":type,
			"authentication":authentication,
			"name":name,
			"pass":pass,
			"agentid":agentid,
			"appId":appId,
			"appSecret":appSecret,
			"oauth" : oauth,
			"AESkey" : AESkey,
			"domain":"${tokenInfo.domain}"
		},
		success:function(data){
			location = basepath+"/mgr/ixin/token.xhtml";
		},
		error: function(data){
		}
	});
}

//验证字段为空
function nameValidate(obj){
	if($.trim($(obj).val()) != ""){
		removeError($(obj).attr("id"));
		return true;
	}else{
		addError($(obj).attr("id"));
		return false;
	}
}

//验证类型为空
function typeValidate(cvalue){
	var tval=$('input:radio[name="'+cvalue+'"]:checked').val();
	if(tval == null){ 
		return false;
	}else{ 
		removeError(cvalue);
		return true;
	}
} 

function addError(id){
	$("#con_"+id).addClass("has-error");
	$("#tip_"+id).removeClass("hidden");
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
	$("#tip_"+id).addClass("hidden");
}

//选择账号类型
function checkAccount(_this){
	if($(_this).val() == 3 && $(_this).attr("checked")){//选择了企业号
		$("#wondowid").css({"height": "500px"});
		$("#con_agentid").show();
		//$("#con_AESkey").show();
		$("#mustdone").show();
		
	}else{
		$("#wondowid").css({"height": "450px"});
		$("#con_agentid").hide();
		//$("#con_AESkey").hide();
		$("#mustdone").hide();
	}
}

//$('input:radio[name="authentication"]:checked').val()
//$('input:radio[name="type"]:checked').val()
//$('input:radio[name="oauth"]:checked').val()
function checkAccount(_this){
	var status = $('input:radio[name="authentication"]:checked').val();
	if($(_this).val() == 3 && $(_this).attr("checked")){//选择了企业号
		$("#wondowid").css({"height": "500px"});
		$("#con_agentid").show();
		//$("#con_AESkey").show();
		$("#mustdone").show();
		
	}else{
		$("#wondowid").css({"height": "450px"});
		$("#con_agentid").hide();
		//$("#con_AESkey").hide();
		$("#mustdone").hide();
	}
	
	if($(_this).val() == 3 && $(_this).attr("checked")){//选择了企业号
		$("#con_oauth").show();
		
	}else if($(_this).val() == 1 && $(_this).attr("checked") && status==1){
		$("#con_oauth").show();
	}else{
		$("#con_oauth").hide();
	}
}
		

function chooseauthentication(_this){
	var status = $('input:radio[name="type"]:checked').val();
	if($(_this).val() == 1 && $(_this).attr("checked") && status == 1){
		$("#con_oauth").show();
		
	}else if(status==3){
		$("#con_oauth").show();
	}else{
		$("#con_oauth").hide();
	}
	
}
</script>
</body>
</html>