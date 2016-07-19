package com.longtime.app.util;

/**
 * 题库ID次生成器
 * @author chenkf
 *
 */
public class ItemBlankIDUtil {

	public static String ID(){
		
		return "LongTime"+System.currentTimeMillis();
	}
}
