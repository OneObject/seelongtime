<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@page import="java.util.Random"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
 	boolean isFromWX = MwebHelper.isFromWeiXinBrowser(request);
	String label_logout = isFromWX?"解除绑定":"注销";
%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
      <link rel="stylesheet" href="${basepath }/static/css/easydialog.css">
<title>个人中心</title>
</head>

<body>
	

	<header  class="ctl_header">
		<c:if test="${param.nav ne 'none'}">
			<div class="back"><a href="${basepath}/m/h5/index.xhtml"><i class="fa fa-home"></i></a></div>
		</c:if>
		
       个人中心
    	
    
    </header>
    
    <article class="scroll ctl_cont">
    
    <section class="info">
    	<a href="${basepath}/m/h5/usercenter/detail.xhtml">
    	<ul> <!-- 加上null判断 -->
        	<li class="pic">
        		<img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>">
        	</li>
            <li class="name">${not empty user.name?user.name:user.username }  </li>
            <li class="cont1">${empty oname and not empty user.name ? user.username:oname}</li>
            <li class="cont1" style="margin-top:10px;">积分：${ajy:creditTotal(user.id) }</li>
            
        </ul>
        
        <span class="arrow"><i class="fa fa-angle-right"></i></span>
        </a>
    
    
    </section>
    
    
    <nav>
    	 <c:if test="${user.domain eq 'guoyaodaxue' }">  
    	<a class="menu"  >
	        <i class="fa  fa-database"></i><span>总积分: ${ajy:creditTotal(user.id) }</span><span class="a"></span>
	    </a>
	    </c:if>
    	<a class="menu" href="${basepath}/m/h5/study/tocomplete.xhtml">
	        <i class="fa fa-cubes"></i><span>已学课程</span><span class="a"><i class="fa fa-angle-right"></i></span>
	    </a>
        
	        <a class="menu" href="${basepath}/m/h5/exam/mytest.xhtml">
	        <i class="fa fa-pencil-square-o"></i><span>完成考试</span><span class="a"><i class="fa fa-angle-right"></i></span>
	        </a>
	    <c:if test="${user.domain ne 'ENN' && user.domain ne 'enntest'}">  
	        <a class="menu"  href="${basepath}/m/h5/usercenter/activity.xhtml?uid=${user.id}">
	        <i class="fa fa-sun-o"></i><span>参与活动</span><span class="a"><i class="fa fa-angle-right"></i></span>
	        </a>
     	</c:if>
     	<a class="menu" href="${basepath}/m/h5/usercenter/comment.xhtml">
        <i class="fa fa-comment-o"></i> <span>我的评论</span><span class="a"><i class="fa fa-angle-right"></i></span>
        </a>
<c:if test="${user.domain ne 'ENN'  && user.domain ne 'enntest'}">
     	
        <c:if test="${user.usertype eq 0 }">
	        <a class="menu" href="${basepath}/m/h5/usercenter/editpassword.xhtml">
	        <i class="fa fa-key"></i> <span>修改密码</span><span class="a"><i class="fa fa-angle-right"></i></span>
	        </a>
        </c:if>
</c:if>       
      
        <a class="menu" href="${basepath}/m/h5/feed/tofeedback.xhtml?model=0">
        <i class="fa fa-comments-o"></i> <span>意见反馈</span><span class="a"><i class="fa fa-angle-right"></i></span>
        </a>
        
        <c:if test="${user.usertype eq 0 }">
        	<a class="menu" href="javascript:logout();">
        		<i class="fa fa-external-link"></i> <span><%=label_logout%></span><span class="a"><i class="fa fa-angle-right"></i></span>
        	</a>
        </c:if>
        <!--  
        <a class="menu" href="${basepath}/m/h5/feed/tofeedback.xhtml?model=1">
        <i class="fa fa-comments-o"></i> <span>联系我们</span><span class="a"><i class="fa fa-angle-right"></i></span>
        </a>
    	-->
    
    
    </nav>
	
</article>


<footer class="footer">
    
    
    </footer>
	

 	<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
   	<script type="text/javascript" src="${basepath }/static/js/easydialog.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/myDialog.js"></script>
    <script type="text/javascript">
		function logout(){
			showMyDialog("你确定<%=label_logout%>吗？","yes");
    	}

		function handleSub(){
			window.location.href="${basepath}/m/h5/logout.xhtml";
		}	
    </script>
</body>
</html>