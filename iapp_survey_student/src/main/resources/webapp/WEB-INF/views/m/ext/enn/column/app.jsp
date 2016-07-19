<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta name="format-detection" content="telephone=no" />
		<title>新学员端</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/guidance.2.0.css" />
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/about-me.css">
	</head>
	<body class="bg-color-gray">
        <header>
            <span class="btn btn-left"  id="btn-left-1">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
                应用中心
            </div>
        </header>
        <section style="margin-top:50px">
            <div class="add-about-box parent-about-1">
                <em class="add-about-bg1"></em>
                <div class="about-frid">我的好友</div>
                <div class="about-add about-add-1">
                    <c:choose>
                    <c:when test="${not empty list }">
	                    <c:set var="flag8" value="true"/>
                    <c:forEach items="${list }" var="item" varStatus="i">
                    	<c:if test="${item.appcode eq '8' }">
	                    	<c:set var="flag8" value="false"/>
                    		<span onclick="saveIndexApp(this)" ${item.isdel eq 0?'class="active"':'' } data-appcode="8" data-id="${item.id }" data-isdel="${item.isdel }">${item.isdel eq 0?"移除":"添加" }</span>
                    	</c:if>
                    	<c:if test="${i.last and flag8 }">
	                    	<span onclick="saveIndexApp(this)"  data-appcode="8" data-id="" data-isdel="1">添加</span>
                    	</c:if>
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                    	<span onclick="saveIndexApp(this)"  data-appcode="8" data-id="" data-isdel="1">添加</span>
                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="add-about-box parent-about-2">
                <em class="add-about-bg2"></em>
                <div class="about-frid">我的群组</div>
                <div class="about-add about-add-2">
                <c:choose>
                    <c:when test="${not empty list }">
                    <c:set var="flag9" value="true"/>
                    <c:forEach items="${list }" var="item" varStatus="i">
                    <c:if test="${item.appcode eq '9' }">
	                    <c:set var="flag9" value="false"/>
	                    <span onclick="saveIndexApp(this)" ${item.isdel eq 0?'class="active"':'' }  data-appcode="9" data-id="${item.id }" data-isdel="${item.isdel }">${item.isdel eq 0?"移除":"添加" }</span>
                    </c:if>
                    <c:if test="${i.last  and flag9}">
	                    <span onclick="saveIndexApp(this)"  data-appcode="9" data-id="" data-isdel="1">添加</span>
                    </c:if>
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
	                    <span onclick="saveIndexApp(this)"  data-appcode="9" data-id="" data-isdel="1">添加</span>
                    </c:otherwise>
                </c:choose>
                </div>
            </div>
            <div class="add-about-box parent-about-3">
                <em class="add-about-bg3"></em>
                <div class="about-frid">邀请专业达人</div>
                <div class="about-add about-add-3">
                    <c:choose>
	                    <c:when test="${not empty list }">
	                    	<c:set var="flag10" value="true"/>
		                    <c:forEach items="${list }" var="item" varStatus="i">
			                    <c:if test="${item.appcode eq '10' }">
			                    	<c:set var="flag10" value="false"/>
				                    <span onclick="saveIndexApp(this)" ${item.isdel eq 0?'class="active"':'' }  data-appcode="10" data-id="${item.id }" data-isdel="${item.isdel }">${item.isdel eq 0?"移除":"添加" }</span>
			                    </c:if>
			                    <c:if test="${i.last and  flag10}">
				                    <span onclick="saveIndexApp(this)"  data-appcode="10" data-id="" data-isdel="1">添加</span>
			                    </c:if>
		                    </c:forEach>
	                    </c:when>
	                    <c:otherwise>
		                    <span onclick="saveIndexApp(this)"  data-appcode="10" data-id="" data-isdel="1">添加</span>
	                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/iscroll4.2.5.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.index.js?v=2222222"></script>
        <script type="text/javascript">
        var changeNum = 0;
        $(function () {

                var $btnBack = $('#btn-left-1');
                $btnBack.bind('click', function () {
                	if(changeNum > 0 ){
                		window.location.href = "${basepath}/m/ext/enn/ask/index.xhtml";
                	}else{
                    	window.history.go(-1);
                	}
                });
                
            });
            
        function saveIndexApp(_this) {
            
        	var $temp = $(_this);
            var isdel = $temp.data('isdel');
            var id = $temp.data('id');
            var appcode = $temp.data('appcode');
            
            var obj = new Object();
            obj.id = id;
            obj.appcode = appcode;
            
            if(isdel == 0) {
            	$($temp).removeClass('active');
            	$($temp).html('添加');
            	$temp.data("isdel","1");
	           	obj.isdel = 1;
            	console.log(isdel);
            } else {
            	$($temp).addClass('active');
            	$($temp).html('移除');
            	$temp.data("isdel","0");
	           	obj.isdel = 0;
            	console.log(isdel);
            }
            
            
            $.ajax({
				type:"POST",
				url:"${basepath}/m/ext/enn/column/saveindexapp.json",
				data: JSON.stringify(obj),
				cache:false,
				contentType: "application/json; charset=utf-8",
				success:function(entity){
					$temp.data("id",entity.id);
					changeNum++;
				},
				error:function(){
				}
			});
            
            console.log(111111);
            
            
        }            
            
            
        </script>
	</body>
</html>
