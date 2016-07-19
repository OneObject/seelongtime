package com.longtime.app.base.cookie;

import org.apache.commons.lang3.StringUtils;

import com.google.common.base.Joiner;
import com.longtime.app.base.util.Constant;

public interface Contants {

    //String COOKIE_KEY_FILTER_RECEIPT = Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constant.COOKIE_KEY_PREFIX), "lt.receipt.admin");//String.format("%s.%s", Constant.COOKIE_KEY_PREFIX, "lt.receipt");

    String COOKIE_KEY_SID            = Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constant.COOKIE_KEY_PREFIX), "sid.admin");//String.format("%s.%s", Constant.COOKIE_KEY_PREFIX, "sid");

    String COOKIE_KEY_DOMAIN         = Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constant.COOKIE_KEY_PREFIX), "lt.domain.admin");//String.format("%s.%s", Constant.COOKIE_KEY_PREFIX, "lt.domain");

    String COOKIE_KEY_UID         = Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constant.COOKIE_KEY_PREFIX), "lt.uid.admin");//String.format("%s.%s", Constant.COOKIE_KEY_PREFIX, "lt.uid");
    
    String COOKIE_KEY_TID     =Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constant.COOKIE_KEY_PREFIX),"lt.tid.admin");
    
    
    String COOKIE_PATH               = "/";

    int    COOKIE_MAX_AGE            = 60 * 60 * 24 * 5;//5天  ;
    
    int 	COOKIE_MIN_AGE = -1; // 内存中

}
