/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-8-23 - 下午12:27:58
 */
package com.longtime.ajy.student.utils;

import java.util.Arrays;

import org.apache.commons.lang.StringUtils;

/**
 * @since 2013-8-23
 * @author yangwk
 * 
 */
public class StringUtil {

	public static String orderStr(String str){
		if(StringUtils.isBlank(str)){
			return "";
		}
		if(!str.contains(",")){
			return str;
		}
		String[] chars = str.split(",");
		Arrays.sort(chars);
		StringBuffer buffer = new StringBuffer();
		for(String item : chars){
			if(StringUtils.isBlank(item)){
				continue;
			}
			buffer.append(item);
			if(!item.equals(chars[chars.length-1])){
				buffer.append(",");
			}
		}
		return buffer.toString();
	}
}
