<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<c:if test="${empty items }">没有内容。</c:if>
<c:forEach var="item" items="${items }">
	 <div class="item">
        <div class="info">
            <a href="${basepath }/m/ext/unicom/chose/detail.xhtml?id=${item.id}">
                <span class="image">
                	<c:if test="${not empty item.cover }">
                    	<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_180_180%>" />
                	</c:if>
                	<c:if test="${empty item.cover }">
						<img src="${basepath }/static/m/ext/unicom/img/default.png" />                      		
                	</c:if>
                </span>
                <ul>
                    <li id="list-wrap">${item.title }</li>
                   <input type="hidden" name="remark" value=${item.remark }>
                   
                    
                    <li id="list-p">作者：${item.author }</li>
                    <li>部门：${item.org }</li>
                </ul>
            </a>
        </div>
        <c:if test="${fn:contains(itemIds,item.id)}">
        	<div id="${item.id }" class="zan active">
	            <span class="img"></span>
	            <span class="text">已赞</span>
	            <span class="num">${item.praisenum }</span>
	        </div>
        </c:if>
        <c:if test="${!fn:contains(itemIds,item.id)}">
        	<div id="${item.id }" class="zan">
	            <span class="img"></span>
	            <span class="text">点赞</span>
	            <span class="num">${item.praisenum }</span>
	        </div>
        </c:if>
    </div>
</c:forEach>
<script>
	$(function(){
		var $zanList = $('.zan');
	    $zanList.bind('click', function () {
	    	if(isChoseStart()){
	    		lightBlock.show("评选活动未开始！");
	    		return;
	    	}
	    	if(isChoseOver()){
	    		lightBlock.show("评选活动已结束！");
	    		return;
	    	}
	        var $boxZan = $(this);
	        var $num = $boxZan.find('.num');
	        var $text = $boxZan.find('.text');
	        var num = parseInt($num.html());
	        
	        var id = $boxZan.attr("id");
	        var choseid = $("#choseid").val();
	        if ($boxZan.is('.active')) {
	            lightDialog.show('确定取消赞？', function () {
	            	if(flag == 1){
	            		return;
	            	}
	            	flag = 1;
	            	$.ajax({
	            		url : basepath+"/m/ext/unicom/chose/praise.json",
	            		type : "POST",
	            		data : {"id":id,"choseid":choseid},
	            		success : function(data) {
	            			flag = 0;
	            			if(data == '-2'){
	            				lightDialog.show({"btnModel":1,"contentText":"该评选选项已经不存在！","footerText":["确定"]}, function () {
	            	                lightDialog.remove();
	            	            });
	            			} else if(data == '-1'){
	            				lightDialog.show({"btnModel":1,"contentText":"您已经赞了6个选项，请先取消其它已赞选项！","footerText":["确定"]}, function () {
	            	                lightDialog.remove();
	            	            });
	            			} else {
	            				$boxZan.removeClass('active');
	                            $num.html(--num);
	                            $text.html('点赞');
	                            lightDialog.remove();
	            			}
	            			
	            		},
	            		error : function() {
	            			flag = 0;
	            			lightBlock.show("系统忙，请重新尝试！");
	            		}
	            	});
	            });
	        } else {
	            lightDialog.show('确定点赞？', function () {
	            	if(flag == 1){
	            		return;
	            	}
	            	flag = 1;
	            	$.ajax({
	            		url : basepath+"/m/ext/unicom/chose/praise.json",
	            		type : "POST",
	            		data : {"id":id,"choseid":choseid},
	            		success : function(data) {
	            			flag = 0;
	            			lightDialog.remove();
	            			if(data == '-2'){
	            				lightDialog.show({"btnModel":1,"contentText":"该评选选项已经不存在！","footerText":["确定"]}, function () {
	            	                lightDialog.remove();
	            	            });
	            			} else if(data == '-1'){
	            				lightDialog.show({"btnModel":1,"contentText":"您已经赞了6个选项，请先取消其它已赞选项！","footerText":["确定"]}, function () {
	            	                lightDialog.remove();
	            	            });
	            			} else {
	            				$boxZan.addClass('active');
	                            $num.html(++num);
	                            $text.html('已赞');
	            			}
	            			
	            		},
	            		error : function() {
	            			flag = 0;
	            			lightBlock.show("系统忙，请重新尝试！");
	            		}
	            	});
	            });
	        }
	    });
	});
	
	$(function (){
		/*
		function toLength(str){
			return String(str).replace(/[^\x00-\xff]/g , 'aa').length;
		}
		*/
	})
</script>