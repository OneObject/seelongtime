<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page language="java" pageEncoding="UTF-8" %>
<aside class="menu">
        <ul class="" role="navigation">
            
            <li class="${menu_survey }" onclick="location.href='${basepath}/survey/index.xhtml'">
                <span style="width:98px;"><fmt:message key="menu.surver" bundle="${bundle}"/></span>
            </li>
            
            <li class="${menu_usercenter }" onclick="location.href='${basepath}/user/center.xhtml'">
                <span style="width:98px;"><fmt:message key="menu.usercenter" bundle="${bundle}"/></span>
            </li>
        </ul>
</aside>