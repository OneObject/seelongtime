package com.longtime.ajy.mweb.model;

import com.longtime.common.model.Entity;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;

public class TokenInfo  implements Entity<String>{

	private static final long serialVersionUID = 923255792345583206L;
	private String id;
	private String token;
	private String domain_token;
	private String domain;
	private String aeskey;
	private int isEnabled = 1;
	private String account_type;// 公众号类型，0为订阅号，1为服务号  3 企业号
	private String authentication;// 是否高级认证，0未认证，1已认证

	private String appId; // 开发者凭据
	private String appSecret; // 开发者凭据

	private String name;

	private String pass;
	
	private String agentid; // for企业号
	
	
	private boolean  oauth = false;

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getAppSecret() {
		return appSecret;
	}

	public void setAppSecret(String appSecret) {
		this.appSecret = appSecret;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getDomain_token() {
		return domain_token;
	}

	public void setDomain_token(String domain_token) {
		this.domain_token = domain_token;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public int getIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(int isEnabled) {
		this.isEnabled = isEnabled;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	
	public void setPass(String pass) {
		this.pass = pass;
	}

	public boolean enable() {
		return 1 == this.isEnabled;
	}


	public String getAccount_type() {
		return account_type;
	}

	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}

	public String getAuthentication() {
		return authentication;
	}

	public void setAuthentication(String authentication) {
		this.authentication = authentication;
	}
	
	

	public String getAeskey() {
		return aeskey;
	}

	public void setAeskey(String aeskey) {
		this.aeskey = aeskey;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	public boolean isWXQY(){
		return "3".equals(account_type);
	}

	public String getAgentid() {
		return agentid;
	}

	public void setAgentid(String agentid) {
		this.agentid = agentid;
	}


	public boolean isOauth() {
		return oauth;
	}

	public void setOauth(boolean oauth) {
		this.oauth = oauth;
	}

	@Override
	public String toString() {
		return String.format("TokenInfo [id=%s, token=%s, domain_token=%s, domain=%s, aeskey=%s, isEnabled=%s, type=%s, authentication=%s, appId=%s, appSecret=%s, name=%s, pass=%s, agentid=%s, oauth=%s]",
			id,
			token,
			domain_token,
			domain,
			aeskey,
			isEnabled,
			account_type,
			authentication,
			appId,
			appSecret,
			name,
			pass,
			agentid,
			oauth);
	}
	
	public static void main(String[] args) {
		
		TokenInfo entity = new TokenInfo();
		BeanPropertySqlParameterSource b = new BeanPropertySqlParameterSource(entity);
		
		String[] a = b.getReadablePropertyNames();
		for (String string : a) {
			System.out.println(string);
		}
	}


}
