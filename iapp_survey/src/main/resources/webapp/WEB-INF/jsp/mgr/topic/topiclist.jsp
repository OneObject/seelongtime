<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ page import="com.longtime.app.config.Constants"%>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>

<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>   
		       <th width="5%">
              <label>
                <input type="checkbox" value="1" onclick="checked_all(this)"/>
               </label>
              </th>
               <th width="5%">序号</th>
			   <th width="">内容</th>
               <th width="15%">创建时间</th>
               <th width="26%">操作</th>
		</tr>
	</thead>
	<tbody id="praiselist">
	<c:if test="${empty list }">
		<tr>
			<td colspan="5"style="text-align:center">
			暂无数据记录
			</td>
		</tr>
	</c:if>
	<c:forEach var="v" items="${list}" varStatus="vs">
		<tr>
		    <td>
                  <label>
                    <input name="ids" id="${v.id }" type="checkbox" value="${v.id }" />
                   </label>
             </td>
			<td width="5%">${vs.index+1 }</td>
			<td class="contanttext" >
			<c:if test="${v.recommend eq 1}"><span style="color: red;" >(荐)</span></c:if>
			<c:if test="${v.top >0}"><span style="color: red;" >(顶)</span></c:if>
			<c:if test="${v.shield eq 1}"><span style="color: red;" >(屏)</span></c:if>
			${ltfun:html2Text(v.content,90)}   
			<c:forEach var="imgentry" items="${images }"  >
				<c:if test="${v.id eq imgentry.key}"><br/>
					 <c:forEach var="imgsrc" items="${imgentry.value }"  >
					 	<img src="<%=Constants.TOPIC_COVER_BASE %>${imgsrc }-80x80" onclick="window.open('<%=Constants.TOPIC_COVER_BASE %>${imgsrc }');">	
					 </c:forEach>
				</c:if>
			</c:forEach> 
			<c:if test="${not empty v.audiourl}"><br/>
					<audio controls="controls">
						<source
							src="<%=Constants.IMG_SERVER_DOWNLOAD%>/${v.audiourl }" type="audio/mp3" ></source>
							 您的浏览器不支持audio标签，请升级
					</audio>
				</c:if>
			</td>
			<td  width="15%">
			<d:formatDate currentTime="${v.createtime}" format="yyyy-MM-dd HH:mm"/>
			</td>
			<td width="">	
			<a href="javascript:void(0);" onclick="delstudent('${v.id}');">删除</a> &nbsp;
			<a href="${basepath}/mgr/topic/commentstudentindex.xhtml?topicid=${v.id}" >评论管理</a>&nbsp;
			<a href="${basepath}/mgr/praise/praiseindex.xhtml?resid=${v.id}&restype=2" >赞管理</a>
			&nbsp;
			<c:if test="${v.recommend eq 1}">
			<a href="javascript:void(0);" onclick="recommend('${v.id}')" id="recommend_${v.id}" r="1">取消推荐</a>
			</c:if>
			<c:if test="${v.recommend eq 0 }">
			<a href="javascript:void(0);" onclick="recommend('${v.id}')" id="recommend_${v.id}" r="0">推荐</a>
			</c:if>
			&nbsp;
			<c:if test="${v.top eq 0 }">
			<a href="javascript:void(0);" onclick="totop('${v.id}');" id="top_${v.id}" t="0">置顶</a>
			</c:if>
			<c:if test="${v.top>0 }">
			<a href="javascript:void(0);" onclick="totop('${v.id}');" id="top_${v.id}" t="1">取消置顶</a>
			</c:if>
			&nbsp;
			<c:if test="${v.shield eq 0}">
				<a href="javascript:void(0);" onclick="shield('${v.id}',1);" id="shield${v.id}" >屏蔽 </a>
			</c:if>
			
			<c:if test="${v.shield eq 1}">
			<a href="javascript:void(0);" onclick="shield('${v.id}',0);" id="shield${v.id}" >取消屏蔽 </a>
			</c:if>
			
			</td>
		</tr>
</c:forEach>
	</tbody>
</table>
<script type="text/javascript">
var flag=true;
/**
 * 全部选中
 */
//var flag = true;//没有选中的情况下是true
function checked_all(o){
	if(flag){
		$("input[name='ids']").each(function(){
			$(this).attr("checked","checked");
		});
		flag = false;
	}else{
		$("input[name='ids']").each(function(){
			$(this).removeAttr("checked");
		});
		flag = true;
	}
	
}

</script>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>

</div>
