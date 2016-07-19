package com.longtime.common.utils;

import com.longtime.platform.credit.utils.DateUtil;

import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.joda.time.DateTime;

public class DateUtils {

	public final static String DATE_FORMAT_DEFAULT = "yyyy-MM-dd";
	public final static String DATE_FORMAT_TIME = "yyyy-MM-dd HH:mm";

	public static String longToString(long time) {

		return longToString(time, DATE_FORMAT_DEFAULT);

	}

	public static String longToString(long time, String format) {
	    if(StringUtils.isBlank(format)){
	        format = DATE_FORMAT_DEFAULT;
	    }
		DateTime dTime = new DateTime(time);
		return dTime.toString(format);

	}
	
	public static long getTodayStartTime(){
	    DateTime dt = DateTime.now();
	    return dt.withTimeAtStartOfDay().getMillis();
	}
	
	//当前时间所在日期的开始时间
	public static long getDayStartTime(long timestamp){
        DateTime dt = new DateTime(timestamp);
        return dt.withTimeAtStartOfDay().getMillis();
    }
	
	//当前时间所在周一的开始时间
	public static long getWeekStartTime(long timestamp){
         Calendar c = Calendar.getInstance();
         c.setTimeInMillis(getDayStartTime(timestamp));
            
         int day_of_week = c.get(Calendar.DAY_OF_WEEK) - 1;
         if (day_of_week == 0){
             day_of_week = 7;
         }
         c.add(Calendar.DATE, -day_of_week + 1);
         return c.getTimeInMillis();
    }
	
	//当前时间所在的第几周
	public static int getWeekOfYear(long timestamp){
	    DateTime dt = new DateTime(timestamp);
	    return dt.getWeekOfWeekyear();
	}
	
	//当前时间所在的年
	public static int getYear(long timestamp){
        DateTime dt = new DateTime(timestamp);
        return dt.getYear();
    }
    

	public static String getMonth(Long time) {
		DateTime dTime = new DateTime(time);
		return String.valueOf(dTime.getMonthOfYear());
	}

	public static String getDay(Long time) {
		DateTime dTime = new DateTime(time);
		return String.valueOf(dTime.getDayOfMonth());
	}
	
	public static String getTime(Long time) {
		DateTime dTime = new DateTime(time);
		int hour = dTime.getHourOfDay();
		int minute = dTime.getMinuteOfHour();
		return String.format("%d:%d", hour,minute);
	}
	public static void main(String[] args) {
        
		System.err.println(getMonthBeginToLong("2015-07-12"));
		
        System.err.println(getCurrentMonthToLong());
        System.err.println(System.currentTimeMillis());
        
//        long time = getTodayStartTime();
//        System.out.println(time);
        
//        System.out.println(getWeekOfYear(time));
//        System.out.println(getYear(time));
//        
//        System.out.println(longToString(getWeekStartTime(System.currentTimeMillis()),"yyyy-MM-dd HH:mm:ss"));
//        System.out.println(longToString(getWeekStartTime(DateUtil.parseStringToLong("2015-06-29 00:00")),"yyyy-MM-dd HH:mm:ss"));
//        System.out.println(longToString(getWeekStartTime(DateUtil.parseStringToLong("2015-06-28 00:00")),"yyyy-MM-dd HH:mm:ss"));
//        System.out.println(longToString(getWeekStartTime(DateUtil.parseStringToLong("2015-06-27 00:00")),"yyyy-MM-dd HH:mm:ss"));
//        System.out.println(longToString(getWeekStartTime(DateUtil.parseStringToLong("2015-06-26 00:00")),"yyyy-MM-dd HH:mm:ss"));
//        System.out.println(longToString(getWeekStartTime(DateUtil.parseStringToLong("2015-06-25 00:00")),"yyyy-MM-dd HH:mm:ss"));
//        System.out.println(longToString(getWeekStartTime(DateUtil.parseStringToLong("2015-06-24 00:00")),"yyyy-MM-dd HH:mm:ss"));
//        System.out.println(longToString(getWeekStartTime(DateUtil.parseStringToLong("2015-06-23 00:00")),"yyyy-MM-dd HH:mm:ss"));
//        System.out.println(longToString(getWeekStartTime(DateUtil.parseStringToLong("2015-06-22 00:00")),"yyyy-MM-dd HH:mm:ss"));
//        System.out.println(longToString(getWeekStartTime(DateUtil.parseStringToLong("2015-06-21 00:00")),"yyyy-MM-dd HH:mm:ss"));
//        
        
        
        
//	    System.out.println(longToString(1395503000000L,DATE_FORMAT_TIME));
//	    System.out.println(time-86400000);
    }

	public static long getCurrentMonthToLong() {
		 Calendar cal = Calendar.getInstance();
		 Date date = new Date(System.currentTimeMillis());
		 cal.setTime(date);
		 cal.set(Calendar.HOUR_OF_DAY, 0); 
		 cal.set(Calendar.SECOND, 0); 
		 cal.set(Calendar.MINUTE, 0); 
		 cal.set(Calendar.MILLISECOND, 0);
		 cal.set(Calendar.DAY_OF_MONTH, 1);
		return cal.getTimeInMillis();
	}
	public static long getMonthBeginToLong(String str) {
		Calendar cal = Calendar.getInstance();
		Date date = new Date(parseDateStringToLong(str));
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0); 
		cal.set(Calendar.SECOND, 0); 
		cal.set(Calendar.MINUTE, 0); 
		cal.set(Calendar.MILLISECOND, 0);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		return cal.getTimeInMillis();
	}
	
	
	/**
	  * 日期字符串转为long 
	  * 日期字符串格式  2015-01-01   2015-1-1  2015/1/1  2015/01/01  20150101
	 * @param dateStr
	 * @return
	 */
	public static long  parseDateStringToLong(String dateStr){
	     
	    if(null==dateStr || dateStr.trim().length()<1){
	        return 0L;
	    }
	     
	    int year =0;
	    int month= 0;
	    int day = 0;
	    if(dateStr.contains("-")){
	        String[] a = dateStr.split("-");
	        year = NumberUtils.toInt(a[0]);
	        month=NumberUtils.toInt(a[1]);
	        day = NumberUtils.toInt(a[2]);
	    }else if(dateStr.contains("/")){
	        String[] a = dateStr.split("/");
           year = NumberUtils.toInt(a[0]);
           month=NumberUtils.toInt(a[1]);
           day = NumberUtils.toInt(a[2]);
	        
	    }else{
	        if(dateStr.length()==8){
	            year = NumberUtils.toInt(dateStr.substring(0, 4));
	            month = NumberUtils.toInt(dateStr.substring(4, 6));
	            day = NumberUtils.toInt(dateStr.substring(6, 8));
	        }else{
	            return Long.MIN_VALUE;
	        }
	    }
	    
	    java.util.Calendar cal = java.util.Calendar.getInstance();
       cal.set(year,
               month - 1,
              day,0,0,0);
       cal.set(Calendar.MILLISECOND, 0);
       return (cal.getTime().getTime());
	    
	    
	 }
}
