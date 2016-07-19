/**
 * project : TD-BSS
 * user created : songsp
 * date created : 2012-12-8 - 下午4:58:20
 */
package com.longtime.common.spring;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.support.RequestContextUtils;

/**
 * @since 2012-12-8
 * @author songsp
 */
public class MessageUtils {

	public static String getMessage(String code, Object[] args, Locale locale) {

		return SpringContextUtil.getApplicationContext().getMessage(code, args, locale);

	}

	public static String getMessage(String code, Object[] args, HttpServletRequest request) {

		return SpringContextUtil.getApplicationContext().getMessage(code,
			args,
			RequestContextUtils.getLocaleResolver(request).resolveLocale(request));

	}

	public static String getMessage(String code, HttpServletRequest request) {
		return SpringContextUtil.getApplicationContext().getMessage(code,
			null,
			RequestContextUtils.getLocaleResolver(request).resolveLocale(request));
	}

	public static String getMessage(String code) {
		return SpringContextUtil.getApplicationContext().getMessage(code, null, null);
	}

	public static String getMessage(String code, String defaultMsg) {
		return SpringContextUtil.getApplicationContext().getMessage(code, null, defaultMsg, null);
	}

	public static String getMessage(String code, Object[] args, String defaultMsg, Locale locale) {
		return SpringContextUtil.getApplicationContext().getMessage(code, args, defaultMsg, locale);
	}

	public static String getMessage(String code, String defaultMsg, HttpServletRequest request) {
		return SpringContextUtil.getApplicationContext().getMessage(code,
			null,
			defaultMsg,
			RequestContextUtils.getLocaleResolver(request).resolveLocale(request));
	}
	
	public static String getMessage(String code,  Object[] args,String defaultMsg, HttpServletRequest request) {
		return SpringContextUtil.getApplicationContext().getMessage(code,
			args,
			defaultMsg,
			RequestContextUtils.getLocaleResolver(request).resolveLocale(request));
	}

}
