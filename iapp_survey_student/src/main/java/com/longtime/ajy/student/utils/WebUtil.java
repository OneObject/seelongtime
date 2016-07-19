/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-26 - 下午5:12:19
 */
package com.longtime.ajy.student.utils;

import com.longtime.ajy.model.User;
import com.longtime.ajy.session.SessionHelper;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * @since 2013-9-26
 * @author yangwk
 * 
 */
public class WebUtil {

	/**
	 * 检查用户是否具有操作权限
	 * @param author_id
	 * @param request
	 * @return
	 */
	public static boolean checkAuth(String author_id, HttpServletRequest request) {
		if(StringUtils.isBlank(author_id)){
			return false;
		}
		User user = SessionHelper.getCurrentUser(request);
		if(!author_id.equals(user.getId())){
			return false;
		}
		return true;
	}
	
	public static String getRemortIP(HttpServletRequest request) {
		if (request.getHeader("x-forwarded-for") == null) {
			return request.getRemoteAddr();
		}
		return request.getHeader("x-forwarded-for");
	}
	
	static String phoneReg = "\\b(ip(hone|od)|android|opera m(ob|in)i" + "|windows (phone|ce)|blackberry"
			+ "|s(ymbian|eries60|amsung)|p(laybook|alm|rofile/midp" + "|laystation portable)|nokia|fennec|htc[-_]"
			+ "|mobile|up.browser|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";
	static String tableReg = "\\b(ipad|tablet|(Nexus 7)|up.browser" + "|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";

	//移动设备正则匹配：手机端、平板  
	static Pattern phonePat = Pattern.compile(phoneReg, Pattern.CASE_INSENSITIVE);
	static Pattern tablePat = Pattern.compile(tableReg, Pattern.CASE_INSENSITIVE);

	public static boolean isMoblie(String userAgent) {
		if(StringUtils.isBlank(userAgent)){
			return  false;
		}
		// 匹配
		Matcher matcherPhone = phonePat.matcher(userAgent);
		if(matcherPhone.find()){
			return true;
		}
		Matcher matcherTable = tablePat.matcher(userAgent);
		if ( matcherTable.find()) {
			return true;
		}

		return false;
	}

	public static boolean isMoblie(HttpServletRequest request) {
		String useAgent = request.getHeader("User-Agent");
		return isMoblie(useAgent);
	}
	
}
