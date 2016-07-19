package com.longtime.common.web.utils;
import java.text.DecimalFormat;
import java.text.NumberFormat;

import org.apache.commons.lang3.StringUtils;

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
	
	// 转为 n秒前   n分钟前   n小时前  日期
	public static String dataLongToSNS(long time,String format){
	    long now = System.currentTimeMillis();
	    
	    long diff = now -time;
	    diff = diff/1000;// 秒
	    
	    if(diff<0){
	        return dateLongToString(time,format);
	    }
	    
	    if(diff<30){ // 30秒
	        return "刚刚";
	    }
	    
	    if(diff<60){
	        return String.format("%s秒前", diff);
	    }
	    
	    if(diff<3600){
	        return String.format("%s分钟前", diff/60);
	    }
        //获取今天凌晨时间
	    long todayStart = DateUtils.getTodayStartTime();
	    
	    if(time>=todayStart){// 今天
	        return String.format("%s小时前", diff/3600);
	    }
	    
	    if(time<todayStart && time >= todayStart-86400000){
	        return "昨天 " + dateLongToString(time, "HH:mm");
	    }
	    
	    return dateLongToString(time,format);
	    
	}
	
}
