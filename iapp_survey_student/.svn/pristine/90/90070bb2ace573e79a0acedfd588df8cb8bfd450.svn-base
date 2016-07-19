<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<% 
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE html>
<html>
<head>
    <title>${examination.examName }</title>
    <link rel="stylesheet" href="${basepath }/static/css/easydialog.css">
    <link rel="stylesheet" href="${basepath }/static/m/new.css">
    
    <script type="text/javascript" src="${basepath }/static/m/nui/js/zepto.js"></script>
    <script type="text/javascript" src="${basepath }/static/js/easydialog.min.js"></script>
    <script type="text/javascript" src="${basepath }/static/js/weixin.js"></script>
    <script type="text/javascript">
    	function goback(){
    		easyDialog.open({
    	        container : {
    	            header : '提示',
    	            content : '<div style="background-color: #ffffff;width:260px;height:40px;">您确定退出吗？</div>',
    	            yesFn : Backbtn,
    	            noFn : true
    	        }
    	    });

    	}
		
    	var Backbtn = function(){
			window.history.go(-1);
        }
        
    	function changeGoback()
		{
    		// Backbtn = function(){
    			//ajyapp.gobacks();
            //}
		}
     </script>
</head>
<body style="background-color: #E9EEF1">
    <div class="testpaper">
        <div class="testpaper-info">
           <span class="paperinfo-left">
                <i class="fa fa-file-text"></i>&nbsp;&nbsp;总共：${totalNum }题
            </span>
           <%--   <span class="paperinfo-right">
                总分:${exam['score_total'] }&nbsp;&nbsp;及格分:${exam['score_pass'] }
            </span> --%>
            
            <span class="paperinfo-right">
                当前第<span id="tNum">1</span>题
            </span>
        </div>
        <form action="${basepath }/m/exam/savetestinfo.xhtml" id="form" method="post">
	        <div class="questionbox">
	        	<c:forEach items="${quesetions }" var="item" varStatus="st">
	        		<c:if test="${item['type'] eq 1 or item['type'] eq 2}">
	        			 <div class="question-item" id="${st.count }question" style="${st.count ne 1 ?'display:none':''}">
			                <span class="question-item-title">${item['title'] }&nbsp;&nbsp;[${item['score'] }分]
			                	<span class="question-item-type">
			                		<c:if test="${item['type'] eq 1}">
			                		(判断题)
			                		</c:if>
			                		<c:if test="${item['type'] eq 2}">
			                		(单选题)
			                		</c:if>
			                	</span>
			                </span>
			                <div class="question-item-content">
			                	<c:forEach items="${item['options'] }" var="option">
			                		 <label for="${item['id'] }_${option['no'] }" class="question-item-o">
				                        <input type="radio" name="${item['id'] }"  id="${item['id'] }_${option['no'] }" value="${option['no'] }" >${option['content'] }
				                    </label>
			                	</c:forEach>
			                </div>
			            </div>
	        		</c:if>
	        		
	        		<c:if test="${item['type'] eq 3}">
	        			<div class="question-item"  id="${st.count }question" style="${st.count ne 1 ?'display:none':''}">
			                <span class="question-item-title">${st.count }.${item['title'] }&nbsp;&nbsp;[${item['score'] }分]<span class="question-item-type">(多选题)</span></span>
			                <div class="question-item-content">
			                	<c:forEach items="${item['options'] }" var="option">
			                		<label for="${item['id'] }_${option['no'] }" class="question-item-o">
				                        <input type="checkbox" name="${item['id'] }" id="${item['id'] }_${option['no'] }"  value="${option['no'] }">${option['content'] }
				                     </label>
			                	</c:forEach>
			                </div>
	            		</div>
	        		</c:if>
	        		
	        		<c:if test="${item['type'] eq 4}">
	        			<c:set value="1" var="hasMulti"></c:set>
	            		<div class="question-item" id="${st.count }question" style="${st.count ne 1 ?'display:none':''}">
			                <span class="question-item-title">${st.count }.${item['title'] }&nbsp;&nbsp;[${item['score'] }分]<span class="question-item-type">(问答题)</span></span>
			                <div class="question-item-content">
			                    <textarea name="${item['id'] }"></textarea>
			                </div>
			            </div>
	        		</c:if>
	        	</c:forEach>
	           
	            <!-- <div class="question-item" id="card" style="display: none">
	               这里是放置答题卡的地方
	                <span class="question-item-title">答题卡<i class="fa fa-times" onclick="easyDialog.close()"></i></span>
	               <ul class="question-card">
	                   <li><span class="sured">1</span></li>
	                   <li><span>2</span></li>
	                   <li><span>3</span></li>
	                   <li><span>4</span></li>
	                   <li><span>5</span></li>
	                   <li><span>6</span></li>
	               </ul>
	                <span class="btn btn-success">返回题目</span>
	            </div> -->
	            <input type="hidden" id="preview" value='<c:out value="${preview }"></c:out>'>
	            <input type="hidden" name="tid" value="${exam['id'] }">
	            <input type="hidden" name="ids" value="${ids}">
	            <input type="hidden" name="uid" value="${uid}">
	            <input type="hidden" name="start_time" value="${start_time }">
	            <input type="hidden" name="score_total" value="${exam['score_total'] }">
	            <input type="hidden" name="score_pass" value="${exam['score_pass'] }">
	            <input type="hidden" name="hasMulti" value="${hasMulti}">
	        </div>
        </form>
        <div class="paper-footer">
              <ul id="controlbox" style="height:40px;line-height:40px;">
            	<li onclick="goback();"  style="width:15%;display:block;overflow:hidden;height:40px;line-height:40px;font-size:24px;color:#fff;text-align:center;">
                    <i style="display: inline-block;height:40px;line-height:40px;width:100%;" class="fa fa-angle-left"></i>
                </li>
                <li onclick="prev('${totalNum }')" id="prevButton" style="width:28%;display:block;overflow:hidden;height:40px;line-height:40px;">
                    &nbsp;
                </li>
                <li onclick="submitForm()" id="submitButton"  style="width:28%;height:40px;line-height:40px;">
                    提交
                </li>
               <!--<li onclick="detail()">-->
                   <!--详情-->
               <!--</li>-->
                <li onclick="next('${totalNum }')" id="nextButton"  style="width:28%;height:40px;line-height:40px;">
                    ${totalNum>1 ? '下一题<i class="fa fa-arrow-right"></i>' : '' }
                </li>
            </ul>
        </div>
    </div>
</body>
</html>
<%@include file="/WEB-INF/include/wx.jsp"%>
<%@include file="/WEB-INF/include/analysis.jsp"%>