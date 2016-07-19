<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<script type="text/javascript">
var data = 1999999999999;
</script>
<c:set var="seller_id" scope="session"> 
1999999999999
</c:set>
<c:out value="${seller_id }"/>
<d:formatDate currentTime="${seller_id }" format="yyyy-MM-dd HH:mm:ss"/>
