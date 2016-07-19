<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
	<title>辅导任务</title>
	<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/xw/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/xw/css/style.css">
</head>
<body>
	<header>
		<div class="back" onclick="gotoback();">
			<i class="fa icon-angle-left"></i>
		</div>
		<p>辅导任务</p>
	</header>

	<section class="select-wrap clear" id="users">
	<!-- <div class="select selected fl">
			张三
		</div> -->
		<c:forEach var="user" items="${students}">
			<div class="select fl ${user.id }" data-hash="${user.id }" data-studentid=${user.id }>
				${user.name }
			</div>
		</c:forEach>
	</section>

	<section class="select-list" id="taskList">
		
	</section>

	<section class="data-normal" style="display:none;" id="loading">
		正在加载...
	</section>


	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/common.js"></script>
	<script type="text/javascript">
		$(function (){
			var selected = $('.select-wrap .select');
			var timer;
			var selectHash = window.location.hash.substring(1);
			
	
			selected.bind('click',function (){
				var hash = $(this).data('hash');
				$(this).addClass('selected').siblings().removeClass('selected');
				
				var studentid = $(this).data("studentid");
				
				loadStudentTask(studentid);
				window.location.hash = hash; 
			});
			
			if(window.location.hash == '') {
				selected.eq(0).addClass('selected');
			} else {
				selected.removeClass('selected');
				$("."+selectHash).addClass('selected');	
			}
			
			init();
			
			
		})
		var taskListDiv= $("#taskList");
		var loadingDiv =$("#loading");
		function loadStudentTask(studentid){
			loadingDiv.show();
			taskListDiv.hide();
			$.ajax({
				type:"GET",
				url:"${basepath}/m/ext/enn/xw/studenttask_list.list",
				data:{studentid:studentid},
				cache:false,
				success:function(html){
					taskListDiv.html(html);
					loadingDiv.hide();
					taskListDiv.show();
					
				}
			});
			
		}
		
		function init(){
			var first =  $("#users").find('div').first();
			var studentid =  first.data("studentid");
			if(!validataEmpty(studentid)){
				loadStudentTask(studentid);
			}
			//first.addClass("selected");
			
		}
		
		
		
	</script>
</body>
</html>