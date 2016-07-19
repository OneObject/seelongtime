package com.longtime.common.web.utils;
import java.text.DecimalFormat;
import java.text.NumberFormat;

import org.apache.commons.lang.StringUtils;

import com.longtime.common.utils.DateUtils;
import com.longtime.common.utils.HtmlUtils;


public class ELFunctions {
	public static String html2Text(String inputString,int size) {
		return HtmlUtils.getNoHTMLString(inputString, size);
	}
	
	public static String dateLongToString(long time){
		return dateLongToString(time,null);
	}
	
	public static String dateLongToString(long time,String format){
		if(time<=0){
			return StringUtils.EMPTY;
		}
		if(StringUtils.isBlank(format)){
			return  DateUtils.longToString(time);
		}
		return DateUtils.longToString(time,format);
	}
	
	public static String numFormat(double num){
		NumberFormat format = new DecimalFormat("#.##");
		
		return format.format(num);
	}
	
}
