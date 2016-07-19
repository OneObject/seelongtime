package com.longtime.common.utils;

import java.util.Map;
import org.apache.commons.beanutils.PropertyUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BeanUtils {

    private static Logger logger = LoggerFactory.getLogger(BeanUtils.class);

    @SuppressWarnings("unchecked")
    public static <T> Map<String, Object> toMap(T bean) {
        Map<String, Object> map;
        try {
            map = PropertyUtils.describe(bean);
            map.remove("class");
            return map;
        } catch (Exception e) {
            logger.error(String.format("bean to map due to fail. bean=[%s]", bean.toString()), e);
            return null;
        }

    }

}
