/**
 * util.DateUtil.java
 * Jul 21, 20084:41:38 PM
 * congwang
 * 复蓝
 */
package org.adl.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author niatwangcong
 * 王聪
 * 上海龙泰信息技术
 * 2008-07-21
 */
public class DateUtil {
	/**
     * 时间格式转换，将字符串型时间转换为毫秒数
     * "yyyy-MM-dd HH:mm:ss" => "12345"	19位
     * "yyyyMMddHHmmss" => "12345"		14位
     * "yyyy-MM-dd" => "12345"		10位
     * 返回 0 是格式不对
     * @param dateStr
     * @return
     */
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
     * 转换时间 long -> String
     * @param timestamp 传入系统时间
     * @return String
     */
    
    public static String parseLongToString(long timestamp) {
        SimpleDateFormat bartDateFormat =
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String returnStr = null;
        try {
            java.util.Date date = new java.util.Date(timestamp);
            returnStr = bartDateFormat.format(date);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return returnStr;
    }
    
    /**
     * 添加 by 宋少璞 2008-10-29 9:34:40
     * 转换时间 long -> String 按自定义的格式输出
     * @param timestamp 传入系统时间
     * @param format 格式
     * @return String
     */
    
    public static String parseLongToString(long timestamp,String format) {
        if(format==null || "".equals(format.trim())){
        	format = "yyyy-MM-dd HH:mm:ss";
        }
    	
    	SimpleDateFormat bartDateFormat =
                new SimpleDateFormat(format);
        String returnStr = null;
        try {
            java.util.Date date = new java.util.Date(timestamp);
            returnStr = bartDateFormat.format(date);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return returnStr;
    }
    
    /*
     * 添加by 宋少璞 取nowTime(格式yyyy-MM-dd)的下一天，为查询
	 * 下一天的0时0分0秒
	 */
	public static  String getNextDay(String nowTime) {
		java.text.SimpleDateFormat dateFormat=new java.text.SimpleDateFormat("yyyy-MM-dd");
		Calendar now = Calendar.getInstance();
		int nowYear=Integer.valueOf(nowTime.substring(0, 4));
		int nowMonth=Integer.valueOf(nowTime.substring(5, 7));
		int day=Integer.valueOf(nowTime.substring(8, 10));
		now.set( nowYear,nowMonth-1,day);
		
		/*
		 * 修改 by 宋少璞 2008-12-30 16:03:31 
		 * 当时间为2008-12-31 下一天计算为 2008-01-01 所以做如下修改
		 */
		if (now.get(Calendar.MONTH) == Calendar.DECEMBER && day==31) { 
			// 如果当前第12月
			now.roll(Calendar.YEAR, true);
		}
		now.roll(Calendar.DAY_OF_YEAR,1);//明天
		return String.valueOf(dateFormat.format(now.getTime())+" 00:00:00");
	}
	
	
	
	/**添加 by 宋少璞 2008-10-31 14:23:28
	 * 将HHHH:mm:ss格式转为 HHHH时mm分ss秒
	 * @param RTETime
	 * @return
	 */
	public static String toFormatRTETime(String RTETime){
		//将后面的毫米去掉
		int index = RTETime.indexOf(".");
		if(index != -1){
			RTETime = RTETime.substring(0,index);
		}
		
		
		//转换为0000时00分00秒
		RTETime = RTETime.replaceFirst(":", "时");
		RTETime = RTETime.replaceFirst(":", "分");
    	RTETime = RTETime+"秒";
    	
    	return RTETime;
	}
	
	/**
	 * 王聪
	 * RTE中 0000:00:00 时间格式的相加
	 * @param time
	 * @param addTime
	 * @return
	 */
	public static String RTETimeAdd(String time,String addTime){

		String src_hour="0";
		String src_min="0";
		String src_sec="0";
		
		String add_hour="0";
		String add_min="0";
		String add_sec="0";
		
		try{
			
			if(time.indexOf(".")!=-1)
				time=time.substring(0, time.lastIndexOf("."));
			
			String times[]=time.split(":");
			src_hour=times[0];
			src_min=times[1];
			src_sec=times[2];
	
			if(addTime.indexOf(".")!=-1)
				addTime=addTime.substring(0, addTime.lastIndexOf("."));
			
			String addTimes[]=addTime.split(":");
			add_hour=addTimes[0];
			add_min=addTimes[1];
			add_sec=addTimes[2];
			
		}
		catch (Exception ex) {
            System.out.println(ex.getMessage());
            return "0000:00:00";
        }
		return getTimeAdd(src_hour, src_min, src_sec, add_hour, add_min, add_sec);
		
	}
	
	
	/**
	 * 王聪
	 * 时间相加：min=秒+秒，sec=分+分，hour=时+时，
	 * min'=min%60
	 * sec'=sec+min/60
	 * hour'=hour+sec/60
	 * @param src_hour
	 * @param src_min
	 * @param src_sec
	 * @param add_hour
	 * @param add_min
	 * @param add_sec
	 * @return String
	 */
	public static String getTimeAdd(String src_hour,String src_min,	String src_sec,String add_hour,	String add_min,	String add_sec){
		int hour;
		int min;
		int sec;
		
		try{

			int sec_temp=0;
			int min_temp=0;
			
			sec=Integer.parseInt(src_sec)+Integer.parseInt(add_sec);
			min=Integer.parseInt(src_min)+Integer.parseInt(add_min);
			hour=Integer.parseInt(src_hour)+Integer.parseInt(add_hour);
			
			if(sec>=60){
				sec_temp=sec/60;
				sec=sec%60;
			}
			min=min+sec_temp;
			if(min>=60){
				min_temp=min/60;
				min=min%60;
			}
			hour=hour+min_temp;
			
		}catch (Exception ex) {
            System.out.println(ex.getMessage());
            return "0000:00:00";
        }
		
		return ConvertUtil.toFixString(hour,4)+":"+ConvertUtil.toFixString(min,2)+":"+ConvertUtil.toFixString(sec,2);
		
	}
	
	
	
	/**
	 * @param src_hour
	 * @param count
	 * @return 返回时间的平均值
	 */
	public static String getAvgTime(String time,int count){
		
		String src_hour="0";
		String src_min="0";
		String src_sec="0";
		
		int hour;
		int min;
		int sec;
		
		long longTime;
		
		try{
			if(time.indexOf(".")!=-1)
				time=time.substring(0, time.lastIndexOf("."));
			
			String times[]=time.split(":");
			src_hour=times[0];
			src_min=times[1];
			src_sec=times[2];
			
			
			sec=Integer.parseInt(src_sec);
			min=Integer.parseInt(src_min);
			hour=Integer.parseInt(src_hour);
			
			longTime=(hour*60*60+min*60+sec)/count;
			
			src_sec=String.valueOf(longTime%60);
			
			if((longTime/60)>=60){
				src_min=String.valueOf((longTime/60)-60);
			}else{
				src_min=String.valueOf(longTime/60);
			}
			
			src_hour=String.valueOf(longTime/3600);
			
		}catch (Exception ex) {
		    System.out.println(ex.getMessage());
		    return "0000:00:00";
		}
			
			
			
		return ConvertUtil.toFixString(src_hour,4)+":"+ConvertUtil.toFixString(src_min,2)+":"+ConvertUtil.toFixString(src_sec,2);
	}
	
	
	
	/**获得两个日期之间相差的天数 endDate - startDate
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public static long differ(Date endDate ,Date startDate) 
	{ 
	    //return endDate.getTime() / (24*60*60*1000) - startDate.getTime() / (24*60*60*1000); 
	    //return endDate.getTime() / 86400000 - startDate.getTime() / 86400000;  //用立即数，减少乘法计算的开销
	    return (endDate.getTime()-startDate.getTime())/(24*60*60*1000);
	}
	
	
	public static void main(String[] args){
		
		SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date mydate = myFormatter.parse("2009-03-01");
			java.util.Date date= myFormatter.parse("2009-03-31");
			long  day= DateUtil.differ(mydate, date);
			System.out.println(day);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		
		
	}
}