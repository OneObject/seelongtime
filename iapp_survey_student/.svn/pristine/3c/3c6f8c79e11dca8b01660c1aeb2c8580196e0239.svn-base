<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>
		<c:if test="${depth eq 1}">
		产品线
		</c:if>
		<c:if test="${depth ne 1 }">
		${cname }
		</c:if>
		</title>
		<link type="text/css" rel="stylesheet" href="${basepath}/static/m/ext/muyang/css/swiper.css" />
		<style type="text/css">
		 	body{background-color: #fff !important;}
		</style>
	</head>
	<body>
		<section class="search no-margin">
			<span class="back" onclick="window.history.go(-1);"></span>
			<div class="search-box">
				<form onsubmit="list();return false;">
                	<input type="search" placeholder="请输入关键字" id="searchContent" value="${searchContent }"/>
                </form>
                <span class="search-btn" onclick="list();"></span>
			</div>
		</section>
        <section class="category-list">
            <div class="<c:if test="${depth eq 1}">list-with-img</c:if><c:if test="${depth ne 1}">list-no-img</c:if>">
            <c:choose>
	            <c:when test="${empty list }">
					<div class="holder-no-data">
						暂无数据
					</div>
	            </c:when>
	            <c:otherwise>
	            	<ul>
                   		<c:if test="${depth eq 3 }">
	                   		<c:forEach var="item" varStatus="i" items="${list }">
			                    <li>
	                   			<a href="${basepath}/m/ext/muyang/product/product/index.xhtml?cid=${item.id}">
	                            	<span>${item.name }</span>
	                        	</a>
	                        	 </li>
			            	</c:forEach>
                   		</c:if>
                   		<c:if test="${depth ne 3 }">
	                   		<c:forEach var="item" varStatus="i" items="${list }">
			                    <li>
		                    		<a href="${basepath}/m/ext/muyang/product/category.xhtml?id=${item.id}">
				                        	<c:if test="${depth eq 1}">
				                        	<c:if test="${not empty item.icon }">
				                            	<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.icon}-80x80" />
				                            </c:if>
				                            </c:if>
			                            <span>${item.name }</span>
			                        </a>
			                    </li>
			            	</c:forEach>
                   		</c:if>
		            	
	            	</ul>
	            </c:otherwise>
            </c:choose>
                
            </div>
        </section>
		<script type="text/javascript" src="${basepath}/static/m/ext/muyang/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript">

			function list() {
				var searchContent = $.trim($("#searchContent").val());
				if(searchContent==null||searchContent==""){
					return;
				}
				window.location.href = "${basepath}/m/ext/muyang/product/product/index.xhtml?searchContent="+searchContent;
		}
		</script>
	</body>
</html>
