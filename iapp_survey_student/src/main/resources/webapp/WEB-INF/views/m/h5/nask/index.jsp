<%@page import="com.longtime.ajy.mweb.AskUtil"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<%

	String index = AskUtil.getIndex(request);
	
%>

<!DOCTYPE html>
<html>
<c:set var="index" value="<%=index %>"></c:set>
<head>
<title>问答首页</title>
</head>
<body>
	<header>
		<div class="title">问答</div>
		<span class="btn btn-menu" id="btn-menu"><i class="fa fa-bars">
		
		<label class="red-dot" id="remind" style="display: none;"></label>
		
		</i>
		</span> <span class="btn btn-add" id="btn-add"><i
			class="fa fa-plus"></i></span> <span class="btn btn-search" id="btn-search"><i
			class="fa fa-search"></i></span>
	</header>
	<nav>
		<ul class="module-nav ctl-hide" id="module-nav">
			<li><label><i class="fa fa-home"></i></label> <a
				href="javascript:void(0);" data-href="${basepath }/m/h5/index.xhtml">首页</a></li>
			<li><label><i class="fa fa-list-alt"></i></label> <a
				href="javascript:void(0);" data-href="${basepath }/m/h5/nask/myquestion.xhtml" >我的提问</a></li>
			<li><label><i class="fa fa-pencil-square-o"></i></label> <a
				href="javascript:void(0);" data-href="${basepath }/m/h5/nask/myanswer.xhtml">我的回答</a></li>
			<li><label><i class="fa fa-file-text-o"></i></label> <a
				href="javascript:void(0);" data-href="${basepath }/m/h5/nask/inviteindex.xhtml">等我答</a> <span><em id="invitenum"></em></span></li>
			<li><label><i class="fa fa-at"></i></label> <a
				href="javascript:void(0);" data-href="${basepath }/m/h5/nask/atindex.xhtml">@我的</a> <span><em id="atnum"></em></span></li>
		</ul>
	</nav>
	<section class="wrapper-static">
		<div class="module-tab">
			<div id="tab-list" class="tab-list tab-col-2">
				<span class="${index eq 'tab1' ? 'set-bd-color set-bg-color active':'set-color set-bd-color' }" data-href="tab1"
					onclick="firstlist(1);">已解决</span> <span
					class="${index eq 'tab2' ? 'set-bd-color set-bg-color active':'set-color set-bd-color' }" data-href="tab2"
					onclick="firstlist(0);">未解决</span>
			</div>
		</div>
		<div class="module-ask-list" id="tab1" style="${index eq 'tab1' ? '':'display:none;' }">

			<div class="holder-loading">
				<i class="fa fa-spinner fa-pulse"></i>正在加载...
			</div>


		</div>
		<div class="module-ask-list" id="tab2" style="${index eq 'tab2' ? '':'display:none;' }">
			<div class="holder-loading">

				<i class="fa fa-spinner fa-pulse"></i>正在加载...

			</div>


		</div>

	</section>
	<script type="text/javascript"
		src="${basepath}/static/m_h5/nask/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m_h5/nask/js/ask_answer_base.js"></script>
	<script type="text/javascript">
	
		$(function() {
			var page1 = 0;
			var page2 = 0;

			<% 
			if("tab1".equals(index)){
			%>
				firstlist(1);
			<%	
			}else{
			%>
				firstlist(0);
			<%
			}
			%>

			remind();

		});

		function remind(){
			$.ajax({
				type : "GET",
				url : "${basepath}/m/h5/nask/remind.json",
				cache : false,
				data : {
				},
				success : function(map) {

					if(parseInt(map.invitenum) == 0 && parseInt(map.atnum) == 0 ){
						$("#remind").hide();
					}else{
						$("#remind").show();
					}
					
					if(parseInt(map.invitenum) >0){
						$("#invitenum").html(map.invitenum);
						$("#invitenum").show();
					}else{
						$("#invitenum").html(0);
						$("#invitenum").hide();
					}
					if(parseInt(map.atnum) >0){
						$("#atnum").html(map.atnum);
						$("#atnum").show();
					}else{
						$("#atnum").html(0);
						$("#atnum").hide();
					}
					
		
				},
				error : function() {
				}
			});

		}

		$(function() {

			var $btnMenu;
			var $moduleNav;
			var $tabListBtns;
			var $tab1;
			var $tab2;
			var $body;
			var btnAdd;
			var btnSearch;
			
			$btnMenu = $('#btn-menu');
			$moduleNav = $('#module-nav');
			$linkList = $('#module-nav a');
			$tabListBtns = $('#tab-list > span');
			$tab1 = $('#tab1');
			$tab2 = $('#tab2');
			$body = $('body');
			btnAdd = document.getElementById('btn-add');
			btnSearch = document.getElementById('btn-search');

			$btnMenu.bind('click', function(e) {
				if ($moduleNav.is('.ctl-hide')) {
					$moduleNav.prop('class', 'module-nav ctl-show');
					$body.append('<div id="menu-hover"></div>');
                    $("#menu-hover").bind('touchstart', function () {
                        $moduleNav.prop('class', 'module-nav ctl-hide');
                        $(this).remove();
                        return false;
                    });                    					
				} else {
					$moduleNav.prop('class', 'module-nav ctl-hide');
				}
				e.stopPropagation();
			});
            $("header").bind('click', function () {
                $moduleNav.prop('class', 'module-nav ctl-hide');
            });	
			$tabListBtns.bind('click', function() {
				var temp = $(this);
				temp.prop('class', 'set-bd-color set-bg-color active')
						.siblings().prop('class', 'set-color set-bd-color');
				$('#' + temp.data('href')).show().siblings('.module-ask-list')
						.hide();
			});
			$moduleNav.bind('touchmove', function(e) {
				return false;
			});
			$linkList.bind('touchstart', function (e) {
				var link = $(this).data('href');
				$moduleNav.prop('class', 'module-nav ctl-hide');
				setTimeout(function ()　{
					window.location.href = link;
				}, 300);
			});
			btnAdd.onclick = function() {//跳转到描述问题页面
				window.location.href = '${basepath}/m/h5/nask/tomiaoshu.xhtml';
			};
			btnSearch.onclick = function() {//跳转到搜索页面
				window.location.href = '${basepath}/m/h5/nask/tosearch.xhtml';
			};

			swipeAjax
					.bindTapEvent(
							document,
							function() {//异步加载
								var $tabLoading1, $tabLoading2;
								if ($tab1.is(':visible')) {//tab1向上滑动，异步加载
									$tabLoading1 = $tab1.find('.loading');
									if (!$tabLoading1.length) {
										swipeAjax.setAjaxCount(0); //这一行必须加 
										return;
									}

									if (total <= current) {
										
										swipeAjax.setAjaxCount(0); //这一行必须加 

										return;
									}
									$tabLoading1
											.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');

									page1 = page1 + 1;

									list(1, page1);

								} else {//tab2向上滑动，异步加载

									$tabLoading2 = $tab2.find('.loading');
									if (!$tabLoading2.length) {
										swipeAjax.setAjaxCount(0); //这一行必须加 
										return;

									}
									if (untotal <= uncurrent) {
										swipeAjax.setAjaxCount(0); //这一行必须加 
										return;
									}
									$tabLoading2.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');

									page2 = page2 + 1;
									
									list(0,page2);

								}
							});
		});

		
		var tab1flag = 0;
		var tab2flag = 0;

		function firstlist(status){
			
			if(status == 0){

				if(tab1flag > 0){
					return ;
				}else{
					tab1flag = tab1flag + 1;
					list(0,1);
				}
			}else if(status == 1){
				if(tab2flag > 0){
					return ;
				}else{
					tab2flag = tab2flag + 1;
					list(1,1);
				}
			}

			
		}

		function list(status, i) {
			
			var div_id = 'tab1';

			if (status == 1) {
				
				
				page1 = i;

				div_id = 'tab1';

			} else {
				
				page2 = i;
				
				div_id = 'tab2';
			}

			var url = "${basepath}/m/h5/nask/list.list";

			$.ajax({
				type : "GET",
				url : url,
				cache : false,
				data : {
					status : status,
					page : i,
					size : 10
				},
				success : function(response) {
				
					if(i == 1){
						
						$("#" + div_id).html(response);
						

						if (status == 1) {
							
							if(total > current ){

								$("#" + div_id).append('<div class="loading">上滑加载更多</div>');
								
							}
							
						} else {

							if(untotal > uncurrent ){

								$("#" + div_id).append('<div class="loading">上滑加载更多</div>');
								
							}
					
						}
						
					}else{
						
						$("#" + div_id).find('.loading').before(response);
						
                    	if (status == 1) {
							
							if(total > current ){

								$("#" + div_id).find('.loading').html('上滑加载更多');
								
							}else{
								
								$("#" + div_id).find('.loading').html('已无更多');

							}
							
						} else {

							if(untotal > uncurrent ){

								$("#" + div_id).find('.loading').html('上滑加载更多');
								
							}else{
								
								$("#" + div_id).find('.loading').html('已无更多');

							}
					
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
