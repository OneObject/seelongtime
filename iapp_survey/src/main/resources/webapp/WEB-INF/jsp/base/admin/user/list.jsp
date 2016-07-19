<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
   <thead>
      <tr>
          <th>
              <label>
	                <input type="checkbox" value="1" onclick="checked_all(this)"/>
               </label>
          </th>
         <th>序号</th>
         <th onclick="page(1, 'username')" class="sorting<c:out value='${orderField eq "username" ? orderDirection:"" }' />" id="username">用户名</th>
         <th>姓名</th>
         <%-- <th onclick="page(1, 'username')" class="sorting<c:out value='${orderField eq "username" ? orderDirection:"" }' />" id="username">用户名</th> --%>
         <th>邮箱</th>
         <th onclick="page(1, 'mobile')" class="sorting<c:out value='${orderField eq "mobile" ? orderDirection:"" }' />" id="mobile">手机</th>
         <th>昵称</th>
         <th>部门</th>
         <th>职级</th>
         <%-- <th onclick="page(1, 'phone')" class="sorting<c:out value='${orderField eq "phone" ? orderDirection:"" }' />" id="phone">工作电话</th>
         <th onclick="page(1, 'certificateType')" class="sorting<c:out value='${orderField eq "certificateType" ? orderDirection:"" }' />" id="certificateType">证件类型</th>
         <th onclick="page(1, 'certificateCode')" class="sorting<c:out value='${orderField eq "certificateCode" ? orderDirection:"" }' />" id="certificateCode">证件号码</th> --%>
         <th onclick="page(1, 'gender')" class="sorting<c:out value='${orderField eq "gender" ? orderDirection:"" }' />" id="gender">性别</th>
         <th onclick="page(1, 'birthday')" class="sorting<c:out value='${orderField eq "birthday" ? orderDirection:"" }' />" id="birthday">生日</th>
         <!-- <th class='notqywx'>绑定状态</th>
         <th class='qywx'>同步状态</th>
         <th class='qywx'>关注状态</th> -->
         <th>操作</th>
      </tr>
   </thead>
   <tbody id="tbody">
   
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="14"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
      <c:forEach var="item" items="${list }" varStatus="st">
          <tr>
               <td>
               <c:if test="${item.type!=1 && item.type!=2}">
                   <label>
                    <input name="ids" id="${item.id }" type="checkbox" value="${item.id }" />
                   </label>
               </c:if>
              </td>
             <td>${st.count }</td>
             <td title="${item.username }">${ltfun:html2Text(item.username, 15)}</td>
             <td title="${item.name }">${ltfun:html2Text(item.name, 15)}</td>
             <td title="${item.email }">${ltfun:html2Text(item.email, 15)}</td>
             <td>${item.mobile }</td>
             <td title="${item.nickName }">${ltfun:html2Text(item.nickName, 15)}</td>
             <td title="${ajy:orgFullName(item.organization.id)}">${ltfun:html2Text(item.organization.name, 15)}</td>
            
            

             <td title="${item.jobLevelEntity.name}">${item.jobLevelEntity.name}</td>
             <%-- <td>${item.phone }</td>
             <td>
                ${certTypeMap[item.certificateType] }
             </td>
             <td>${item.certificateCode }</td> --%>
             <td>
                ${genderMap[item.gender] }
             </td>
             <td>${ltfun:dateLongToStringFormat(item.birthday, 'yyyy-MM-dd')  }</td>
            <%--  <td class='notqywx'>
             	<c:if test="${item.isbind == 0}">
             		未绑定
             	</c:if>
             	<c:if test="${item.isbind == 1}">
             		已绑定
             	</c:if>
             </td>
             <td class='qywx'>
             <c:if test="${item.synchronousstatus==1 }">
             		已同步
             </c:if>
             <c:if test="${item.synchronousstatus==-1 }">
             		同步失败
             </c:if>
             <c:if test="${item.synchronousstatus==-2||item.synchronousstatus==-4 }">
             		无需同步
             </c:if>
             <c:if test="${item.synchronousstatus==0&&item.synctype==0 }">
             		新增未同步
             </c:if>
              <c:if test="${item.synchronousstatus==0&&item.synctype==2 }">
             		修改未同步
             </c:if>
             </td>
             <td class='qywx'>
             <c:if test="${item.attentionstatus==-1}">
             		邀请失败
             </c:if>
             <c:if test="${item.attentionstatus==0}">
             		未邀请
             </c:if>
             <c:if test="${item.attentionstatus==1 }">
             		已邀请
             </c:if>
             <c:if test="${item.attentionstatus==2 }">
             		已关注
             </c:if>
             <c:if test="${item.attentionstatus==3 }">
             		取消关注
             </c:if>
              <c:if test="${item.attentionstatus==-2 }">
             		已冻结
             </c:if>
               <c:if test="${item.attentionstatus==4 }">
             		未关注
             </c:if>
             </td> --%>
             <td>
				<c:if test="${item.isbind == 1}">
                  <a href="javascript:void(0);" onclick="cancelBind('${item.id}')" class="notqywx">
                     <span>解除绑定</span>
                  </a>
                </c:if> 
                  <c:if test="${item.enable ==1 }">
                  <a href="javascript:void(0);" onclick="forbiddenAccount('${item.id}')">
                  <span>账号禁用</span>
                  </a>
                   </c:if>
                  
                  <c:if test="${item.enable ==0 }">
                    <a href="javascript:void(0);" onclick="enableAccount('${item.id}')">
                    <span>启用账号</span>
                    </a>
                  </c:if>
                   
                   
                  <a href="${basepath }/base/admin/user/userdetail.xhtml?id=${item.id }">
                      <span>
                         <i class="icon-eye-open"></i>
                                                                                          详情
                     </span>
                  </a>
                  <a href="${basepath }/base/admin/user/updateuser.xhtml?id=${item.id }">
                     <span>
                         <i class="glyphicon glyphicon-edit"></i>
                                                                                           编辑
                     </span>
                  </a>
                  <c:if test="${item.type!=1 && item.type!=2}">
                  <a href="javascript:void(0);" onclick="deleteSingle('${item.id}');">
                      <span>
                         <i class="glyphicon glyphicon-trash"></i>
                                                                                           删除
                     </span>
                  </a>
                 </c:if>
                 
             </td>
          </tr>
       </c:forEach>
        </c:otherwise>
    </c:choose>
   </tbody>
</table>

<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
