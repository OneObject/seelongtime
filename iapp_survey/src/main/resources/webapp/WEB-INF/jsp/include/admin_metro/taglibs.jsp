<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions" prefix="ltfun" %>
<%@ taglib uri="http://www.longtimeit.com/iapp" prefix="d" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<c:set var="SERVER" value="http://${pageContext.request.serverName}:${pageContext.request.serverPort}" />
<c:set var="basepath" value="${SERVER}${pageContext.request.contextPath}" />
<c:set var="path" value="${SERVER}${pageContext.request.contextPath}" />
<c:set var="requestURL" value="${pageContext.request.requestURL}" />
<script>
var basepath='${basepath}';
</script>
