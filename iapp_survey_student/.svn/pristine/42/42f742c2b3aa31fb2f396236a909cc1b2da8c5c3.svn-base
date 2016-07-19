package com.longtime.ajy.support;

import java.util.Locale;
import java.util.ResourceBundle;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.ajy.student.utils.Constants;

public class I18nHelper {
	
	private static final Logger logger = LoggerFactory.getLogger(I18nHelper.class);
	
	private static ThreadLocal<Locale> currentLanguageType = new ThreadLocal<Locale>();

	public static String get(String key) {
		try {
			Locale locale = currentLanguageType.get();
			ResourceBundle bundle = ResourceBundle.getBundle(Constants.I18N_BASE_NAME,locale);
			String value =  bundle.getString(key);
			return value;
		} catch (Exception e) {
			logger.error(String.format("get i18n message by key=%s due to error", key,e));
		}
		return "";
	}
	
	/**
	 * 设置用户当前语言环境
	 * @param languageType
	 */
	public static void setCurrentLanguageType(Locale locale){
		currentLanguageType.set(locale);
	}
	
	/**
	 * 获取当前用户所选择的语言环境
	 * 只适应于用户从浏览器发起请求的处理流程中使用，定时任务、支付回调等与用户无关的方法内无法获取
	 * @return
	 */
	public static Locale getCurrentLanguageType(){
		Locale locale = currentLanguageType.get();
		return locale;
	}
	
}
