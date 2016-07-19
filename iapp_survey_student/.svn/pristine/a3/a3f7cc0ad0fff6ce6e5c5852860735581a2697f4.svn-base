package com.longtime.ajy.support.service;

import org.apache.commons.lang3.CharEncoding;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class EmailSender {

	private static final Logger logger = LoggerFactory.getLogger(EmailSender.class);

	private JavaMailSenderImpl javaMailSender;

	private Properties javaMailProperties = new Properties();

	private String host;

	private int port = -1;

	private String username;

	private String password;

	private String defaultEncoding;

	private String alias;

	private static ExecutorService executorService = Executors.newFixedThreadPool(1);

	public Properties getJavaMailProperties() {
		return javaMailProperties;
	}

	public void setJavaMailProperties(Properties javaMailProperties) {
		this.javaMailProperties = javaMailProperties;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDefaultEncoding() {
		return defaultEncoding;
	}

	public void setDefaultEncoding(String defaultEncoding) {
		this.defaultEncoding = defaultEncoding;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public static Logger getLogger() {
		return logger;
	}

	public void init() {
		javaMailSender = new JavaMailSenderImpl();
		javaMailSender.setDefaultEncoding(defaultEncoding);
		javaMailSender.setHost(host);
		javaMailSender.setPassword(password);
		javaMailSender.setPort(port);
		javaMailSender.setJavaMailProperties(javaMailProperties);
		javaMailSender.setUsername(username);
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
