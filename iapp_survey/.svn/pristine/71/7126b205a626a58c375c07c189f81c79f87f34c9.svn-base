package com.longtime.app.base.util;

import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class URLPatternUtils {

    private static Logger logger = LoggerFactory.getLogger(URLPatternUtils.class);

    /**
     * 
     * /user/* ---> /admin/user/list.xhtml /user/add.* --->
     * /admin/user/add.xhtml 不区分大小写
     * 
     * @param regex
     * @param url
     * @return
     */
    public static boolean pattern(String regex, String url) {
        if (StringUtils.isBlank(regex) || StringUtils.isBlank(url)) {
            return false;
        }
        Pattern p = Pattern.compile(regex.toLowerCase());
        return p.matcher(url.toLowerCase()).find();
    }
}
