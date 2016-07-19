package com.longtime.ajy.student.service;

import com.google.common.collect.Maps;
import com.longtime.ajy.session.LoginSession;
import com.longtime.ajy.support.MD5;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang3.StringUtils;

public interface LoginService {

    LoginSession doLogin(LoginForm loginForm) throws LoginException;

    
    public static class LoginException extends  Exception{
        private static final long serialVersionUID = 4836935714466830842L;
        
        private Code code ;
        public LoginException(Code code){
            super();
            this.code = code;
        }
        public LoginException(Code code,String message) {
            super(message);
            this.code = code;
        }
        
        public Code getCode() {
            return code;
        }
        
    }
    public static class LoginForm {

        public static String default_domain = "";
        String username;
        String password;
        
        Long timestamp;
        
        String domain = default_domain;

        Code   code;
        
        
        Map<String,String> custom = Maps.newHashMap(); // 自定义登录/绑定条件   key=用户属性字段名  value=用户输入的值  如果custom有数据 将不采用账号密码方式登录

        public LoginForm(HttpServletRequest request){
            this.setUsername(StringUtils.trimToNull(request.getParameter("username")));
            this.setPassword(StringUtils.trimToNull(request.getParameter("password")));
            if(StringUtils.isNotBlank(request.getParameter("domain")) ){
                this.setDomain(request.getParameter("domain"));
            }
            
            if(StringUtils.isNotBlank(request.getParameter("timestamp"))){
            	this.setTimestamp(NumberUtils.toLong(request.getParameter("timestamp")));
            }
            
            String[] customKeys = request.getParameterValues("custom");
            
            if(null==customKeys || customKeys.length<1){
                return;
            }
            for (String key : customKeys) {
                custom.put(key, StringUtils.trimToEmpty(request.getParameter(String.format("c_%s", key))));
            }
        }

        public boolean isCustomLogin(){
            return MapUtils.isNotEmpty(custom);
        }
        public boolean validate() {
            if(isCustomLogin()){
                for(String v :custom.values()){
                    if(StringUtils.isBlank(v)){
                        return false;
                    }
                }
                return true;
            }
            
            return StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password);
        }

        public String getUsername() {
            return StringUtils.lowerCase(username);
        }

        public void setUsername(String username) {
            this.username = StringUtils.lowerCase(username);
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public Code getCode() {
            return code;
        }

        public void setCode(Code code) {
            this.code = code;
        }

        
        public String getDomain() {
            return domain;
        }

        
        public void setDomain(String domain) {
            this.domain = domain;
        }

        
        public Map<String, String> getCustom() {
            return custom;
        }

        
        public void setCustom(Map<String, String> custom) {
            this.custom = custom;
        }

        public Long getTimestamp() {
			return timestamp;
		}

		public void setTimestamp(Long timestamp) {
			this.timestamp = timestamp;
		}

		@Override
		public String toString() {
			return String
					.format("LoginForm [username=%s, password=%s, timestamp=%s, domain=%s, code=%s, custom=%s]",
							username, password, timestamp, domain, code, custom);
		}
        
		public boolean isTimeExpire(){
			if(null==timestamp ||  timestamp<1){
				return false;
			}
			return ( timestamp+300000) < System.currentTimeMillis();
		}
		
		public boolean  validatePwd(String serverOriginalPwd){
			if(null!=timestamp && timestamp>0){
				serverOriginalPwd = MD5.encodeMd5(String.format("%s%d", serverOriginalPwd,timestamp));
			}
			return this.password.equals(serverOriginalPwd);
		}

    }

    public static enum Code {
        success((short) 0), // 输入信息为空
        empty((short) 1), // 输入信息为空
        pwdfial((short) 2), // 用户名密码错误
        disable((short) 3), // 用户被禁用
        expire((short) 4),// 用户过期
        unequal_domain((short)5),//domain不一致
        invalid((short)6),//被踢下线，或会话信息失效
        ineffective((short) 7),// 未生效
        already_bind((short) 10),// 已被绑定
        timeexpire((short)11),
        notnamelogin((short)12),
        fail((short) 100);// 其他错误

        private short code;

        Code(short code){
            this.code = code;
        }

        public short getCode() {
            return code;
        }

        public void setCode(short code) {
            this.code = code;
        }

    }

	LoginSession doLogin(String username, String string) throws LoginException;
}
