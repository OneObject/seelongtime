<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<head>
<title>公众号绑定</title>
<meta name="menu_path" content="ixin.menu_bind" />
<link rel="stylesheet"  href="${basepath}/static/ixin/css/base.css" type="text/css">
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<%-- <link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css"> --%>
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

	<div class="row">
        <div class="col-md-12">
            <div class="note note-success">

		<table class="searchContent" style="padding-top: 8px;">
			<tr>
				<td>
					<span>Token：${tokenInfo.token}</span>
				</td>
				
			</tr>
			<tr>
				<td>
					<span>URL：${baseurl }${tokenInfo.domain_token}.xhtml</span>	
				</td>
			</tr>
			<tr>
				<td>
					<span>Domain：${tokenInfo.domain}</span>
				</td>
				
			</tr>
			<tr>
				<td>
					<span>启用微信服务：<c:if test="${tokenInfo.isEnabled eq 1}" >已启用</c:if>
					<c:if test="${tokenInfo.isEnabled eq 0}" >未启用</c:if></span>	
				</td>
			</tr>
		</table>
	</div>
        </div>
    </div>
    
        <div class="row">
        <div class="col-md-12">
            <div class="note note-success" style="display: none">

		<table class="searchContent" style="padding-top: 8px; width:100%;">
			<tr>
				<td>
					<span>公众号账号：<span id="username">${tokenInfo.name }</span></span>
				</td>
				
			</tr>
			<tr>
				<td>
					<span>公众号密码：<span id="pwd"><c:out value="${ empty tokenInfo.name? '':'******'}"/></span></span>	
				</td>
			</tr>
			<tr>
				<td>
					<span>公众号类型： 
					 <c:if test="${tokenInfo.type eq '0' }">订阅号</c:if>
					 <c:if test="${tokenInfo.type eq '1' }">服务号</c:if>
					 </span>	
				</td>
			</tr>
			<tr>
				<td>
					<span>高级认证： 
					 <c:if test="${tokenInfo.authentication eq '0' }">未认证</c:if>
					 <c:if test="${tokenInfo.authentication eq '1' }">已认证</c:if>
					 </span>	
				</td>
			</tr>
			
				<tr id="qrcode" style="display:none">
					<td>
						<p>
						<br>
						<img width="150" src="${basepath }/resource/ixin/${tokenInfo.name}.jpg" >
						
						</p>
						
					</td>
				</tr>
			
			<tr>
				<td style="text-align:right;" > 
				<span id="js_preview" class="btn btn_input btn_primary" onclick="addPulicname('${tokenInfo.domain}')"><button>填写并自动绑定</button></span>
				</td>
			</tr>
		</table>
	</div>
        </div>
    </div>
    
    
    <div class="row">
        <div class="col-md-12">
            <div class="note note-success">

		<table class="searchContent" style="padding-top: 8px; width:100%;">
			<tr>
				<td>
					<span>AppId：${tokenInfo.appId}</span>
				</td>
				
			</tr>
			<tr>
				<td>
					<span>AppSecret：${tokenInfo.appSecret }</span>	
				</td>
			</tr>
			<tr>
				<td style="text-align:right;" > 
				<span id="js_preview" class="btn btn_input btn_primary" onclick="addAppKey('${tokenInfo.domain}');"><button>开发者凭证</button></span>
				</td>
			</tr>
		</table>
	</div>
        </div>
    </div>
 
    
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript">
function addAppKey(domain){
	var html = [];
	html.push('<div style="width:500px;height:190px;">');
	html.push('<div class="form-group" id="con_AppId">');
	html.push('        <label class="control-label col-md-3" >AppId：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input type="text" class="form-control" id="AppId" name="name" onchange="nameValidate(this)">');
	html.push('            <span id="tip_AppId" class="help-block hidden">AppId不能为空！</span>');
	html.push('        </div>');
	html.push('    </div>');
	html.push('<div class="form-group" id="con_AppSecret">');
	html.push('        <label class="control-label col-md-3" >AppSecret：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input type="text" class="form-control" id="AppSecret" name="name" onchange="nameValidate(this)">');
	html.push('            <span id="tip_AppSecret" class="help-block hidden">AppSecret不能为空！</span>');
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
}

function addPulicname(domain){
	var html = [];
	html.push('<div style="width:500px;height:170px;">');
	html.push('<div class="form-group" id="con_name">');
	html.push('        <label class="control-label col-md-3" >公众号账号：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input type="text" class="form-control" id="name" name="name" onchange="nameValidate(this)" value="${tokenInfo.name }">');
	html.push('            <span id="tip_name" class="help-block hidden">公众号账号名不能为空！</span>');
	html.push('        </div>');
	html.push('    </div>');
	html.push('<div class="form-group" id="con_pass">');
	html.push('        <label class="control-label col-md-3" >密码：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input type="text" class="form-control" id="pass" name="pass" onchange="nameValidate(this)">');
	html.push('            <span id="tip_pass" class="help-block hidden">密码不能为空！</span>');
	html.push('        </div>');
	html.push('    </div>');
	html.push('<div class="form-group" id="con_type">');
	html.push('        <label class="control-label col-md-3" >公众号类型：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input name="type" type="radio" value="0" id="dingyue"  /> <label for="dingyue"> 订阅号</label>&nbsp;&nbsp;');
	html.push('            <input name="type" type="radio" value="1" id="fuwu"  /> <label for="fuwu"> 服务号 </label>');
	html.push('            <span id="tip_type" class="help-block hidden">请选择公众号类型！</span>');
	html.push('        </div>');
	html.push('    </div>');
	html.push('<div class="form-group" id="con_authentication">');
	html.push('        <label class="control-label col-md-3" >高级认证：</label>');
	html.push('        <div class="col-md-9">');
	html.push('            <input name="authentication" type="radio" value="1" id="yes" /><label for="yes"> 是</label>&nbsp;&nbsp;');
	html.push('            <input name="authentication" type="radio" value="0" id="no" /><label for="no"> 否</label>');
	html.push('            <span id="tip_authentication" class="help-block hidden">请选择高级认证！</span>');
	html.push('        </div>');
	html.push('    </div>');
	html.push("</div>");
	easyDialog.open({
	  container : {
	    header : '输入公众号账号密码，并自动绑定',
	    content : html.join(""),
	    yesFn : createFn,
	    noFn : true

	  }
	});
}
function createFn(){
	
	if(!nameValidate($("#name"))){
		addError("name");
		return false;
	}
	if(!nameValidate($("#pass"))){
		addError("pass");
		return false;
	}
	
	if(!typeValidate("type")){
		addError("type");
		return false;
	}
	
	if(!typeValidate("authentication")){
		addError("authentication");
		return false;
	}
	
	var name = $('#name').val();	
	var pass = $('#pass').val();
	var type =  val=$('input:radio[name="type"]:checked').val();
	var authentication =  val=$('input:radio[name="authentication"]:checked').val();
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/ixin/addPublicname.xhtml",
		data: {"name":name,"pass":pass,"type":type,"authentication":authentication,"domain":"${tokenInfo.domain}"},
		success:function(data){
			//location = basepath+"/mgr/ixin/mytoken.xhtml";
			$("#username").html(name);
			$("#pwd").html("******");
			
			doAutoBind();	
			
		},
		error: function(data){
		}
	});
}


function doAutoBind(){
	easyDialog.open({
		  container : {
		    content : '公众账号自动绑定中...'
		  }
		  //autoClose : 2000
		});
	
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/ixin/autobind.json",
		success:function(data){
			easyDialog.close();
			if("1"==data){
				alert("绑定成功");
			}else{
				alert("绑定失败");
			}
			location = basepath+"/mgr/ixin/mytoken.xhtml";
			
		},
		error: function(data){
			easyDialog.close();
			alert("绑定失败");
		}
	});

	
	
	
}

function btnFn(){
		
	if(!nameValidate($("#AppId"))){
		addError("AppId");
		return false;
	}
	if(!nameValidate($("#AppSecret"))){
		addError("AppSecret");
		return false;
	}
	var appId = $('#AppId').val();	
	var appSecret = $('#AppSecret').val();
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/ixin/addcertificates.xhtml",
		data: {"appId":appId,"appSecret":appSecret,"domain":"${tokenInfo.domain}"},
		success:function(data){
			location = basepath+"/mgr/ixin/mytoken.xhtml";
		},
		error: function(data){
		}
	});
}
function nameValidate(obj){
	if($.trim($(obj).val()) != ""){
		removeError($(obj).attr("id"));
		return true;
	}else{
		addError($(obj).attr("id"));
		return false;
	}
}

function typeValidate(cvalue){
	var tval=$('input:radio[name="'+cvalue+'"]:checked').val();
	if(tval==null){ 
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


function getQrcodeFile(){
	
	$.getJSON(basepath+"/mgr/ixin/qrcode.json", { "wxuname": "${tokenInfo.name}" },function(result){
	    if(result && result.path){
	    	
	    	$("#qrcode").show();
		}
	  });
}
getQrcodeFile();

</script>
</body>

</html>