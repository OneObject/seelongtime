package com.longtime.common.spring;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.http.MediaType;
import org.springframework.http.converter.StringHttpMessageConverter;

public class UTF8StringBeanPostProcessor implements BeanPostProcessor {
	
	public static final Charset DEFAULT_CHARSET = Charset.forName("UTF-8"); 
	
	
	private String charset ;
	
	
	public String getCharset() {
		return charset;
	}

	public void setCharset(String charset) {
		this.charset = charset;
	}

	@Override
	public Object postProcessAfterInitialization(Object bean, String beanName)
			throws BeansException {
		if (bean instanceof StringHttpMessageConverter) {
			Charset  cs = DEFAULT_CHARSET;
			if(StringUtils.isNotBlank(charset)){
				cs = Charset.forName(charset);
			}
			MediaType mediaType = new MediaType("text", "plain",cs);
			List<MediaType> types = new ArrayList<MediaType>();
			types.add(mediaType);
			types.add(MediaType.ALL);
			((StringHttpMessageConverter) bean).setSupportedMediaTypes(types);
		}
		return bean;
	}

	@Override
	public Object postProcessBeforeInitialization(Object bean, String beanName)
			throws BeansException {
		return bean;
	}
}
