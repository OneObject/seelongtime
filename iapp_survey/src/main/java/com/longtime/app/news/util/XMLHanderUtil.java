package com.longtime.app.news.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.longtime.app.news.vo.CategoryNewsVO;
import com.longtime.app.news.vo.CategoryVO;
import com.longtime.app.news.vo.NewsResultVO;
import com.longtime.app.news.vo.NewsVO;

public class XMLHanderUtil {
	
	
	@SuppressWarnings("unchecked")
	private static NewsResultVO read(String path){
		NewsResultVO result = new NewsResultVO();
		try{
			InputStream in = XMLHanderUtil.class.getResourceAsStream(path);
			SAXReader reader = new SAXReader(); 
			Document doc = reader.read(in);  
            Element root = doc.getRootElement(); 
			List<Element> list = (List<Element>)root.elements();
			List<CategoryVO> categoryVOs = new ArrayList<CategoryVO>();
			List<CategoryNewsVO> categoryNewsVOs = new ArrayList<CategoryNewsVO>();
			for (Element category : list) {
				CategoryNewsVO categoryNewsVO = new CategoryNewsVO();
				List<Element> news = category.elements();
				Attribute attribute = category.attribute("name");
				CategoryVO categoryVO = new CategoryVO();
				if(attribute!=null){
					categoryVO.setName(attribute.getValue());
					categoryNewsVO.setName(attribute.getValue());
				}
				//1..
				categoryVOs.add(categoryVO);
				
				List<NewsVO> newsVOs = new ArrayList<NewsVO>();
				for (Element n : news) {
					List<Element> eleAttr = n.elements();
					NewsVO newsVO = new NewsVO();
					for (Element e : eleAttr) {
						if(e.getName().equals("id")){
							newsVO.setId(replaceBlank(e.getStringValue()));
						}
						if(e.getName().equals("title")){
							newsVO.setTitle(replaceBlank(e.getStringValue()));
						}
						if(e.getName().equals("short_content")){
							newsVO.setShort_content(replaceBlank(e.getStringValue()));
						}
						if(e.getName().equals("content")){
							newsVO.setContent(replaceBlank(e.getStringValue()));
						}
						if("detail_url".equals(e.getName())){
							newsVO.setDetail_url(replaceBlank(e.getStringValue()));
						}
						if("thumbnail_url".equals(e.getName())){
							newsVO.setThumbnail_url(replaceBlank(e.getStringValue()));
						}
						if("time".equals(e.getName())){
							newsVO.setTime(replaceBlank(e.getStringValue()));
						}
					}
					newsVOs.add(newsVO);
				}
				categoryNewsVO.setNews(newsVOs);
				categoryNewsVOs.add(categoryNewsVO);
			}
			result.setCategorys(categoryVOs);
			result.setCategorynews(categoryNewsVOs);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	 public static String replaceBlank(String str) {
	        String dest = "";
	        if (str!=null) {
	            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
	            Matcher m = p.matcher(str);
	            dest = m.replaceAll("");
	        }
	        return dest;
	    }
	 public static String replaceBlankWithSpace(String str) {
	        String dest = "";
	        if (str!=null) {
	            Pattern p = Pattern.compile("\t|\r|\n");
	            Matcher m = p.matcher(str);
	            dest = m.replaceAll("");
	        }
	        return dest;
	    }
	 public static NewsResultVO getXmlResult(String...rpath){
		 String path = "";
		 if(rpath == null || rpath.length<=0 || StringUtils.isBlank(rpath[0])){
			throw new IllegalArgumentException("file path is not set.");
		 }else{
			 path = rpath[0];
		 }
		 return read(path);
	 }
	public static void main(String[] args) {
		NewsResultVO vo = getXmlResult("/test_news.xml");
		System.out.println(JSONObject.fromObject(vo).toString());
	}
}
