<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
    response.setHeader("Pragma","No-cache");
    response.setHeader("Cache-Control","No-cache");
    response.setDateHeader("Expires", -1);
    response.setHeader("Cache-Control", "No-store");

boolean isTeacher = MwebHelper.isCoach(request);
pageContext.setAttribute("isTeacher", isTeacher);
boolean isSuper = MwebHelper.isSuperMan(request);
pageContext.setAttribute("isSuper", isSuper);
%>
<!DOCTYPE html>
<html>
	<head>
		<title>首页</title>
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/swiper.css" />
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/about-me.css?v=20151027" />
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/mobiscroll.custom-2.15.1.min.css" />
		<style type="text/css">
			body{
				background: #eee;
			}
		</style>
		<script type="text/javascript">
		<!--android回退按钮事件-->
		window.apiready = function(){
			
			  var backSecond = 0;
		      api.addEventListener({name: 'keyback'}, function(ret, err){
		         var curSecond = (new Date).getSeconds();
		         if(Math.abs(curSecond - backSecond) > 3){
		             backSecond = curSecond;
		            //alert("next click will exit!");
		         }else{
		             api.closeWidget();  //exit
		         }
		    });
		}
		</script>
	</head>
	<body class="bg-color-gray">
	
	<div class="wrapper-box" id="wrapper-box-6" style="display:none;">
        <div id="replace-box-6">
            <section class="wrapper-static ">
                <div class="new-student-box">
                    <span class="btn-back" id="ring" style="display:none;" >
                        <i class="fa fa-angle-left"></i>
                    </span>
                    
                    
                    <div class="student-box-header">
                        <div class="man" onclick="tousercenter();">
                              <img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray&v=<%=System.currentTimeMillis() %>" />
                              <span id="level">${userCreditLevelInfo.creditLevel.name}</span>
                        </div>
                        <ul>
                            <li>
                                <span class="list-intro">身份</span>
                                <div class="items-box">
                                    <div class="item">
                                        <div class="item-wrapper">
                                           	<c:if test="${user.category==1}">
												<span class="icon-zdr"></span>
                                                <label>指导人</label>
											</c:if>
										     <c:if test="${user.category==0}">
												<span class="icon-xy"></span>
                                                <label>学员</label>
											</c:if>
										     <c:if test="${user.category==3}">
												<span class="icon-dr"></span>
                                                <label>达人</label>
											</c:if>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="item-wrapper">
                                        	<c:if test="${user.authority==1}">
	                                            <span class="icon-rz"></span>
	                                            <label>认证</label>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                    <span class="list-intro">成就</span>
                                    <div class="items-box">
                                        <div class="items-wrapper-box">
                                            <div class="items-wrapper" id="items-wrapper-index">
                                                <div class="item">
                                                    <div class="item-wrapper">
                                                      <!--  <span class="icon-jldr"></span>
                                                        <label >记录达人</label> -->
                                                    </div>
                                                </div>
                                             
                                               
                                            </div>
                                        </div>
                                    </div>
                                    <label class="arrow" id="transiton-arrow-index" data-target="items-wrapper-index"  data-status="close" onclick="elementTransition(this);" style="display:none">
                                        <i class="fa fa-angle-right"></i>
                                    </label>
                                </li>
                        </ul>
                    </div>
                    <div class="student-box-footer">
                        <div class="man-name">
                            <span>${user.name}</span>
                            <label>${not empty org.name?org.name:"" }</label>
                        </div>
                        <div class="line-info">
                            <ul>
                                <li>${adopt}%</li>
								<li>采纳率</li>
                            </ul>
                            <ul>
                                <li>
                                <c:if test="${user.category eq 0 }">
                                ${userCreditLevelInfo.experience}
                                </c:if>
                                <c:if test="${user.category ne 0  }">
                                ${userCreditLevelInfo.credit}
                                </c:if>
                                </li>
								<li>${user.category==0 ?"经验值":"财富值"}</li>
                            </ul>
                            <ul>
                                <li>${ranktop }</li>
                                <li>排名</li>
                            </ul>
                        </div>
                    </div>
                    <div class="student-box-lv">
                        <div class="lv-name">
                            <span>等级：${userCreditLevelInfo.creditLevel.code }</span>
                        </div>
                        <div class="lv-intro">
                            <span class="lv-percent" style="width:${userCreditLevelInfo.percent }%;">${userCreditLevelInfo.percent }%</span>
                        </div>
                    </div>

                    </div>


                <c:choose>
                    <c:when test="${surveyflag}" >
                        <div class="student-func-line" onclick="javascript:window.location.href='${basepath}/m/ext/enn/coach/surveyresult.xhtml?coachid=${coachid}&isStudent=true'">
                            <div class="student-tip" >
                                <span class="message"></span>
                                <label>对指导人的评估（匿名）开始了，赶快去填写吧！</label>
                                <a href="#" class="dot">
                                </a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                    <div class="student-func-line" style="display:none;" onclick="tomessage();">
                        <div class="student-tip" >
                            <span class="message"></span>
                            <label id="indexMessageFmodel"></label>
                            <a href="#" class="dot">
                                <span>

                                    更多
                                    <i></i>
                                </span>
                            </a>
                        </div>
                    </div>
                    </c:otherwise>
                </c:choose>
                
                    <div class="useapp-box" style="margin:0 auto;">
                        <ul>
                            <li>
                                <a href="javascript:indexForColumn('other');">
                                    <em><img src="${basepath}/static/m/ext/enn/img/icon_1.png" alt=""></em>
                                    <span>专业交流</span>
                                </a>
                            </li>
                            <li>
                                <a href="${basepath}/m/ext/enn/coach/course.xhtml?uid=${user.id }">
                                    <em><img src="${basepath}/static/m/ext/enn/img/icon_2.png" alt=""></em>
                                    <span>微课</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:onclicktoCoach();">
                                    <em><img src="${basepath}/static/m/ext/enn/img/icon_3.png" alt=""></em>
                                    <span>辅导</span>
                                </a>
                            </li>
                            <li>
                                <a href="${basepath}/m/ext/enn/task/center.xhtml">
                                    <em>
                                        <b><img src="${basepath}/static/m/ext/enn/img/icon_4.png" alt="" />
                                        <i id="notice_task_index" style="display:none;"></i></b>
                                    </em>
                                    <span>我的任务</span>
                                </a>
                            </li>
                            <li>
                                <a href="${basepath}/m/ext/enn/rank/index.xhtml">
                                    <em><img src="${basepath}/static/m/ext/enn/img/icon_5.png" alt=""></em>
                                    <span>排行榜</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:indexForColumn('talk');">
                                    <em><img src="${basepath}/static/m/ext/enn/img/icon_6.png" alt=""></em>
                                    <span>谈天说地</span>
                                </a>
                            </li>

                            <c:if test="${true && user.category eq 0 &&  not (classid lt 9) }">
                            <li>
                                <a href="http://peixun.enn.cn/android/app/ext/icoach/index.do?uid=${user.username}&uname=${uNameUrlEncode}&timestamp=${timestamp}&sign=${sign}&phone=${user.mobile}&type=COURSE&classid=${classid}">
                                    <em><img src="${basepath}/static/m/ext/enn/img/COURSE.png" alt=""></em>
                                    <span>课程评估</span>
                                </a>
                            </li>
                            <li>
                                <a href="http://peixun.enn.cn/android/app/ext/icoach/index.do?uid=${user.username}&uname=${uNameUrlEncode}&timestamp=${timestamp}&sign=${sign}&phone=${user.mobile}&type=EXAM&classid=${classid}">
                                    <em><img src="${basepath}/static/m/ext/enn/img/EXAM.png" alt=""></em>
                                    <span>考试</span>
                                </a>
                            </li>
                            </c:if>
                            <c:forEach items="${list }" var="item" >
                            <c:if test="${item.appcode eq '8' }">
                            <li>
                                <a href="${basepath}/m/ext/enn/sns/address.xhtml">
                                    <em><img src="${basepath}/static/m/ext/enn/img/icon_${item.appcode }.png" alt=""></em>
                                    <span>我的好友</span>
                                </a>
                            </li>
                            </c:if>
                            </c:forEach><c:forEach items="${list }" var="item" >
                            <c:if test="${item.appcode eq '9' }">
                            <li>
                                <a href="${basepath}/m/ext/enn/sns/mygroup.xhtml">
                                
                                    <em><img src="${basepath}/static/m/ext/enn/img/icon_${item.appcode }.png" alt=""></em>
                                    <span>我的群组</span>
                                </a>
                            </li>
                            </c:if>
                            </c:forEach><c:forEach items="${list }" var="item" >
                            <c:if test="${item.appcode eq '10' }">
                            <li>
                                <a href="${basepath}/m/ext/enn/user/invitesuper.xhtml">
                                
                                    <em><img src="${basepath}/static/m/ext/enn/img/icon_${item.appcode }.png" alt=""></em>
                                    <span>邀请专业达人</span>
                                </a>
                            </li>
                            </c:if>
                            </c:forEach>
                            
                        </ul>
                        <div class="add-useapp">
                            <ul>
                                <li>
                                    <a href="${basepath}/m/ext/enn/column/addindexapp.xhtml">
                                        <em><img src="${basepath}/static/m/ext/enn/img/icon_7.png" alt=""></em>
                                        <span>添加应用</span>
                                    </a>
                                </li>
                            </ul>
                            <div style="clear:both;"></div>
                        </div>
                        <div style="text-align:center;color:#999;font-size:16px">新奥大学荣誉出品</div>
                    </div>
                </section>
            </div>
        </div>
	
        <div class="wrapper-box" id="wrapper-box-1"  style="display: none;">
            <header>
            
            <span class="btn btn-left" onclick="backWrapBox6();"><i class="fa fa-angle-left"></i></span>
            
                <div class="btn-search" onclick="toSearch()">
                    <label>搜索</label>
                </div>
            </header>
            <div class="holder-loading" id="holder-loading-1">
                <i class="fa fa-spinner fa-pulse"></i>正在加载...
            </div>
            <div id="replace-box-1" style="display: none;">
                <section class="wrapper-static margin-top-50 margin-bottom-55">

					<div><a href="${basepath}/m/study/detail/8a2bb3815373068d0154bdc7fbf63280.xhtml"><img style="display: block;width:100%" src="${basepath}/static/m/ext/enn/img/banner_20160517.jpg" /></a></div>

                	<%-- <div class="block-banner">
                        <div  class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><a href="${basepath}/m/ext/enn/task/center.xhtml"><img style="display: block;" src="${basepath}/static/m/ext/enn/img/banner_20151023.jpg" /></a></div>
                                <div class="swiper-slide"><a href="${basepath}/m/study/detail/8a2be106504c3ab801506aa264c51190.xhtml"><img style="display: block;" src="${basepath}/static/m/ext/enn/img/banner_20151016.jpg" /></a></div>
                               <!--  <div class="swiper-slide"><a href="${basepath}/m/study/detail/8a2bb3814f0731d1014f0b03c9310371.xhtml"><img style="display: none;" src="${basepath}/static/m/ext/enn/img/banner_20150808.jpg" /></a></div>  -->
                            </div>
                        </div>
                        <div class="pagination"></div>
                    </div> --%>
                    
                    <div id="index-column-choosedO" style="display:none;">
	                  	<div class="category-line" id="user-category-line-org">
								<c:if test="${initcolumn}">
										<c:if test="${not empty org.id}">
										<span class="category active"   data-id="${org.id }" data-target="category-tags-1" data-status="uncreated" >${org.name }</span>
										<input type='hidden' id="first_columnOid" value="${org.id }" />
										</c:if>
										<span class="category <c:if test="${empty org.id}">active</c:if>"   data-id="" data-target="category-tags-2" data-status="uncreated" >全部</span>
								</c:if>
								<c:if test="${not initcolumn}">
									<c:forEach items="${choosedO }" var="item" varStatus="i">
										<c:if test="${i.count lt 8  }"><c:if test="${i.first }"><input type='hidden' id="first_columnOid" value="${item.columnid }"/></c:if>
			                    			<span class="category ${i.first ?'active':''}"  ${i.first ?" id='column_first'":""}     data-id="${item.columnid }" data-target="category-tags-${i.count }" data-status="uncreated" >${item.columnname }</span>
			                    		</c:if>
			                    	</c:forEach>
		                    	</c:if>
		                        <label  class="add-category" onclick="window.location.href='${basepath}/m/ext/enn/column/index.xhtml?type=o&from=${from }'">
		                            <i class="add-icon"></i>${initcolumn ?'添加产业':'' }
		                        </label>
		                  </div>
		                    
		                </div>
		                  
		                  
		                  
	                    
						<div class="category-line" id="user-category-line-1">
							<c:forEach items="${choosedR }" var="item" varStatus="i">
								<c:if test="${i.count lt 9  }"><c:if test="${i.first }"><input type="hidden" id="first_columnidname" value="${item.columnidname }" /></c:if>
	                    			<span class="category ${i.first ?'active':''}"  ${i.first ?" id='column_first'":""}     data-id="${item.columnidname }" data-target="category-tags-${i.count }" data-status="uncreated" data-text="<c:if test="${item.columnid eq 'fun' }">[<c:forEach var="tag" items="${taglist }" varStatus="t">{'id':'${tag.id }','text': '${tag.name }'}<c:if test="${not t.last}">,</c:if></c:forEach>]</c:if>">${item.columnname }</span>
	                    		</c:if>
	                    	</c:forEach>
	                        <label  class="add-category ${initcolumn ?'':'add-category2' }" onclick="window.location.href='${basepath}/m/ext/enn/column/index.xhtml?type=r&from=${from }'">
	                            <i class="add-icon"></i>${initcolumn ?'添加栏目':'' }
	                        </label>
	                    </div>
						 <div class="category-tags-line" id="category-tags-line-1" style="display: none;">
	                        <span class="arrow"   onclick="toFunQuestions();"></span>
	                    </div>

	                    <div class="category-line" id="user-category-line-2" style="display: none">
	                       <c:forEach items="${choosedR }" var="item" varStatus="i">
								<c:if test="${i.count gt 8 and   i.count lt 17 }">
	                    			<span class="category" data-id="${item.columnidname }" data-target="category-tags-${i.count }" data-status="uncreated" data-text="<c:if test="${item.columnid eq 'fun' }">[<c:forEach var="tag" items="${taglist }" varStatus="t">{'id': '${tag.id }','text': '${tag.name }'}<c:if test="${not t.last}">,</c:if></c:forEach>]</c:if>">${item.columnname }</span>
	                    		</c:if>
	                    	</c:forEach>
	                    </div>
	
	                    <div class="category-tags-line"  id="category-tags-line-2" style="display: none;">
	                        <span class="arrow"   onclick="toFunQuestions();"></span>
	                    </div>
                    
                   
                    
				<c:if test="${!daySiginInfo.todaySigin}">
					<div class="block-sign-in" id="block-sign-in">
                        <label></label>
                        <span class="btn-sign-in" id="btn-sign-in" onclick="doSigin();">签到</span>
                        <ul>
                            <li>您已连续签到<i>${daySiginInfo.cycle_num }</i>天</li>
                            <li>今天签到<i>${daySiginInfo.currentCanGetExperience}</i>经验值</li>
                        </ul>
                    </div>
				</c:if>
				<c:if test="${not empty week3qFinishInfo  and !week3qFinishInfo.finsh}">
				
                    <div class="block-sign-in block-task-info">
                        <label></label>
                        <span class="btn-sign-in" id="btn-task" onclick="window.location.href = '${basepath}/m/ext/enn/ask/tomiaoshu.xhtml';">前往</span>
                        <ul>
                            <li>您本周需要完成<i>${week3qFinishInfo.requireNum}</i>个提问任务</li>
                            <li>还剩<i>${week3qFinishInfo.requireNum-week3qFinishInfo.completeNum}</i>个未完成</li>
                        </ul>
                    </div>
				</c:if>

                    <div class="module-ask-answer-list">
						

                        <div class="loading">上滑加载更多</div>

                    </div>
                </section>
            </div>
        </div>
        <div class="wrapper-box" id="wrapper-box-2"  style="display: none;">
            <header>
                <span class="btn btn-right" onclick="tomessage();">
                    <span class="bell">
                        <label class="bellicon" style="display: none;"></label>
                    </span>
                </span>
                <div class="title">
                    等你来回答
                </div>
            </header>
            <div class="holder-loading" id="holder-loading-2">
                <i class="fa fa-spinner fa-pulse"></i>正在加载...
            </div>
            <div id="replace-box-2" style="display: none;">
                <section class="wrapper-static margin-top-50 margin-bottom-55">
                    <ul class="block-fast-list">
                        <li>
                            <a href="javascript:void(0);" onclick="toQustionList('q_invite')" >
                                <span class="image" id="q_invite"></span>
                                <div>被邀请的问题</div>
                                <label class="arrow" ></label>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" onclick="toQustionList('q_at')" >
                                <span class="image" id="q_at"></span>
                                <div>@我的问题</div>
                                <label class="arrow"></label>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" onclick="toQustionList('new')" >
                                <span class="image"></span>
                                <div>最新的提问</div>
                                <label class="arrow"></label>
                            </a>
                        </li>
                        <%--
                        <li>
                            <a href="javascript:void(0);" onclick="toQustionList('fun')" >
                                <span class="image"></span>
                                <div>感兴趣的问题</div>
                                <label class="arrow"></label>
                            </a>
                        </li>
                        --%>
                        <li>
                            <a href="javascript:void(0);" onclick="toQustionList('credit')" >
                                <span class="image"></span>
                                <div>高悬赏的问题</div>
                                <label class="arrow"></label>
                            </a>
                        </li>
                        <li>
                            <a href="${basepath }/m/ext/enn/task/center.xhtml">
                                <span class="image" id="notice_task"></span>
                                <div>任务中心</div>
                                <label class="arrow"></label>
                            </a>
                        </li>
                        <%--
                        <li>
                            <a href="${basepath }/m/ext/enn/rank/index.xhtml">
                                <span class="image"></span>
                                <div>排行榜</div>
                                <label class="arrow"></label>
                            </a>
                        </li>
                        --%>
                    </ul>
                </section>
            </div>
        </div>
        <div class="wrapper-box" id="wrapper-box-4"  style="display: none;">
           <header>
			     <span class="btn btn-left" onclick="backWrapBox6();"><i class="fa fa-angle-left"></i></span>
			    <div class="title" id="new-student-title">
			    	${isTeacher?"我要辅导的学员":"我的导师"}
			    </div>
			</header>
			<div class="holder-loading" id="holder-loading-4">
			    <i class="fa fa-spinner fa-pulse"></i>正在加载...
			</div>
			<div id="replace-box-4" style="display: none;">
			
			
			</div>
        </div>
        <div class="wrapper-box" id="wrapper-box-5"  style="display: none;">
            <div class="holder-loading" id="holder-loading-5">
                <i class="fa fa-spinner fa-pulse"></i>正在加载...
            </div>
            <div id="replace-box-5" style="display: none;">
                <section class="wrapper-static margin-bottom-55">
                    <!--<div class="my-info-box">
                        <div class="bell-box">
                    <span class="bell" onclick="tomessage();">
                        <label class="bellicon" style="display: none;"></label>
                    </span>
                        </div>
                        <div class="grade-1" onclick="tousercenter();">
                            <div class="grade-2">
                                <div class="grade-3" id="grade-3">
                                    <img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray&v=<%=System.currentTimeMillis() %>" />
                                    <span id="level">${userCreditLevelInfo.creditLevel.name}</span>
                                </div>
                            </div>
                        </div>
                        <div class="my-name" id="myname">
                            ${user.name}
                        </div>
                        <div class="line-info">
                             <ul>
                                <li id="adopt">${adopt}%</li>
                                <li>采纳率</li>
                            </ul>
                            <ul>
                                <li id="credit">${userCreditLevelInfo.credit}</li>
                                <li>财富值</li>
                            </ul>
                            <ul>
                                <li id="friendcount">${countFriend}</li>
                                <li>好友</li>
                            </ul>
                        </div>
                    </div>-->

				<div class="new-student-box">
                
                        <div class="student-box-header">
                            <div class="man" onclick="tousercenter();">
                                <img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray&v=<%=System.currentTimeMillis() %>" />
                                <span id="level">${userCreditLevelInfo.creditLevel.name}</span>
                            </div>
                            <ul>
                                <li>
                                    <span class="list-intro">身份</span>
                                    <div class="items-box">
                                        <div class="item">
                                            <div class="item-wrapper">
                                           
                                                <c:if test="${user.category==1}">
													<span class="icon-zdr"></span>
	                                                <label>指导人</label>
												</c:if>
											     <c:if test="${user.category==0}">
													<span class="icon-xy"></span>
	                                                <label>学员</label>
												</c:if>
											     <c:if test="${user.category==3}">
													<span class="icon-dr"></span>
	                                                <label>达人</label>
												</c:if>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="item-wrapper">
											<c:if test="${user.authority==1}">
                                                <span class="icon-rz"></span>
                                                <label>认证</label>
												</c:if>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <span class="list-intro">成就</span>
                                    <div class="items-box">
                                        <div class="items-wrapper-box">
                                            <div class="items-wrapper" id="items-wrapper">
                                                <div class="item">
                                                    <div class="item-wrapper">
                                                      <!--  <span class="icon-jldr"></span>
                                                        <label >记录达人</label> -->
                                                    </div>
                                                </div>
                                             
                                               
                                            </div>
                                        </div>
                                    </div>
                                    <label class="arrow" id="transiton-arrow" data-target="items-wrapper"  data-status="close" onclick="elementTransition(this);" style="display:none">
                                        <i class="fa fa-angle-right"></i>
                                    </label>
                                </li>
                            </ul>
                        </div>

                        <div class="student-box-footer">
                            <div class="man-name" >
								<label id="myname">${user.name}</label>
                                <label id="department"></label>
                            </div>
                            <div class="line-info">
                                <ul>
                                     <li id="adopt">${adopt}%</li>
									 <li>采纳率</li>
                                </ul>
                               	<ul>
	                                <li id="credit">${userCreditLevelInfo.credit}</li>
									<li>财富值</li>
                            	</ul>
                                <ul onclick="window.location.href='${basepath }/m/ext/enn/sns/address.xhtml'">
								 <li id="friendcount">${countFriend}<span>查看</span></li>
                                <li>好友</li>
                                </ul>
                            </div>
                        </div>

                    </div>
                    <div class="favorite-tags" onclick="window.location.href='${basepath }/m/ext/enn/ask/toaddtag.xhtml'">
                        <div class="favorite-tags-header">
                            我感兴趣的标签
                        </div>
                        <div class="favorite-tags-footer">
                            <div class="tags" id="tags">
                               
                            </div>
                        <span class="arrow"></span>
                        </div>
                    </div>


                    <div class="module-center-list">
                        <ul>
						      <li>
                                <a href="${basepath }/m/ext/enn/user/invitesuper.xhtml">
                                    <span class="image m8"></span>
                                    <label class="arrow"></label>
                                    <div>
                                        邀请专业达人<label>NEW</label>
                                    </div>
                                </a>
                            </li>
							<!--<li>
                                <a href="${basepath }/m/ext/enn/ask/toaddtag.xhtml">
                                    <span class="image m1"></span>
                                    <label class="arrow"></label>
                                    <div>
                                        我感兴趣的标签
                                    </div>
                                </a>
                            </li>-->
                            <li>
                                <a href="${basepath }/m/ext/enn/ask/questions.xhtml?model=me">
                                    <span class="image m2"></span>
                                    <label class="arrow"></label>
                                    <div>
                                        我提问的
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="${basepath }/m/ext/enn/ask/questions.xhtml?model=meAnswer">
                                    <span class="image m3"></span>
                                    <label class="arrow"></label>
                                    <div>
                                        我回答的
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="${basepath }/m/ext/enn/ask/questions.xhtml?model=meInvite">
                                    <span class="image m4"></span>
                                    <label class="arrow"></label>
                                    <div>
                                        我邀请的
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="${basepath }/m/ext/enn/coach/course.xhtml?uid=${user.id}">
                                    <span class="image m5"></span>
                                    <label class="arrow"></label>
                                    <div>
                                        我的课程
                                    </div>
                                </a>
                            </li>
                          <!--  <li>
                                <a href="${basepath }/m/ext/enn/sns/address.xhtml">
                                    <span class="image m6"></span>
                                    <label class="arrow"></label>
                                    <div>
                                        我的通讯录
                                    </div>
                                </a>
                            </li>-->
                            <li>
                                <a href="${basepath }/m/ext/enn/sns/mygroup.xhtml">
                                    <span class="image m7"></span>
                                    <label class="arrow"></label>
                                    <div>
                                        我的群组
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="block-logout-group">
			            <div class="btn-logout" onclick="logout();">注销</div>
			        </div>
                </section>
            </div>
        </div>

        <footer>
            <div class="footer-line" id="footer-line">
                <a href="javascript:void(0);" class="active" id="footer-btn-1" data-href="wrapper-box-6">
                    <div>
                        <label></label>
                        <span>首页</span>
                    </div>
                </a>
                <a href="javascript:void(0);"  id="footer-btn-2" data-href="wrapper-box-2">
                    <div>
                        <label></label>
                        <span>等你答</span>
                        <i id="dnd" style="display: none;"></i>
                    </div>
                </a>
                <a class="btn-ask" href="javascript:void(0);" onclick="toAsk();">
                    <div class="circle-bg"></div>
                    <div class="green-ask"></div>
                </a>
                <a href="javascript:void(0);" id="footer-btn-4" data-href="wrapper-box-4">
                    <div>
                        <label></label>
                        <span>辅导</span>
                        <i id='notice_coach' style="display: none"></i>
                    </div>
                </a>
                <a href="javascript:void(0);" id="footer-btn-5" data-href="wrapper-box-5">
                    <div>
                        <label></label>
                        <span>我</span>
                    </div>
                </a>
            </div>
			<input type='hidden' name="question_timestamp" id="question_timestamp"/>
        </footer>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/swiper.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.index.js"></script>
        <script type="text/javascript">
        $(function (){
        	$('#wrapper-box-6').show();
	        var appWidth = $('.useapp-box').width();
	        
	        $('.useapp-box li a').css('width',appWidth/3);
	        if (!/AppleWebKit.*Mobile.*/i.test(navigator.userAgent)) {
                $('.useapp-box li a').css('width',appWidth/3-6);
            }
	        var liWidth = $('.useapp-box li a').width();
	        $('.useapp-box li a').css('height',liWidth);
	        //var liHeight = $('.useapp-box li a').height();
	        //$('.useapp-box li a').css('line-height',liHeight+'px');
        })
        
        </script>
        <script type="text/javascript">
        	
	        var firstQuerykey=$("#first_columnidname").val();
	        var firstQueryOid=$("#first_columnOid").val(); 
	        var querykey=firstQuerykey;
	        var queryOid=firstQueryOid;
	        var isShowColumn = false;
        	var column="column";
        	var taggroup ="";
            var $body;
            
            var $wrapperBox1;
            var $wrapperBox2;
            var $wrapperBox3;
            var $wrapperBox4;
            var $wrapperBox5;
            var $wrapperBox6;
            var $holderLoading1;
            var $holderLoading2;
            var $holderLoading3;
            var $holderLoading4;
            var $holderLoading5;
            var $holderLoading6;
            var $footer;
            var $tabListBtns;
            var isSuper = ${isSuper};
            var hash = window.location.hash;
            var stateMap = {
                wrapper1Showed: false,
                wrapper2Showed: false,
                wrapper3Showed: false,
                wrapper4Showed: false,
                wrapper5Showed: false,
                wrapper6Showed: false
            };

            var $replaceBox1;
            var $replaceBox2;
            var $replaceBox3;
            var $replaceBox4;
            var $replaceBox5;
            var $replaceBox6;

            var timeStamp = Date.now();
            
            var $adopt;
            var $credit;
            var $friendcount;
            var $grade3;
			var $department;
			var $task;
			var $task_index;
			var $tags;
			var $transiton;
			var $transiton_index;
			var windowW = window.innerWidth;
            var itemW = (window.innerWidth - 152) / 4;

            function elementTransition(_this) {
                var $temp = $(_this);
                var status = $temp.data('status');
                var target = $temp.data('target');
                var $target = $('#' + target);

                if (status === 'close') {
                    $temp.find('i')[0].className = 'fa fa-angle-left';
                    $temp.data('status', 'open');
                    $target.css('left', (- itemW * 4) + 'px' );
                } else {
                    $temp.find('i')[0].className = 'fa fa-angle-right';
                    $temp.data('status', 'close');
                    $target.css('left',  '0' );
                }
            }




            var tagsWidthSum ;
            var $userCategoryLine2 ;
            var $userCategoryLine4 ;
            var $userCategoryLine6 ;
            var nodeListArr ;
            var $categoryList1 ;
            var $categoryList2 ;
            var $categoryList3 = null;
            var $categoryList4 = null;
            var $categoryList5 = null;
            var $categoryList6 = null;
            var $categoryTagsine1 ;
            var $categoryTagsine2 ;
            var $categoryTagsine3 ;
            var $categoryTagsine4 ;
            var $categoryTagsine5 ;
            var $categoryTagsine6 ;
            var $categoryListOrg ;

            function showColumn() {
                setTimeout(function () {
                    $('#user-category-line-1 .category').each(function () {
                        var $temp = $(this);
                        var itemW = $temp.width();
                        tagsWidthSum += (itemW + 21);
                        if (tagsWidthSum >= (windowW - 54)) {
                            nodeListArr.push($temp);
                            $userCategoryLine2.show();
                        }
                    });
                    $userCategoryLine2.prepend(nodeListArr);
                    
                    
                    $categoryList1 = $('#user-category-line-1 .category');
                    $categoryList2 = $('#user-category-line-2 .category');

                    $categoryList1.bind('click', function () {
                        var $temp = $(this);
                        var target = $temp.data('target');
                        var status = $temp.data('status');
                        var text = $temp.data('text');
                        querykey = $temp.data('id');
                        
                        setLine1RColumnChecked($temp);
                        page = 1;
                        getlist(page);
                        /*
                        $categoryList2.removeClass('active');
                        $temp.addClass('active').siblings('.category').removeClass('active');

                        $('.module-ask-answer-list .loading').remove();
                        $('.module-ask-answer-list').html('<div class="loading">上滑加载更多</div>');
                        page = 1;
                        getlist(page);

                        if (typeof text === 'undefined' || text === '') {
                            $categoryTagsine1.hide();
                            $categoryTagsine2.hide();
                            return;
                        } else {
                            text = text.replace(/\'/g, '"');
                        }
                        var jsonObj = JSON.parse(text);

                        if (status === 'uncreated') {
                            createCategoryTags($categoryTagsine1, target, jsonObj);
                            $temp.data('status', 'created');
                        }

                        $('.category-tags-line .tags').hide();
                        $('#' + target).show();
                        $categoryTagsine2.hide();
                        $categoryTagsine1.show();

						*/
                    });
                    $categoryList2.bind('click', function () {
                        var $temp = $(this);
                        var target = $temp.data('target');
                        var status = $temp.data('status');
                        var text = $temp.data('text');
                        querykey = $temp.data('id');

                        $categoryList1.removeClass('active');
                        $temp.addClass('active').siblings('.category').removeClass('active');
                        $('.module-ask-answer-list .loading').remove();
                        $('.module-ask-answer-list').html('<div class="loading">上滑加载更多</div>');
                        page = 1;
                        getlist(page);

                        if (typeof text === 'undefined' || text === '') {
                            $categoryTagsine1.hide();
                            $categoryTagsine2.hide();
                            return;
                        } else {
                            text = text.replace(/\'/g, '"');
                        }

                        var jsonObj = JSON.parse(text);

                        if (status === 'uncreated') {
                            createCategoryTags($categoryTagsine2, target, jsonObj);
                            $temp.data('status', 'created');
                        }

                        $('.category-tags-line .tags').hide();
                        $('#' + target).show();
                        $categoryTagsine1.hide();
                        $categoryTagsine2.show();
                    });
                    
                    
                    $categoryListOrg.bind('click', function () {
                        var $temp = $(this);
                        setOrgColumnChecked($temp);
                        page = 1;
                        getlist(page);

                    });
                    
                    
                }, 50);

            }
            
            
            function getFirstOrgColumnObj(){
            	return $("#user-category-line-org span:first");
            }
            function getFirstRColumnObj(){
            	return $("#user-category-line-1 span:first");
            }
            function setFirstOrgColumnChecked(){
            	var $temp = getFirstOrgColumnObj();
            	setOrgColumnChecked($temp);
            }
            
            function setFirstRColumnChecked(){
            	var $temp = getFirstRColumnObj();
            	setLine1RColumnChecked($temp);
            }
            
            
            function setOrgColumnChecked(obj){
            	var $temp = obj;
                var target = $temp.data('target');
                var status = $temp.data('status');
                queryOid = $temp.data('id');
                $categoryListOrg.removeClass('active');
                $temp.addClass('active').siblings('.category').removeClass('active');

                $('.module-ask-answer-list .loading').remove();
                $('.module-ask-answer-list').html('<div class="loading">上滑加载更多</div>');
            }
            
            function setLine1RColumnChecked(obj){
            	var $temp = obj;
                var target = $temp.data('target');
                var status = $temp.data('status');
                var text = $temp.data('text');
                querykey = $temp.data('id');
                $categoryList2.removeClass('active');
                $temp.addClass('active').siblings('.category').removeClass('active');

                $('.module-ask-answer-list .loading').remove();
                $('.module-ask-answer-list').html('<div class="loading">上滑加载更多</div>');

                if (typeof text === 'undefined' || text === '') {
                    $categoryTagsine1.hide();
                    $categoryTagsine2.hide();
                    return;
                } else {
                    text = text.replace(/\'/g, '"');
                }
                var jsonObj = JSON.parse(text);

                if (status === 'uncreated') {
                    createCategoryTags($categoryTagsine1, target, jsonObj);
                    $temp.data('status', 'created');
                }

                $('.category-tags-line .tags').hide();
                $('#' + target).show();
                $categoryTagsine2.hide();
                $categoryTagsine1.show();
            }
            


            function createCategoryTags(parentNode, targetId, dataJson) {
                var temp;
                var html = '<div class="tags" id="'+ targetId +'">';

                if (!dataJson) {
                    console.log('need json data!');
                    return;
                }
                for (var i = 0; i < dataJson.length; i++) {
                    temp = dataJson[i];
                    html += '<label onclick="clickTagAction(\''+ temp.id +'\');">'+ temp.text +'</label>';
                }
                html += '</div>';
                parentNode.append(html);

            }

            //显示我感兴趣下的标签内容
            function showFirstFunQuestionTagInfo(){
                var $temp = $("#column_first");
                var target= $temp.data('target');
                var status = $temp.data('status');
                var text = $temp.data('text');
                if (typeof text === 'undefined' || text === '') {
                    return;
                } else {
                    text = text.replace(/\'/g, '"');
                }
                var jsonObj = JSON.parse(text);

                if (status === 'uncreated') {
                    createCategoryTags($categoryTagsine1, target, jsonObj);
                    $temp.data('status', 'created');
                }
                $('#' + target).show();
                $categoryTagsine1.show();
            }

            function clickTagAction(id) {
            	toTagQuesetionList(id);
            }
            $(function () {



                $body = $('body');
                $wrapperBox1 = $('#wrapper-box-1');
                $wrapperBox2 = $('#wrapper-box-2');
                $wrapperBox3 = $('#wrapper-box-3');
                $wrapperBox4 = $('#wrapper-box-4');
                $wrapperBox5 = $('#wrapper-box-5');
                $wrapperBox6 = $('#wrapper-box-6');
                $holderLoading1 = $('#holder-loading-1');
                $holderLoading2 = $('#holder-loading-2');
                $holderLoading3 = $('#holder-loading-3');
                $holderLoading4 = $('#holder-loading-4');
                $holderLoading5 = $('#holder-loading-5');
                $holderLoading6 = $('#holder-loading-6');
                $footer = $('footer');
                $tabListBtns = $('#footer-line > a');

                $replaceBox1 = $('#replace-box-1');
                $replaceBox2 = $('#replace-box-2');
                $replaceBox3 = $('#replace-box-3');
                $replaceBox4 = $('#replace-box-4');
                $replaceBox5 = $('#replace-box-5');
                $replaceBox6 = $('#replace-box-6');
                
                
                $adopt = $('#adopt');
                $credit = $('#credit');
                $friendcount = $('#friendcount');
                $grade3 = $('#grade-3');
                $myname = $('#myname');
                $department = $('#department');
				$task=$('#items-wrapper');
				$transiton=$("#transiton-arrow");
				
				$task_index=$('#items-wrapper-index');
				$transiton_index=$("#transiton-arrow-index");
				
				$tags = $('#tags');
				
				

				$('#items-wrapper').width(itemW * 7 + 'px');
                $('#items-wrapper .item').width(itemW + 'px');

                $('#items-wrapper-index').width(itemW * 7 + 'px');
                $('#items-wrapper-index .item').width(itemW + 'px');



                tagsWidthSum = 0;
                $userCategoryLine2 = $('#user-category-line-2');
                $userCategoryLine4 = $('#user-category-line-4');
                $userCategoryLine6 = $('#user-category-line-6');
                nodeListArr = [];
                $categoryListOrg = $('#user-category-line-org .category');
                $categoryList1 = $('#user-category-line-1 .category');
                $categoryList2 = $('#user-category-line-2 .category');

                $categoryTagsine1 = $('#category-tags-line-1');
                $categoryTagsine2 = $('#category-tags-line-2');

                resetBodayBGColor();
                
                if(null==hash || ""==hash || "#a"==hash){hash="#f"}
                if (hash) {
                    switch (hash) {//页面初始加载时，流程控制
                        case '#a0': //谈天说地
                        	$("#index-column-choosedO").hide();
        					indexForColumn("talk");
                            break;
                        case '#a1':
        					$("#index-column-choosedO").show();
        					indexForColumn("other");
                            break;
                        case '#a':
                        	$("#index-column-choosedO").hide();
                            showWrapperBox1();
                            break;
                        case '#b':
                            $('#footer-btn-2').addClass('active').siblings().removeClass('active');
                            showWrapperBox2();
                            break;
                        case '#c':
                            $('#footer-btn-3').addClass('active').siblings().removeClass('active');
                            showWrapperBox3();
                            break;
                        case '#d':
                            $('#footer-btn-4').addClass('active').siblings().removeClass('active');
                            showWrapperBox4();
                            break;
                        case '#e':
                            $('#footer-btn-5').addClass('active').siblings().removeClass('active');
                            showWrapperBox5();
                            break;
                        case '#f':
                        	window.location.hash = 'f';
                        	$('body').css('background','#fefefe');
                            showWrapperBox6();
                            break;
                        default:
                            console.log('不存在该模块！');
                    }
                } else {
                	$('body').css('background','#fefefe');
                    showWrapperBox6();
                }

                for (var i = 0; i < $tabListBtns.length; i++) {
                    $tabListBtns[i].addEventListener('touchstart', function () {
                        var curTimeStamp = Date.now();
                        if (curTimeStamp - timeStamp < 200) {
                            window.location.href="${basepath}/m/ext/enn/ask/index.xhtml";
                        }
                        timeStamp = Date.now();
                    }, false);
                }
                
                $tabListBtns.bind('click', function () {//用户点击按钮时，流程控制
                    var $temp = $(this);
                    var href = $temp.data('href');
                    $temp.addClass('active').siblings().removeClass('active');
                    swipeAjax.setAjaxCount(0);  //这一行必须加
                    resetBodayBGColor();
                    switch (href) {
                        case 'wrapper-box-1':
                            window.location.hash = 'a';
                            showWrapperBox1();
                            break;
                        case 'wrapper-box-2':
                            window.location.hash = 'b';
                            showWrapperBox2();
                            break;
                        case 'wrapper-box-3':
                            //window.location.hash = 'c';
                            showWrapperBox3();
                            break;
                        case 'wrapper-box-4':
                            window.location.hash = 'd';
                            showWrapperBox4();
                            break;
                        case 'wrapper-box-5':
                            window.location.hash = 'e';
                            userinfo();
                            showWrapperBox5();
                            break;
                        case 'wrapper-box-6':
                        	$('body').css('background','#fefefe');
                            window.location.hash = 'f';
                            showWrapperBox6();
                            break;
                        default:
                            console.log('不存在该模块！');
                    }
                });
            });
            
            
            function resetBodayBGColor(){
            	$('body').css('background','#eee');
            }
            
            
            function showWrapperBox6() {
            	
                $wrapperBox6.show().siblings('.wrapper-box').hide();
                if (!stateMap.wrapper6Showed) {
                    stateMap.wrapper6Showed = true;
                    //ajax请求，异步加载
                    $holderLoading6.remove();
                    $replaceBox6.show();
                    initWrapperBox6();
                    
                }
            }

            function onclicktoCoach(){
            	$('#footer-btn-4').addClass('active').siblings().removeClass('active');
            	window.location.hash = 'd';
            	showWrapperBox4();
            }
            
            function backWrapBox6(){
            	 $('#footer-btn-1').addClass('active').siblings().removeClass('active');
	            window.location.hash = 'f';
	        	$('body').css('background','#fefefe');
	            showWrapperBox6();
            }
			function initWrapperBox6(){
				//remindGroupNotice();
				//newTaskInfo();
			}
			
			function showIndexPageNoticeInfo(show,answerme,inviteat,other){
				
				if(answerme > 0){
					$("#indexMessageFmodel").html('提示：你的问题有人回答了');
				}else if(inviteat > 0){
					$("#indexMessageFmodel").html('提示：有新的问题等你回答');
				}else if(other > 0 ){
					$("#indexMessageFmodel").html('提示：有新的系统通知');
				}
				if(show >0 ){
					$(".student-func-line").show();
				}
				
			}
			
			
			
			function remindGroupNotice(){
    			$.ajax({
    				type : "GET",
    				url : "${basepath}/m/ext/enn/notice/remindgroup.json",
    				cache : false,
    				data : {
    					"coachid":"${coachid}"
    				},
    				success : function(map) {
    					
    					var answerme = parseInt(map.answerme);
    					var inviteat = parseInt(map.inviteat);
    					var other = parseInt(map.other);
    					var show = parseInt(map.show);
    					if(answerme > 0){
    						$("#indexMessageFmodel").html('提示：您的问题有人回答了');
    					}else if(inviteat > 0){
    						$("#indexMessageFmodel").html('提示：有问题邀请你回答');
    					}else if(other > 0 ){
    						$("#indexMessageFmodel").html('提示：有聊天信息');
    					}
    					if(show >0 ){
    						$(".student-func-line").show();
    					}
        				
    				},
    				error : function() {
    				}
    			});

    		}
			
			function indexForColumn(type){
				resetBodayBGColor();
				querykey = firstQuerykey;
				if('talk' == type){
					$("#index-column-choosedO").hide();
					taggroup = 0;
					queryOid = "";
					setFirstRColumnChecked();
					window.location.hash = 'a0';
				}else if('other' == type){
					$("#index-column-choosedO").show();
					taggroup = 1;
					setFirstRColumnChecked();
					setFirstOrgColumnChecked();
					window.location.hash = 'a1';
				}
				showWrapperBox1();
			}

            function showWrapperBox1() {
            	
                if(!isShowColumn) {
                    isShowColumn = true;
                    showColumn();
                    if ("r_fun" == querykey) { //感兴趣的
                        showFirstFunQuestionTagInfo();
                    }
                }


                $wrapperBox1.show().siblings('.wrapper-box').hide();
                
                if (!stateMap.wrapper1Showed) {
                    stateMap.wrapper1Showed = true;
                    //ajax请求，异步加载
                    $holderLoading1.remove();
                    $replaceBox1.show();
                    initWrapperBox1();
                }else{
                	//$('.module-ask-answer-list .loading').remove();
                    //$('.module-ask-answer-list').html('<div class="loading">上滑加载更多</div>');
                	 getlist(1);
                }
            }
            function showWrapperBox2() {
                $wrapperBox2.show().siblings('.wrapper-box').hide();
                if (!stateMap.wrapper2Showed) {
                    stateMap.wrapper2Showed = true;
                    //ajax请求，异步加载
                    $holderLoading2.remove();
                    $replaceBox2.show();
                    initWrapperBox2();
                }
            }
            function showWrapperBox3() {
                $wrapperBox3.show().siblings('.wrapper-box').hide();
                if (!stateMap.wrapper3Showed) {
                    stateMap.wrapper3Showed = true;
                    //ajax请求，异步加载
                    $holderLoading3.remove();
                    $replaceBox3.show();
                    initWrapperBox3();
                   
                }
            }
            function showWrapperBox4() {
            	var url="${basepath}/m/ext/enn/coach/index.list";
                $wrapperBox4.show().siblings('.wrapper-box').hide();
                if (!stateMap.wrapper4Showed) {
                    stateMap.wrapper4Showed = true;
                	$replaceBox4.load(url,function(){
                        $holderLoading4.remove();
                        $replaceBox4.show();
                        initWrapperBox4();
    				});      
                }
            }
            function showWrapperBox5() {
            	var url = "${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray&v=" + Math.random();
                $wrapperBox5.show().siblings('.wrapper-box').hide();
                insertIcon(url);
                if (!stateMap.wrapper5Showed) {
                    stateMap.wrapper5Showed = true;
                    //ajax请求，异步加载
                   
                    $holderLoading5.remove();
                    $replaceBox5.show();
                    initWrapperBox5();
                    
                }
                
            }

            var page = 1;
			
            function initWrapperBox1() {
                var banner;
                var $loading;

                banner = new Swiper('.swiper-container',{
                    pagination: '.pagination',
                    loop: true,
                    autoplay: 3000,
                    autoplayDisableOnInteraction: false,
                    autoResize: true,
                    calculateHeight: true,
                    paginationClickable: true,
                    onSlideChangeStart: function () {
                        swipeAjax.setAjaxCount(0);
                    }
                });
                setTimeout(function () {
                    $(".swiper-slide img").css({"display": "block"});
                }, 100);
                
                getlist(1);


                swipeAjax.bindTapEvent(document, function () {//上滑回调
                	if (!$wrapperBox1.is(':visible')) {
                		swipeAjax && swipeAjax.setAjaxCount(0);
                		return;
                	}
                    $loading = $('.module-ask-answer-list .loading');
                    if (!$loading.length) {
                        return;
                    }
                    if (total <= current) {
						swipeAjax.setAjaxCount(0); //这一行必须加 
						return;
					}
                    page = page + 1;
                    getlist(page);
                });


            }

            
			
            function getlist(i){
            	var  $loading1 = $('.module-ask-answer-list .loading');
            	$loading1.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
            	$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/ask/list.list",
					data:{page : i,size :20,model:column,key:querykey,taggroup:taggroup,oid:queryOid},
					cache:false,
					success:function(html){
						$loading1.before(html);
						if(total>current){
							$loading1.html('上滑加载更多');
						}else if(total!=1&&current!=1){
							$loading1.html('已无更多');
						}else if(total == 0 || total == 1 ){
							$loading1.html("");
						}
						swipeAjax.setAjaxCount(0);  //这一行必须加
					}
				});
            }
            
            
            function toSearch(){
            	window.location.href="${basepath}/m/ext/enn/ask/search.xhtml";
            }
            
            function todetail(id){
				//window.location.href="${basepath}/m/ext/enn/ask/detail.xhtml?id="+id;
				//alert(api);
				if (typeof(api) == "undefined"){
					window.open("${basepath}/m/ext/enn/ask/detail.xhtml?id="+id);
				}
				
				api.openWin({
					animation:{
					    type:"none"               //动画类型（详见动画类型常量）
					},
					delay:400,
					slidBackEnabled:false,
				    name: 'question_detail',
				    url: "${basepath}/m/ext/enn/ask/detail.xhtml?id="+id+"&openwin=true",
				    pageParam: {name: 'test'}
				});
				//window.open("${basepath}/m/ext/enn/ask/detail.xhtml?id="+id);
            }
            
            
            function toQustionList(model){
            	
            	window.location.href = "${basepath}/m/ext/enn/ask/questions.xhtml?model="+model;
            	//清除提醒
            	//showOrCleanNotice(model,false);
            }
            
            function toAsk(){
            	/* if(isSuper){
            		lightBlock.show('该功能目前仅对大学生和指导人开放，敬请期待……');
            		return;
            	} */
            	window.location.href="${basepath}/m/ext/enn/ask/tomiaoshu.xhtml";
            }
            
            /*初始化 等你答 的提醒 */
            function initWrapperBox2() {
            	requestQInviteAndAtNotice();
            }
           
			$(function(){
				remindGroup();
				//requestQInviteAndAtNotice();
				userinfo();
				
			});
			
			
            
            function remindGroup(){
    			$.ajax({
    				type : "GET",
    				url : "${basepath}/m/ext/enn/notice/remindgroup.json",
    				cache : false,
    				data : {
    					"coachid":"${coachid}"
    				},
    				success : function(map) {
    					
    					var show = parseInt(map.show);
        				showOrCleanBellicon(show>0);
        				
        				//var num = parseInt(map.answerme) + parseInt(map.inviteat) + parseInt(map.other);
        				
        				showOrCleanCoachNotice(parseInt(map.coach)>0);
        				
        				
        				var dnd = parseInt(map.inviteat);
        				
        				if(dnd>0){
        					showOrCleanDnD(true);
        				}else{
        					requestTaskNoticeInfo();
        					
        				}
						
        				var answerme = parseInt(map.answerme);
    					var inviteat = parseInt(map.inviteat);
    					var other = parseInt(map.other);
    					
        				
    					showIndexPageNoticeInfo(show,answerme,inviteat,other);
        				
						/*
						if(parseInt(map.forme) > 0 ){
							$("#dnd").show();
						}else{
							$("#dnd").hide();
						}
						*/
    				},
    				error : function() {
    				}
    			});

    		}
            function userinfo(){
    			$.ajax({
    				type : "GET",
    				url : "${basepath}/m/ext/enn/user/userInfo.json",
    				cache : false,
    				success : function(map) {
						
    					var src = map.user.id;
    					//var name = map.userCreditLevelInfo.creditLevel.name;
						var str = '';
						var str2 = '';
						var taskcount=map.task.length;
						
    					$adopt.html(map.adopt+"%");
    					$credit.html(map.userCreditLevelInfo.credit);
    		            $friendcount.html(map.countFriend+'<span>查看</span>');
   		           		//$grade3.html('<img src="${basepath}/user/avatar/'+ src +'.xhtml?style=80x80&color=gray&v=<%=System.currentTimeMillis() %>" /><span>'+ name +'</span>');
   	                	$myname.html(map.user.name);
        				$department.html(map.org.name);
						for(var j=0; j<map.task.length;j++){
							if(map.task[j].id!==("sjwx")){
								str += '<div class="item"><div class="item-wrapper"><span class="icon-'+map.task[j].id+'"></span> <label >'+map.task[j].name+'</label></div></div>';
							}else{
								taskcount=taskcount-1;
							}
						}
						
						$task.html(str);
						$task_index.html(str);
						
						if(taskcount>4){
							$transiton.show();
							$transiton_index.show();
						}
						for(var k=0; k<map.tags.length;k++){
							str2+= '<label>'+map.tags[k].name+'</label>';
						}
						$tags.html(str2);
						$('#items-wrapper').width(itemW * 7 + 'px');
						$('#items-wrapper .item').width(itemW + 'px');
						
						$('#items-wrapper-index').width(itemW * 7 + 'px');
						$('#items-wrapper-index .item').width(itemW + 'px');


    				},
    				error : function() {
    				}
    			});

    		}
            
            function requestTaskNoticeInfo(){
            	$.ajax({
    				type : "GET",
    				url : "${basepath}/m/ext/enn/notice/newtask.json",
    				cache : false,
    				data : {
    				},
    				success : function(map) {
    					
    					var newTaskNum = parseInt(map.task);
    					if(newTaskNum>0){
    						showOrCleanDnDOnly(true);	
    					}
    					showOrCleanInviteAndAtNotice("notice_task",newTaskNum >0);
    					
    					// 新首页 我的任务提醒
    					if(newTaskNum>0){
    						$("#notice_task_index").show();
    					}else{
    						$("#notice_task_index").hide();
    					}
    					
    						
    				},
    				error : function() {
    				}
    			});
            	
            	
            }
            
            function requestQInviteAndAtNotice(){
    			$.ajax({
    				type : "GET",
    				url : "${basepath}/m/ext/enn/notice/remind.json",
    				cache : false,
    				data : {
    				},
    				success : function(map) {

    					
    					showOrCleanDnD(parseInt(map.show)>0);
    					showOrCleanInviteAndAtNotice("q_invite",parseInt(map.invitenum) >0);
    					showOrCleanInviteAndAtNotice("q_at",parseInt(map.atnum) >0);
    					//showOrCleanInviteAndAtNotice("notice_task",1+parseInt(map.tasknum) >0);
    					requestTaskNoticeInfo();
    						
    				},
    				error : function() {
    				}
    			});

    		}
            function showOrCleanInviteAndAtNotice(modelId,isShow){
            	var content = "";
            	if(isShow){
            		content = "<label></label>";
            	}
            	$("#"+modelId).html(content);
            }
            
            function showOrCleanBellicon(isShow){
            	if(isShow){
            		$(".bellicon").show();
            	}else{
            		$(".bellicon").hide();
            	}
            }
            function showOrCleanDnD(isShow){
            	if(isShow){
            		$("#dnd").show();
            		showOrCleanBellicon(true);
            	}else{
            		$("#dnd").hide();
            	}
            	
            }
            
            function showOrCleanDnDOnly(isShow){
            	if(isShow){
            		$("#dnd").show();
            	}else{
            		$("#dnd").hide();
            	}
            	
            }
            function showOrCleanCoachNotice(isShow){
            	if(isShow){
            		$("#notice_coach").show();
					$("#btn_coach").show();
            		//showOrCleanBellicon(true);
            	}else{
            		$("#notice_coach").hide();
					$("#btn_coach").hide();
            	}
            	
            }

			function tomessage(){
				window.location.href="${basepath}/m/ext/enn/ask/message.xhtml";
			}

			/* 签到功能 */
		function doSigin() {
			$('#block-sign-in').remove();

			
			$.ajax({
				type: "POST",
				url:  "${basepath}/m/ext/enn/ask/dosigin.json",
				success:function(data){
						var num = data;
						

						showDaySigin(num);
						
					},
			});
		}
			
			
		function getDaysigininfo(){
			$.ajax({
				type: "GET",
				cache : false,
				url:  "${basepath}/m/ext/enn/task/daysigininfo.json",
				success:function(data){
						if(null!=data){
							if(data.todaySigin ==true){
								$('#block-sign-in').remove();
							}
							
						}
						
					},
			});
			
		}
		//getDaysigininfo();
			
		function showDaySigin(num){
			var html =
						'<div class="signed-box" id="signed-box">'
						+ '<ul>'
						+ '<li></li>'
						+ '<li>签到成功</li>'
						+ '<li>经验+<label>'+ num + '</label> 财富+2</li>'
						+ '</ul>'
						+ '</div>';
			$('body').append(html);
			setTimeout(function () {
							$('#signed-box').animate({'opacity': 0}, 800, function () {
								$(this).remove();
							});
			}, 500);
		}
		
		
		function tousercenter(){
			window.location.href = "${basepath}/m/ext/enn/user/center.xhtml";
		}
		
		function logout(){
			
			
			lightDialog.show("确定注销吗？",
                    function(){
                		lightDialog.remove();
                		
                		window.location.href = "${basepath}/m/ext/enn/logout.xhtml";
                		
                		/* $.ajax({
                			type: "GET",
                			url:  "${basepath}/m/ext/enn/coach/toSaveSurveyResult.json",
                			cache : false,
                			data: {answer:JSON.stringify(objs),coachid :"${param.coachid}",uids:uids,surveyid:'1',},
                			success:function(data){
               						window.location.href="${basepath}/m/ext/enn/coach/chat.xhtml?coachid=${param.coachid}";
                			},
                			error: function(data){
                			}
                		}); */
                    },
                    function(){
                    	lightDialog.remove();
                    });
			
		}
            
            function toFunQuestions(){
            	window.location.href = "${basepath}/m/ext/enn/ask/questions.xhtml?model=fun"
            }
			function toTagQuesetionList(tagid){
            	window.location.href = "${basepath}/m/ext/enn/ask/questions.xhtml?model=tag&tagid="+tagid;

            }


            function toguidance(coachid){
            	window.location.href = "${basepath}/m/ext/enn/coach/chat.xhtml?coachid="+coachid;
             }
			
            
            function changeRingPos() {
                var $ringBtn = $('#ring');
                var str = '<span class="btn btn-left" onclick="goback4UXue();"><i class="fa fa-angle-left"></i></span>';
                $ringBtn.addClass('btn-right');
                $ringBtn.before(str);
            }
            
            function goback4UXue(){
                    if (/ipad|iphone/i.test(navigator.userAgent)){
            	   var str1 = '{ "type": "goHome"}'; 
                    connectWebViewJavascriptBridge(function (bridge) {
                        bridge.init(function (message, responseCallback) {
                            responseCallback()
                        })
                        bridge.registerHandler('JavascriptHandler', function (data, responseCallback) {
                            responseCallback(data)
                        })
                        bridge.send(str1,function (responseData) {
                        })
                    })
                    }
                if (/android/i.test(navigator.userAgent)){
                           window.dome.goBackHome();
                  }else{
                       return false;
                   }
               
                function connectWebViewJavascriptBridge(callback) {
                    if (window.WebViewJavascriptBridge) {
                        callback(WebViewJavascriptBridge)
                    } else {
                        document.addEventListener('WebViewJavascriptBridgeReady', function () {
                            callback(WebViewJavascriptBridge)
                        }, false)
                    }
                }

                if (window.WebViewJavascriptBridge) {
                    return
                }
                var messagingIframe
                var sendMessageQueue = []
                var receiveMessageQueue = []
                var messageHandlers = {}
                var CUSTOM_PROTOCOL_SCHEME = 'wvjbscheme'
                var QUEUE_HAS_MESSAGE = '__WVJB_QUEUE_MESSAGE__'
                var responseCallbacks = {}
                var uniqueId = 1

                function _createQueueReadyIframe(doc) {
                    messagingIframe = doc.createElement('iframe')
                    messagingIframe.style.display = 'none'
                    doc.documentElement.appendChild(messagingIframe)
                }

                function init(messageHandler) {
                    if (WebViewJavascriptBridge._messageHandler) {
                        throw new Error('WebViewJavascriptBridge.init called twice')
                    }
                    WebViewJavascriptBridge._messageHandler = messageHandler
                    var receivedMessages = receiveMessageQueue
                    receiveMessageQueue = null
                    for (var i = 0; i < receivedMessages.length; i++) {
                        _dispatchMessageFromObjC(receivedMessages[i])
                    }
                }

                function send(data, responseCallback) {
                    _doSend({data: data}, responseCallback)
                }

                function registerHandler(handlerName, handler) {
                    messageHandlers[handlerName] = handler
                }

                function callHandler(handlerName, data, responseCallback) {
                    _doSend({handlerName: handlerName, data: data}, responseCallback)
                }

                function _doSend(message, responseCallback) {
                    if (responseCallback) {
                        var callbackId = 'cb_' + (uniqueId++) + '_' + new Date().getTime()
                        responseCallbacks[callbackId] = responseCallback
                        message['callbackId'] = callbackId
                    }
                    sendMessageQueue.push(message)
                    messagingIframe.src = CUSTOM_PROTOCOL_SCHEME + '://' + QUEUE_HAS_MESSAGE
                }

                function _fetchQueue() {
                    var messageQueueString = JSON.stringify(sendMessageQueue)
                    sendMessageQueue = []
                    return messageQueueString
                }

                function _dispatchMessageFromObjC(messageJSON) {
                    setTimeout(function _timeoutDispatchMessageFromObjC() {
                        var message = JSON.parse(messageJSON)
                        var messageHandler

                        if (message.responseId) {
                            var responseCallback = responseCallbacks[message.responseId]
                            if (!responseCallback) {
                                return;
                            }
                            responseCallback(message.responseData)
                            delete responseCallbacks[message.responseId]
                        } else {
                            var responseCallback
                            if (message.callbackId) {
                                var callbackResponseId = message.callbackId
                                responseCallback = function (responseData) {
                                    _doSend({responseId: callbackResponseId, responseData: responseData})
                                }
                            }

                            var handler = WebViewJavascriptBridge._messageHandler
                            if (message.handlerName) {
                                handler = messageHandlers[message.handlerName]
                            }

                            try {
                                handler(message.data, responseCallback)
                            } catch (exception) {
                                if (typeof console != 'undefined') {
                                    console.log("WebViewJavascriptBridge: WARNING: javascript handler threw.", message, exception)
                                }
                            }
                        }
                    })
                }

                function _handleMessageFromObjC(messageJSON) {
                    if (receiveMessageQueue) {
                        receiveMessageQueue.push(messageJSON)
                    } else {
                        _dispatchMessageFromObjC(messageJSON)
                    }
                }

                window.WebViewJavascriptBridge = {
                    init: init,
                    send: send,
                    registerHandler: registerHandler,
                    callHandler: callHandler,
                    _fetchQueue: _fetchQueue,
                    _handleMessageFromObjC: _handleMessageFromObjC
                }

                var doc = document
                _createQueueReadyIframe(doc)
                var readyEvent = doc.createEvent('Events')
                readyEvent.initEvent('WebViewJavascriptBridgeReady', false, true)
                readyEvent.bridge = WebViewJavascriptBridge
                doc.dispatchEvent(readyEvent)
            }


            
            UXueAPP();
            function UXueAPP(){
            	if (/ulearning/i.test(navigator.userAgent) || 'true'=='${param.uxuedebug}'){
    				changeRingPos();
    			}
            }
            
        </script>
        
        <script type="text/javascript" src="${basepath}/static/plugins/socket.io/socket.io.js"></script>
		<script type="text/javascript" >
		var socket ;
		var coachid="";
		<c:if test="${not empty coachid}">
			coachid = ",coach_"+"${coachid}";
		</c:if>
		

		
		function socketioInit(groupIds){
		socket =  io.connect('<%=Constant.WEBSOCKET_SERVER%>?type=notice&domain=<%=MwebHelper.getCurrentDomain()%>&id=<%=MwebHelper.getCurrentUid()%>'+coachid+groupIds);
		//socket =  io.connect('http://socketio.aijiayou.com:80?type=vote&id=${id}');

		socket.on('connect', function() {
			console.log('Client has connected to the server!');//正常
	
		});

		socket.on('message', function(data) {
			if(null!=data){
				
				if(data.model=="q_at"){
					showOrCleanDnD(true);
					showOrCleanInviteAndAtNotice("q_at",true);
					return ;
				} 
				if(data.model=="q_invite" ){
					showOrCleanDnD(true);	
					showOrCleanInviteAndAtNotice("q_invite",true);
					return;
				}
				if(data.model=="coach"){
					showOrCleanCoachNotice(true);
				}
				showOrCleanBellicon(true);
			}
		});

		socket.on('disconnect', function() {
			console.log('The client has disconnected!');//连接错误'
			
		});	
	  }	
		
		function insertIcon(url) {
			var $grad3 = $('#grade-3');
			var img = new Image();
			img.src = url;
			
			img.onload = function () {
				$grad3.find('img').remove();
			    $grad3.prepend(img);
			};
		}
		  

		 function initNoitceSio(){
			 $.ajax({
					type: "GET",
					cache : false,
					url:  "${basepath}/m/ext/enn/user/getuserGroupnoticeids.json",
					success:function(data){
						    var groupids = "";
						    
							if(null!=data && data.ids!=""){
								groupids = ","+data.ids;
							}

							socketioInit(groupids);

						}
				});
		}
		 initNoitceSio();
		//socketioInit();
		</script>
	</body>
</html>

