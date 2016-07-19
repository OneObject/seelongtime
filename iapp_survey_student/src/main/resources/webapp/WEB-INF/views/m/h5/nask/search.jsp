<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>搜索</title>
</head>
<body>
	<header>
		<div class="block-search">
			<span class="search" id="search"><i class="fa fa-search"></i></span>
			<form onsubmit="list(1);return false;"><input type="search" id="search-input" placeholder="请输入内容" /></form> <span
				class="delete" id="delete"><i class="fa fa-times"></i></span>
		</div>
		<span class="btn btn-back" id="btn-back"><i
			class="fa fa-angle-left"></i></span> <span class="btn btn-add" id="btn-add"><i
			class="fa fa-plus"></i></span>
	</header>
	<section class="wrapper-static">
		<div class="module-my-ask" id="content">
		
			<div class="holder-no-data" id="nodata">
				<img src="${basepath}/static/m_h5/nask/img/no_data.png" />
			</div>
			
			<div class="holder-loading" id="loading">
				<i class="fa fa-spinner fa-pulse" ></i>正在加载...
			</div>


		</div>
	</section>
	<script type="text/javascript" src="${basepath}/static/m_h5/nask/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m_h5/nask/js/ask_answer_base.js"></script>
	<script type="text/javascript">

		var page = 0;
	
		$(function() {
			var $searchBtn = $('#search');
			var $deleteBtn = $('#delete');
			var $searchInput = $('#search-input');
			var btnBack = document.getElementById('btn-back');
			var btnAdd = document.getElementById('btn-add');
			var $loading;

			
			$deleteBtn.bind('click', function() {//清空input内容
				$searchInput.val('');
			});
			$searchBtn.bind('click', function() {//点搜索按钮时
				list(1);
			});
			$searchInput.bind('focus', function() {//文本框聚焦是，显示删除按钮
				$deleteBtn.show();
			});
			btnBack.onclick = function() {//回到首页
				//window.location.href = '${basepath}/m/h5/nask/index.xhtml';
				window.history.go(-1);
				
			};
			btnAdd.onclick = function() {//跳转到描述问题页面
				window.location.href = '${basepath}/m/h5/nask/tomiaoshu.xhtml';
			};

			swipeAjax.bindTapEvent(document, function() {//模拟上滑加载
				$loading = $('.module-my-ask .loading');
				if (!$loading.length) {
					swipeAjax.setAjaxCount(0);
					return;
				}

				if(total<= current ){
        			swipeAjax.setAjaxCount(0);  //这一行必须加 
					return;
            	}	
				
				$loading.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');

				page = page + 1;
				
				list(page);

			});

		});
		$(function() {
			
			list(1);

		});

		var flag = 0;
		
		function list(i) {
			if(flag == 0 ){
				$("#loading").hide();
				$("#nodata").show();
				flag = flag + 1;
				return;
			}else{
				$("#nodata").hide();
				$("#loading").show();
			}

			if($.trim($("#search-input").val())=="" || $.trim($("#search-input").val()) == null){
				$("#loading").hide();
				$("#nodata").show();
				lightBlock.show("请输入内容！");
					return;
			}

			var tLoading  = $('#content').find('.loading');	
					
			page = i ;
			
			var url = "${basepath}/m/h5/nask/searchlist.list";
			
			$.ajax({
				type : "GET",
				url : url,
				cache : false,
				data : {
					content : $.trim($("#search-input").val()),
					page : i ,
					size : 10
				},
				success : function(response) {
					if(i == 1){
						$("#content").html(response);
						if(total > current ){
							$("#content").append('<div class="loading">上滑加载更多</div>');
						}else{
							
						}
						swipeAjax.setAjaxCount(0); 
					}else{
						tLoading.before(response);
						if(total > current ){
							tLoading.html('上滑加载更多');
						}else{
							tLoading.html('已无更多');
						}
						swipeAjax.setAjaxCount(0); 
					}
				},
				error : function() {
				}
			});
		}
	</script>
</body>
</html>

