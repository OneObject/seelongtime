<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>修改密码</title>
<meta name="menu_path" content="" />
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
  	<link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
  	<link rel="stylesheet" href="${basepath}/static/css/active.css">
  	<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
  	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
  	<link href="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css" rel="stylesheet">
	<script src="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js"></script>
	<style type="text/css">
		div.checker, div.checker span, div.checker input {
			width: auto;height: auto;
		}
	</style>
  	<script type="text/javascript">
	</script>
</head>
<body>
	  <!-- 创建考试基本信息 -->
       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				 <%-- <li><i class="icon-home"></i> <a href="${basepath }">首页</a>
                    <i class="icon-angle-right"></i></li> --%>
				<li><span href="#">修改密码</span></li>
				</ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box green">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-bookmark-o"></i><span>修改密码</span>
				</div>
			</div>
			<div class="portlet-body form box_box">
				<div class="col-md-12">
					<div class="portlet-body form" style="overflow: hidden;">
						<form id="addForm" method="post" class="form-horizontal"
							role="form" action="${basepath }/mgr/notice/doadd.xhtml">
							<div class="form-body">
								<div class="form-group"  style="height: 62px;" id="con_oldpassword">
									<label class="col-md-4 control-label">旧密码<span
										class="required">*</span></label>
									<div class="col-md-3">
										<input id="oldpassword"  type="password" placeholder="请输入旧密码" onblur="verifypassword1()" class="form-control">
										<span id="olderror"  class="help-block " style=""></span>
									</div>
								</div>
								<div class="form-group" style="height: 62px;" id="con_newpassword">
									<label  class="col-md-4 control-label">新密码<span
										class="required">*</span></label>
									<div class="col-md-3">
										<input  id="newpassword" type="password" placeholder="请输入新密码" onblur="verifypassword2()" class="form-control" >
										<span id="newerror"  class="help-block " style=""></span>
									</div>
								</div>
								<div class="form-group" style="height: 62px;" id="con_repassword">
									<label class="col-md-4 control-label">重复密码<span
										class="required">*</span></label>
									<div class="col-md-3">
										<input id="repassword" type="password" placeholder="请重新输入新密码" onblur="verifypassword3()" class="form-control" >
										<span id="reperror"  class="help-block " style=""></span>
									</div>
								</div>
								
								<div class="form-group" style="text-align: right">

									<span class="btn btn-success" onclick="dosubmit();"><i
										class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;保存</span>
									<span class="btn btn-success" onclick="goback();"><i
										class="glyphicon glyphicon-share-alt"></i>&nbsp;&nbsp;取消</span>
								</div>
							</div>
						



						</form>
					</div>
				</div>
			</div>
		</div>
			</div>
	
	<script type="text/javascript">
	 var valiOld = false;
	   	var valiNew = false;
	   	var valiRe = false;


		//旧密码验证
		function verifypassword1(){
	    	var oldpassword = $.trim($("#oldpassword").val());
	    	if(oldpassword==''){
	    				addError("oldpassword");
	    				$("#olderror").html("不能为空！");
	    				$("#olderror").show();
	    				valiOld = false;
	    				//alert(11);
	    		          return;
	        }else{
		        removeError("oldpassword");
	        	$("#olderror").html("");
	        	$("#olderror").hide();
	        }
	    	$.ajax({
	            type: "POST",
	            url:"${basepath}/mgr/verifypassword.json",
	            data:{'oldpassword':oldpassword},
	            error: function(data) {
	            	$("#olderror").html("密码错误！");
					$("#olderror").show();
					valiOld = false;
	            },
	            success: function(data) {
	                if(data)
	                    {
	                		removeError("oldpassword");
	                		$("#olderror").html("");
	                		$("#olderror").hide();
	                		valiOld = true;
	                    }
	                else
	                    {
	                		addError("oldpassword");
	                		$("#olderror").html("密码错误！");
	    					$("#olderror").show();
	    					valiOld = false;
	                    }
	            }
	        });
	    }

	    //新密码验证
		function verifypassword2(){
			var newpassword = $.trim($("#newpassword").val());
			//新密码为空验证
			if(newpassword==''){
				addError("newpassword");
				$("#newerror").html("不能为空！");
				$("#newerror").show();
				valiNew = false;
				return
			}else{
				removeError("newpassword");
				$("#newerror").html("");
				$("#newerror").hide();
			}
			//新密码长度验证
			if(newpassword.length<5 || newpassword.length>15){
				addError("newpassword");
				$("#newerror").html("长度至少5位，至多15位！");
				$("#newerror").show();
				valiNew = false;
				return
			}else{
				removeError("newpassword");
				$("#newerror").html("");
				$("#newerror").hide();
			}
			valiNew = true;
	    }
	    //重复新密码验证
		function verifypassword3(){
			var newpassword = $.trim($("#newpassword").val());
	    	var repassword = $.trim($("#repassword").val());

			//重复输入新密码为空验证
			if(repassword==''){
				addError("repassword");
				$("#reperror").html("不能为空！");
				$("#reperror").show();
				valiRe = false;
				return
			}else{
				removeError("repassword");
				$("#reperror").html("");
				$("#reperror").hide();
			}

			//重复输入新密码长度验证
			if(repassword.length<5 || repassword.length>15){
				addError("repassword");
				$("#reperror").html("长度至少5位，至多15位！");
				$("#reperror").show();
				valiRe = false;
				return
			}else{
				removeError("repassword");
				$("#reperror").html("");
				$("#reperror").hide();
			}

			//两次新密码是否相等
			if(newpassword != repassword){
				addError("repassword");
				$("#reperror").html("两次新密码输入不一致!");
				$("#reperror").show();
				valiRe = false;
				return
			}else{
				removeError("repassword");
				$("#reperror").html("");
				$("#reperror").hide();
			}

			valiRe = true;
	    }

		function dosubmit(){
			//旧密码验证
			if(!valiOld){
				verifypassword1();
				return;
			}
			
			 //新密码验证
			verifypassword2();
			if(!valiNew){
				return
			}
			
			//重复新密码验证
			verifypassword3();
			if(!valiRe){
				return
			}

			var password = $.trim($("#repassword").val());
			
	    	if(valiOld && valiNew && valiRe){
	    		$.ajax({
	                type: "POST",
	                url:"${basepath}/mgr/updatepassword.json",
	                data:{'password':password},
	                error: function(data) {
	                	showMsgDialog('修改失败');
	                },
	                success: function(data) {
	                    if(data){
	                    	showMsgDialog('修改成功');
	                    	setTimeout(function(){
	                    		window.location.href="${basepath}/mgr/logout.xhtml";
	                    	},500);
	                    }else{
	                    	showMsgDialog('修改失败');
	                    }
	                }
	            });
	       	}
	            				
	            	
	    }
	    

		function showMsgDialog(text){
			easyDialog.open({
				container : {
					header : '提示',
					content : "<div style='width:300px;text-align:center;'>"+text+"</div>",
				},
				autoClose : 2000,
				callback : function(){
					
				}
			});
		}
		
	/** 返回上一页  */
	function goback(id){
		window.history.go(-1) ;
	}

	/** 添加错误信息 */
	function addError(id){
		$("#con_"+id).addClass("has-error").focus();
	}
	function removeError(id){
		$("#con_"+id).removeClass("has-error");
	}
	
	</script>
</body>
</html>
