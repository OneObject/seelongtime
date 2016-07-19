/* Copyright © 2010 www.myctu.cn. All rights reserved. */
/**
 * project : ctu-protocol
 * user created : pippo
 * date created : 2013-5-6 - 上午11:41:28
 */
package com.myctu.platform.protocol.transform.json.setting;

import org.codehaus.jackson.JsonParser.Feature;
import org.codehaus.jackson.map.ObjectMapper;

/**
 * @since 2013-5-6
 * @author pippo
 */
public class ParserSetting {

	public static void init(ObjectMapper objectMapper) {
		objectMapper.configure(Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
		objectMapper.configure(Feature.ALLOW_SINGLE_QUOTES, true);
	}

}
