<%@page contentType="text/html; charset=utf-8" %>
<%@page import="com.longtime.ajy.support.PasswordEncoder"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.common.collect.Maps"%>
<%@page import="com.longtime.common.utils.MaskUtils"%>
<%@page import="com.longtime.app.email.util.EmailSender"%>
<%@page import="org.springframework.mail.javamail.*"%>
<%@page import="java.util.Properties"%>
<%@page import=" org.apache.commons.lang3.CharEncoding"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%!

Logger logger = LoggerFactory.getLogger("com.longtime.app.mic_email_send.jsp");
String host="mail.leadcess.com";
int port=25;
String username="mic@leadcess.com";
String password="123456";
String alias="上海电信微学院";
String domain="mic";
final String subject = "密码找回";
JavaMailSenderImpl javaMailSender = null;

public void send(final String to, final String subject, final String text, final boolean html) {
	logger.debug("send email start. to={} subject={} text={}", to,subject,text);
	javaMailSender.send(new MimeMessagePreparator() {
		public void prepare(javax.mail.internet.MimeMessage mimeMessage) throws Exception {
			MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, CharEncoding.UTF_8);
			message.setFrom(username, alias);
			message.setTo(to);
			message.setSubject(subject);
			message.setText(text, html);
		};
	});
	logger.debug("send email end . to={} ", to,subject,text);
}
%>
<%
if(null==javaMailSender){
	javaMailSender = new JavaMailSenderImpl();
	javaMailSender.setDefaultEncoding(CharEncoding.UTF_8);
	javaMailSender.setHost(host);
	javaMailSender.setPort(port);
	javaMailSender.setUsername(username);
	javaMailSender.setPassword(password);
	Properties javaMailProperties = new Properties();
	javaMailProperties.setProperty("mail.smtp.timeout", "25000");
	javaMailSender.setJavaMailProperties(javaMailProperties);
}



final String to = request.getParameter("to");//邮件地址
String name = request.getParameter("name"); //真实信息
String loginname = request.getParameter("loginname");//账号
String pwd = request.getParameter("pwd");//加密后密码

String callback = request.getParameter("callback");//jsonp

//String text = String.format("您好 %s: 您账号密码为 %s", StringUtils.isBlank(user.getName())?MaskUtils.mask(user.getUsername(),3,3):user.getName(),originalPwd);
boolean bool = false;

if(StringUtils.isNotBlank(to) && StringUtils.isNotBlank(name)&& StringUtils.isNotBlank(loginname)&& StringUtils.isNotBlank(pwd) ){
	String originalPwd = PasswordEncoder.decode(pwd, domain);
	final String text = String.format("<!doctype html><html><head><meta charset=\"utf-8\"></head><body><p>您好：%s</p><p>您的帐号:%s 密码为:%s<br>为保证账号安全，请及时修改密码.</p>系统邮件请勿回复.</body></html>",
		name,loginname,originalPwd);
	send(to, subject, text, true);
	
	bool = true;
}


/*
logger.debug("send email start. to={} subject={} text={}", to,subject,text);
javaMailSender.send(new MimeMessagePreparator() {
	public void prepare(javax.mail.internet.MimeMessage mimeMessage) throws Exception {
		MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, CharEncoding.UTF_8);
		message.setFrom(username, alias);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text, true);
	};
});
logger.debug("send email end . to={} ", to,subject,text);
*/

String rs = String.format("%s({rs:%s});",callback,bool);
//输出
response.setCharacterEncoding(CharEncoding.UTF_8);
response.setContentType("text/json; charset=UTF-8");
response.getWriter().write(rs);
%>
