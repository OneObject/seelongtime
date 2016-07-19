package com.longtime.app.util;

import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.commons.lang3.CharEncoding;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.config.Constants;

public class EmailSender {

	private static final Logger logger = LoggerFactory.getLogger(EmailSender.class);

	private JavaMailSenderImpl javaMailSender;

	private static ExecutorService executorService = Executors.newFixedThreadPool(1);
	
	private String alias;
	
	private String username;

	private EmailSender() {
		javaMailSender = new JavaMailSenderImpl();
		javaMailSender.setDefaultEncoding(Constants.EMAIL_DEFAULT_ENCODEING);
		javaMailSender.setHost(Constants.EMAIL_HOST);
		javaMailSender.setPort(Constants.EMAIL_PORT);
		javaMailSender.setUsername(Constants.EMAIL_USERNAME);
		javaMailSender.setPassword(Constants.EMAIL_PASSWORD);
		Properties javaMailProperties = new Properties();
		javaMailProperties.setProperty("mail.smtp.timeout", "25000");
		javaMailSender.setJavaMailProperties(javaMailProperties);
		
		this.alias = Constants.EMAIL_ALAIS;
		this.username = Constants.EMAIL_USERNAME;
	}
	
	private EmailSender(TenantConfig tenantConfig) {
		javaMailSender = new JavaMailSenderImpl();
		javaMailSender.setDefaultEncoding(Constants.EMAIL_DEFAULT_ENCODEING);
		javaMailSender.setHost(tenantConfig.getHost());
		javaMailSender.setPassword(tenantConfig.getPassword());
		javaMailSender.setPort(tenantConfig.getPort());
		Properties javaMailProperties = new Properties();
		javaMailProperties.setProperty("mail.smtp.timeout", "25000");
		javaMailSender.setJavaMailProperties(javaMailProperties);
		javaMailSender.setUsername(tenantConfig.getUsername());
		
		this.alias = tenantConfig.getAlias();
		this.username = tenantConfig.getUsername();
	}
	
	public static EmailSender getEmailSender(TenantConfig tenantConfig){
		if(tenantConfig == null || !tenantConfig.isSetEmailConfig()){
			return null;
		}
		return new EmailSender(tenantConfig);
	}
	
	
	public void sendAsyn(final String to, final String subject, final String text, final boolean html){
		executorService.execute(new Runnable() {
			@Override
			public void run() {
				send(to, subject, text, html);
			}
		});
		
	}
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

}
