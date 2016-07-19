<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <title>考试详情</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="${basepath}/static/m/new.css">
        <link rel="stylesheet" type="text/css" href="${basepath }/static/m/weixin-client-page1a1cdb.css">
        <style>
            #nickname {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                max-width: 90%;
            }
            ol, ul {
                list-style-position: inside;
            }
        </style>
        <style>
            #activity-detail .page-content .text {
                font-size: 16px;
            }
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
        
        <script type="text/javascript">
		    function takeExam(tid){
		    	var uid = $("#uid").val();
				var url = "${basepath}/m/exam/takeexam.xhtml?tid="+tid+"&uid="+uid;
				//var adminRoot = $("#adminRoot").val();
				//var url = adminRoot+"/student/itest/examination/m/takeexam.xhtml?tid="+tid+"&uid="+uid;
				//alert(url);
				 window.top.location.href=url;
				//toViewShell(url);
				//window.location.href = basepath +"/m/h5/viewshell.xhtml?url="+encodeURI(url);
				//window.open(adminRoot+"/student/itest/examination/m/takeexam.xhtml?tid="+tid+"&uid="+uid);
			}

			function toRank(){
				var tid = $("#tid").val();
				var uid = $("#uid").val();
				//var adminRoot = $("#adminRoot").val();
				//window.location.href=adminRoot+"/student/itest/examination/m/rank.xhtml?tid="+tid+"&uid="+uid;
				var url = "${basepath}/m/exam/rank.xhtml?tid="+tid+"&uid="+uid;
				window.location.href = url;
				//toViewShell(url);
			}
    	</script>
    	<%-- 页面风格设置 --%>
<%@ include file="/WEB-INF/include/m_h5_setting.jsp"%>
    </head>
    <body id="activity-detail">
    	<header class="bootStrapHeader ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);" class="app_back"><i class="fa fa-angle-left"></i></a></div>
     <span style="height:38px;width:70%;white-space:nowrap;text-overflow:ellipsis;display:inline-block;line-height:38px;overflow:hidden;" id="ptitle">考试详情</span>
	</header>
	    <input type="hidden" value="<%=Constant.ADMIN_ROOT %>" id="adminRoot"/>
	    <input type="hidden" value="${uid }" id="uid"/>
        <div class="page-bizinfo ctl_cont">
            <div class="header">
                <h1 id="activity-name">${exam.examName }</h1>
                <p class="activity-info">
                    <span id="post-date" class="activity-meta no-extra">${ltfun:dateLongToStringFormat(exam.startTime,'yyyy-MM-dd HH:mm') }</span>
                </p>
            </div>
        </div>
        <div class="page-content">
            
            <div class="media" id="media">
               <c:if test="${ empty exam.cover}">
                <img src="${basepath }/static/m/img/xhy.png" style="width:100%;">
                </c:if>
                <c:if test="${not empty exam.cover}">
                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${exam.cover}-320x180" style="width:100%;">
                </c:if>
            </div>
            <input type="hidden" id="tid" value="${exam.id}">
            <div class="text">
            	<p>&nbsp;&nbsp;</p>
            	<p>
            		<div class="time_start">
            			<div class="start">
            					<c:choose>
            						<c:when test="${exam.examTimes eq 0 || exam.examTimes gt exam.test_times }">
            							<span class="btnGreen" onclick="takeExam('${exam.id}')">
            								开始答题
            							</span>
            							<a href="javascript:toRank();" style="margin-top:20px;display:block;height:24px;line-height:24px;text-align: right;">查看排行榜</a>
            						</c:when>
            						<c:otherwise>
            							<div class="alert alert-warning">您已经达到了答题限制次数</div>
            						</c:otherwise>
            					</c:choose>
            			</div>
            		</div>
            	</p>
            	<p>&nbsp;</p>
            	<p>
            	规则说明：
            	</p>
            	<p>
            	1、答题时请保持安静；
            	</p>
            	<p>
            	2、答题完毕请根据答题完提示进行下一步操作。
				</p>
				<p>
				3、练习结束后，系统将自动给出成绩。
				</p>
            </div>
        </div>
    </body>
</html>
<content tag="extra_js">
</content> 
