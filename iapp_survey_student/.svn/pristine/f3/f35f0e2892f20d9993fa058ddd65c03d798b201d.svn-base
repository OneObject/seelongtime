<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="menu.changepwd" bundle="${bundle}"/></title>
<meta name="menu_path" content="pwd"><%--当前菜单选中设置 --%>
</head>
<body>
<section class="main-home">
<ol class="breadcrumb">
    <li><a href="${basepath}/"><fmt:message key="menu.home" bundle="${bundle}"/></a></li>
    <li class="active"><fmt:message key="menu.changepwd" bundle="${bundle}"/></li>
</ol>
    <!--修改密码-->
    <div class="changebox">
        <form role="form" action="$(basepath)/user/changePassword.xhtml" method="post">
            <div class="form-group" id="oldpass">
                <label for="old-password"><fmt:message key="pwd.old_pwd" bundle="${bundle}"/></label>
                <input type="password" class="form-control" id="old-password" placeholder="<fmt:message key="pwd.input_old_pwd" bundle="${bundle}"/>">
                <div class="alert alert-danger" id="oldpasstip"></div>
            </div>
            <div class="form-group">
                <label for="newpassword"><fmt:message key="pwd.new_pwd" bundle="${bundle}"/></label>
                <input type="password" class="form-control" id="newpassword" placeholder="<fmt:message key="pwd.new_pwd" bundle="${bundle}"/>">
            </div>
            <div class="form-group" id="makesure">
                <label for="surenewpassword"><fmt:message key="pwd.confirm_pwd" bundle="${bundle}"/></label>
                <input type="password" class="form-control" id="surenewpassword" placeholder="<fmt:message key="pwd.new_pwd" bundle="${bundle}"/>">
                <div class="alert alert-danger" id="surepasstip"><fmt:message key="pwd.pwd_not-equal" bundle="${bundle}"/></div>
            </div>
            <div class="form-group submibtn">
                <span class="fabubtn"><fmt:message key="pwd.confirm_update" bundle="${bundle}"/></span>
            </div>
        </form>
    </div>
</section>
<!--下面是页面使用的js-->
<!--<script type="text/javascript" src="../../static/js/jquery-2.1.0.min.js"></script>-->
        <script type="text/javascript">
            $(document).ready(function(){
                 $("#surepasstip").hide();
                 $("#oldpasstip").hide();
                 $(".fabubtn").click(function(){
                     var oldpass=$("#old-password").val();
                     if(oldpass==null || oldpass==""){
                    	 $("#oldpasstip").show();
                    	 $("#oldpasstip").html('<fmt:message key="pwd.old_pwd_cannot_blank" bundle="${bundle}"/>');
                    	 $("#oldpass").attr("class","form-group has-error");
                    	 return;
                         }else{
                        	 $("#oldpasstip").hide();
                        	 $("#oldpasstip").val("");
                        	 $("#oldpass").attr("class","form-group");
                             }

                     var newpassword=$("#newpassword").val();
                     var surenewpassword=$("#surenewpassword").val();
                     if(newpassword!=surenewpassword){
                        $("#makesure").attr("class","form-group has-error");
                         $("#surepasstip").show();
                         return;
                         }else{
                       	  $("#makesure").attr("class","form-group");
                             $("#surepasstip").hide();
                             }
                      
                     
                     var url="${basepath}/user/oldpassCheck.json";
                     var param={"oldpass":oldpass};
                     //判断当前用户输入的旧密码是否正确
                	 $.ajax({
                		   type:"POST",
                		   url:url,
                		   data:param,
                		  // datatype:"json",
                		   success: function(msg){
                		     if(msg){
                		    	 $("#oldpasstip").hide();
                            	 $("#oldpasstip").val("");
                            	 $("#oldpass").attr("class","form-group ");

                            	 $.ajax({
                            		   type: "POST",
                            		   url: "${basepath}/user/changePassword.json",
                            		   data: "newpassword="+newpassword+"&oldpassword="+oldpass+"&surenewpassword="+surenewpassword,
                            		   success: function(msg){
                            		     if(msg){
                                		     alert('<fmt:message key="pwd.update_success" bundle="${bundle}"/>');
                                		     window.location.href='${basepath}/logout.xhtml';
                                		     }else{
                                                 alert('<fmt:message key="pwd.update_fail" bundle="${bundle}"/>');
                                    		     }
                            		   }
                            		});

                                 
                    		     }else{
                    		    	 $("#oldpasstip").show();
                                	 $("#oldpasstip").html('<fmt:message key="pwd.pwd_error" bundle="${bundle}"/>');
                                	 $("#oldpass").attr("class","form-group has-error");
                        		     }
                		   }
                		});
                         });
                $(".course-item").hover(function(){
                    $(this).find(".poster").animate({"marginTop":"-103px"},function(){
                        $(this).find(".pullup").hide();
                    });
                },function(){
                    $(this).find(".poster").animate({"marginTop":"0px"},function(){
                        $(this).find(".pullup").show();
                    });
                });
            });$(this).find(".poster")
            
        </script>
</body>
</html>
<%-- sitemesh自定义的内容 --%>
<content tag="extra_js">  
</content> 