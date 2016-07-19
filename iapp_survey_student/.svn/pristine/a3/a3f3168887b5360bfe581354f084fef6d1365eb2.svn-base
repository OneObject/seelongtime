/* Copyright © 2010 www.myctu.cn. All rights reserved. */
package com.myctu.platform.protocol.transform.json;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.LinkedHashMap;
import java.util.Map;

import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myctu.platform.protocol.transform.json.setting.DeserializerSetting;
import com.myctu.platform.protocol.transform.json.setting.GeneratorSetting;
import com.myctu.platform.protocol.transform.json.setting.ParserSetting;
import com.myctu.platform.protocol.transform.json.setting.SerializerSetting;

/**
 * @since 2012-1-10
 * @author pippo
 */
public abstract class JacksonSupport {

    private static Logger logger = LoggerFactory.getLogger(JacksonSupport.class);

    public final static ObjectMapper objectMapper = new ObjectMapper();

    public final static JsonFactory jsonFactory = new JsonFactory();

    static {

        DeserializerSetting.init(objectMapper);
        SerializerSetting.init(objectMapper);

        ParserSetting.init(objectMapper);
        GeneratorSetting.init(objectMapper);
    }

    public static String encodeAsString(Object packet) {
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            encode1(packet, out, JsonEncoding.UTF8);
            return new String(out.toByteArray());
        } catch (Exception e) {
            logger.error(String.format("encode [%s] to string due to error", packet), e);
            return null;
        }
    }

    public static <M> void encode1(M packet, OutputStream out, JsonEncoding charset) {
        try {
            JsonGenerator jg = jsonFactory.createJsonGenerator(out, charset);
            //          jg.useDefaultPrettyPrinter();
            objectMapper.writeValue(jg, packet);
        } catch (Exception e) {
            logger.error(String.format("encode [%s] to string due to error", packet), e);
        }
    }

    public static <M> M decode1(InputStream in, Class<M> clazz) {
        M packet = null;
        try {
            packet = objectMapper.readValue(in, clazz);
        } catch (Exception e) {
            logger.error(String.format("decode [%s] to object due to error", in), e);
        }

        return packet;
    }

    public static <M> M decode1(String in, Class<M> clazz) {
        M packet = null;
        try {
            packet = objectMapper.readValue(in, clazz);
        } catch (Exception e) {
            logger.error(String.format("decode [%s] to object due to error", in), e);
        }

        return packet;
    }

    @SuppressWarnings("unchecked")
    public static <M> Map<String, Object> toMap(M in) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        encode1(in, out, JsonEncoding.UTF8);
        return decode1(new ByteArrayInputStream(out.toByteArray()), LinkedHashMap.class);
    }

    public static <M> M fromMap(Map<String, Object> in, Class<M> clazz) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        encode1(in, out, JsonEncoding.UTF8);
        return decode1(new ByteArrayInputStream(out.toByteArray()), clazz);
    }
}
