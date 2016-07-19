package com.longtime.app.news.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONObject;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import com.longtime.app.news.vo.CategoryNewsVO;
import com.longtime.app.news.vo.CategoryVO;
import com.longtime.app.news.vo.NewsResultVO;
import com.longtime.app.news.vo.NewsVO;

public class PullParseHelperUtil {

	
	public static NewsResultVO parse(InputStream ins,boolean hasContent)throws Exception{
		NewsResultVO result = new NewsResultVO();
		List<CategoryVO> categoryVOs = null;
		List<CategoryNewsVO> categorynews = null;
		List<NewsVO> news = null;
		CategoryNewsVO e = null;
		NewsVO n = null;
		XmlPullParser xmlParser = XmlPullParserFactory.newInstance().newPullParser();
		xmlParser.setInput(ins, "utf-8");
		int event = xmlParser.getEventType();
		while(event!=XmlPullParser.END_DOCUMENT){
			switch (event) {
			case XmlPullParser.START_DOCUMENT:
				categoryVOs = new ArrayList<CategoryVO>();
				categorynews = new ArrayList<CategoryNewsVO>();
				break;
			case XmlPullParser.START_TAG:
				if("categorys".equals(xmlParser.getName())){
					CategoryVO vo = new CategoryVO();
					e = new CategoryNewsVO();
					news = new ArrayList<NewsVO>();
					vo.setName(xmlParser.getAttributeValue(0));
					e.setName(xmlParser.getAttributeValue(0));
					categoryVOs.add(vo);
				}
				if("news".equals(xmlParser.getName())){
					n = new NewsVO();
				}
				if("id".equals(xmlParser.getName())){
					n.setId(myTrim(xmlParser.nextText()));
				}
				if("title".equals(xmlParser.getName())){
					n.setTitle(myTrim(xmlParser.nextText()));
				}
				if("short_content".equals(xmlParser.getName())){
					n.setShort_content(myTrim(xmlParser.nextText()));
				}
				if("content".equals(xmlParser.getName())){
					if(hasContent){
						n.setContent(myTrim(xmlParser.nextText()));
					}
				}
				if("detail_url".equals(xmlParser.getName())){
					n.setDetail_url(myTrim(xmlParser.nextText()));
				}
				if("thumbnail_url".equals(xmlParser.getName())){
					n.setThumbnail_url(myTrim(xmlParser.nextText()));
				}
				if("time".equals(xmlParser.getName())){
					n.setTime(myTrim(xmlParser.nextText()));
				}
				
				break;
			case XmlPullParser.END_TAG:
				if("news".equals(xmlParser.getName())){
					news.add(n);
				}
				if("categorys".equals(xmlParser.getName())){
					e.setNews(news);
					categorynews.add(e);
				}
			default:
				break;
			}
			event = xmlParser.next();
		}
		if(event == XmlPullParser.END_DOCUMENT){
			result.setCategorynews(categorynews);
			result.setCategorys(categoryVOs);
		}
		
		return result;
	}
	
	public static String replaceBlank(String str) {
		
        if (str!=null) {

            Pattern p = Pattern.compile("\\s*|\t|\r|\n");

            Matcher m = p.matcher(str);

            str= m.replaceAll("");

        }

        return str;

    }
	
	public static String myTrimWithNotN(String str) {
		
        if (str!=null) {

            Pattern p = Pattern.compile("\\s*|\t|\r|\n");

            Matcher m = p.matcher(str);

            str= m.replaceAll("");

        }

        return str;

    }
	
	 private static String myTrim(String str) {
		  int start=0,end=str.length()-1;  //这里要避免角标越界
		  while(start<=end && (str.charAt(start)==' ' || str.charAt(start) == '\n' || str.charAt(start) == '\r'|| str.charAt(start) == '\t')) { //获取空字符的索引
		   start++;
		  }
		  while(start<=end && (str.charAt(end)==' ' ||str.charAt(end)=='\n'||str.charAt(end)=='\r'||str.charAt(end)=='\t')) {
		   end--;
		  }
		  return str.substring(start,end+1);  //获取非空字符
	}
	
	
	public static void main(String[] args)throws Exception {
		InputStream ins = PullParseHelperUtil.class.getClassLoader().getResourceAsStream("test_news.xml");
		NewsResultVO vo = parse(ins,true);
		System.out.println(JSONObject.fromObject(vo).toString());
		/*String str = "\n                1\n            ";
		System.out.println(myTrim(""));*/
	}
}
