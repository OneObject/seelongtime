<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<ul class="list_list" id="block_content" style="display: block;overflow:hidden;">
    <c:choose>
        <c:when test="${empty list }">
            <li>没有相关记录！</li>
        </c:when>
        <c:otherwise>
    <c:forEach var="item" items="${list }" varStatus="index" >
        <li class="list_item_folder ${item.cssClass }" id="block_${item.id }">
            <table>
                <tr>
                    <td>
                        <i class="glyphicon glyphicon-book"></i>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="item_name">${ltfun:html2Text(item.name, 10)}</span>
                    </td>
                </tr>
                <tr>
                	<td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <span class="upload_time">${ltfun:dateLongToStringFormat(item.createTime,'yyyy-MM-dd HH:mm') }</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="modify_time">${item.sizeMb }&nbsp;Mb</span>
                    </td>
                </tr>
            </table>
            <div class="remove_item hidden" style="margin-top:-170px;" id="remove_${item.id }"><i class="glyphicon glyphicon-remove" onclick="deleteSingle('${item.id}')"></i></div>
        </li>
    </c:forEach>
        </c:otherwise>
    </c:choose>
</ul>

<!-- <table class="table table-striped table-bordered table-hover table-full-width datatable" id="list_content"> -->
<table class="table table-striped table-bordered table-hover table-full-width datatable hidden table-advance" id="list_content">
    <thead>
        <tr>
            <%-- <th><label> <input type="checkbox" value="1" onclick="checked_all(this)" name='' />
            </label></th> --%>
            <th>序号</th>
            <th>文件名</th>
            <th onclick="page(1, 'createTime')" class="sorting<c:out value='${orderField eq "createTime" ? orderDirection:"" }' />" id="createTime">上传时间</th>
            <th onclick="page(1, 'size')" class="sorting<c:out value='${orderField eq "size" ? orderDirection:"" }' />" id="size">文件大小</th>
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
            <%-- <td><label> <input type="checkbox" value="${item.id }" name='ids'/>
            </label></td> --%>
            <td class="highlight">
                <div class="${item.cssClass2 }"></div>
                &nbsp;&nbsp;${num.index+1 }
            </td>
            <td>
                <span id="name_${item.id }" title="${item.name }">${ltfun:html2Text(item.name, 15)}</span>
            </td>
            <td>
                <span>${ltfun:dateLongToStringFormat(item.createTime, 'yyyy-MM-dd HH:mm') }</span>
            </td>
            <td>
                <span>${item.sizeMb }&nbsp;Mb</span>
            </td>
            <td>
                <a href="javascript:void(0);" onclick='deleteSingle("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-remove"></i>&nbsp;删除</span></a>
            </td>
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

                           
<c:set var="pager" value="${page }" scope="request"></c:set>
<div style="width:100%;clear:both;height:30px;margin-top:10px;display:block;">
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
</div>
<!-- <style type="text/css">
.remove_item{display:none;}
.remove_item:hover{display:none;}
</style> -->
