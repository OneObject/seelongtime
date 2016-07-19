package com.longtime.app.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import com.ssf.core.Matcher;
import com.ssf.utils.IOUtils;

public class SensitiveUtil
{
	private static InputStream is = null;
	static{
		try {
            is = Thread.currentThread().getContextClassLoader().getResourceAsStream("sensitive_words");
            BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
            String tmp = null;
            while((tmp = br.readLine()) != null) {
                Matcher.addKeyWord(tmp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(is);
        }
	}
	/**
	 * 检测某个字符串是否还有敏感词  
	 * @param str
	 * @return 返回 True 时非法， False 合法
	 */
	private static boolean  checkIsIllegal(String str)
	{
		return Matcher.isIllegal(str);
	}
}
