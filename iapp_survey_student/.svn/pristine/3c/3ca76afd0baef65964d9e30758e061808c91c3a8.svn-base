 <%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>

<div class="new-task-box-wrapper">
<c:forEach items="${tasks }" var="item"  varStatus="i">
<div class="new-big-task-box">
               <div class="task-head closed">
                   <label class="arrow"><i class="fa fa-angle-right"></i></label>
                   <div class="text">${item.title }</div>
                   <div class="select-status-box">
                       <div class="select-status-title" data-status="closed" data-href="#" data-value="0">
                           <span>${item.status eq 0 ? '进行中':item.status eq 1 ? '未完成':'已完成' }</span><label></label>
                       </div>
                       <div class="select-status-list">
                            <span data-taskid="${item.id }" data-value="0" data-text="进行中" class="${item.status eq 0 ? 'active':'' }">进行中</span>
                            <span data-taskid="${item.id }" data-value="1" data-text="未完成" class="${item.status eq 1 ? 'active':'' }">未完成</span>
                            <span data-taskid="${item.id }" data-value="2" data-text="已完成" class="${item.status eq 2 ? 'active':'' }">已完成</span>
                       </div>
                   </div>
                   <input type="hidden" id="${item.id }_status" value="${item.status }"> 
               </div>
               <div class="task-content padding-top-0" style="display: none;">
                  <div class="green-white-line">
                      <div class="block-green border-right-0">
                          <label>1</label>修改主题任务
                      </div>
                      <div class="block-white border-left-0">
                          <label>2</label>修改辅导明细
                      </div>
                      <span class="arrow-green-white"></span>
                  </div>
                  <div class="edit-title">主题任务</div>
                  <div class="edit">
                      <textarea placeholder="" class="min-height-48  textarea-info" id="${item.id }_subject">${item.subject }</textarea>
                  </div>
                  <div class="edit-title">辅导目标</div>
                  <div class="edit">
                      <textarea placeholder="" class="min-height-48" id="${item.id }_target">${item.target }</textarea>
                  </div>
                  <div class="btn-line">
                      <div class="btn-next-step" data-id="${item.id }" onclick="nextstep(this)">
                          下一步
                      </div>
                  </div>
              </div>
          </div>
</c:forEach>
</div>

<div class="new-task-box-wrapper padding-bottom-10">
                <div class="new-big-task-box">
                    <div class="task-content padding-top-0">
                        <div class="green-white-line">
                            <div class="block-green border-right-0">
                                <label>1</label>添加主题任务
                            </div>
                            <div class="block-white border-left-0">
                                <label>2</label>添加辅导明细
                            </div>
                            <span class="arrow-green-white"></span>
                        </div>
                        <div class="edit-title">复制给</div>
                        <div class="edit border-0">
                            <div id="copy-holder" class="copy-holder">
                            	<c:forEach var="item" varStatus="v" items="${list }">
	                            	<c:if test="${uid ne item.id  }">
	                                	<span data-id="${item.id }"><label>${item.name }</label></span>
	                                </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <input type="hidden" id="${item.id }_status" value="0">
                        <div class="edit-title">主题任务</div>
                        <div class="edit">
                            <textarea placeholder="" class="min-height-48  textarea-info" id="${item.id }_subject"></textarea>
                        </div>
                        <div class="edit-title">辅导目标</div>
                        <div class="edit">
                            <textarea placeholder="" class="min-height-48" id="${item.id }_target"></textarea>
                        </div>
                        <div class="btn-line">
                            <div class="btn-next-step" data-id="${item.id }" onclick="nextstep(this)">
                                下一步
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <script type="text/javascript">
            
            
            </script>