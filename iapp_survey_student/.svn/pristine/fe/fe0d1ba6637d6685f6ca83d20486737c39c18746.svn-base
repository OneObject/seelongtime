<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
		<title>结果列表</title>
		<style type="text/css">
            *{
                margin:0;padding:0;border:0;
            }
            ul,ol,dl{
                list-style: none;
            }
            input::-webkit-search-cancel-button {
                display: none;
            }
            a,button,input,textarea,span,img,li,div{
                -webkit-tap-highlight-color:rgba(255,0,0,0);
            }
			article,section,dl,dt,dd,span,a,div{
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            .test-result-history{
                width:100%;
            }
            .test-result-history dt{
                background: #f3f3f3;
                height:60px;
                line-height:30px;
                font-size:20px;
                color:#444;
                padding:15px 15px;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                border-bottom: 1px solid #d9d9d9;
                font-weight: bold;
            }
            .test-result-history dd{
                color:#666;
                height:72px;
                line-height:72px;
                border-bottom: 1px solid #d9d9d9;
            }
            .test-result-history .time-info{
                padding:0 200px 0 15px;
                color:#808080;
                font-size:16px;
            }
            .test-result-history .state-info{
                width:200px;
                float:right;
                padding:0 10px;
                text-align: left;
                font-size:18px;
                color:#808080;
                font-weight: bold;
            }
            .state-info span{
                display: inline-block;
                width:80px;
                height:36px;
                text-align: center;
                line-height: 36px;
                border:1px solid transparent;
                border-radius: 4px;
                float:left;
                margin-top:18px;
            }
            .state-info span.pass{
                border:1px solid #8dd786;
                color:#8dd786;
            }
            .state-info span.failed{
                border:1px solid #ff8c8c;
                color:#ff8c8c;
            }
            .state-info a{
                color:#529bea;
                text-decoration: none;
                display: inline-block;
                width:80px;
                text-align: center;
                height:72px;
                float:left;
                line-height: 72px;
                margin-left:16px;
            }
            body{background: #fff;}
		</style>
	</head>
	<body>
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
     	<span class="addWrap" id="ptitle">结果列表</span>
	</header>
        <article class="test-result-history ctl_cont">
            <dl>
            	<dt>${exam.examName }</dt>
            	<c:if test="${empty list }">
            	<dd style="border-bottom:none;">
            	<section class="noData">
			        <img src="${basepath }/static/img/noData.png" />
			    </section>
			    </dd>
			    </c:if>
            	<c:forEach var="item" items="${list }">
                <dd>
                <c:choose>
                <c:when test="${item.status eq 2 }">
                    <div class="state-info">
                        <span>阅卷中</span>
                    </div>
                    <div class="time-info">${ltfun:dataLongToSNS(item.start_time,'MM-dd
				HH:mm') }</div>
                </c:when>
                <c:otherwise >
                    <div class="state-info">
                        <span class="${item.status eq 0?'failed':'pass' }"><fmt:formatNumber value="${item.score}"  type="number"/></span>
                         
                        <a href="${basepath}/m/h5/exam/detailtotesteepaper.xhtml?tid=${exam.id}&uid=${uid }&id=${item._id}">查看</a>
                         
                         
                    </div>
                    <div class="time-info">${ltfun:dataLongToSNS(item.start_time,'MM-dd
				HH:mm') }</div>
                </c:otherwise>
                </c:choose>
                </dd>
            	</c:forEach>
            </dl>
        </article>
	</body>
</html>

