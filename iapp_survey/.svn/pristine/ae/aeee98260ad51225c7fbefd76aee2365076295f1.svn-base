package com.longtime.demo.testmain;

import org.springframework.web.util.HtmlUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ImgTest {

	public static void main(String[] args) {
		String s = "<html><img src='image/ad1.gif' width='128' height='36'/></html>";

		String content = "&lt;p style=&quot;margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; clear: both; white-space: normal; direction: ltr; unicode-bidi: embed; word-break: normal;&quot;&gt;&lt;span style=&quot;font-size: 20px; font-family: 隶书;&quot;&gt;大学生心理辅导系列之---与大学生的交流秘技中的倾听与提问&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;clear: both; white-space: normal;&quot;&gt;&lt;img data-s=&quot;300,640&quot; data-type=&quot;jpeg&quot; src=&quot;https://mmbiz.qlogo.cn/mmbiz/BuibbyDiaTKOXwH45n5UZvRLsrDdXxkIsgHQ2SH06H18D9icNBDLRq17HddDsiaDe1xic1HgrMNTrgMcYsoGfSHv52A/0?wx_fmt=jpeg&quot; data-ratio=&quot;1.1146245059288538&quot; data-w=&quot;&quot; style=&quot;max-width: 100%; height: auto !important;&quot;/&gt;&lt;br/&gt;&lt;img data-s=&quot;300,640&quot; data-type=&quot;jpeg&quot; src=&quot;https://mmbiz.qlogo.cn/mmbiz/BuibbyDiaTKOXwH45n5UZvRLsrDdXxkIsgg21pro1Sjm6GSU3SV30CicWlp9egSSEYmH5UZR4lj2YfbU9tOK95M8A/0?wx_fmt=jpeg&quot; data-ratio=&quot;1.3557312252964426&quot; data-w=&quot;&quot; style=&quot;max-width: 100%; height: auto !important;&quot;/&gt;&lt;br/&gt;&lt;img data-s=&quot;300,640&quot; data-type=&quot;jpeg&quot; src=&quot;https://mmbiz.qlogo.cn/mmbiz/BuibbyDiaTKOXwH45n5UZvRLsrDdXxkIsgDTsngo0M3HOjhIlYaGD90liaiaMpRtAibW7BiajKw73wiaAKCsXOw8gqbBg/0?wx_fmt=jpeg&quot; data-ratio=&quot;1.8952569169960474&quot; data-w=&quot;&quot; style=&quot;max-width: 100%; height: auto !important;&quot;/&gt;&lt;br/&gt;&lt;img data-s=&quot;300,640&quot; data-type=&quot;jpeg&quot; src=&quot;https://mmbiz.qlogo.cn/mmbiz/BuibbyDiaTKOXwH45n5UZvRLsrDdXxkIsgib9A7V5bcRz98EPQpgtcfzGHjdtiaicvonnWx1TicflicZsmmw50l1BgHsQ/0?wx_fmt=jpeg&quot; data-ratio=&quot;1.5889328063241106&quot; data-w=&quot;&quot; style=&quot;max-width: 100%; height: auto !important;&quot;/&gt;&lt;br/&gt;&lt;img data-s=&quot;300,640&quot; data-type=&quot;png&quot; src=&quot;https://mmbiz.qlogo.cn/mmbiz/BuibbyDiaTKOVeB7O8VXGpibJQ5FicefiaXXRReO75J8M8TjNjRlBIib2icCaxwb3kkBQFFgdL9t9eBibKE27rcbBIicang/0?wx_fmt=png&quot; data-ratio=&quot;1.3102766798418972&quot; data-w=&quot;&quot; style=&quot;max-width: 100%; height: auto !important;&quot;/&gt;&lt;br/&gt;&lt;img data-s=&quot;300,640&quot; data-type=&quot;jpeg&quot; src=&quot;https://mmbiz.qlogo.cn/mmbiz/BuibbyDiaTKOXwH45n5UZvRLsrDdXxkIsgGp8bpviafEM5YWaTtInfdTlBJCb3kicib4SnGkOibpf5DcvPABtlXFdyibA/0?wx_fmt=jpeg&quot; data-ratio=&quot;1.1897233201581028&quot; data-w=&quot;&quot; style=&quot;max-width: 100%; height: auto !important;&quot;/&gt;&lt;br/&gt;&lt;img data-s=&quot;300,640&quot; data-type=&quot;jpeg&quot; src=&quot;https://mmbiz.qlogo.cn/mmbiz/BuibbyDiaTKOXwH45n5UZvRLsrDdXxkIsgv06ka41p39F7W5QzYiayMRRmOJ7rJ5wfNsBIILolGnSnPdCDibXmRRxA/0?wx_fmt=jpeg&quot; data-ratio=&quot;1.1897233201581028&quot; data-w=&quot;&quot; style=&quot;max-width: 100%; height: auto !important;&quot;/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0pt; margin-bottom: 0pt; margin-left: 0in; clear: both; white-space: normal; direction: ltr; unicode-bidi: embed; word-break: normal;&quot;&gt;&lt;span style=&quot;font-family: 宋体;&quot;&gt;赶快来体验一下这个秘技吧，跟大学生沟通的时候不要忘了五位一体的倾听，恰当的反应和积极的提问。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;";

		//content="<html><img src='image/ad1.gif' width='128' height='36'/><img src='image/ad2.gif' width='128' height='36'/></html>";
		content = HtmlUtils.htmlUnescape(content);
		content = HtmlUtils.htmlUnescape(content);



		List<String> imgs = getImgStr(content);

		for (String img : imgs) {
			System.out.println(img);
		}
		
		System.err.println(outputHtml(content, "http:/www.baidu.com"));
		
		
		
	}
	
	public static List<String> getImgStr(String htmlStr){
	     String img="";     
	     Pattern p_image;     
	     Matcher m_image;     
	     List<String> pics = new ArrayList<>();
	  
	     String regEx_img = "<img.*src=(.*?)[^>]*?>"; //图片链接地址     
	     p_image = Pattern.compile(regEx_img,Pattern.CASE_INSENSITIVE);
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
	
	
	public static String replaceImgUrl(String html,String url){
		List<String> string = getImgStr(html);
		for (String s : string) {
			html = html.replaceAll(s, url);
		}
		return html;
	}
	
	public static String outputHtml(String htmlStr,String url){
	     String img="";     
	     Pattern p_image;     
	     Matcher m_image;     
	  
	     String regEx_img = "<img.*src=(.*?)[^>]*?>"; //图片链接地址     
	     p_image = Pattern.compile(regEx_img,Pattern.CASE_INSENSITIVE);
	     m_image = p_image.matcher(htmlStr);
		while (m_image.find()) {
			img = img + "," + m_image.group();
			Matcher m = Pattern.compile("src=(\"|')?(.*?)(\"|'|>|\\s+)",Pattern.CASE_INSENSITIVE).matcher(img); //匹配src
			while (m.find()) {
				htmlStr = htmlStr.replace(m.group(2),url);
		}
		}
	     return htmlStr;     
	 }
	
	
	

}
