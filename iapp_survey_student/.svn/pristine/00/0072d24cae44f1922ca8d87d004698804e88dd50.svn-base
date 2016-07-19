<%@page import="javax.sound.midi.SysexMessage"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="org.apache.commons.lang3.StringUtils"%>
<%@ page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page import="com.longtime.ajy.model.vo.TenantInfo"%>
<% 
	TenantInfo tenantInfo = MwebHelper.getTenantInfo();
	String color = tenantInfo.getColor();
	if(StringUtils.isBlank(color)){
		color = "#9acf60";
	}
	
	boolean isFromWeiXinBrowser = false;//MwebHelper.isFromWeiXinBrowser(request);
%>
<style type="text/css">

	#login_register{color:<%=color%>;}

	section.sender a:active,section.sender a,section.test ul li span.a,a.sub,header{background-color:<%=color%>;}
	section.result ul li.face_g i{color:<%=color%>;}
	section.option a.cur{color:<%=color%>;border-color:<%=color%>;}
	section.testOnline a li.state label.now{background-color:<%=color%>;}
	
	article.scroll a.sub:active{background-color:<%=color%>;}
	
	section.login div{border:1px solid <%=color%>;}
	section.login a{background:<%=color%>;}
	section.login a:active{background-color:<%=color%>;}
	.addClass{background-color:<%=color%>;}
	.ts_bgcolor{background-color:<%=color%>;}
	/*默认首页主题颜色*/	
	article.default nav div a:active{background:#f4f4f4;color:<%=color%>;}
	/*调研模块*/
	.survey section.questionBox dl dd span.dan{background-color:<%=color%>;}
	.survey section.questionBox dl dd span.duo{background-color:<%=color%>;}
	.survey section.submit span{border-color:<%=color%>;color:<%=color%>;}
	.survey section.questionBox dl.grade dd label.cur{background:<%=color%>;}
	.survey section.infoBox ul li span{color:<%=color%>;}
	.survey section.msgBox p{border-color:#f0f3f9;background:#f0ffd1;color:<%=color%>;}
	.survey section.infoBox p.msg{border-color:#f0f3f9;background:#f0ffd1;color:<%=color%>;}
	.survey section.questionBox dl.result dd span.per label{background:<%=color%>;}
	
	.survey section.resultBox dl dd span.per label.a{background:<%=color%>;}
	.survey section.resultBox dl dd span:last-child{color:<%=color%>;}
	.survey section.resultBox dl dd label.color{color:<%=color%>;}
	.survey section.questionBox dl.result dd span.per label{background:<%=color%>;}
	.survey section.resultBox dl dd span.per+span{color:<%=color%>;}
	
	.survey section.questionBox dl dt.label label.block{background-color:<%=color%>;}
	.survey section.resultBox dl dt.label label.block{background-color:<%=color%>;}
	
	/*考试、练习模块*/
.kaoshi section.questionBox ul.score li:first-child + li{color:<%=color%>;}
.kaoshi section.questionBox ul.score li.a{color:#bbd782;}
.kaoshi section.questionBox ul.score li.b{color:#d64156;}
.kaoshi section.questionBox div.retry{border-color:<%=color%>;color:<%=color%>;}

.kaoshi section.questionBox dl dd span.dan{background-color:<%=color%>;}
.kaoshi section.questionBox dl dd span.duo{background-color:<%=color%>;}

.kaoshi section.questionBox div.errorMsg{background:#f2dede;color:#d64156;}
.kaoshi section.questionBox dl dd.correct{border-color:#bbd782;}

.kaoshi section.questionBox .rank{color:<%=color%>;}



.kaoshi section.guideBox span{color:<%=color%>;}

.kaoshi section.questionBox dl dt span.a i{color:#d64156;}
.kaoshi section.questionBox dl dt span.b i{color:#bbd782;}
.kaoshiDetail section.enterKaoshi div.start{border-color:<%=color%>;color:<%=color%>;}
.kaoshiDetail section.moreInfo .rank{color:<%=color%>;}

/*问答模块*/
article.wenda .wendaBox a>div span:first-child label{color:<%=color%>;}
article.wenda .optionBox span:first-child{color:<%=color%>;}
article.wenda .optionBox span.options{color:<%=color%>;}
article.wenda .txt div+span{background:<%=color%>;}

/*作业模块*/
article.zuoye nav ul{border-color:<%=color%>;}
article.zuoye nav ul li{color:<%=color%>;}
article.zuoye nav ul li:first-child+li{border-left-color:<%=color%>;border-right-color:<%=color%>;}
article.zuoye nav ul li.cur{background:<%=color%>;}
article.zuoye .list2 a ul li span.a{color:#d64156;}
article.zuoye .list2 a ul li span.b{color:#bbd782;}
article.zuoye .detailBox span.sub{border-color:<%=color%>;color:<%=color%>;}
article.zuoye .comment1 ul li:first-child span label{color:<%=color%>;}
article.zuoye .comment1 ul li:first-child+li span.a{color:#d64156;}
article.zuoye .comment1 ul li:first-child+li span.b{color:#bbd782;}
article.zuoye .zuoyeList a ul li span.a{color:#d64156;}
article.zuoye .zuoyeList a ul li span.b{color:#bbd782;}
article.zuoye span.uploadSub{border-color:<%=color%>;color:<%=color%>;}

/*注册页面*/
.submitbtn{background-color:<%=color%>;}

/*课程详情*/
.funcBox span,.funcBox1 span{color:<%=color%>;}

.kaoshi section.questionBox div.retry1 span{border-color:<%=color%>;color:<%=color%>;}

.editSub{border-color:<%=color%>;color:<%=color%>;}
.editSub a {color:<%=color%>;}
.sign-content .box-signed .info{color:<%=color%>;}
.sign-content .box-to-sign .btn-sign{background: <%=color%>;}

/**/
article.msgList nav ul{border-color:<%=color%>;}
article.msgList nav ul li{color:<%=color%>;}
article.msgList nav ul li:first-child+li{border-color:<%=color%>;}
article.msgList nav ul li.cur{background-color:<%=color%>;}
.module-tab .tab-list span {border-color:<%=color%>!important; color:<%=color%>!important;}
.module-tab .tab-list span.active{background-color:<%=color%>!important;color:#fff!important;}
/**报名签到对话框*/
div.dialogBox1 .dialogHeader { border-bottom: 1px solid <%=color%>; color: <%=color%>;} 
.view-result{color: <%=color%> !important;}
/*通用提示框模块*/
div.dialogBox .dialogHeader{color:<%=color%>;border-bottom-color:<%=color%>;}
	<% 
		if(tenantInfo.isShownavigation() == false && isFromWeiXinBrowser == true){
	%>
		.ctl_header{display:none;}
		.ranklist .ctl_header{display:none;}
		img.ctl_cont{padding-top:0px;}
		article.ctl_cont{padding-top:0px;}
		div.ctl_cont{padding-top:0px;}
		.ctl_rl{display:none;}
	<%
		}else {
	%>
		.ctl_header{display:block;}
		.ranklist .ctl_header{display:block;}
		img.ctl_cont{padding-top:50px;}
		article.ctl_cont{padding-top:50px;}
		div.ctl_cont{padding-top:50px;}
		.ctl_rl{display:block;}
	<%
		}
	%>
	}
</style>