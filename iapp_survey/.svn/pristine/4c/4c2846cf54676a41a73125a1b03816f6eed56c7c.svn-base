package com.longtime.common.utils;

import org.apache.commons.lang3.math.NumberUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.sound.midi.SysexMessage;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;

public class DateUtils {

	public final static String DATE_FORMAT_DEFAULT = "yyyy-MM-dd";
	public final static String DATE_FORMAT_TIME = "yyyy-MM-dd HH:mm";
	public final static String DATE_FORMAT_ALL = "yyyy-MM-dd HH:mm:ss";
	
	public final static long ONE_DAY = 24*60*60*1000L;

	public static String longToString(long time) {
		return longToString(time, DATE_FORMAT_DEFAULT);
	}
	
	/**
	 * 返回到分钟yyyy-MM-dd HH:mm
	 * @param time
	 * @return
	 */
	public static String longToStringMMtime(long time){
		return longToString(time, DATE_FORMAT_TIME);
	}
	
	

	public static String longToString(long time, String format) {
		if(StringUtils.isBlank(format)){
			format = DATE_FORMAT_DEFAULT;
		}
		DateTime dTime = new DateTime(time);
		return dTime.toString(format);

	}
	
	/**
	 * 获得现在年份
	 * @param format
	 * @return
	 */
	public static String getCurrentYear(){
	    return getCurrentYear(DATE_FORMAT_DEFAULT);
	}
	
	/**
	 * 获得当前日期
	 * @return
	 */
	public static String getCurrentTime(){
	     return getCurrentTime("yyyy-MM-dd");
	}
	
	/**
	 * 获得当前时间
	 * @param format
	 * @return
	 */
	public static String getCurrentTime(String format){
		 DateTime dTime = new DateTime();
	     return dTime.toString(format);
	}
	
	/**
	 * 获得当前学年
	 * @param format
	 * @return
	 */
    public static String getCurrentYear(String format){
        DateTime dTime = new DateTime(new DateTime().getYear(), 1, 1, 0, 0);
        return dTime.toString(format);
    }
    
    
	 public static long parseStringToLong(String dateStr) {
	        dateStr = dateStr.trim();
	        if (dateStr.length() == 19) {
	            try {
	                java.util.Calendar cal = java.util.Calendar.getInstance();
	                cal.set(Integer.parseInt(dateStr.substring(0, 4)),
	                        Integer.parseInt(dateStr.substring(5, 7)) - 1,
	                        Integer.parseInt(dateStr.substring(8, 10)),
	                        Integer.parseInt(dateStr.substring(11, 13)),
	                        Integer.parseInt(dateStr.substring(14, 16)),
	                        Integer.parseInt(dateStr.substring(17, 19)));
	                cal.set(java.util.Calendar.MILLISECOND, 0);
	                return (cal.getTime().getTime());
	            } catch (Exception e) {
	                return 0;
	            }

	        } else if (dateStr.length() == 16) {
                try {
                    java.util.Calendar cal = java.util.Calendar.getInstance();
                    cal.set(Integer.parseInt(dateStr.substring(0, 4)),
                            Integer.parseInt(dateStr.substring(5, 7)) - 1,
                            Integer.parseInt(dateStr.substring(8, 10)),
                            Integer.parseInt(dateStr.substring(11, 13)),
                            Integer.parseInt(dateStr.substring(14, 16)));
                    cal.set(java.util.Calendar.MILLISECOND, 0);
                    return (cal.getTime().getTime());
                } catch (Exception e) {
                    return 0;
                }

            } else if (dateStr.length() == 14) {
	            try {
	                java.util.Calendar cal = java.util.Calendar.getInstance();
	                cal.set(Integer.parseInt(dateStr.substring(0, 4)),
	                        Integer.parseInt(dateStr.substring(4, 6)) - 1,
	                        Integer.parseInt(dateStr.substring(6, 8)),
	                        Integer.parseInt(dateStr.substring(8, 10)),
	                        Integer.parseInt(dateStr.substring(10, 12)),
	                        Integer.parseInt(dateStr.substring(12, 14)));
	                cal.set(java.util.Calendar.MILLISECOND, 0);
	                return (cal.getTime().getTime());
	            } catch (Exception e) {
	                return 0;
	            }
	        } else if (dateStr.length() == 10) {
	            try {
	                java.util.Calendar cal = java.util.Calendar.getInstance();
	                cal.set(Integer.parseInt(dateStr.substring(0, 4)),
	                        Integer.parseInt(dateStr.substring(5, 7)) - 1,
	                        Integer.parseInt(dateStr.substring(8, 10)), 0, 0, 0);
	                cal.set(java.util.Calendar.MILLISECOND, 0);
	                return (cal.getTime().getTime());
	            } catch (Exception e) {
	                return 0;
	            }
	        } else {
	            try {
	                return Long.parseLong(dateStr);
	            } catch (Exception e) {
	                return 0;
	            }

	        }

	    }
	 
	 /**
	  * 获取某一年里的某一周的开始时间和结束时间
	  * @param year
	  * @param week
	  * @return long[0]=starttime   long[1]=endtime
	  */
	 public static long[] getStartAndEndOfWeeksYear(int year,int week){
		 
	    long[] times = new long[2];
	    
		DateTime date = new DateTime(String.valueOf(year));
		
		times[0] = date.withWeekOfWeekyear(week).withDayOfWeek(1).getMillis();
		 
		times[1] = date.withWeekOfWeekyear(week).withDayOfWeek(7).getMillis()+ONE_DAY;
		 
		return times;
		
	 };
	 
	 public static long getStartOfMonthNOW(){
		 
		 Calendar cal = Calendar.getInstance();
		 cal.set(Calendar.HOUR_OF_DAY, 0); 
		 cal.set(Calendar.SECOND, 0); 
		 cal.set(Calendar.MINUTE, 0); 
		 cal.set(Calendar.MILLISECOND, 0);
		 cal.set(Calendar.DAY_OF_MONTH, 1);
		 return cal.getTimeInMillis();		 
		 
	 }
	 
	 
	 /**
	  * 获取某一年里的某一月的开始时间和结束时间
	  * @param year
	  * @param month 1~12
	  * @return long[0]=starttime   long[1]=endtime
	  */
	 public static long[] getStartAndEndOfMonthsYear(int year,int month){
		 
		 long[] times = new long[2];
		 
		 DateTime time = new DateTime(String.valueOf(year)+"-"+String.valueOf(month));
		 
		 times[0] = time.getMillis();
		 
		 Calendar cal = Calendar.getInstance();
		 Date date = new Date(time.getMillis());
		 cal.setTime(date);
		 cal.set(Calendar.HOUR_OF_DAY, 0); 
		 cal.set(Calendar.SECOND, 0); 
		 cal.set(Calendar.MINUTE, 0); 
		 cal.set(Calendar.MILLISECOND, 0);
		 cal.set(Calendar.DAY_OF_MONTH, 1);
		 cal.add(Calendar.MONTH, 1);
		 times[1] = cal.getTimeInMillis();
		 
		 return times;
		 
	 };
	 
	 /**
	  * 获取某一年里的某一季度的开始时间和结束时间
	  * @param year
	  * @param quarter 1~4
	  * @return long[0]=starttime   long[1]=endtime
	  */
	 public static long[] getStartAndEndOfQuartersYear(int year,int quarter){
		 
		 long[] times = new long[2];
		 
		 int month = 1;
		 if (quarter == 1) {
			 month = 1;
		 }else if(quarter == 2){
			 month = 4;
		 }else if(quarter == 3){
			 month = 7;
		 }else if(quarter == 4){
			 month = 10;
		 }
		 
		 DateTime time = new DateTime(String.valueOf(year)+"-"+String.valueOf(month));
		 
		 times[0] = time.getMillis();
		 
		 Calendar cal = Calendar.getInstance();
		 Date date = new Date(time.getMillis());
		 cal.setTime(date);
		 cal.set(Calendar.HOUR_OF_DAY, 0); 
		 cal.set(Calendar.SECOND, 0); 
		 cal.set(Calendar.MINUTE, 0); 
		 cal.set(Calendar.MILLISECOND, 0);
		 cal.set(Calendar.DAY_OF_MONTH, 1);
		 cal.add(Calendar.MONTH, 3);
		 times[1] = cal.getTimeInMillis();
		 
		 return times;
		 
		 
		 
	 };
	 /**
	  * 获取某一年开始时间和结束时间
	  * @param year
	  * @return long[0]=starttime   long[1]=endtime
	  */
	 public static long[] getStartAndEndOfYear(int year){
		 
		 long[] times = new long[2];
		 
		 
		 DateTime time = new DateTime(String.valueOf(year));
		 
		 times[0] = time.getMillis();
		 
		 Calendar cal = Calendar.getInstance();
		 Date date = new Date(time.getMillis());
		 cal.setTime(date);
		 cal.set(Calendar.HOUR_OF_DAY, 0); 
		 cal.set(Calendar.SECOND, 0); 
		 cal.set(Calendar.MINUTE, 0); 
		 cal.set(Calendar.MILLISECOND, 0);
		 cal.set(Calendar.DAY_OF_MONTH, 1);
		 cal.add(Calendar.YEAR, 1);
		 times[1] = cal.getTimeInMillis();
		 
		 return times;
		 
		 
	 };

	 
	 
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
	/**
	 * 日期字符串转为long 
	 * 日期字符串格式  2015-01-01 12:23
	 * @param dateStr
	 * @return
	 */
	public static long  parseDateTimeStringToLong(String dateStr){
		if(null==dateStr || dateStr.trim().length()<1){
			return 0L;
		}
		return DateUtils.parseStringToLong(dateStr+":00");
	}
	 
	 
	
	private static long getformarttime(String date) throws ParseException {
		Calendar a = Calendar.getInstance();
		int year = a.get(Calendar.YEAR);// 得到年
		StringBuffer sb = new StringBuffer();
		sb.append(year);
		if (date == null || date.length() < 0) {
			date = "1-1";
		}
		sb.append("-" + date);
		if (sb.length() <= 10) {
			sb.append(" 00:00:00");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long newdate = sdf.parse(sb.toString()).getTime();

		return newdate;
	}
	 public static void main(String[] args) throws Exception {
		 
		 System.err.println(getformarttime("1-1"));
		 System.err.println(getformarttime("8-1"));
		 System.err.println(getformarttime("9-1"));
		 System.err.println(getformarttime("10-1"));
		 System.err.println(getformarttime("11-1"));
		 System.err.println(getformarttime("12-1"));
		 System.err.println();
		 System.err.println();
		 System.out.println(getStartOfMonthNOW());
		 System.err.println();
		 System.err.println(getDayStartTime(parseStringToLong("2016-01-01")));
		 System.err.println(getDayStartTime(parseStringToLong("2015-08-01")));
		 System.err.println(getDayStartTime(parseStringToLong("2015-07-01")));
		 System.err.println(getDayStartTime(parseStringToLong("2015-08-01")));
		 
	
		System.err.println(System.currentTimeMillis());
		System.err.println(DateUtils.parseDateStringToLong("2015-07-05"));
		System.err.println(DateUtils.parseDateStringToLong("2015-07-06"));
		 
    	System.out.println(DateUtils.longToString(1438578120000L,"yyyy-MM-dd HH:mm:ss"));
    	
    	long l = DateUtils.parseDateStringToLong("20151121");
    	System.out.println(DateUtils.longToString(l,DATE_FORMAT_ALL));
    	
    	l = DateUtils.parseDateStringToLong("19681111");
        System.out.println(DateUtils.longToString(l,DATE_FORMAT_ALL));
        
        l = DateUtils.parseDateStringToLong("2015-1-1");
        System.out.println(DateUtils.longToString(l,DATE_FORMAT_ALL));
        
        l = DateUtils.parseDateStringToLong("2015/01/01");
        System.out.println(DateUtils.longToString(l,DATE_FORMAT_ALL));
        
        l = DateUtils.parseDateStringToLong("2015/1/1");
        System.out.println(DateUtils.longToString(l,DATE_FORMAT_ALL));
        
        System.out.println(Long.MIN_VALUE);
    	
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
}
