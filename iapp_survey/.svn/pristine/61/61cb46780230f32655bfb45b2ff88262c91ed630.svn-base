package com.longtime.app.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

public class PathUtil {
	
	
	
	/**
	 * 
	 * 功能描述：转换正确的路径
	 * 如：//////////\D:\F/FD/=》D:/F/FD/
	 * @author:houbiao,he
	 * @create:Jun 12, 2009  9:20:05 AM
	 * @update:Jun 12, 2009  9:20:05 AM
	 * @param path
	 * @return
	 */
	public static String getProperPath( String path )
	{
	    path = path.replace("\\", "/") ;
		while (path.indexOf("//") >= 0) {
		    path = path.replace("//", "/") ;
        }
		
		String[] paths = path.split("/") ;
		List<String> list = new ArrayList<String>();
		for( String s:paths ){
			if(StringUtils.isNotBlank(s)){
				list.add(s);
			}
		}
		
	   
		StringBuffer returnPath = new StringBuffer();
		String firstStr = ((String)list.get(0)).length()>2?("//"+(String)list.get(0)):(String)list.get(0);
		returnPath.append(firstStr) ;
		
		for( int i=1;i<list.size();i++ )//i-1 从第二个开始
		{
			returnPath.append("/"+(String)list.get(i)) ;
		}
		
		
		return returnPath.toString() ;
		
	}
	

	/**
	 * 功能描述：
	 * @author:houbiao,he
	 * @create:Jun 11, 2009  5:28:55 PM
	 * @update:Jun 11, 2009  5:28:55 PM
	 * @param args
	 */
	public static void main(String[] args) {
		String s = "///192.168.0.5\\/nas" ;
		String ss = getProperPath(s);
		
//		System.out.println("///192.168.0.5\\/nas".replace("///", "/"));
		
		System.out.println(ss);
	}

}
