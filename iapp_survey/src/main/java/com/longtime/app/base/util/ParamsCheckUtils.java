package com.longtime.app.base.util;

import org.apache.commons.lang3.StringUtils;

public class ParamsCheckUtils {
    /**
     * 判断字符列表中是否有空值
     * @param params
     * @return
     */
    public static boolean haveNull(String... params){
//        Map<String, String> ret = new HashMap<String, String>();
        for(String s: params){
            if(StringUtils.isBlank(s)){
                return true;
            }
//            ret.push(StringUtils.trim(s));
        }
        return false;
    }
}
