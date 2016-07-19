<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
<title>编辑资料</title>
</head>

<body>
	
 
	<header class="ctl_header">
      <div class="back"><a href="${basepath}/m/h5/usercenter/detail.xhtml"><i class="fa fa-angle-left"></i></a></div>
       	编辑资料
	 <%--<div class="home"><a class="txt"  onclick="save()">保存</a></div>--%>

</header>
    <article class="scroll ctl_cont" >

    <section class="infoEdit">
	<form id="editform">
            <ul>
				<li>
				头像<span>
						<img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>">
				</span>
				</li>
               	<li>账号<span>${user.username} </span></li>
                <li>邮箱<span><input type="text" value="${user.usertype==0?user.email:user.temporary_email }" name="email" id="email" onblur="verifyemail()"  onfocus="foucsing(this)"/></span></li>
                <li>手机<span><input type="tel" value="${user.usertype==0?user.mobile:user.temporary_mobile }" name="mobile" id="mobile" onblur="verifymobile()" onfocus="foucsing(this)"/></span></li>
            </ul>
			<input type="hidden" id="mobile_flag" value="0">
			<input type="hidden" id="email_flag" value="0">
            <ul>
				<li>真实姓名<span><input type="text" value="${user.name}"  name="name" id="name" onfocus="foucsing(this)" /></span></li>
                <li>昵称<span><input type="text" value="${user.nickname}" name="nickname"  id="nickname" onfocus="foucsing(this)" /></span></li>
                <li class="gender">性别<span>
                <c:if test="${user.gender==1 }"><input type="radio" id="men" name="gender" checked value="1" /><label for="men">男</label></c:if>
               	<c:if test="${user.gender!=1 }"><input type="radio" id="men" name="gender" value="1" /><label for="men">男</label></c:if>
               	<c:if test="${user.gender==2 }"><input type="radio" id="women" name="gender"  checked value="2" /><label for="women">女</label></c:if>
               	<c:if test="${user.gender!=2 }"><input type="radio" id="women" name="gender"  value="2" /><label for="women">女</label></c:if>
             	<c:if test="${user.gender==3 }"><input type="radio" id="secret" name="gender"  checked value="3" /><label for="secret">保密</label></c:if>
             	<c:if test="${user.gender!=3 }"><input type="radio" id="secret" name="gender"  value="3" /><label for="secret">保密</label></c:if>
                </span>
                </li>
                <li>部门名称<span>${oname}</span></li>
                <%-- <li>工作电话<span><input type="text" value="${user.phone}" name="phone" id="phone" onfocus="foucsing(this)" /></span></li> --%>
            </ul>
        
	</form>
			<div class="editSub" style="margin-top:20px;font-size:16px;border:1px solid;text-align:center;height:38px;box-sizing:border-box;line-height:36px;">
			 <a onclick="save()" style="display: block;"> 保存</a>
			</div>
    </section>
    
    </article>
    
    
    <footer class="footer">
    </footer>
 	<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
    <script type="text/javascript">
    //href="${basepath}/m/h5/usercenter/save.json"
	function save(){
			var email = $.trim($("#email").val());
			var mobile = $.trim($("#mobile").val());
			var name = $.trim($("#name").val());
			var nickname = $.trim($("#nickname").val());
			var gender = $("input[name='gender']:checked").val();
			var phone = $.trim($("#phone").val());
			//var nitinfo = $.trim($("#unitinfo").val());
			//alert($("#email").css("color")=='rgb(255, 0, 0)');
			if($("#email_flag").val()=='1')
				{
					showMyTishi('邮箱已被占用','white','black','168');
					return;
				}
			if($("#mobile_flag").val()=='1')
			{
				showMyTishi('手机号已被占用','white','black','168');
				return;
			}

			
			if(name==''||!checkName(name)){
					$("#name").css("color","red");
					showMyTishi('请输入正确格式的真实姓名','white','black','168');
					return;
				}
			if(!checkName(nickname)){
				$("#nickname").css("color","red");
				showMyTishi('请输入正确格式的昵称','white','black','168');
				return;
			}
			if(email !='' && !checkEmail(email)){
				$("#email").css("color","red");
				showMyTishi('请输入正确的邮箱','white','black','168');
				return;
			}
			if(mobile !='' && !checkMobile(mobile)){
				$("#mobile").css("color","red");
				showMyTishi('请输入正确的手机号','white','black','168');
				return;
			}
			if(phone!=''&&!checkMobile(phone)&&!checkTelPhone(phone)){
				$("#phone").css("color","red");
				showMyTishi('请输入正确的电话','white','black','168');
				return;
			}
			if(true){
					$.ajax({
		                cache: true,
		                type: "POST",
		                url:"${basepath}/m/h5/usercenter/save.json",
		                data:$('#editform').serialize(),
		                async: true,
		                error: function(data) {
		                	showTishi('保存失败，请稍后执行...');
		                },
		                success: function(data) {
		                    location.href="${basepath}/m/h5/usercenter/index.xhtml";
		                }
		            });
				}
		}
//验证邮箱
	function verifyemail()
	{
		var email = $.trim($("#email").val());
		if(email==''){
		//	showMyTishi('邮箱不可为空','white','black','168');
			return;
			}
		$.ajax({
            cache: true,
            type: "POST",
            url:"${basepath}/m/h5/usercenter/verifyemail.json",
            data:{"email":email},
            async: true,
            error: function(data) {
            	showMyTishi('邮箱已被占用','white','black','168');
            	$("#email").val('1');
            },
            success: function(data) {
                if(data){
                	$("#email").css("color","#53575e");
                	$("#email_flag").val('0');
                }else{
                	showMyTishi('邮箱已被占用','white','black','168');
                	$("#email").css("color","red");
                	$("#email_flag").val('1');
                     }
            }
        });
	}
	//验证手机 
	function verifymobile()
	{
		var mobile = $.trim($("#mobile").val());
		if(mobile==''){
	//		showMyTishi('手机号不可为空','white','black','168');
			return;
			}
		$.ajax({
            cache: true,
            type: "POST",
            url:"${basepath}/m/h5/usercenter/verifymobile.json",
            data:{"mobile":mobile},
            async: true,
            error: function(data) {
            	showMyTishi('手机号已被占用','white','black','168');
            	$("#mobile_flag").val('1');
            },
            success: function(data) {
                if(data){
                	$("#mobile").css("color","#53575e");
                	$("#mobile_flag").val('0');
                }else{
                	showMyTishi('手机号已被占用','white','black','168');
                	$("#mobile").css("color","red");
                	$("#mobile_flag").val('1');
                	
                     }
            }
        });
	}
	//正在输入 
	function foucsing(_this)
	{
		$(_this).css("color","#53575e");
	}
    </script>

    <SCRIPT type="text/javascript">
	    function checkName(name) {   
	    	var size = getBytesCount(name);
	    	if(size<250)
		    	{
		    		return true;
		    	}
	    	return false;
	    }
	    //邮箱验证
	    function checkEmail(email){
			var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
			if(pattern.test(email)){
				return true;
			}else{ 
				return false;
		  	}
		}
	    //验证电话号码
	    function checkTelPhone(telphone)        
	    {       
	       if(telphone.search(/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/) != -1){   
	       redflag=0;
	       return true;
	       }
	       else{   
	       return false;
	       }
	    }
    //验证手机号码
	   function checkMobile(mobile){
			var pattern = /^[1][3-8]\d{9}/;
			if(pattern.test(mobile)){
				return true;
			}else{ 
				return false;
		  	}
		}

	   function getBytesCount(str)
	   {
	     var bytesCount = 0;
	     if (str != null)
	     {
	       for (var i = 0; i < str.length; i++)
	       {
	         var c = str.charAt(i);
	             if (c.match(/[^\x00-\xff]/ig) != null) //全角
	              {
	                 bytesCount += 2;
	              }
	             else
	              {
	                 bytesCount += 1;
	              }
	       }
	     }
	     return bytesCount;
	   }
</SCRIPT>
</body>
</html>
