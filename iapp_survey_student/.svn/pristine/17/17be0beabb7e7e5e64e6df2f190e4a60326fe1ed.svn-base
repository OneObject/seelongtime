<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html>
<head>
    <title>考试排行榜</title>
 	<link rel="stylesheet" href="${basepath }/static/m/new.css">
 	<style>
    header{width:100%;height:38px;line-height:38px;padding:6px 0px;text-align:center;font-size:16px;color:#fff;position:fixed;z-index:5;top:0px;left:0px;}
    .home{width:44px;height:38px;text-align:center;line-height:38px;position:absolute;right:0px;top:9px;}
    .home i{font-size:24px;width:44px;height:38px;line-height:38px;display:block;}
    .home a{color:#fff;}
    .home a.txt{font-size:12px;}
    .back{width:44px;height:38px;line-height:38px;position:absolute;left:0px;top:9px;}
    .back i{font-size:24px;}
    .back a{color:#fff;width:44px;height:38px;line-height:38px;display:block;}
    .bootStrapHeader{height:50px;}
 	</style>
 	    	<%-- 页面风格设置 --%>
<%@ include file="/WEB-INF/include/m_h5_setting.jsp"%>
</head>
<body>
<div class="ranklist">

    <header class="ctl_header bootStrapHeader" >
    	<div class="back"><a class="app_back" href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
     	<span style="height:38px;width:70%;white-space:nowrap;text-overflow:ellipsis;display:inline-block;line-height:38px;overflow:hidden;" id="ptitle">排行榜</span>
	</header>
       
    <img src="${basepath }/static/img/top.png" class="img-responsive ctl_cont"style="width:100%;" >
    <span class="rank-name-bg">
     </span>
     <span class="rank-name-font">
          	考试排行榜
     </span>
    <section>
     <ul>
		<c:forEach items="${testee }" var="item" varStatus="vs">
				<li>
                <div class="userinfo">
                    <div class="img-num">
                        <img src="http://www.aijiayou.com:80/student/user/avatar/${item.uid }.xhtml?style=80x80&color=blue">
                        <span class="label label-info">
                        NO.${vs.index+1 }
                        </span>
                    </div>
                    <div class="rankinfo">
                
                        <span class="username">姓名：${item.name}</span>
                 
                        <span class="userscore">得分：${item.score}</span>
                    </div>
                </div>
            </li>					        
        
        </c:forEach>
        <li>
             <c:choose>
             <c:when test="${not empty test.uid}">
        	<div class="rankinfo"> 
                	<span class="username">我的排名:NO.${num+1}</span>
             </div>
                </c:when>
                <c:otherwise>
        	<div class="userinfo">
                   <span class="userscore">我的排名:你还未参加考试</span>
                </div>
                </c:otherwise>
                </c:choose>
        </li>
        </ul>
    </section>
</div>
</body>
</html>
<%@include file="/WEB-INF/include/wx.jsp"%>
<%@include file="/WEB-INF/include/analysis.jsp"%>