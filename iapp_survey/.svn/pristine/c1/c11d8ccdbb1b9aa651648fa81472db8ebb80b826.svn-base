package com.longtime.app.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ParseFormatDateUtil {
	private static ParseFormatDateUtil parseFormatDateUtil = new ParseFormatDateUtil();
	private static Logger logger = LoggerFactory.getLogger(ParseFormatDateUtil.class);

	private ParseFormatDateUtil(){}	
	
	
	public static ParseFormatDateUtil newInstence(){
		return parseFormatDateUtil;
	}
	
	public long getTimeFromFormatDate(String formatDate,String... format){
		
		String formatStr= "";
		
		if(ArrayUtils.isEmpty(format)||StringUtils.isEmpty(format[0])){
			formatStr = "yyyy年MM月dd日HH点mm分";
		}else{
			formatStr = format[0];
		}
		DateFormat df = new SimpleDateFormat(formatStr);
		try {
			return (df.parse(formatDate)).getTime();
		} catch (ParseException e) {
			logger.error("parse date error[{}]",formatDate);
			e.printStackTrace();
		}
		return 0L;
	}
	
	/**
	 * 
	 * @param req reuqest请求
	 * @param key 根据key获取信息[req.getParameter(key);]
	 * @param format 解析的格式
	 * @return
	 */
	public long getStringForLong(HttpServletRequest req,String key,String format){
		String res = req.getParameter(key);
		if(StringUtils.isBlank(res)){
			return 0L;
		}
		if(StringUtils.isBlank(format)){
			format = "yyyy-MM-dd HH:mm:ss";
		}
		DateFormat df = new SimpleDateFormat(format);
		long resLong = 0l;
		try {
			resLong = (df.parse(res)).getTime();
			return resLong;
		} catch (ParseException e) {
			e.printStackTrace();
			return 0l;
		}
		
	}
	
	public static void main(String[] args) {
		System.out.println(newInstence().getTimeFromFormatDate("2013年09月11日13点41分"));
	}
}
