<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.session.SessionHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta name="menu_path" content="home"><%--当前菜单选中设置 --%>
<script type="text/javascript" src="${basepath}/static/js/page.js"></script>
<script type="text/javascript">
	function gotoPage(page_index,page_size){
		$.ajax({
       		url:"${basepath}/feed/list.list",
       		type:"GET",
       		data:{"page":page_index,"size":page_size},
       		success:function(data){
       			$("#feedList").html(data);
       		}
       	});
	}
	gotoPage(1,20);
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/analysis.jsp"%>

<section class="main-home">
	<ol class="breadcrumb">
	    <li class="active">首页</li>
	</ol>
    <section class="row">
        <section class="col-xs-12 col-sm-6 col-md-8" id="feedList">
			 <!-- <div class="home-input-box">
			    <textarea></textarea>
			    <span>
			        <i class="fa fa-camera"></i>
			    </span>
			    <span class="span">
			        <i  class="fa fa-smile-o"></i>
			    </span>
			    <div class="hide-btn-box">
			        <btn class="btn btn-danger">发表</btn>
			    </div>
			</div> -->
		</section>
		
        <div class="hidden-sm">
            <!--小于760px会自动隐藏起来-->
            <section class="col-xs-6 col-md-4 youce">
                <!--个人信息模块 start-->
                <div class="persional">
                    <div class="down">
                        <div class="touxiang-bg">
        					<img src="${basepath}/user/avatar/<%=SessionHelper.getCurrentUid() %>.xhtml?style=128x128" class="img-circle touxiang"/>
                        </div>
                        <div class="name-level">
                            <h3><%=SessionHelper.getCurrentUname(request) %></h3>
                            <h5>--</h5>
                        </div>
                        <div class="message">
                            <table>
                                <tr>
                                    <td>
                                        <span><strong>--</strong>&nbsp;&nbsp;&nbsp;&nbsp;关注</span>
                                    </td>
                                    <td>
                                        <span><strong>--</strong>&nbsp;&nbsp;&nbsp;&nbsp;粉丝</span>
                                    </td>
                                    <td>
                                      <%
			                             String uid = SessionHelper.getCurrentUid();
			                             pageContext.setAttribute("uid", uid);
	                                    %>
                                        <!-- <span><strong>--</strong>&nbsp;&nbsp;&nbsp;&nbsp;发表</span> --> 
                                        <span>${ajy:creditTotal(uid) }积分</span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <!--个人信息模块 end-->
                <!--统一的列表栏-->
                <!--加入群组 start-->
               <%--  <div class="table-box">
                    <div class="table-header">
                        <span class="table-title"><i class="fa fa-users"></i>&nbsp;&nbsp;加入的群组</span>
                    </div>
                    <div class="table-body">
                        <ul class="qunzu">
                            <li>
                                <img src="${basepath }/static/img/home/01.png">
                                <span class="renshu">12</span>
                            </li>
                            <li>
                                <img src="${basepath }/static/img/home/02.png">
                                <span class="renshu">12</span>
                            </li>
                            <li>
                                <img src="${basepath }/static/img/home/01.png">
                                <span class="renshu">12</span>
                            </li>
                            <li>
                                <img src="${basepath }/static/img/home/02.png">
                                <span class="renshu">12</span>
                            </li>
                            <li>
                                <img src="${basepath }/static/img/home/01.png">
                                <span class="renshu">12</span>
                            </li>
                            <li>
                                <img src="${basepath }/static/img/home/02.png">
                                <span class="renshu">12</span>
                            </li>
                        </ul>
                    </div>
                </div> --%>
                <!--加入群组 end-->
                <!--感兴趣的主题 start-->
                <!-- <div class="table-box">
                    <div class="table-header">
                        <span class="table-title"><i class="fa fa-flag"></i>&nbsp;&nbsp;感兴趣的主题</span>
                    </div>
                    <div class="table-body">
                        <ul class="zhuti">
                            <li>
                                <span class="zt-title">你感兴趣么？为什？</span>
                                <span class="zt-renshu">121</span>
                            </li>
                            <li>
                                <span class="zt-title">你感兴趣么？为什？</span>
                                <span class="zt-renshu">121</span>
                            </li>
                            <li>
                                <span class="zt-title">你感兴趣么？为什？</span>
                                <span class="zt-renshu">121</span>
                            </li>
                            <li>
                                <span class="zt-title">你感兴趣么？为什？</span>
                                <span class="zt-renshu">121</span>
                            </li>
                            <li>
                                <span class="zt-title">你感兴趣么？为什？</span>
                                <span class="zt-renshu">121</span>
                            </li>
                            <li>
                                <span class="zt-title">你感兴趣么？为什？</span>
                                <span class="zt-renshu">121</span>
                            </li>
                        </ul>
                    </div>
                </div> -->
                <!--感兴趣的主题 end-->
                <!--感兴趣的人 start-->
                <%-- <div class="table-box">
                    <div class="table-header">
                        <span class="table-title"><i class="fa fa-smile-o"></i>&nbsp;&nbsp;感兴趣的人</span>
                    </div>
                    <div class="table-body">
                        <ul class="person">
                            <li>
                                <img src="${basepath }/static/img/home/person.png">
                                <span class="person-name">张晓莹</span>
                            </li>
                            <li>
                                <img src="${basepath }/static/img/home/person.png">
                                <span class="person-name">莫文蔚</span>
                            </li>
                          	<li>
                                <img src="${basepath }/static/img/home/person.png">
                                <span class="person-name">张晓莹</span>
                            </li>
                            <li>
                                <img src="${basepath }/static/img/home/person.png">
                                <span class="person-name">莫文蔚</span>
                            </li><li>
                                <img src="${basepath }/static/img/home/person.png">
                                <span class="person-name">张晓莹</span>
                            </li>
                            <li>
                                <img src="${basepath }/static/img/home/person.png">
                                <span class="person-name">莫文蔚</span>
                            </li>
                        </ul>
                    </div>
                </div> --%>
                <!--感兴趣的人 end-->
            </section>
        </div>

    </section>
</section>
</body>
</html>
<content tag="extra_js">