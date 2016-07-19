<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th>
	            <label>
			    	<input type="checkbox" value="1" onclick="checked_all(this)" name='' />
	            </label>
            </th>
            <th>序号</th>
            <th>考试名称</th>
            <th>考试简介</th>
            <!-- <th>考试编号</th>
            <th>关键字</th> -->
            <th>创建状态</th>
            <th>考试状态</th>
            <th onclick="page(1, 'startTime')" class="sorting<c:out value='${orderField eq "startTime" ? orderDirection:"" }' />" id="startTime">考试开始时间</th>
            <th onclick="page(1, 'endTime')" class="sorting<c:out value='${orderField eq "endTime" ? orderDirection:"" }' />" id="endTime">考试结束时间</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="10"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
        <tr>
            <td><label>
            	<input type="checkbox" value="${item.id }" name='ids' />
            </label></td>
            			
            <td>${num.index+1 }</td>
            <td>
                <span id="name_${item.id }" title="${item.examName }">${ltfun:html2Text(item.examName, 15)}</span>
            </td>
            <%-- <td>
                <span>${item.examNo }</span>
            </td>
            <td>
                <span title="${item.keyword }">${ltfun:html2Text(item.keyword, 15)}</span>
            </td> --%>
             <td>
                <span>
                     ${ltfun:html2Text(item.content, 10)}
                </span>
            </td>
             <td>
                <span>
                     ${ajy:createStatus(4,item.id,1,domain) }
                </span>
            </td>
            <td>
                <span>
                     <c:forEach items="${examinationStatusMap }" var="status">
                         <c:if test="${status.value eq item.status}">${status.key }</c:if>
                     </c:forEach>
                </span>
            </td>
            <td>
                <span>${ltfun:dateLongToStringFormat(item.startTime,'yyyy-MM-dd HH:mm') }</span>
            </td>
            <td>
                <span>${ltfun:dateLongToStringFormat(item.endTime,'yyyy-MM-dd HH:mm') }</span>
            </td>
            <td>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        点击选择操作 <span class="caret"></span>
                 </button>
                  <ul class="dropdown-menu" role="menu">
	                    <li><a href="javascript:void(0);" onclick='detailEntity("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;详细信息</span></a></li>
	                    <li><a href="javascript:void(0);" onclick='updateEntity("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-edit"></i>&nbsp;编辑考试</span></a></li>
	                    <%-- 未发布 --%>
                        <c:if test="${item.status eq '0' }">
                            <li><a href="javascript:void(0);" onclick='release("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-plus"></i>&nbsp;发布考试</span></a></li>
                        </c:if>
                        <%-- 发布失败  --%>
                        <c:if test="${item.status eq '-1' }">
                            <li><a href="javascript:void(0);" onclick='release("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-plus"></i>&nbsp;重新发布考试</span></a></li>
                        </c:if>
                        <%-- 已发布 --%>
                        <c:if test="${item.status eq '2' }">
                            <li><a href="javascript:void(0);" onclick='refreshtestpaper("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-plus"></i>&nbsp;刷新试卷</span></a></li>
                        </c:if>
                         <%-- 考试已结束 --%>
                        <c:if test="${item.status ne '4' }">
                            <li><a href="${basepath }/mgr/itest/exam/step3.xhtml?tid=${item.id}"><span class="mytable_btn"><i class="glyphicon glyphicon-copyright-mark"></i>&nbsp;授权考试</span></a></li>
                        </c:if>
                        <%-- 已发布,考试中,考试已结束（TODO） --%>
                        <c:if test="${item.status eq '2' || item.status eq '3' || item.status eq '4' }">
                        	<li><a href="javascript:void(0);" onclick='cancelrelease("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-plus"></i>&nbsp;取消发布考试</span></a></li>
                            <li><a href="${basepath }/base/admin/itest/examination/testpaperpreviewcon.xhtml?id=${item.id}" target="blank" ><span class="mytable_btn"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;预览试卷</span></a></li>
                        </c:if>
                       
                        <%-- 考试中,考试已结束（包含问答题） --%>
                         <c:if test="${item.isContainAsk}">
                            <li><a href="${basepath }/base/admin/itest/examination/markpaperlistcon.xhtml?id=${item.id}" target="blank" ><span class="mytable_btn"><i class="glyphicon glyphicon-ok"></i>&nbsp;考试阅卷</span></a></li>
                        </c:if>
                        <%-- 考试中,考试已结束 
                        <c:if test="${item.status eq '3' || item.status eq '4' }">--%>
                            <li><a href="${basepath }/base/admin/itest/examination/listtesteecon.xhtml?tid=${item.id}" target="blank"><span class="mytable_btn"><i class="glyphicon glyphicon-subtitles"></i>&nbsp;考试情况</span></a></li>
                           <%--  <c:if test="${item.examTimes eq 1 }">
                            <li><a href="${basepath }/base/admin/itest/examination/testeepapercon.xhtml?tid=${item.id}" target="blank"><span class="mytable_btn"><i class="glyphicon glyphicon-eye-close"></i>&nbsp;考试详情</span></a></li>
                            </c:if> --%>
                          <%--</c:if>--%>
                        <%-- 考试中 --%>
                        <%-- <c:if test="${item.status eq '3'}">
                            <li><a href="${basepath }/student/itest/examination/takeexam.xhtml?tid=${item.id}&uid=${uid}" target="blank"><span class="mytable_btn"><i class="glyphicon glyphicon-registration-mark"></i>&nbsp;测试考试</span></a></li>
                        </c:if> --%>
                        <li><a href="javascript:void(0);" onclick='deleteSingle("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-remove"></i>&nbsp;删除考试</span></a></li>
                  </ul>
                </div>
                &nbsp; <a href="javascript:void(0);" onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT %>m/h5/exam/detail.xhtml?tid=${item.id}&status=${item.status}&fdomain=${item.domain}')">访问地址</a>
            </td>
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
