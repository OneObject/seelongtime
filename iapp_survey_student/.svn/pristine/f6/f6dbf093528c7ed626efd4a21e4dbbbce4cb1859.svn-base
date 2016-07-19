<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<title>我的评论</title>
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/m_h5/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/m_h5/css/hengtian_m.css" />
<style type="text/css">
header {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
body{
	background:#eee;
}
</style>
</head>
<body class="body-gray-color">
	<header class="ctl_header">
		<div class="title">我的评论</div>
		<span class="btn btn-back" id="btn-back"
			onclick="window.history.go(-1);"><i class="fa fa-angle-left"></i></span>
	</header>
	<article class="scroll ctl_cont">
		<section class="wrapper-static">
			<div class="module-tab">
				<div id="tab-list" class="tab-list tab-col-3">
					<span class="set-bd-color set-bg-color active" data-href="tab1" >课程</span>
					<span class="set-color set-bd-color" data-href="tab2" >话题</span> <span
						class="set-color set-bd-color" data-href="tab3" >问答</span>
				</div>
			</div>
			<div class="module-tab-wapper" id="tab1" >
			</div>
			<div class="module-tab-wapper" id="tab2" style="display: none;" >

			</div>
			<div class="module-tab-wapper" id="tab3" style="display: none;" >

			</div>
		</section>

		<section class="more" id="toload" style="display:none; padding: 25px 55px 45px;"
			onclick="page();">
			<a href="javascript:void(0);">点击加载更多</a>
		</section>

		<section class="loading" id="loading" style="padding: 25px 55px 45px;">
			<i class="fa fa-spinner fa-spin"></i>
		</section>


	</article>
	
	<script type="text/javascript" src="${basepath}/static/m_h5/js/myDialog.js"></script>
	<script type="text/javascript">

	
		$(function() {
			var $tabListBtns;

			$tabListBtns = $('#tab-list > span');

			$tabListBtns.bind('click', function() {
				var temp = $(this);
				temp.prop('class', 'set-bd-color set-bg-color active')
						.siblings().prop('class', 'set-color set-bd-color');
				$('#' + temp.data('href')).show()
						.siblings('.module-tab-wapper').hide();

				if(temp.attr("data-href") == 'tab1'){
					restype = 1;
				}else if(temp.attr("data-href") == 'tab2'){
					restype = 2;
				}else if(temp.attr("data-href") == 'tab3'){
					restype = 3;
				}
				topage();
			});
			
			topage();

		});

		var restype = 1;
		//首次点击加载列表标记
		var courseflag = 0 ;
		var topicflag = 0 ;
		var askflag = 0 ;

		// restype 1:课程  2:话题 3：问答
		function topage(){
			
			if(restype == 1){
				if(courseflag > 0){
					return;
				}
				courseflag = 1 ;
				page();

			}else if(restype == 2){
				if(topicflag > 0){
					return;
				}
				topicflag = 1;
				page();

			}else if(restype == 3 ){
				if(askflag > 0){
					return;
				}
				askflag = 1;
				page();
			}
		}

		var coursepage = 1 ;
		var topicpage = 1 ;
		var askpage = 1 ;
		
        function page(){
            var page = 1;
        	if(restype == 1){
            	page = coursepage;
			}else if(restype == 2){
				page = topicpage;
			}else if(restype == 3){
				page = askpage;
			}

        	$("#toload").hide();
        	$("#loading").show();
			$.ajax({
				url:"${basepath}/m/h5/usercenter/commentlist.list",
				data:{restype:restype,page : page,size : 10},
				cache : false,
				success:function(data){
					if(restype == 1){
						var html = $("#tab1").html();
						html += data;
						$("#tab1").html(html);
						coursepage++;
						if(coursecurrent < coursetotal){
							$("#toload").show();
						}
					}else if(restype == 2){
						var html = $("#tab2").html();
						html += data;
						$("#tab2").html(html);
						topicpage++;
						if(topiccurrent < topictotal){
							$("#toload").show();
						}
					}else if(restype == 3){
						var html = $("#tab3").html();
						html += data;
						$("#tab3").html(html);
						askpage++;
						if(askcurrent < asktotal){
							$("#toload").show();
						}
					}
		        	$("#loading").hide();

				}
			});
            
        }

		var rid = null;
		function deleteEntity(id){
			rid = id;
			showMyDialog("你确定要删除吗？","yes");
		}

		function handleSub(){
			$.ajax({
				url:"${basepath}/m/comment/delete.json",
				data:{id:rid},
				cache : false,
				success:function(data){
					$("#item_"+rid).remove();
					$("#dialogloading").remove();
					$(".dialogBg").remove();
				}
			});
		}
		
	</script>
</body>
</html>
