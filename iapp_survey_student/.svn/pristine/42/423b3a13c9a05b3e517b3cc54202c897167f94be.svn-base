<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@page import="java.io.*"%>
<%
//String domain="syngenta";
//MwebHelper.flushCurrentDomain(request, response, domain);

String domain = MwebHelper.getCurrentDomain();

String method = request.getMethod();
if("post".equalsIgnoreCase(method)){
	String userid = request.getParameter("userid");//企业号中用户id
	
	boolean authSuccess = false;
	//设置绑定成功
	if(StringUtils.isNotBlank(userid)){
		authSuccess = MwebHelper.authSuccess2Validate4QY(userid, domain);
	}
	PrintWriter pw = null;
	response.setContentType("application/json;charset=utf-8");
	try {
		pw = response.getWriter();
		pw.print("{\"rs\":");
		pw.print(authSuccess);
		pw.print("}");       
    } catch (IOException e) {

    } finally {
        if (pw != null) {
        	pw.close();
        }
    }
}else{
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","No-cache"); 
	response.setDateHeader("Expires", -1); 
	response.setHeader("Cache-Control", "No-store");
	
	String code = request.getParameter("code");
	
	// 获取userid
	String userid = MwebHelper.getOpenIdByOauthCode(code, domain);
%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    
    <link rel="stylesheet" href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css" >
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css" >
    <style type="text/css">
   	 		section.login a.loging{background:#ccc;}
			section.login a.loging i{display:inline-block;margin-left:10px;font-size:20px;}
			section.pro{padding:8px;box-sizing:border-box;width:100%;} 
			section.pro .introBox{box-sizing:border-box;border:1px solid #ccc;border-radius:2px;padding:14px 8px;font-size:14px;line-height:22px;}
 			section.pro .agreeBtn{font-size: 18px;width: 100%;height: 38px;line-height: 38px;color: #fff;display: block;text-align: center;margin: 14px 0px 18px;background: #627f26;}   
    		section.pro .disagree{font-size:12px;color:#529bea;}
    </style>  

    
    <style type="text/css">
   	 		section.login a.loging{background:#ccc;}
			section.login a.loging i{display:inline-block;margin-left:10px;font-size:20px;}   
    </style>
<title>保密协议</title>
<script type="text/javascript">
var basepath='${basepath}';
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	WeixinJSBridge.call('hideToolbar');
});
//去掉右上角选项
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	WeixinJSBridge.call('hideOptionMenu');
});
</script>
<%-- 页面风格设置 --%>
<%@ include file="/WEB-INF/include/m_h5_setting.jsp"%>
</head>

<body>
	<div id="promise" >
		<header>保密协议</header>
        <article class="scroll">
        	 <section class="pro">
				<div class="introBox">
					此平台仅限先正达员工内部使用，其内容应予以保密。如果您不是或者不再是先正达员工，请退出登录、删除此公众帐号或软件，但仍需对您从该平台上了解的信息保密。对于泄密给先正达造成损失的，先正达保留追究法律责任的权利。此平台上的所有信息包括文字、图片、影音视频等均限于先正达公司内部交流，未经公司内部授权审批，任何人不得将此平台上的内容外传。信息泄漏造成的损失和法律责任将由泄漏人承担。请确认知悉上述内容并承诺遵守此保密协议。
				</div>
				<div class="agreeBtn" onclick="comfirm();">同意</div>
				<div class="disagree">不同意请关闭当前页</div>
				</section>
        </article>
	</div>	
	
	<div id="login" style="display: none;">
		<header>
	        保密协议
	    </header>
	    
	    <article class="scroll">
	    	<section class="pro">
				<div class="introBox">您已经同意保密协议，请点击左上角按钮退出当前页面.
	    		</div>
	    	</section>
	    </article>
	</div>
     
<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
<script type="text/javascript">

$(function (){
	
});

function comfirm(){
	$.ajax({
		type:"POST",
		url:basepath+"/m/h5/custom/qy_syngenta_2validate.json",
		data:{"userid":"<%=StringUtils.trimToEmpty(userid)%>"},
		success:function(data){
			if(data && data.rs==true){
				$("#promise").hide();
				$("#login").show();
			}else{
				alert('服务端请求失败.');
			}
		},error:function(data){
			
		}
	});
	
}
</script>
</body>
</html>
<%
}
%>
