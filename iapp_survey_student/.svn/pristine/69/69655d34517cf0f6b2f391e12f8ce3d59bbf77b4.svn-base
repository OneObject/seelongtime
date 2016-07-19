<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath }/static/css/320.css">
</head>
<body>
    <section class="task-list-box">
        <ul>
            <!--<li>-->
                <!--<div class="task-item">-->
                    <!--<label class="task-cion iconwarning">&lt;!&ndash;iconwarning:未完成   iconsuccess:通过     icondanger:未通过    iconinfo：已完成&ndash;&gt;-->
                        <!--<i class="fa fa-tasks"></i>-->
                    <!--</label>-->
                    <!--<div class="task-content">-->
                        <!--<span class="task-name">《新行员培训第一期作业》该提交了</span>&lt;!&ndash;label-warning:未开始   label-success:通过     label-danger:未通过    label-info：已完成&ndash;&gt;-->
                        <!--<span class="task-time">2014-12-32至2015-01-22</span>-->
                        <!--<i class="fa fa-chevron-right"></i>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</li>-->
            <c:if test="${empty tasklist}">
            <li>
               <span class="alert alert-warning" style="display:block;overflow: hidden; text-align: center;">没有数据</span>
            </li>
            </c:if>
            <c:forEach var="item" items="${tasklist}">
            <li>
                <div class="task-item">
                    <div class="task-content-style1" onclick="lookdetail('${item.id}')">
                        <span class="task-name-style1">${item.title }
                        </span><!--label-warning:未开始   label-success:通过     label-danger:未通过    label-info：已完成-->
                        <span class="task-time-style1">${ltfun:dateLongToStringFormat(item.begintime,'MM月dd日 ') }~${ltfun:dateLongToStringFormat(item.endtime,'MM月dd日 ') }</span>
                        <i class="fa fa-chevron-right"></i>
                    </div>
                </div>
            </li>
            </c:forEach>
        </ul>
    </section>
    <script type="text/javascript">
      function lookdetail(id){
          window.location.href="${basepath}/m/task/tlist.xhtml?id="+id;
          }

    </script>
</body>
</html>