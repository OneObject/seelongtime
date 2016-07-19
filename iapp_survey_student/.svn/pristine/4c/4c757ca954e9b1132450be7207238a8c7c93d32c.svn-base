<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    
<title>个人资料</title>
</head>

<body>
	

	<header class="ctl_header">
      <div class="back"><a href="${basepath}/m/h5/usercenter/index.xhtml"><i class="fa fa-angle-left"></i></a></div>
       	个人资料
	<%--<div class="home"><a href="${basepath}/m/h5/usercenter/edit.xhtml"><i class="fa fa-pencil"></i></a></div> --%> 

</header>
    <article class="scroll ctl_cont" >

    <section class="infoMore">

            <ul>
				<li>
					头像<span>
					<a href="${basepath}/m/h5/usercenter/uploadavatar.xhtml">
						<img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>">
					</a>
				</span>
				</li>
                <li>账号<span>${user.username} </span></li>
                <li>邮箱<span>${user.usertype==0?user.email:user.temporary_email } </span></li>
                <li>手机<span>${user.usertype==0?user.mobile:user.temporary_mobile } </span></li>
            </ul>
			
            
            <ul>
				<li>真实姓名<span>${user.name}</span></li>
                <li>昵称<span>${user.nickname}</span></li>
                <li>性别<span>
               	<c:if test="${user.gender==1 }">男</c:if>
               	<c:if test="${user.gender==2 }">女</c:if>
             	<c:if test="${user.gender==3 }">保密</c:if>
                </span></li>
                <li>部门名称<span>${oname}</span></li>
                <%-- <li>工作电话<span>${user.phone}</span></li> --%>
            </ul>

        <c:if test="${user.domain ne 'langham'}">
			<div class="editSub" style="margin-top:20px;font-size:16px;border:1px solid;text-align:center;height:38px;box-sizing:border-box;line-height:36px;">
			 <a href="${basepath}/m/h5/usercenter/edit.xhtml" style="display: block;"> <i class="fa fa-pencil">&nbsp;&nbsp;修改</i></a>
			</div>
        </c:if>

    </section>

    
    
    
    
    </article>
    
    
    <footer class="footer">
    
    
    </footer>
	


 	<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
</body>
</html>
