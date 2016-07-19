/* Copyright © 2010 www.myctu.cn. All rights reserved. */
/**
 * project : dfs-proxy
 * user created : pippo
 * date created : 2012-4-16 - 上午8:30:50
 */
package com.myctu.platform.resource.agent.signature;

/**
 * @since 2012-4-16
 * @author pippo
 */
public class ResourceSignature {

	public ResourceSignature(String domain, String user) {
		this.domain = domain;
		this.user = user;
	}

	public ResourceSignature(String domain, String user, String resource_id, long expire) {
		this.domain = domain;
		this.user = user;
		this.resource_id = resource_id;
		this.expire = expire;
	}

	protected String domain;

	protected String user;

	protected String signature;

	protected String resource_id;

	protected long expire;

	protected boolean valid;

	protected ErrorType error;

	public String getDomain() {
		return this.domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getUser() {
		return this.user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getSignature() {
		return this.signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getResource_id() {
		return resource_id;
	}

	public void setResource_id(String resource_id) {
		this.resource_id = resource_id;
	}

	public long getExpire() {
		return this.expire;
	}

	public void setExpire(long expire) {
		this.expire = expire;
	}

	public boolean isValid() {
		return this.valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

	public ErrorType getError() {
		return this.error;
	}

	public void setError(ErrorType error) {
		this.error = error;
	}

	public enum ErrorType {

		/* 签名失败 */
		sign_fail,

		/* 不合法的签名 */
		invalid_sign,

		/* 用户未登陆 */
		unlogin,

		/* 用户id与签名不匹配 */
		invalid_user,

		/* 签名已过期 */
		expire

	}
}
