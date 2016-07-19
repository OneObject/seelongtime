<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<html>
	<head>

		<title>我的群组</title>

		<style type="text/css">
			body{
				background:#eee;
			}
		</style>
	</head>
	<body class="bg-color-gray">
        <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            
            <div class="title title-2">
                	我的群组
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="module-group-list">
           <c:if test="${empty rs  or  rs.pageable.totalPages eq 0  }">
	<div class="no-data-img"></div>
</c:if>
		<c:forEach var="item" items="${rs.data}">
                <a href="${basepath}/m/ext/enn/sns/chat.xhtml?type=1&to=${item.id}">
                    <div class="block-group">
                        
                        <div class="img-box one">
                        <c:if test="${empty item.cover }">
                         <img src="${basepath}/static/m/ext/enn/img/default_group.png" />
                        </c:if>
                        <c:if test="${not empty item.cover }">
                            <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover }-80x80">
						</c:if>
                        </div>
                        
                        <ul>
                            <li>${item.title }(${item.member_num})</li>
                            <li>${item.remark }</li>
                            <li>${ltfun:dateLongToStringFormat(item.createtime,'MM-dd') }</li>
                        </ul>
                    </div>
                </a>
             	</c:forEach>

               
            </div>
        </section>

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
           
        $(function () {
                var $btnBack = $('#btn-back');
                var $loading;

                $btnBack.bind('click', function () {
                    window.history.go(-1);
                });

                swipeAjax.bindTapEvent(document, function () {//上滑回调
                    $loading = $('.module-group-list .loading');
                    if (!$loading.length) {
                        return;
                    }
                    $loading.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
                    setTimeout(function () {//模拟ajax请求
                        //$loading.before('<div>模拟加载了一条数据</div>');
                        $loading.html('上滑加载更多');
                        swipeAjax.setAjaxCount(0);  //这一行必须加
                    }, 2000);
                });
            });
        </script>
	</body>
</html>
