<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.longtime.common.utils.Page" %>
<%@page language="java" import="com.longtime.app.config.Constants"   %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <%-- <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th> --%>
               <th>序号</th>
			   <th>标题</th>
               <th>简介</th>
               <th>封面</th>
               <th>创建者</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty ranklist }">
		<tr>
		<td colspan="8">没有找到更多排行榜信息</td>
		</tr>
	</c:if>
	<c:forEach items="${ranklist}" var="item" varStatus="num">
	<tr>       
	           <td>${num.count}</td>
			   <td>${item.title }</td>
               <td>
               ${item.remark}
               </td>
               <td>
               <c:if test="${empty item.cover }">
                 <img src="${basepath}/static/ixin/img/rank/rank_default.png"  height="50" width="50" >
                </c:if>
                 <c:if test="${not empty item.cover}">
                 
              <img src="<%=Constants.IMG_SERVER_DOWNLOAD%>${item.cover}" height="50" width="50"></img>
              </c:if>
               </td>
                  <td>
               ${item.creatorName}
               </td>
               <td>
               <a href="#"  onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT %>m/h5/rank/detail.xhtml?id=${item.id }&fdomain=${item.domain}');">访问地址</a>
              <ltacl:datactl creatoruid="${item.creator }">
               <a href="${basepath}/mgr/rank/doupdate.xhtml?model=${model }&id=${item.id}">修改</a>
               <a href="#" id="delrank" onclick="del('${item.id}')">删除</a>
               </ltacl:datactl>
               </td>
		</tr>
	</c:forEach>
		
	</tbody>
</table>
<script type="text/javascript">
    function del(id){
         if(confirm("确定要删除吗?")){
        	 $.ajax({
  			   type:"POST",
  			   url: "${basepath}/mgr/rank/delrank.json",
  			   data: "id="+id,
  			   success: function(msg){
  				   if(msg.flag){
  					   window.location.href="${basepath}/mgr/rank/index.xhtml?model="+msg.model;
  					   }else{
                             alert("信息删除失败!");
  						   }
  			   }
  			});
             }
		 
    }
</script>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
