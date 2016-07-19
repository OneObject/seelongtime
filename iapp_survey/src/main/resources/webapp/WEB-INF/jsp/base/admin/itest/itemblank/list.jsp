<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th><label> <input type="checkbox" value="1" onclick="checked_all(this)" name='' />
            </label></th>
            <th>序号</th>
            <th>题库名称</th>
            <th onclick="page(1, 'entityMetaInfo.dateCreated')" class="sorting<c:out value='${orderField eq "entityMetaInfo.dateCreated" ? orderDirection:"" }' />" id="entityMetaInfo.dateCreated">创建时间</th>
            <th>创建人</th>
           	<th onclick="page(1, 'entityMetaInfo.dateLastModified')" class="sorting<c:out value='${orderField eq "entityMetaInfo.dateLastModified" ? orderDirection:"" }' />" id="entityMetaInfo.dateLastModified">修改时间</th>
             <th>修改人</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="8"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
        <tr>
            <td><label> <input type="checkbox" value="${item.id }" name='ids'/>
            </label></td>
            <td>${num.index+1 }</td>
            <td>
                <span id="name_${item.id }" title="${item.name }">${ltfun:html2Text(item.name, 15)}</span>
            </td>
            <td>
                <span>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateCreated, 'yyyy-MM-dd HH:mm') }</span>
            </td>
            <td>
                <span>${item.entityMetaInfo.userCreated }</span>
            </td>
            <td>
                <span>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateLastModified, 'yyyy-MM-dd HH:mm') }</span>
            </td>
            <td>
                <span>${item.entityMetaInfo.userLastModified}</span>
            </td>
            <td>
            	<a href="javascript:void(0);" onclick='detailItemblank("${item.name }","${item.content}","${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;查看详情</span></a>
            	&nbsp;&nbsp;
                <a href="javascript:void(0);" onclick='updateItemblank("${item.name}","${item.content}","${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改</span></a>
                &nbsp;&nbsp;
                <a href="javascript:void(0);" onclick='deleteSingle("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-remove"></i>&nbsp;删除</span></a>
                &nbsp;&nbsp;
                <a href="javascript:void(0);" onclick="importQuestion('${item.id}')" id="import_${item.id }"><span class="mytable_btn"><i class="glyphicon glyphicon-log-in"></i>&nbsp;导入试题</span></a>
                &nbsp;&nbsp;
                <a href="javascript:void(0);" onclick='addQuestion("${item.id}")'><span  class="mytable_btn"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加试题</span></a>
                <%-- <div class="btn-group">
                  <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        点击选择操作 <span class="caret"></span>
                 </button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="javascript:void(0);" onclick='detailItemblank("${item.name }","${item.content}","${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;查看详情</span></a></li>
                    <li><a href="javascript:void(0);" onclick='updateItemblank("${item.name}","${item.content}","${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改</span></a></li>
                    <li><a href="javascript:void(0);" onclick='deleteSingle("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-remove"></i>&nbsp;删除</span></a></li>
                    <li><a href="javascript:void(0);" onclick='importQuestion("${item.id}")' id="import_${item.id }"><span class="mytable_btn"><i class="glyphicon glyphicon-log-in"></i>&nbsp;导入试题</span></a></li>
                    <li><a href="javascript:void(0);" onclick='addQuestion("${item.id}")'><span  class="mytable_btn"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加试题</span></a></li>
                  </ul>
                </div> --%>
            </td>
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
