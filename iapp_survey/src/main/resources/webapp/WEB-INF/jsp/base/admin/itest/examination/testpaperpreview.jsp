<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>

<c:forEach var="testQuestion" items="${qList }" varStatus="state">
<c:if test="${testQuestion.type eq '1' }">
<!-- 判断 -->
<table class="table table-striped table-bordered table-hover table-full-width datatable yulan">
    <thead>
        <tr>
            <th class="num">
                <span>${state.count }</span>
            </th>
            <th colspan="2">
                <span>
                    ${testQuestion.title }
                </span>    
                <div class="tyf-sb">
	             	<span>正确：<label class="right">${map[testQuestion.id].correct}</label></span>
	                <span>错误：<label class="error">${map[testQuestion.id].wrong}</label></span>
	                <span>未回答：<label class="normal">${map[testQuestion.id].unanswer}</label></span>
	                <span>正确率：<label><fmt:formatNumber value="${map[testQuestion.id].percent}"  type="percent"/></label></span>
            	</div>           
            </th>

        </tr>
     <c:forEach var="option" items="${testQuestion.options }" varStatus="state">
        <tr>
            <td>&nbsp;</td>
            <td class="num">${option.no}</td>
             <c:if test="${testQuestion.answer eq option.no }">
              <td>
                  <input type="radio" disabled="disabled" checked="checked" name="trueOrFalse${testQuestion.id}" onclick="return false">${option.content }
              </td>
             </c:if>
             <c:if test="${testQuestion.answer != option.no }">
                    <td>
                        <input type="radio" disabled="disabled" name="trueOrFalse${testQuestion.id}" onclick="return false">${option.content }
                    </td>
             </c:if>
        </tr>
     </c:forEach>
    </thead>
</table>
</c:if>
<!-- 单选 -->
<c:if test="${testQuestion.type eq '2' }">
<table class="table table-striped table-bordered table-hover table-full-width datatable yulan">
	<thead>
		<tr>
			<th class="num">
				<span>${state.count }</span>
</th>
<th colspan="2">
	<span>
		${testQuestion.title }
		</span>
		     <div class="tyf-sb">
	             	<span>正确：<label class="right">${map[testQuestion.id].correct}</label></span>
	                <span>错误：<label class="error">${map[testQuestion.id].wrong}</label></span>
	                <span>未回答：<label class="normal">${map[testQuestion.id].unanswer}</label></span>
	                <span>正确率：<label><fmt:formatNumber value="${map[testQuestion.id].percent}"  type="percent"/></label></span>
            	</div>     
	</th>
</tr>
<c:forEach var="option" items="${testQuestion.options }" varStatus="state">
<tr>
             <td>&nbsp;</td>
             <td class="num">${option.no}</td>
            <c:if test="${testQuestion.answer eq option.no }">
                <td>
                    <input type="radio" value="${option.no}" checked="checked" onclick="return false;" disabled="disabled"/>
                    <%-- <textarea style="width:617px;height:30px" name="option${option.no}" id="q_option"  readonly="readonly"></textarea> --%>${option.content }
                </td>
            </c:if>
            <c:if test="${testQuestion.answer ne option.no }">
                <td>
                    <input type="radio" value="${option.no}" onclick="return false;" disabled="disabled" />
                    <%-- <textarea style="width:617px;height:30px" name="option${option.no}" id="q_option"  readonly="readonly" ></textarea> --%>${option.content }
                </td>
            </c:if>
</tr>
</c:forEach>
	</thead>
</table>
</c:if>
<!-- 多选 -->
<c:if test="${testQuestion.type eq '3' }">
<table class="table table-striped table-bordered table-hover table-full-width datatable yulan">
	<thead>
           <tr>
               <th class="num">
                   <span>${state.count }</span>
            </th>
            <th colspan="2">
                <span>
                    ${testQuestion.title }
                </span>
                  <div class="tyf-sb">
	             	<span>正确：<label class="right">${map[testQuestion.id].correct}</label></span>
	                <span>错误：<label class="error">${map[testQuestion.id].wrong}</label></span>
	                <span>未回答：<label class="normal">${map[testQuestion.id].unanswer}</label></span>
	                <span>正确率：<label><fmt:formatNumber value="${map[testQuestion.id].percent}"  type="percent"/></label></span>
            	</div>     
            </th>
        </tr>
        <c:forEach var="option" items="${testQuestion.options }" varStatus="state">
        <tr>
           <td>&nbsp;</td>
           <td class="num">${option.no}</td>
             <c:if test="${fn:contains(testQuestion.answer, option.no)}">
                 <td>
                     <input type="checkbox" value="${option.no}" checked="checked" disabled="disabled"/>${option.content }
                     <%-- <textarea style="width:617px;height:30px" name="option${option.no}" id="q_option" readonly="readonly">${option.content }</textarea>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
                 </td>
             </c:if>
             <c:if test="${!fn:contains(testQuestion.answer, option.no)}">
                 <td>
                     <input type="checkbox" value="${option.no}" disabled="disabled"/><input type="hidden" value="${option.no}" name="qs_answerHid"/>${option.content }
                     <%-- <textarea style="width:617px;height:30px" name="option${option.no}" id="q_option"  readonly="readonly">${option.content }</textarea>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
                 </td>
             </c:if>
</tr>
</c:forEach>
	</thead>
</table>
</c:if>
<!-- 问答 -->
<c:if test="${testQuestion.type eq '4' }">
<table class="table table-striped table-bordered table-hover table-full-width datatable yulan">
	<thead>
           <tr>
               <th class="num">
                   <span>${state.count }</span>
            </th>
            <th colspan="2">
                <span>
                    ${testQuestion.title }
                 </span>
             </th>
         </tr>
<tr>
	<td colspan="2" class="cankao">
		<span class="btn default btn-xs green-stripe">参考答案</span>
		</td>
	<td>${testQuestion.answer }
			</td>
		</tr>
	</thead>
</table>
</c:if>
</c:forEach>
