<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <!-- <th><label><input type="checkbox" value="" onclick="checked_all()" name='' />
            </label></th> -->
            <th>序号</th>
            <th>文件名</th>
            <th>题库名</th>
            <th onclick="page(1, 'status')" class="sorting<c:out value='${orderField eq "status" ? orderDirection:"" }' />" id="status">状态</th>
            <th onclick="page(1, 'entityMetaInfo.dateCreated')" class="sorting<c:out value='${orderField eq "entityMetaInfo.dateCreated" ? orderDirection:"" }' />" id="entityMetaInfo.dateCreated">导入时间</th>
            <th>导入人</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
    
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="8"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
        <tr>
            <%-- <td><label> <input type="checkbox" value="${item.id }" name='ids'/>
            </label></td> --%>
            <td>${num.index+1 }</td>
            <td>
                <span id="fileName_${item.id }" title="${item.fileName }">${ltfun:html2Text(item.fileName, 15)}</span>
            </td>
            <td>
                <span id="itemblankName_${item.id }" title="${item.itemblank.name }">${item.itemblank.name }</span>
            </td>
            <td>
                <span id="fileName_${item.id }">
                       <c:forEach var="mi" items="${statusMap }">
                           <c:if test="${item.status eq mi.value }">${mi.key }</c:if>
                       </c:forEach>
                </span>
            </td>
            <td>
                <span id="dateCreated_${item.id }">${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateCreated, 'yyyy-MM-dd HH:mm')}</span>
            </td>
            <td>
                <span id="userCreated_${item.id }">${item.entityMetaInfo.userCreated }</span>
                <input type="hidden" id="totalNum_${item.id }" value="${item.totalNum}" >
                <input type="hidden" id="userLastModified_${item.id }" value="${item.entityMetaInfo.userLastModified}" >
                <input type="hidden" id="dateLastModified_${item.id }" value="${ltfun:dateLongToStringFormat(logModel.entityMetaInfo.dateLastModified, 'yyyy-MM-dd HH:mm')}" >
	            <c:if test="${item.totalNum ne 0 }">
	                <c:forEach var="t" items="${tnMap }" varStatus="i">
	                    <tr>
	                        <td>${t.key }:</td>
	                        <td>${t.value }</td>
	                    </tr>
	                </c:forEach>
	            </c:if>
            </td>
            <td>
             <c:if test="${item.status != 0 }"> <!-- 状态为0的时候不显示 -->
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                            点击选择操作  ${item.status}<span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" role="menu">
                        <c:if test="${item.status eq 1 }">
  		                    <li><a href="javascript:void(0)" onclick="showError('${item.id}')"><span class="mytable_btn"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;查看错误信息</span></a></li>
                        </c:if>
                        <c:if test="${item.status eq 2 }">
		                    <li><a href="javascript:void(0)" onclick="detailItem('${item.id}')"><span class="mytable_btn"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;详细信息</span></a></li>
		                    <li><a href="javascript:void(0)" onclick="questionManage('${item.id}')"><span class="mytable_btn"><i class="glyphicon glyphicon-edit"></i>&nbsp;试题管理</span></a></li>
		                    <li><a href="javascript:void(0)" onclick="undoImport('${item.id}')"><span class="mytable_btn"><i class="glyphicon glyphicon-remove"></i>&nbsp;撤消</span></a></li>
                        </c:if>
                        <c:if test="${item.status eq 3 }">
		                    <li><a href="javascript:void(0)" onclick="detailItem('${item.id}')"><span class="mytable_btn"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;详细信息</span></a></li>
                        </c:if>
                  </ul>
                </div>
          </c:if>
            </td>
        </tr>
        </c:forEach>
        </c:otherwise>
        </c:choose>
    </tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
