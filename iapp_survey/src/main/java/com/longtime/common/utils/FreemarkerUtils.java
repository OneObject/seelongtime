package com.longtime.common.utils;

import com.google.common.collect.Maps;
import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.ObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang3.CharEncoding;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

public class FreemarkerUtils {

	private static final Logger logger = LoggerFactory.getLogger(FreemarkerUtils.class);

	private static Configuration configuration;
	
	private static Configuration configuration_stringloader = new Configuration(); //使用字符串变量作为模板
	
	private static StringTemplateLoader stringLoader = new StringTemplateLoader();
	
	private static final String template_path = "/template/";
	
	private static boolean isInit = false;
	
	static{
	    configuration_stringloader.setTemplateLoader(stringLoader);
	}

	public void setConfiguration(Configuration configuration) {
		FreemarkerUtils.configuration = configuration;
	}

	private static void init() {
		if (configuration != null) {
			return;
		}

		if (configuration == null) {
			synchronized(FreemarkerUtils.template_path){
				configuration = new Configuration();
				configuration.setDefaultEncoding(CharEncoding.UTF_8);
				configuration.setObjectWrapper(ObjectWrapper.DEFAULT_WRAPPER);
				configuration.setClassForTemplateLoading(FreemarkerUtils.class,template_path);
			}
		}			
		isInit = true;
		
	}

	public static String toString(String template_name, Map<String, Object> context) {
		if(!isInit){
			init();
		}
		try {
			Template template = configuration.getTemplate(template_name);
			return FreeMarkerTemplateUtils.processTemplateIntoString(template, context);
		} catch (Exception e) {
			logger.error("process template:[{}] with context:[{}] due to error:[{}]",
				template_name,
				context,
				ExceptionUtils.getStackTrace(e));
			return null;
		}
	}
	
	/**
	 * 
	 * @param template_context 模板内容
	 * @param context
	 * @return
	 */
	public static String toString2(String template_context, Map<String, Object> context) {
	   
        stringLoader.putTemplate("custom_template",template_context );
         
        configuration_stringloader.setTemplateLoader(stringLoader);
         
        try {
            Template template =  configuration_stringloader.getTemplate("custom_template","utf-8");
            return FreeMarkerTemplateUtils.processTemplateIntoString(template, context);
        } catch (Exception e) {
            logger.error("process template_context:[{}] with context:[{}] due to error:[{}]",
                         template_context,
                        context,
                        ExceptionUtils.getStackTrace(e));
            return null;
        }
    }
	
	
	
	
	
	public static void main(String[] args) {
		Map<String,Object> context = Maps.newHashMap();
		context.put("name", "宋少璞");
		context.put("value", "songshaopu");
		context.put("pwd", "123456");
		String str = FreemarkerUtils.toString("test.ftl", context);
		System.out.println(str);
		
		
		str = FreemarkerUtils.toString2("${name}--${pwd}", context);
		System.out.println(str);
		
		str = FreemarkerUtils.toString2("${value}--${name}", context);
		System.out.println(str);
		
		
		str = FreemarkerUtils.toString("test.ftl", context);
        System.out.println(str);
	}

}

