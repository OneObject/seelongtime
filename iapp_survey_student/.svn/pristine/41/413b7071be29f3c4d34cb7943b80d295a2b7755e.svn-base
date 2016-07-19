<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>搜索</title>
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
		<style type="text/css">
			body{
				background: #eee;
			}
			
		</style>
	</head>
	<body class="bg-color-gray">
        <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="block-search">
                <span class="search" id="search" ></span>
              <form onsubmit="search(1, true);return false;">
                <input type="search" id="input" placeholder="请输入内容" />
              </form>
                <span class="delete" id="delete"></span>
            </div>
        </header>
        
        <section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="module-ask-answer-list">

                <div class="loading"></div>

            </div>
        </section>
        

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/swiper.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.index.js"></script>
        <script type="text/javascript">

        var page =1;
    	var oldName;
        $(function () {
            var $btnBack = $('#btn-back');
            var $searchBtn = $('#search');
            var $deleteBtn = $('#delete');
            var $searchInput = $('#input');
            var $loading;

            
            if($searchInput.val() !== ''){
            	search(1, true);
        	}
            
            $deleteBtn.bind('click', function () {//清空input内容
                $searchInput.val('');
                $loading1.before("");
            });
            $searchBtn.bind('click', function () {//点搜索按钮时
            	search(1, true);
            });
            $searchInput.bind('focus', function () {//文本框聚焦是，显示删除按钮
                $deleteBtn.show();
            });

            $btnBack.bind('click', function () {
                window.history.go(-1);
            });

            swipeAjax.bindTapEvent(document, function () {//上滑回调
                $loading = $('.module-ask-answer-list .loading');
                if (!$loading.length) {
                    return;
                }
                if(current >= total){
					swipeAjax.setAjaxCount(0);  //这一行必须加
                	return;
                }
                $loading.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
                page = page + 1;
                search(page, false);
            });
        });
        
        
        function search(pageNum, isSearch){
        	page = pageNum;
        	var name = $.trim($('#input').val());
        	var  $loading1 = $('.module-ask-answer-list .loading');
        	if(name === ""){
        		lightBlock.show('请输入内容');
        		return;
        	} 

        	$.ajax({
				type:"GET",
				url:"${basepath}/m/ext/enn/ask/list.list?model=search&name="+name,
				data:{page : page,size : 20},
				success:function(html){
					var $temp = $('.module-ask-answer-list');
					if (isSearch) {
						$temp.html(html);
						if(total>1){
							$temp.append('<div class="loading">上滑加载更多</div>');
						}
						page = 1;
					} else {
						$loading1.before(html);
						if(total>current){
							$loading1.html('上滑加载更多');
						}else if(total!=1&&current!=1){
							$loading1.html('已无更多');
						}else {
							$loading1.html("");
						}
					}
					swipeAjax.setAjaxCount(0);  //这一行必须加
				}
			});
        	
        	
        }
        
        
        function todetail(id,inviteid){
        	window.open("${basepath}/m/ext/enn/ask/detail.xhtml?id="+id);
        }
        
            
        </script>
	</body>
</html>
