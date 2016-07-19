/**
 * project : adapter-server
 * user created : songsp
 * date created : 2012-12-27 - 下午8:04:20
 */
package com.longtime.common.utils;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

/**
 * @since 2012-12-27
 * @author songsp
 */
public class HtmlUtils {
    
    /**获得可用的输入内容，大写-》小写，全角-》半角，去除html,script,css特殊符号,去除html特殊符号
     * @param content 内容
     * @return
     */
    public static String getAvailableString(HttpServletRequest req, String name) {
        String content = req.getParameter(name);
        
        return getAvailableString(content);
    }
    
    /**获得可用的输入内容，大写-》小写，全角-》半角，去除html,script,css特殊符号,去除html特殊符号
     * @param content 内容
     * @return
     */
    public static String getAvailableString(String content) {
        if (StringUtils.isBlank(content)){
            return StringUtils.EMPTY;
        }
        
        content = StringUtils.trimToNull(content);
        content = content.toLowerCase();
        content = ToDBC(content);
        content = getNoHTMLString(content, content.length());
        content = getNoSpecialHTMLString(content);
        
        return content;
    }
	
	/**过滤html标签
	 * @param content 内容
	 * @param p 截取字符个数
	 * @return
	 */
	public static String getNoHTMLString(String content, int p) {

		if (StringUtils.isBlank(content))
			return StringUtils.EMPTY;
		if (0 == p)
			return StringUtils.EMPTY;

		java.util.regex.Pattern p_script;
		java.util.regex.Matcher m_script;
		java.util.regex.Pattern p_style;
		java.util.regex.Matcher m_style;
		java.util.regex.Pattern p_html;
		java.util.regex.Matcher m_html;

		try {
			String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>";
			// 定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script> }
			String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>";
			// 定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style> }
			String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式

			p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
			m_script = p_script.matcher(content);
			content = m_script.replaceAll(""); // 过滤script标签

			p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
			m_style = p_style.matcher(content);
			content = m_style.replaceAll(""); // 过滤style标签

			p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
			m_html = p_html.matcher(content);

			content = m_html.replaceAll(""); // 过滤html标签
		} catch (Exception e) {
			return "";
		}

		if (content.length() > p) {
			content = content.substring(0, p) + "...";
		}
		return content;
	}
	
	/**过滤HTML中的需要转义字符
	 * @param content 内容
	 * @return
	 */
	public static String getNoSpecialHTMLString(String content) {
	    
	    if (StringUtils.isBlank(content))
	        return StringUtils.EMPTY;
	    
	    java.util.regex.Pattern p_html;
	    java.util.regex.Matcher m_html;
	    
	    try {
	        // 定义HTML中的需要转义字符的正则表达式
	        String regEx_html = "&amp;|&lt;|&gt;|&copy;|&quot;|&reg;|&nbsp;"; 
	        
	        p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
	        m_html = p_html.matcher(encodeHtml(content));
	        content = m_html.replaceAll("");
	    } catch (Exception e) {
	        return "";
	    }
	    
	    return content;
	}
    
    /**
     * 半角转全角：
     * 全角空格为12288，半角空格为32 其他字符半角(33-126)与全角(65281-65374)的对应关系是：均相差65248
     */
    public static String ToSBC(String input) {
        char[] c = input.toCharArray();
        for (int i = 0; i < c.length; i++) {
            if (c[i] == 32) {
                c[i] = (char) 12288;
                continue;
            }
            if (c[i] < 127)
                c[i] = (char) (c[i] + 65248);
        }
        return new String(c);
    }
    
    /**
     * 全角转半角 (不转换中文句号，双引号，单引号，书名号)
     * @param input
     * @return
     */
    public static String ToDBC(String input) {
        char[] c = input.toCharArray();
        for (int i = 0; i < c.length; i++) {
            if (c[i] == 12288) {
                c[i] = (char) 32;
                continue;
            }
            if (c[i] > 65280 && c[i] < 65375)
                c[i] = (char) (c[i] - 65248);
        }
        return new String(c);
    }

    /**
     * 半角转全角
     * 
     * @param QJstr
     * @return
     */
    @Deprecated
    public static final String BQchange(String QJstr) {
        if(StringUtils.isBlank(QJstr)){
            return "";
        }
        
        String outStr = "";
        String Tstr = "";
        byte[] b = null;

        for (int i = 0; i < QJstr.length(); i++) {
            try {
                Tstr = QJstr.substring(i, i + 1);
                b = Tstr.getBytes("unicode");
            } catch (java.io.UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            if (b[3] != -1) {
                b[2] = (byte) (b[2] - 32);
                b[3] = -1;
                try {
                    outStr = outStr + new String(b, "unicode");
                } catch (java.io.UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            } else
                outStr = outStr + Tstr;
        }

        return outStr;
    }

    /**
     * 全角转半角
     * 
     * @param QJstr
     * @return
     */
    @Deprecated
    public static final String QBchange(String QJstr) {
        if(StringUtils.isBlank(QJstr)){
            return "";
        }
        
        String outStr = "";
        String Tstr = "";
        byte[] b = null;

        for (int i = 0; i < QJstr.length(); i++) {
            try {
                Tstr = QJstr.substring(i, i + 1);
                b = Tstr.getBytes("unicode");
            } catch (java.io.UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            if (b[3] == -1) {
                b[2] = (byte) (b[2] + 32);
                b[3] = 0;
                try {
                    outStr = outStr + new String(b, "unicode");
                } catch (java.io.UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            } else
                outStr = outStr + Tstr;
        }

        return outStr;
    }
    
    public static String encodeHtml(String html){
		
		return StringEscapeUtils.escapeHtml4(html);
	}
	
	public static String html2Text(String inputString) {
		if(StringUtils.isBlank(inputString)){
			return StringUtils.EMPTY;
		}
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
	
	public static void main(String[] args) {
//	    System.out.println(HtmlUtils.getNoHTMLString("《script>asfas", "《script>asfas".length()));
		System.out.println(HtmlUtils.getAvailableString("ＡｂCd<a>e</a><script>alert(1);</script><style>222</style>&lt;<br><p>\n"));
//		System.out.println(HtmlUtils.getNoHTMLString("<script>afaf</script>122afaf", 3));;
		System.out.println(HtmlUtils.getNoSpecialHTMLString("<a>e</a><script>alert(1);</script>"));;
		
		System.out.println(HtmlUtils.encodeHtml("<script>alert(1);</script>"));
    }
}
