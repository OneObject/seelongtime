package com.longtime.ajy.session;

import org.apache.commons.lang3.StringUtils;

import com.google.common.base.Joiner;
import com.longtime.ajy.student.config.Constant;

public interface Contants {

    String COOKIE_KEY_FILTER_RECEIPT = Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constant.COOKIE_KEY_PREFIX), "lt.receipt");//String.format("%s.%s", Constant.COOKIE_KEY_PREFIX, "lt.receipt");

    String COOKIE_KEY_SID            = Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constant.COOKIE_KEY_PREFIX), "sid");//String.format("%s.%s", Constant.COOKIE_KEY_PREFIX, "sid");

    String COOKIE_KEY_DOMAIN         = Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constant.COOKIE_KEY_PREFIX), "lt.domain");//String.format("%s.%s", Constant.COOKIE_KEY_PREFIX, "lt.domain");

    String COOKIE_KEY_OPNEID         = Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constant.COOKIE_KEY_PREFIX), "lt.openid");//String.format("%s.%s", Constant.COOKIE_KEY_PREFIX, "lt.openid");

    String COOKIE_KEY_EXT         = Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constant.COOKIE_KEY_PREFIX), "lt.ext");//String.format("%s.%s", Constant.COOKIE_KEY_PREFIX, "lt.openid");

    String COOKIE_PATH               = "/";

    int    COOKIE_MAX_AGE            = 60 * 60 * 24 * 7;//7天  //-1;
    
        
    boolean COOKIE_SESSION_NEVER_EXPIRES = Constant.COOKIE_SESSION_NEVER_EXPIRES;
    
}
