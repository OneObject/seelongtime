<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="java.util.List"%>
<%@page import="com.google.common.collect.Lists"%>
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
    </style>
    
     <%
                response.setHeader("Pragma","No-cache");
                response.setHeader("Cache-Control","No-cache");
                response.setDateHeader("Expires", -1);
                response.setHeader("Cache-Control", "No-store");

                
                String[] tempids= new String[]{"0c6fc87ee07c4df1ba170092982d202e","13bf5172894c41528c9235c57e53d869","24f4cfdd42954b5289b5b57256bf1591","26441a35e9c2460bbd9fc42ce8bd38d0","4247237ad6db49e2ae2845b099bc7d11","444281a258dd4a16bdd3f2c5bd9ad035","510e7fbd7c0f4284bc0a9bedc6ed2e04","55654c6b8ab44b57982ea4808015d432","56fcdd8d75f4479582631b1f85b09e7a","59f77883b8a3441d9518226e204ad5f1",
                		"641700f198814fc1b7b27654b6d9135b","9e2195ad652c452e8d1eb3f2defc22f7","b7763d8a9e214be5b9079bde7bc8c09d",
                		"bbc263a4abde454cbbd6459d1a4c6c37","bc13107d4ba24aad91fdb7f24cf20c8a","cc9fce53873a4a38ab476853b505ca11","cfa46f6ae5a642119a1f17417d8c7f8e","d2a3983fa77e4e8e80028bed23fb3263","d9cd3bfa6cdb46ffbc2c14cfca4440ef"};
                
                List<String> tempIds = Lists.newArrayList(tempids);
                String uid = MwebHelper.getCurrentUid();
                if(StringUtils.isNotBlank(uid) && !MwebHelper.DEFAULT_UID.equals(uid)   && !uid.startsWith("l_") && !tempIds.contains(uid)){
                        request.getRequestDispatcher("/m/h5/index.xhtml").forward(request, response);
                }
        %>
        
        
<title>用户绑定</title>
<script type="text/javascript">
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
	<c:if test="${domain eq 'SMG' }">
		<c:redirect url="${basepath}/m/register.xhtml?domain=${domain}&callback=${callback}&openid=${openid}&d_openid=${d_openid}"></c:redirect>
	</c:if>
	<header>
        用户绑定
    </header>
    
    <article class="scroll">
    <form method="post" action="${basepath}/m/h5/login.xhtml" id="loginForm" method="post">
    <section class="login">
    
<c:choose>
	<c:when test="${domain eq 'ENN'  || domain eq 'enntest'}">
		<input type="hidden"  name="custom"   value="username"/>
		<input type="hidden"  name="custom" value="name"/>
	    <div><input type="text" placeholder="姓名"  class="require"  name="c_name" /></div>
	    <div><input type="text" placeholder="员工编号" class="require"  name="c_username" /></div>	
	</c:when>
	<c:when test="${domain eq 'fosun'}">
		<input type="hidden"  name="custom"   value="email"/>
		<input type="hidden"  name="custom" value="name"/>
	    <div><input type="text" placeholder="姓名"  class="require"  name="c_name" /></div>
	    <div><input type="text" placeholder="公司邮箱" class="require"  name="c_email" /></div>	
	</c:when>
	<c:otherwise>
		<div><input type="text" placeholder="账号"  class="require" id='username'  name="username" value="${loginForm.username }"/></div>
        <div><input type="password" placeholder="密码" class="require" id='password'  name="password" /></div>
	</c:otherwise>
</c:choose>    
        
         <p class="error" id="nullinputerror">请输入信息</p>
   		 <c:if test="${not empty loginForm and loginForm.code !='success'}">
	                    <c:choose>
	                	<c:when test="${loginForm.code=='empty'}"><p class="error" style="display: block;">请输入信息</p></c:when>
	                	<c:when test="${loginForm.code=='pwdfial'}"><p class="error" style="display: block;">账号或密码错误</p></c:when>
	                	<c:when test="${loginForm.code=='disable'}"><p class="error" style="display: block;">账号被禁用</p></c:when>
	                	<c:when test="${loginForm.code=='expire'}"><p class="error" style="display: block;">账号已过期</p></c:when>
	                	<c:when test="${loginForm.code=='ineffective'}"><p class="error" style="display: block;">账号未生效</p></c:when>
	                	<c:when test="${loginForm.code=='already_bind'}"><p class="error" style="display: block;">账号已被绑定</p></c:when>
	                	<c:when test="${loginForm.code=='fail'}"><p class="error" style="display: block;">信息输入错误</p></c:when>
	                	</c:choose>
         </c:if>
   		 <a href="#" class="log"  onclick="submitf()">绑定</a>
   		   		<c:if test="${not empty tenantConfig && tenantConfig.openregister==true}">
   		   		<a  id="login_register" style="display: inline-block;background:none;font-size:14px;height:20px;line-height:20px;width:70px;text-align:left;margin-top:30px;"  href="${basepath}/m/register.xhtml?domain=${tenantConfig.id}&openid=${openid}">注册帐号</a>
                </c:if>
                
                <c:if test="${domain eq 'syngenta'}">
                	<a  id="login_register" style="display: inline-block;background:none;font-size:14px;height:20px;line-height:20px;width:70px;text-align:left;margin-top:30px;"  href="${basepath}/m/h5/findpwd.xhtml">忘记密码</a>
               	</c:if>
                 <br />
                <c:if test="${not empty tenantConfig && tenantConfig.login_prompt ne null}">
                  <span style="color:#999;font-size: 14px;display:block;margin-top:32px;line-height:22px;">${tenantConfig.login_prompt }</span>
                </c:if>
                &nbsp;
	            &nbsp;
                 <input type="hidden" name="domain" value="${domain}"/>
                 <input type="hidden" name="openid" value="${openid}"/>
                 <input type="hidden" name="d_openid" value="${d_openid}"/>
                 <input type="hidden" name="callback" value="${callback}"/>
                 <input type="hidden" name="action" value="bind"/>
    </section>
    </form>
    </article>
 	<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
    <script type="text/javascript">
	  //正在绑定
		function loging(){
			$("a.log").text("正在绑定").append('<i class="fa fa-spinner fa-spin"></i>').addClass("loging");
	
			}
			
		//显示绑定
		function login(){
			$("a.log").replaceWith('<a href="#" class="log" onClick="submitf();">绑定</a>');
	
			}
    
        function submitf(){
        	 loging();
        	 $(".error").hide();
        	 $("#nullinputerror").hide();
        	 
        	 var inputItem = $(".require");
        	 
        	 var isEmpty = false;
        	 $(".require").each(function(){
        		 	if($(this).val()==""){
        		 		isEmpty = true;
        		 	}
        	  });
        	 
            if(isEmpty){
            	 login();
                 $("#nullinputerror").show();
            }else{
                /*提交操作*/
                $("#loginForm").submit();
            }
        }
</script>
</body>
</html>
