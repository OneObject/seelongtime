/* Copyright © 2010 www.myctu.cn. All rights reserved. */
/**
 * project : ctu-protocol
 * user created : pippo
 * date created : 2013-5-6 - 上午11:34:08
 */
package com.myctu.platform.protocol.transform.json.setting;

import java.io.IOException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.Version;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;
import org.codehaus.jackson.map.SerializerProvider;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.codehaus.jackson.map.module.SimpleModule;

/**
 * @since 2013-5-6
 * @author pippo
 */
public class SerializerSetting {

	public static void init(ObjectMapper objectMapper) {
		objectMapper.setSerializationInclusion(Inclusion.NON_NULL);

		objectMapper.configure(SerializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS, true);
		//		objectMapper.configure(SerializationConfig.Feature.WRITE_DATE_KEYS_AS_TIMESTAMPS, false);
		//		objectMapper.configure(SerializationConfig.Feature.WRITE_DATES_AS_TIMESTAMPS, false);
		objectMapper.configure(SerializationConfig.Feature.WRITE_EMPTY_JSON_ARRAYS, false);
		objectMapper.configure(SerializationConfig.Feature.WRITE_NULL_MAP_VALUES, false);

		SimpleModule module = new SimpleModule("JacksonEncoder", new Version(1, 0, 0, null));
		//module.addSerializer(new TransportModeSerializer());
		//module.addSerializer(new OPCodeSerializer());

		objectMapper.registerModule(module);
	}

	


}
