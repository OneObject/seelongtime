/**
 * util.DateUtil.java
 * Jul 21, 20084:41:38 PM
 * congwang
 * 复蓝
 */
package com.longtime.app.ixin.utils;

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
	* String日期转换为Long
	* @param formatDate("MM/dd/yyyy HH:mm:ss")日期格式
	* @param date("12/31/2013 21:08:00")参数
	* @return
	* @throws ParseException
	*/
	public static long transferStringDateToLong(String formatDate,String date){
        if(formatDate==null || "".equals(formatDate.trim())){
        	formatDate = "yyyy-MM-dd HH:mm";
        }
		SimpleDateFormat sdf= new SimpleDateFormat(formatDate);
		Date dt;
		try {
			dt = sdf.parse(date);
		} catch (ParseException e) {
			 System.out.println(e.getMessage());
			 return 0;
		}
		return dt.getTime();
	}

}