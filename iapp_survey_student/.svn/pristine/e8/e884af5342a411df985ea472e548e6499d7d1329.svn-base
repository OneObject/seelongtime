package com.longtime.ajy.student.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;

import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.MwebHelper;

public interface RegisterService {

	User doRegister(RegisterForm registerForm) throws RegisterException;

	public static class RegisterException extends Exception {
		private static final long serialVersionUID = 4836935714466830842L;

		private Code code;

		public RegisterException(Code code) {
			super();
			this.code = code;
		}

		public RegisterException(Code code, String message) {
			super(message);
			this.code = code;
		}

		public Code getCode() {
			return code;
		}

	}

	public static class RegisterForm {
		String name;
		String mobile;
		String username;
		String nickname;
		String domain;
		String uid;
		String openid;
		String oid;
		Code code;
		boolean disable = false;

		public RegisterForm(HttpServletRequest request) {
			this.setMobile(StringUtils.trimToEmpty(
					request.getParameter("mobile")).toLowerCase());
			this.setName(StringUtils.trimToEmpty(request.getParameter("name"))
					.toLowerCase());
			this.setUsername(StringUtils.trimToNull(request
					.getParameter("username")));
			this.setNickname(StringUtils.trimToNull(request
					.getParameter("nickname")));
			this.setDomain(StringUtils.trimToNull(request
					.getParameter("domain")));
			this.setOpenid(StringUtils.trimToNull(request
					.getParameter("openid")));
			if (StringUtils.isBlank(this.getOpenid())) {
				this.setOpenid(MwebHelper.getCurrentOpenId());
			}
			if(StringUtils.isNotBlank(request.getParameter("disable"))){
			    disable = BooleanUtils.toBoolean(request.getParameter("disable"));
			}
			String oid = String.format("domain_%s", this.getDomain());
			this.setOid(oid);
		}

		public boolean isBlank() {
			if (StringUtils.isBlank(this.name)
					|| StringUtils.isBlank(this.mobile)
					|| StringUtils.isBlank(this.username)) {
				// || StringUtils.isBlank(this.nickname)
				return false;
			}
			return true;
		}

		public String getNickname() {
			return nickname;
		}

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getDomain() {
			return domain;
		}

		public void setDomain(String domain) {
			this.domain = domain;
		}

		public String getMobile() {
			return mobile;
		}

		public void setMobile(String mobile) {
			this.mobile = mobile;
		}

		public String getUid() {
			return uid;
		}

		public void setUid(String uid) {
			this.uid = uid;
		}

		public String getOpenid() {
			return openid;
		}

		public void setOpenid(String openid) {
			this.openid = openid;
		}

		public String getOid() {
			return oid;
		}

		public void setOid(String oid) {
			this.oid = oid;
		}

		public Code getCode() {
			return code;
		}

		public void setCode(Code code) {
			this.code = code;
		}

        
        public boolean isDisable() {
            return disable;
        }

        
        public void setDisable(boolean disable) {
            this.disable = disable;
        }
		

	}

	/*
	 * public static class RegisterForm { String name; String mobile; String
	 * email; String password; String domain ; String org; String uid; String
	 * openid; Code code;
	 * 
	 * public RegisterForm(HttpServletRequest request){
	 * 
	 * this.setMobile(StringUtils.trimToEmpty(request.getParameter("mobile")).
	 * toLowerCase());
	 * this.setEmail(StringUtils.trimToEmpty(request.getParameter
	 * ("email")).toLowerCase());
	 * this.setPassword(StringUtils.trimToNull(request
	 * .getParameter("password")));
	 * this.setDomain(StringUtils.trimToNull(request.getParameter("domain")));
	 * this.setName(StringUtils.trimToNull(request.getParameter("name")));
	 * this.setOrg(StringUtils.trimToNull(request.getParameter("org")));
	 * this.setOpenid(StringUtils.trimToNull(request.getParameter("openid")));
	 * if(StringUtils.isBlank(this.getDomain())){
	 * this.setDomain(MwebLoginFilter.DOMAIN_DEFAULT); } }
	 * 
	 * public String getMobile() { return mobile; }
	 * 
	 * public void setMobile(String mobile) { this.mobile = mobile; }
	 * 
	 * public String getEmail() { return email; }
	 * 
	 * public void setEmail(String email) { this.email = email; }
	 * 
	 * public boolean validate() {
	 * 
	 * if(StringUtils.isBlank(email) && StringUtils.isBlank(mobile)){ return
	 * false; }
	 * 
	 * return StringUtils.isNotBlank(password) && StringUtils.isNotBlank(name) ;
	 * }
	 * 
	 * public String getPassword() { return password; }
	 * 
	 * public void setPassword(String password) { this.password = password; }
	 * 
	 * public Code getCode() { return code; }
	 * 
	 * public void setCode(Code code) { this.code = code; }
	 * 
	 * 
	 * public String getName() { return name; }
	 * 
	 * 
	 * public void setName(String name) { this.name = name; }
	 * 
	 * 
	 * public String getDomain() { return domain; }
	 * 
	 * 
	 * public String getOpenid() { return openid; }
	 * 
	 * 
	 * public void setOpenid(String openid) { this.openid = openid; }
	 * 
	 * public void setDomain(String domain) { this.domain = domain; }
	 * 
	 * 
	 * public String getOrg() { return org; }
	 * 
	 * 
	 * public void setOrg(String org) { this.org = org; }
	 * 
	 * 
	 * public String getUid() { return uid; }
	 * 
	 * 
	 * public void setUid(String uid) { this.uid = uid; }
	 * 
	 * }
	 */

	public static enum Code {
		success((short) 0), // 成功
		empty((short) 1), // 输入信息为空
		exist((short) 2), // 账号存在
		password((short) 3), // 账号存在
		illegal((short) 4), // 账号存在
		fail((short) 100);// 其他错误

		private short code;

		Code(short code) {
			this.code = code;
		}

		public short getCode() {
			return code;
		}

		public void setCode(short code) {
			this.code = code;
		}

	}
}
