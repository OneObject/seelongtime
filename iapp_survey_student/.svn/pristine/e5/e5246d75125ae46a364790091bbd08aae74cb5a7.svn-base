package com.longtime.ajy.student.utils;

import java.awt.Desktop.Action;

import org.apache.commons.lang3.StringUtils;

import com.longtime.ajy.model.Feed;
import com.longtime.ajy.model.Feed.ACTION;
import com.longtime.ajy.model.Feed.RESTYPE;


public class FeedUtil {
    
    public static String unknow_name = "匿名";
	
	public static String createTitle(Feed feed){
		if(feed == null){
			return "";
		}
		String actor = String.format("<a href=\"#\">%s</a>", StringUtils.isBlank(feed.getUname())?unknow_name:feed.getUname());
		ACTION verbEnum = ACTION.from(feed.getAction());
		if(verbEnum == null){
			return null;
		}
		String verb = verbEnum.getTitle();
		
		RESTYPE restypeEnum = RESTYPE.from(feed.getRestype());
		if(restypeEnum == null){
			return null;
		}
		String restype=restypeEnum.getTitle();
		String object = String.format("了%s&nbsp;<a href=\"#\">%s</a>",restype, feed.getResname());
		
		String title = String.format("%s&nbsp;%s%s", actor,verb,object);
		return title;
	}
	
	public  static String CreateTileForApp(Feed feed)
	{
		if(feed == null){
			return "";
		}
		String actor = feed.getUname();
		ACTION verbEnum = ACTION.from(feed.getAction());
		if(verbEnum == null){
			return null;
		}
		String verb = verbEnum.getTitle();
		
		RESTYPE restypeEnum = RESTYPE.from(feed.getRestype());
		if(restypeEnum == null){
			return null;
		}
		String restype=restypeEnum.getTitle();
		String object = String.format("了%s%s",restype, feed.getResname());
		
		String title = String.format("%s%s%s", actor,verb,object);

		return title;
		
	}
}
