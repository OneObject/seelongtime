package com.longtime.app.util;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.util.HtmlUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HTMLUtils {

	private static HTMLUtils htmlUtils = new HTMLUtils();
	
	private HTMLUtils(){
		
	}
	
	public static HTMLUtils newInstence(){
		return htmlUtils;
	}
	
	public String encodeHtml(String html){
		
		return StringEscapeUtils.escapeHtml4(html);
	}
	
	public static String html2Text(String inputString) {
		String htmlStr = inputString; // 含html标签的字符串
		String textStr = "";
		java.util.regex.Pattern p_script;
		java.util.regex.Matcher m_script;
		java.util.regex.Pattern p_style;
		java.util.regex.Matcher m_style;
		java.util.regex.Pattern p_html;
		java.util.regex.Matcher m_html;

		java.util.regex.Pattern p_html1;
		java.util.regex.Matcher m_html1;

		try {
			String regEx_script = "<[//s]*?script[^>]*?>[//s//S]*?<[//s]*?///[//s]*?script[//s]*?>"; // 定义script的正则表达式{或<script[^>]*?>[//s//S]*?<///script>
			String regEx_style = "<[//s]*?style[^>]*?>[//s//S]*?<[//s]*?///[//s]*?style[//s]*?>"; // 定义style的正则表达式{或<style[^>]*?>[//s//S]*?<///style>
			String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
			String regEx_html1 = "<[^>]+";
			p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
			m_script = p_script.matcher(htmlStr);
			htmlStr = m_script.replaceAll(""); // 过滤script标签

			p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
			m_style = p_style.matcher(htmlStr);
			htmlStr = m_style.replaceAll(""); // 过滤style标签

			p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
			m_html = p_html.matcher(htmlStr);
			htmlStr = m_html.replaceAll(""); // 过滤html标签

			p_html1 = Pattern.compile(regEx_html1, Pattern.CASE_INSENSITIVE);
			m_html1 = p_html1.matcher(htmlStr);
			htmlStr = m_html1.replaceAll(""); // 过滤html标签

			textStr = htmlStr;

		} catch (Exception e) {
			System.err.println("Html2Text: " + e.getMessage());
		}

		return textStr;// 返回文本字符串
	}



	public static List<String> getHtmlImgSrc(String htmlStr) {
		if(StringUtils.isBlank(htmlStr)){
			return Collections.emptyList();
		}

		htmlStr = HtmlUtils.htmlUnescape(htmlStr);
		String img = "";
		Pattern p_image;
		Matcher m_image;
		List<String> pics = new ArrayList<>();

		String regEx_img = "<img.*src=(.*?)[^>]*?>"; //图片链接地址
		p_image = Pattern.compile
				(regEx_img, Pattern.CASE_INSENSITIVE);
		m_image = p_image.matcher(htmlStr);
		while (m_image.find()) {
			img = img + "," + m_image.group();
			Matcher m = Pattern.compile("src=(\"|')?(.*?)(\"|'|>|\\s+)",Pattern.CASE_INSENSITIVE).matcher(img); //匹配src
			while (m.find()) {
				String src = m.group(2);
				if (!pics.contains(src))
					pics.add(src);
			}
		}
		return pics;
	}

	public static void main(String[] args) {
		//String html = "<script >$(function(){alert('msg');})</script>";
		String h = "function openwin() {window.open ('http://www.baidu.com', 'newwindow', 'height=100, width=400, toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no') //写成一行}";
//		System.out.println(newInstence().encodeHtml(h));
		System.out.println(newInstence().encodeHtml("《script>adfas"));

		String s = "<html><IMG sRc=http://www.baidu.com/image/ad2.gif width='128' height='36'/><img src='image/ad1.gif' width='128' height='36'/></html>";

		List<String > imgSrcs = getHtmlImgSrc(s);

		for (String src : imgSrcs) {
			System.out.println(src);
		}
	}
}
