/* Copyright © 2010 www.myctu.cn. All rights reserved. */
/**
 * project : ctu-protocol
 * user created : pippo
 * date created : 2013-5-6 - 上午11:29:46
 */
package com.myctu.platform.protocol.transform.json.setting;

import org.codehaus.jackson.Version;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.module.SimpleModule;


/**
 * @since 2013-5-6
 * @author pippo
 */
public class DeserializerSetting {

	public static void init(ObjectMapper objectMapper) {
		objectMapper.configure(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS, true);
		objectMapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		SimpleModule module = new SimpleModule("JacksonDecoder", new Version(1, 0, 0, null));
		//module.addDeserializer(TransportMode.class, new TransportModeDeserializer());
		//module.addDeserializer(OPCode.class, new OPCodeDeserializer());

		objectMapper.registerModule(module);
	}

	
}